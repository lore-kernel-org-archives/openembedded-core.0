Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9977D77FDC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 17:23:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 23 May 2017 10:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,382,1491289200"; d="scan'208";a="972177527"
Received: from bitbang.jf.intel.com (HELO [10.7.159.60]) ([10.7.159.60])
	by orsmga003.jf.intel.com with ESMTP; 23 May 2017 10:23:25 -0700
To: Joshua Watt <jpewhacker@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
	<CAJdd5GZeT8h7qXfKF=XM7Q0kKoMgQSxNprqhWz7wYv_vBquzTQ@mail.gmail.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <09a43b20-0aa0-beed-f019-762bb23d0a79@linux.intel.com>
Date: Tue, 23 May 2017 10:23:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAJdd5GZeT8h7qXfKF=XM7Q0kKoMgQSxNprqhWz7wYv_vBquzTQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Atomically generate host keys
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 May 2017 17:23:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/23/2017 08:29 AM, Joshua Watt wrote:
> On Tue, May 23, 2017 at 9:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:
>>>
>>> +if [ ! -f "$NAME" ]; then
>>> +    echo "  generating ssh $TYPE key..."
>>> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
>>> +
>>> +    # Sync to ensure data is written to temp file before renaming
>>> +    sync
>>> +
>>> +    # Move (Atomically rename) files
>>> +    # Rename the .pub file first, since the check that triggers a
>>> +    # key generation is based on the private file.
>>> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
>>> +    sync
>>> +
>>> +    mv -f "${NAME}.tmp" "${NAME}"
>>> +    sync
>>> +fi
>>>
>>
>> All of these syncs seem quite enthusiastic, are they really needed?  Writing
>> the file to a temporary name and then mving it to the real name should
>> result in either no file or a complete file in the event of power loss,
>> surely?
> 
> My understanding (and observation) of most journal file systems is
> that only metadata (i.e. directory entries and such) are journaled in
> typical usage. The first sync is necessary in this case to ensure that
> the actual file data gets put on the disk before we rename the files,
> otherwise in the event of interruption journaled rename might get
> replayed but have garbage data. The second one is more of a "force
> operation order" sync to make sure the public file is written before
> the private one, as a reordering would cause problems. The last sync
> is the most optional, but I've seen it take minutes for disk to sync
> contents if no one calls "sync", so it is very possible that all our
> work of regenerating keys would be for naught if power is interrupted
> in the meantime.
> 
> I think some of these syncs can be removed. Namely, the first and
> third one. The second one needs to be there, but can server double
> duty of syncing data to disk and enforcing the order between the
> public and private rename. It does mean we could get a state where the
> public key exists but is garbage, but this should be OK because the
> private key won't exist and it would be regenerated.
> 
> The third sync can be removed and I can put one final sync at the end
> after all keys are generated to ensure we won't go through all the
> effort of regenerating the (last) key again in the event of
> interruption shortly after, unless you would prefer I didn't.
> 

The typical convention for this is,

1. Update file data.
2. sync file
3. sync containing directory
4. mv file to new location
5. sync directory containing new file (although I've seen this step left out before)

https://lwn.net/Articles/457672/ is a good example which is linked from 
https://lwn.net/Articles/457667/

But one of the important parts vs your code, is also that the example is only 
calling sync on the files/directory needed, vs calling "sync" with no arguments 
which is going to cause all data in all filesystem caches to be flushed.

>>
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>> b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>> index 148e6ad..af56404 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>>> @@ -1,22 +1,14 @@
>>>   [Unit]
>>>   Description=OpenSSH Key Generation
>>>   RequiresMountsFor=/var /run
>>> -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
>>> -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
>>> -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
>>> -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
>>> -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
>>> -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
>>> -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
>>> -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
>>
>>
>> Can you not continue to use ConditionPathExists to only run this unit if it
>> needs to run?  You can prepend the argument with | to make them logical OR
>> instead of logical AND, if I'm reading this documentation correctly.
> 
> I will try that. I wasn't aware that was an option since systemd conf
> files are somewhat new to me.
> 
>>
>> Ross


