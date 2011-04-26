Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEmTR-0002jw-5k
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 19:54:57 +0200
Received: by ewy5 with SMTP id 5so283122ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2011 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=cr8hEdTX2208NTK9cs9Rq/In7GNryF6YzZAcu7oW/0k=;
	b=ZDz4nZFcLlpKLlakQv/dfS9FFNov7wLiiYv61C0sU+iA2lLWMR89TgjJ2z2HJLWRTi
	P9rTSOCv4oDtZJdV5ChJO5AaKQ8KOCSXfYzOTh1sZSIZfrSmxNkoyAp4uz1Bz4eoLCxi
	vdaWGoZTPOvgw9sIRCF48kT5f5anR66t7einw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Bq/HS32aQ9WNPL4KaDuBbrXhM1WV87in3tJQNm0zclWAXJ/AYzyy8v+4MggNiPj2Un
	WmWla3nqTIjxfF2yuBiXj793rXebD+VAETg5Lku2UpuT//E1ob2x4v+1hcBJGC/Ndrbc
	w8ewxGHyuylU27eNKVtxauRV4vP11ZFBsk8mg=
Received: by 10.14.17.103 with SMTP id i79mr512682eei.13.1303840335145; Tue,
	26 Apr 2011 10:52:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Tue, 26 Apr 2011 10:51:44 -0700 (PDT)
In-Reply-To: <4DB65C5B.2050409@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
	<a0629aa0dc55829565b7ab1725875eac065ab2f1.1303539961.git.sgw@linux.intel.com>
	<4DB562CF.1020100@mlbassoc.com> <4DB59811.5040109@linux.intel.com>
	<4DB5ABDB.9070201@mlbassoc.com> <4DB65C5B.2050409@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Apr 2011 10:51:44 -0700
Message-ID: <BANLkTik6odYsapq-n82ytd0H7HdYKTLV5g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 07/37] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Tue, 26 Apr 2011 17:54:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2011 at 10:47 PM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
> On 04/25/2011 10:14 AM, Gary Thomas wrote:
>> On 04/25/2011 09:49 AM, Saul Wold wrote:
>>> On 04/25/2011 05:02 AM, Gary Thomas wrote:
>>>> On 04/23/2011 12:28 AM, Saul Wold wrote:
>>>>> From: =3D?UTF-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D<ynezz@true.cz>
>>>>>
>>>>> In the current state, udev init script is loaded as 3rd and
>>>>> modutils.sh as
>>>>> 20th, so udevadm called in udev init script loads all kernel modules
>>>>> in some
>>>>> unpredictable order, not honoring in any way specified order of
>>>>> modules in
>>>>> /etc/modules. This causes some troubles mainly in the first boot. So
>>>>> to fix
>>>>> this we now move loading of the kernel modules just before we exec
>>>>> udev init
>>>>> script. Example of the current state:
>>>>>
>>>>> Starting udev
>>>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
>>>>> rtc-m48t86 rtc-m48t86: battery ok
>>>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1
>>>>>
>>>>> root@ts72xx:~# cat /etc/modules
>>>>> rtc-ep93xx
>>>>> ohci-hcd
>>>>> ts72xx_sbcinfo
>>>>> rtc-m48t86
>>>>>
>>>>> As you can guess, this is really wrong behaviour, because I've rtc1 a=
s
>>>>> the
>>>>> main time source for my system.
>>>>>
>>>>> root@ts72xx:~# cat /etc/default/hwclock
>>>>> HWCLOCKACCESS=3Dyes
>>>>> HWCLOCKDEVICE=3D/dev/rtc1
>>>>>
>>>>> Expected behaviour with this patch applied:
>>>>>
>>>>> Please wait: booting...
>>>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
>>>>> usbcore: registered new device driver usb
>>>>> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>>>>> ...
>>>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
>>>>> rtc-m48t86 rtc-m48t86: battery ok
>>>>> Starting udev
>>>>>
>>>>> Signed-off-by: Petr =C5=A0tetiar<ynezz@true.cz>
>>>>>
>>>>> (based on http://patches.openembedded.org/patch/1917/)
>>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>>> ---
>>>>> .../modutils/modutils-initscripts.bb | 4 ++--
>>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>>> b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>>> index 1665955..5ae34b4 100644
>>>>> --- a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>>> +++ b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>>> @@ -4,10 +4,10 @@ LICENSE =3D "PD"
>>>>> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7bf87fc37976e93ec66ad84fac=
58c098"
>>>>> SRC_URI =3D "file://modutils.sh \
>>>>> file://PD.patch"
>>>>> -PR =3D "r4"
>>>>> +PR =3D "r5"
>>>>>
>>>>> INITSCRIPT_NAME =3D "modutils.sh"
>>>>> -INITSCRIPT_PARAMS =3D "start 20 S ."
>>>>> +INITSCRIPT_PARAMS =3D "start 2 S ."
>>>>>
>>>>> inherit update-rc.d
>>>>>
>>>>
>>>> Should there not be a corresponding change to modutils_2.4.27.bb? It's
>>>> not clear to me
>>>> where there are these two separate recipes, but they should at least b=
e
>>>> kept in sync.
>>>>
>>> Gary,
>>>
>>> Could you please resend this as a proper patch with Signed-off-by and c=
ommit info.
>>
>> Attached. =C2=A0However, as Koen pointed out, perhaps this recipe should=
 just be dropped,
>> at least for Poky? =C2=A0I don't know that 2.4 kernels are built or supp=
orted?
>
>
> Right, so for clarification, for 2.4 kernels, images should be built
> using just the modutils_2.4.27.bb recipe. For 2.6 kernels, images should
> be built using module_init_tools and modutils-initscripts.
>
> In oe-core, task-base requires module-init-tools and task-core-boot
> requires modutils-initscripts. That actually seems backwards to me as
> modutils-initscripts is useless without module-init-tools.
>
> There is a considerable amount of cruft in the kernel base classes
> related to older kernels which I'd like to see purged. Perhaps a
> meta-linux-2.4 layer would be a good place to keep things like these as
> well as the modutils_2.4.27 recipe.

Do we have usecases to even support 2.4 anymore ? I would suggest
to remove it if no use cases are reported.

>
> However, in terms of the immediate issue, I agree with Gary's patch.
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


