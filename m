Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 84E6B7925E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:26:30 +0000 (UTC)
Received: from [10.0.0.246] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id D844D1C13DA;
	Thu, 16 Aug 2018 08:26:30 +0200 (CEST)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180815115907.14045-1-martin@geanix.com>
	<CAJ86T=UJ1xqGDjeO+i9Qyy8sbA_027c2GZQtaqSwp15VAaoUHw@mail.gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <b55e3c9e-bcee-7466-5fd5-8f98f7233899@geanix.com>
Date: Thu, 16 Aug 2018 08:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UJ1xqGDjeO+i9Qyy8sbA_027c2GZQtaqSwp15VAaoUHw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: fix wrong volatile dir for sshd host keys on read-only rootfs
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
X-List-Received-Date: Thu, 16 Aug 2018 06:26:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Andre,

On 15/08/2018 21.47, Andre McCurdy wrote:
> On Wed, Aug 15, 2018 at 4:59 AM, Martin Hundebøll <martin@geanix.com> wrote:
>> When the read-only-rootfs image feature is enabled, and openssh is
>> installed into an image, the ssh daemon is reconfigured to use
>> /var/run/ssh when generating host keys.
>>
>> Fix up the creation of the volatile dir to actually match what sshd is
>> configured to.
>>
>> Signed-off-by: Martin Hundebøll <martin@geanix.com>
>> ---
>>   meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
>> index a0d2af3c65..fcbc5ae9d5 100644
>> --- a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
>> +++ b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
>> @@ -1,2 +1,2 @@
>> -d root root 0755 /var/run/sshd none
>> +d root root 0755 /var/run/ssh none
> 
> This doesn't look right.
> 
> /var/run/sshd is the directory used for privilege separation (grep for
> --with-privsep-path ), so it's not correct to remove it.

I see - didn't know about openssh chrooting to do privilege separation.

> Note that sshd_check_keys script runs "mkdir -p $SYSCONFDIR" (ie
> /var/run/ssh in the read-only rootfs case) at run time before creating
> any keys.

Yes, it works without the volatile folder; for openssh at least.

> What exactly was the problem that this patch tries to fix?

I am running a custom image with the read-only-rootfs feature enabled, 
and wanted to make the ssh host keys persistent across reboots.

At first, I tried adding a bind-mount entry to fstab from /data/ssh to 
/var/run/ssh, but the latter don't exist when mountall.sh is executed by 
RC (/data is the mountpoint of a persistent partition).

I then looked at the volatile entries and noticed that it created the 
(empty) /var/run/sshd, so changed it to (wrongly) create /var/run/ssh 
instead.

That wasn't enough though, since populate-volatiles.sh comes after 
mountall.sh.

In the end I simply added a new entry to volatiles to create a symlink 
from /var/run/ssh to /data/ssh, which works for me :)

Maybe I should change the patch to add a comment about the /var/run/sshd 
entry, so we don't end up doing mistakes like the 
debian-predictable-keys story.

// Martin

