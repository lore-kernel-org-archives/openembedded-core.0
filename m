Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SqRSF-0005i7-Tf
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 18:13:57 +0200
Received: by eeit10 with SMTP id t10so709014eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ea3BhFxiJA9ybCN2ylii2vQ1FdIznPVnpFBcW7H6U/E=;
	b=DoZAWPuXXHQ1wYVGAmS6yi82wps3S+1o3YiDmcDnga6tHX/AYlg7tpQmLF7grk9XcH
	4UitbziOUctG8Qrk/E3Y8Y8A1m8Wl4j6vZR325zcuYf86JxEYPHUA/1dnq8Yf2j//VUy
	8/+Aawk3a1djI2WfpfjlszMrZRC04VB4+x5nEaEz2SoonyroMq3Aowj9u9ajmGn8ezhX
	OLfENKT/NCrgGGsqiJgpWPd3EDIgiSTanB9azm6kHVyKDiwL1yeGeNQf1a/pT3oH7YA8
	bjOYg9mXE+aV20aiCL/EEUlq7Br/MEPmMZnuxiLd8nRWfDVL67fcUi9eEh2p1iich4Iu
	IDxQ==
Received: by 10.14.211.132 with SMTP id w4mr5406045eeo.39.1342368158847; Sun,
	15 Jul 2012 09:02:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Sun, 15 Jul 2012 09:02:08 -0700 (PDT)
In-Reply-To: <AF604684617F454390621992F367F169011A007D@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
	<1342090978.22262.7.camel@ted>
	<AF604684617F454390621992F367F169011A007D@039-SN2MPN1-021.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Jul 2012 09:02:08 -0700
Message-ID: <CAMKF1soCkrVRrkWbr9Sx+2JEtXajwPeORAN_mNkzS4KXWcgzTg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH] kernel.bbclass: update image name to keep it same in D and DEPLOYDIR
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
X-List-Received-Date: Sun, 15 Jul 2012 16:13:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 15, 2012 at 4:18 AM, Liu Ting-B28495 <B28495@freescale.com> wro=
te:
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Thursday, July 12, 2012 7:03 PM
> To: Patches and discussions about the oe-core layer
> Cc: McClintock Matthew-B29882
> Subject: Re: [OE-core] [PATCH] kernel.bbclass: update image name to keep =
it same in D and DEPLOYDIR
>
> On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
>> From: Ting Liu <b28495@freescale.com>
>>
>> Signed-off-by: Ting Liu <b28495@freescale.com>
>> ---
>>  meta/classes/kernel.bbclass |    7 ++++++-
>>  1 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 81c334b..420a1ec 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -122,7 +122,12 @@ kernel_do_install() {
>>       #
>>       install -d ${D}/${KERNEL_IMAGEDEST}
>>       install -d ${D}/boot
>> -     install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL=
_IMAGETYPE}-${KERNEL_VERSION}
>> +        install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KER=
NEL_IMAGE_BASE_NAME}.bin
>> +        cd ${D}/${KERNEL_IMAGEDEST}/
>> +        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAM=
E}.bin
>> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
>> +     cd -
>>       install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>>       install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>>       install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>
> This is going to break users who rely on the existing naming/layout.
>
> The patch description is lacking on why we need to do this too, it just s=
ays what you're doing and not why.
>
> Cheers,
>
> Richard
>
>
> [Liu Ting-B28495] on our side, we used two ways to load the kernel images=
. 1) load from Ethernet 2) load from hard disk which deployed with the root=
fs image containing kernel image (installing the package 'kernel-image'). W=
e cannot use the same bootargs in u-boot due to the mismatched name.

so define two macros nfsboot and diskboot which take care of setting all
required parameters as well as other env vars.

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


