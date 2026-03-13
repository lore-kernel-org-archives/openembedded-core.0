Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9DF106FD8C
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:24:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9994.1773383082635470483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0VLq5697;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98E8AC415A5;
	Fri, 13 Mar 2026 06:25:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DD7860027;
	Fri, 13 Mar 2026 06:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E09E010369DF4;
	Fri, 13 Mar 2026 07:24:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773383079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SQoOsF4rumT8aU528EH3XesIpqFmYnBcICntd1xRIak=;
	b=0VLq5697K5B+NqE4TT9kHNospSFPEI1SATt/Y5GhbqG3FPaRoZsYcanOXZWTxap1q1BK2R
	RqNwaZVoh68VUERht7HyJBAtG2+QlXhxM4a6oYbo0EzmFx4s/eMKqy7YBO7jEpCvZxQgLP
	9tJIuZlprl5avB8Mr5YHWPqe3yEQ5q2CLJktavEisD1suFXoUpBb0l6qKLOdaWpAD1/3X1
	iU+BSiucxEpDbduECgJ/f/aemdiMVJJ5joD4RC/aIOyqeoxIq62pMqXr67N8OvjdvHxTnG
	Bro3e7a+Zny/JrTVl6EMaZNjX9i5YG07MYGwDbIWzvoYHdx8WiiKZZRsUVkjVw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 07:24:35 +0100
Message-Id: <DH1FU20JU3AD.3GC0F6C7OKR0B@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Robert Yang" <liezhi.yang@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v8 0/9] rpm: 4.20.1 -> 6.0.1
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1773324129.git.liezhi.yang@windriver.com>
 <DH0XA8PQOXXR.12KPIBAF43RZ3@bootlin.com>
 <1f50dc21-bf2a-4b2f-9a39-9ef5137f26c6@windriver.com>
In-Reply-To: <1f50dc21-bf2a-4b2f-9a39-9ef5137f26c6@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233025

On Fri Mar 13, 2026 at 5:54 AM CET, Robert Yang wrote:
> Hi Mathieu,
>
> On 3/12/26 23:52, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>> On Thu Mar 12, 2026 at 3:09 PM CET, liezhi.yang wrote:
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> * V8:
>>>    - Fix build with systemd (Check patch 7 for detailes)
>>>    - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkg=
config
>>>      (Check patch 7 for detailes)
>>>    - Backport a PULL from git/libarchive to fix oe-selftest failures.
>>>
>>> * V7:
>>>    - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
>>>      To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24=
.04 when
>>>      pkg-config is installed on host, now the host contamination has be=
en fixed,
>>>      and the patch has been submitted to upstream:
>>>      https://github.com/rpm-software-management/rpm/pull/4127
>>>
>>> * V6
>>>    - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>>>
>>> * V5
>>>    - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>>>    - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependen=
cies
>>>      between /bin/sh and libc.so.
>>>
>>> * V4
>>>    - Fix loop dependencies issues for libc6 and busybox
>>>    - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>>>
>>> * V3
>>>    - Fix Alexender's comments
>>>      a) Suppot rpm 6
>>>      b) Move rpm-setup-autosign to rpm-build
>>>      c) Remove -DLIBELF_FOUND=3DFalse
>>>
>>>    - Fix build for nativesdk-rpm
>>>
>>>    - Drop patch for createrepo-c since it has been upgraded (rev:
>>>      804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>>>
>>> * V1 & V2
>>>    - Initial version
>>>
>>> // Robert
>>>
>>=20
>> Hi Robert,
>>=20
>> Thanks for the new version.
>>=20
>> I suspect I still need to get some gettext patch with it. Either yours
>> or the one from the glibc upgrade series. Is that right?
>
> I think you meat the following oe-selftest error:
>
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepe=
nds on=20
> locale-base-c, but it isn't a build dependency? [build-deps]
>
>
> I can reproduce it with pure master branch: (rev:=20
> 438afb3ded629408172c4bd7d556c5d2abacd631)
> PACKAGE_CLASSES =3D "package_rpm"
> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder'
> MACHINE =3D 'qemux86-64'
>
> IMAGE_INSTALL:append =3D " glibc-utils localedef"
> GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 fr_FR.UTF-8 en_US.ISO-8859-1 de_D=
E.UTF-8=20
> fr_FR.ISO-8859-1 zh_HK.BIG5-HKSCS tr_TR.UTF-8"
> IMAGE_LINGUAS:append =3D " en-us fr-fr"
>
> $ bitbake glibc-2.0
>
> So I don't think it's caused by rpm 6 or gettext upgrading, and we don't =
need
> other patches.
>
> I will check how to fix the glib-2.0 issues, but it's not related to rpm =
6.
>
> // Robert
>

No sorry, I didn't mean anything specific. I did not had the time to
launch a build with this series so far, I just wanted to be sure about
the requirements.

Build will start in a few minutes.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


