Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f196.google.com (mail-yk0-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id B06247687B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 12:24:02 +0000 (UTC)
Received: by ykdg206 with SMTP id g206so1341671ykd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4EzSw47NkEcwbwe/6Cwmqo/idtzNHsmYYnU/VYFfmYg=;
	b=Ce1+V7+TfB3hFxoCnf/CM/NxfaWsE6L4s9zKhTSuKM1iAy/9wc/D2Jmup1lGJpkdAR
	2Mwh3EdvRzj4m2pM4eeYJGfiQENks7xvc0nkcB/uyIWOS+rJVmP7fXj4Qe1+HKrI1O0q
	3zyTS4vgVrqAaUSRl9bciC/Fv1TMH7R9NAhpzT/hm3t18mfJ7W2SVkAU5bp9UclBFY+a
	DoBVNHeYyrsQ6f5OVVZR3FS7SUudV3Kcl4naYuWiQrK7HKl8cOrNKP0FY1G11uKJ7GtT
	WmDkAonMX/qpZ/fe8LxiN1qdW7Xmj6td/wMo5fXP+oa/b38RE7zgyxsrT67sfZ/7QSVu
	dkVw==
MIME-Version: 1.0
X-Received: by 10.170.225.68 with SMTP id r65mr34323777ykf.58.1442492642249;
	Thu, 17 Sep 2015 05:24:02 -0700 (PDT)
Received: by 10.13.203.151 with HTTP; Thu, 17 Sep 2015 05:24:02 -0700 (PDT)
In-Reply-To: <1442472281.27156.24.camel@intel.com>
References: <1442405501.27156.9.camel@intel.com>
	<1442472281.27156.24.camel@intel.com>
Date: Thu, 17 Sep 2015 08:24:02 -0400
Message-ID: <CADkTA4P+Zi2zL0yzWV3DBdskLkUdwxc-HtsudqTVQwQv7TU0jA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: udev + 60-persistent-storage.rules + IDE
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
X-List-Received-Date: Thu, 17 Sep 2015 12:24:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 17, 2015 at 2:44 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Wed, 2015-09-16 at 14:11 +0200, Patrick Ohly wrote:
>> I just noticed that udev (no longer) creates /dev/disk/by-uuid links for
>> my boot partition under qemu when booting a whole-disk image
>> (hdddirect). The device is then /dev/hda, with /dev/hda2 being the root
>> partition.
>>
>> systemd's 60-persistent-storage.rules indeed skips the relevant rules
>> because "hd" is not listed:
>>
>> KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*", GOTO="persistent_storage_end"
>>
>> Adding "hd*" to that line fixes the problem. I'll send patches to
>> systemd and for OE-core.
>
> Lennart argued that /dev/hd* is caused by using the deprecated
> CONFIG_IDE in the kernel and therefore rejected adding "hd*" to upstream
> udev.
>
> CONFIG_IDE seems to come from common-pc-drivers.cfg [1] but that's just
> a guess - I'm not entirely sure how to identify the actual kernel config
> fragments that were used during a build. Anyway, it has been there since
> 2011 and modernizing that is a different topic, so I'll just send the
> patch for systemd/udev.


That is in fact where it comes from for those machines .. and in fact, I started
removing it from various trees about a year ago. Up until recently, it
was around
for compatibility reasons .. but now the generic scsi subsystem
provides everything
that CONFIG_IDE used to .. and they can in fact be dropped.

I may do it to the 4.1 kernel, or wait until after the upcoming
release to avoid any
chance of breaking something that still depends on it.

Bruce

>
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/bsp/common-pc/common-pc-drivers.cfg
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

