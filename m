Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAC71125853
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:52:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24993.1773330750191450740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HRVAUUFy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 045E61A2E31;
	Thu, 12 Mar 2026 15:52:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6A7F6001B;
	Thu, 12 Mar 2026 15:52:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 338E31036852B;
	Thu, 12 Mar 2026 16:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773330747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J1RGsFEK44z6FqyHf4ELbS84R669CajQ0wO8BbSJonE=;
	b=HRVAUUFyy9G3Zh3C6NOnVyQIdQbPz5oDO31tkz9qACZTpjQhWkVC18EngGRSK+kQLVtPCE
	surSkXXdsHG4tpOkpV9WYLI0xc5Rv3dtIBIrx5S/eGUBg8is6DGpTzF9FTP3Dsu4tuQru1
	5D47LnK6JhV9/IpFjUb0eyh2rQSSzZG9mQWdZfYqlJH+zyyOeXFoOtfUs+6Web/8jgLYXi
	Nlx+XRjM5yH/frmFU8WBFeNshy+O2XA06M0FoMqoKmcOk8+puIfSWeB+8JkEeiFoDwRtwb
	rZX73K3c+tLtL0DtmfAu70rMricw88kEUb+usQ04OnUQEEHgy3hT61c3q512yg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 16:52:22 +0100
Message-Id: <DH0XA8PQOXXR.12KPIBAF43RZ3@bootlin.com>
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 0/9] rpm: 4.20.1 -> 6.0.1
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1773324129.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232983

On Thu Mar 12, 2026 at 3:09 PM CET, liezhi.yang wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> * V8:
>   - Fix build with systemd (Check patch 7 for detailes)
>   - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgcon=
fig=20
>     (Check patch 7 for detailes)
>   - Backport a PULL from git/libarchive to fix oe-selftest failures.
>
> * V7:
>   - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
>     To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04=
 when
>     pkg-config is installed on host, now the host contamination has been =
fixed,
>     and the patch has been submitted to upstream:
>     https://github.com/rpm-software-management/rpm/pull/4127
>
> * V6
>   - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>
> * V5
>   - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>   - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencie=
s
>     between /bin/sh and libc.so.=20
>
> * V4
>   - Fix loop dependencies issues for libc6 and busybox
>   - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>
> * V3
>   - Fix Alexender's comments
>     a) Suppot rpm 6
>     b) Move rpm-setup-autosign to rpm-build
>     c) Remove -DLIBELF_FOUND=3DFalse
>
>   - Fix build for nativesdk-rpm
>
>   - Drop patch for createrepo-c since it has been upgraded (rev:
>     804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>
> * V1 & V2
>   - Initial version
>
> // Robert
>

Hi Robert,

Thanks for the new version.

I suspect I still need to get some gettext patch with it. Either yours
or the one from the glibc upgrade series. Is that right?

https://lore.kernel.org/openembedded-core/cover.1772895871.git.liezhi.yang@=
windriver.com/
https://lore.kernel.org/openembedded-core/20260310174403.2309825-2-Hemanth.=
KumarMD@windriver.com/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


