Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3E6CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 11:56:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20033.1792151815575989818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 04:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V/Zv5DkQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E6424E4124C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 11:56:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEE986075D;
	Fri, 16 Oct 2026 11:56:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B14AB10328153;
	Fri, 16 Oct 2026 13:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792151812; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qG6M7a8sNdjketFrpC/oWgrI+3EyilNfaHy8udUTLic=;
	b=V/Zv5DkQX2ZJYTLTqbmwlF54O1ubOh6akbNoFvYyJ5G0FP/6oZav/IWsUR7zp0t8ALMNe6
	Xup9yJ/ROdvQOdWcvaqZJJdwB9M7vNRw0JKM021Jv/OA7LxLvy89XfReXAdf2bLPEAyy0Z
	lIDJarBMg7MyFVZAtMpKK8Xkeciw2q1VFLuKjoKbfXdk0ZoLHAHbWwgYwOZSyJ0aJC1+tt
	4t0ef37Djs283tOdJKiHWrX4Sk8+5+loBXHmcjb0XN77eDQaQJgXPpifeKweoEYSJhKgKt
	KIuLCvDjGOuyJuv2bthv/BJZRG9/yamG4imt0dgnKg5r3O/9fpvSr06+M7CvPg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 13:56:51 +0200
Message-Id: <DM68SO6TLPT9.17KOYQYSWPYAS@bootlin.com>
Subject: Re: [OE-core] [PATCH v10 2/3] dnf: Upgrade to 5.4.6.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261015142331.3639101-1-adam.duskett@amarulasolutions.com>
 <20261015142331.3639101-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20261015142331.3639101-2-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 11:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248015

On Thu Oct 15, 2026 at 4:23 PM CEST, Adam Duskett via lists.openembedded.or=
g wrote:
> Completely rewritten in C++, there are several changes needed
> to facilitate moving from DNF4 to DNF5. Below are some significant
> items to note:
>
>     - Added a negative lookahead filter for the following warning if
>       RPM_SIGN_PACKAGES !=3D '1': "Warning: skipped OpenPGP checks"
>       This warning is hard-coded and piped to stderr if gpg checks
>       are disabled. However, most users do not sign their RPM packages
>       and use dnf to simply construct the rootfs.
>
>     - The "-v/--verbose" cli option is removed. As such, remove the argum=
ent
>     everywhere it was called.[1]
>
>     - the rpmverbosity cli option is replaced with --setopt=3Drpmverbosit=
y
>
>     - Change gpgcheck to pkg_gpgcheck as this is what the documentation
>     recommends.[2]
>
>     - --nogpgcheck is now --no-gpgchecks
>
>     - --setopt=3Dprotect_running_kernel=3DFalse has to be set or else eve=
ry dnf
>     transaction complains that /boot/vmlinuz-${kernel_version} does not
>     exist in /var/log/dnf5.log. There is an open issue on github[3] to en=
able
>     the currently not-yet implemented `autocheck_running_kernel option`, =
but
>     it has been open for quite some time and the protect_running_kernel
>     option supresses the message.
>
>     - Move --skip-broken to after the install argument as the global
>       --skip-broken argument is removed.
>
>     - /var/cache/dnf is replaced with /var/cache/libdnf5
>
>     - Add `features +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'`
>           `features +=3D 'PACKAGECONFIG:append:pn-librepo =3D " sequoia"\=
n'`
>       to test_testimage_dnf as librepo currently does not work
>       with gpgme.
>
>     - Change `if line.startswith("Error in POSTIN scriptlet in rpm packag=
e"):`
>       to `if "Error in %post scriptlet:" in line:` as dnf prints `>>>`
>       charachters and the error string has changed.
>
> While DNF5 has many config options, unfortunately, the majority
> of them depends on sdbus-c++, which is not included in OE-core.
> However, the package is included in meta-openembedded, so it's
> best to include the PACKAGECONFIG options in the recipe and
> leave them off by default.
>
> 1: https://github.com/rpm-software-management/dnf5/issues/464
> 2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
> 3: https://github.com/rpm-software-management/dnf5/issues/1255
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

Thanks for the new version. We do see build failures, probably when
building against musl:

ERROR: dnf-5.4.6.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker=
/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/dnf/5.4.6.0=
/temp/run.do_compile.405459' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/dnf/5.4.6.0/sources/dnf-5.4.6.0/libdnf5/utils/bootc.cpp: =
In function 'std::unique_ptr<json_object, int (*)(json_object*)> libdnf5::u=
tils::bootc::get_bootc_status()':
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/dnf/5.4.6.0/sources/dnf-5.4.6.0/libdnf5/utils/bootc.cpp:4=
4:74: error: expected unqualified-id before '(' token
|    44 |         std::string stderr_content(reinterpret_cast<const char *>=
(result.stderr.data()), result.stderr.size());
|       |                                                                  =
        ^~~~~~
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/dnf/5.4.6.0/sources/dnf-5.4.6.0/libdnf5/utils/bootc.cpp:4=
4:97: error: expected unqualified-id before '(' token
|    44 |         std::string stderr_content(reinterpret_cast<const char *>=
(result.stderr.data()), result.stderr.size());
|       |                                                                  =
                               ^~~~~~
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/dnf/5.4.6.0/sources/dnf-5.4.6.0/libdnf5/utils/bootc.cpp:5=
3:70: error: expected unqualified-id before '(' token
|    53 |     std::string stdout_content(reinterpret_cast<const char *>(res=
ult.stdout.data()), result.stdout.size());
|       |                                                                  =
    ^~~~~~
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/dnf/5.4.6.0/sources/dnf-5.4.6.0/libdnf5/utils/bootc.cpp:5=
3:93: error: expected unqualified-id before '(' token
|    53 |     std::string stdout_content(reinterpret_cast<const char *>(res=
ult.stdout.data()), result.stdout.size());
|       |                                                                  =
                           ^~~~~~
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4895
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4863

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


