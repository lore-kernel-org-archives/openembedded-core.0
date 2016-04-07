Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B083077011
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 23:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B53E23141D35;
	Fri,  8 Apr 2016 01:46:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id EfXAe-t753A2; Fri,  8 Apr 2016 01:46:35 +0200 (CEST)
Received: from [172.22.22.61] (55d40344.access.ecotel.net [85.212.3.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 5BEBE3141D33;
	Fri,  8 Apr 2016 01:46:35 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <1460012563-18898-1-git-send-email-raj.khem@gmail.com>
	<57069A2A.4040901@opendreambox.org>
	<EAFEA49B-06C0-446C-80F0-0B300EFFB863@gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <5706F15A.3080205@opendreambox.org>
Date: Fri, 8 Apr 2016 01:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <EAFEA49B-06C0-446C-80F0-0B300EFFB863@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox/mdev: Ensure /sys is mounted before using it
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
X-List-Received-Date: Thu, 07 Apr 2016 23:46:44 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 07.04.2016 21:01, Khem Raj wrote:
> 
>> On Apr 7, 2016, at 10:34 AM, Andreas Oberritter <obi@opendreambox.org> wrote:
>>
>> Hi Khem,
>>
>> On 07.04.2016 09:02, Khem Raj wrote:
>>> echo would fail if /sys is not mounted and boot would abort
>>
>> are you sure about the dependency between echo and sysfs? It seems quite
>> unlikely to me. I'd guess the real problem is mdev failing to start
>> without syses.
> 
> real problem was missing mounting sysfs on /sys, but I wanted to keep the other
> way of setting it instead of echo

Note that I was referring to your commit message.

After a second look I see that you also mount /proc in your patch, and I
guess that's what you meant to describe. Please update the commit
message (and subject) to actually match your patch.

Regards,
Andreas


> 
>>
>> Regards,
>> Andreas
>>
>>
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> meta/recipes-core/busybox/files/mdev | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
>>> index 9625247..8c9c06e 100755
>>> --- a/meta/recipes-core/busybox/files/mdev
>>> +++ b/meta/recipes-core/busybox/files/mdev
>>> @@ -1,10 +1,12 @@
>>> #!/bin/sh
>>> -
>>> +mount -t proc proc /proc
>>> +mount -t sysfs sysfs /sys
>>> mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
>>> mkdir /dev/pts /dev/shm
>>> chmod 777 /dev/shm
>>> mount -t devpts devpts /dev/pts
>>> touch /dev/mdev.seq
>>> +#sysctl -w kernel.hotplug=/sbin/mdev
>>> echo "/sbin/mdev" > /proc/sys/kernel/hotplug
>>> mdev -s
>>>
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


