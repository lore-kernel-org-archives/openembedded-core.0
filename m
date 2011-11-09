Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1ROCjP-0001Mp-8S
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 19:18:39 +0100
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 09 Nov 2011 10:11:17 -0800
Received: by ggnv5 with SMTP id v5so3905763ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 10:11:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.197.167 with SMTP id iv7mr4415044igc.46.1320862276624; Wed,
	09 Nov 2011 10:11:16 -0800 (PST)
Received: by 10.50.40.194 with HTTP; Wed, 9 Nov 2011 10:11:16 -0800 (PST)
In-Reply-To: <4EBA6B5D.6050005@hale.at>
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
	<4EB90155.3070705@hale.at> <1320761558.10843.39.camel@ted>
	<4EB9507C.8060507@hale.at>
	<CAPhnLPACHNsFC6rx1uNOcLKgn68D6qeTYcN=VGns+eRAEqKstw@mail.gmail.com>
	<4EBA6B5D.6050005@hale.at>
Date: Wed, 9 Nov 2011 10:11:16 -0800
Message-ID: <CAPhnLPBt4n2KcYo5C8HGRAYwgRSDm_WUxSpsKvtJXEeT_=ihxg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on non physical disks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2011 18:18:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 9, 2011 at 4:00 AM, Wolfram Stering <wolfram.stering@hale.at> wrote:
> On 11/08/2011 04:57 PM, Flanagan, Elizabeth wrote:
>> On Tue, Nov 8, 2011 at 7:53 AM, Wolfram Stering <wolfram.stering@hale.at> wrote:
>>> On 11/08/2011 03:12 PM, Richard Purdie wrote:
>>>> On Tue, 2011-11-08 at 11:15 +0100, Wolfram Stering wrote:
>>>>> On 11/02/2011 07:41 AM, Beth Flanagan wrote:
>>>>>> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>>>>>>
>>>>>> tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies
>>>>>> buildstats to not collect diskio statistics when we encounter a case where
>>>>>> the os.major/os.minor is not represented with an entry in /proc/diskstats.
>>>>> A similar issue exists for building on a btrfs partition.
>>>>> I posted a message on Oct 28 concerning buildstats on btrfs volumes.
>>>>> The problem there is, that btrfs's stat() reports fake device ids that
>>>>> cannot be found in /proc/diskstats.
>>>> Did this patch help address that problem for you too?
>>> I'll be able to check that tomorrow and report back.
>> It should as the patch will just disable diskio collection if it
>> cannot find a valid device id in /proc/diskstats. Let me know if it
>> doesn't and I'll rework it and resubmit.
>>
>> -b
>
> Your patch fixes the buildstats issue for building on a btrfs volume as
> well.
> bitbake no longer hits the exception and diskstats are omitted.
>
> Theoretically, this information would be available for btrfs, but it is
> not discoverable
> in the way buildstats currently collects the disk statistics. However,
> this is a seaprate
> issue, I think.

Yes, and I'm open for suggestions on the best way to implement finding
disk io data for the myriad of filesystem types out there. :/ Or at
the very list  a way to pull diskstats from a trimmed down list that
includes:

ext2/3/4
btrfs
tmpfs
encryptfs....

I'm not sure performance data is even collected for for non-block
devices. dstat and iostat as far as I can tell can't collect data for
tmpfs.

Ideas?

-b

-- 
Elizabeth Flanagan
Yocto Project
Build and Release


