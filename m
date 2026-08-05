Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D692C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 13:21:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40172.1785936063116664097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 06:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xgdi1ZI9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D24731A143D;
	Wed,  5 Aug 2026 13:21:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B49602AB;
	Wed,  5 Aug 2026 13:21:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D460E11C34A15;
	Wed,  5 Aug 2026 15:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785936059; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dmwcpqje7FbcEQ5TdKevxghRBQfrbDiHkDSBxK3BdqA=;
	b=xgdi1ZI9Xp0TwJm+cGKVaPomzCETzyAaP4p/zGy7CfmZqqHRLdvFMWRZe1xkKO7PSxyxRJ
	kmcxY3j/tbPhAbguKwhdt9vzi4BxcI8GT58FWL88uGetp1DHjFolvskEJ7tAw9J6529peS
	j6Yh33a9k5vo48826U8mlvPpeSmBg0A0N93qIH4gbTS4wBmAgh1Uq3GhGNUQXjjegxoDAb
	L5T0QYXyO/lde9BuOlzWo4KBsX9tTktM4GHRXbjmtLR4z96nin8RlJx2nan/0kDwnoQc3d
	/Zz+8rCz9FmaF2fM/1x//E+Dqhhsrentdkf9m1Ajztr9crJqatPlbj6uouTWaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Aug 2026 15:20:58 +0200
Message-Id: <DKH1HUP3GM0Z.2U848KFCSC5C0@bootlin.com>
Subject: Re: [OE-core] [PATCH] libtool: upgrade 2.5.4 -> 2.6.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260804120503.2878-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260804120503.2878-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 13:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242867

On Tue Aug 4, 2026 at 2:05 PM CEST, Jaipaul Cheernam wrote:
> - Upgrade to first stable release of 2.6 series:
>   https://savannah.gnu.org/news/?id=3D10914
>
> - Notable changes since 2.5.4:
>   - New libtool-next-version tool for guiding library version updates
>   - Objective-C and Objective-C++ tagging support (OBJC, OBJCXX)
>   - Allow statically linking clang_rt archives by absolute path
>   - Fix overlinking of dependency libraries on ELF systems
>   - Pass --target architecture flag and resource-dir for Clang
>   - SlimCC compiler support
>   - MSVC and MSYS2 improvements
>
> - Drop 0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
>   has been merged upstream.
>
> - Refresh 0003-libtool-remove-help2man-dependency.patch for new line
>   offsets and to also remove the libtoolnextv_1 man page target added
>   in 2.6.2.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade.

It looks like this breaks build for ricv platforms (qemuriscv64
MACHINE):

ERROR: libunwind-1.8.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/qemuriscv64/build/build/tmp/work/riscv64imafdc-poky-linux/libunwind/1.=
8.3/temp/run.do_compile.1756282' failed with exit code 1
...
| riscv64-poky-linux-gcc: error: unrecognized command-line option '-WCClink=
er'; did you mean '-Xlinker'?
| make[2]: *** [Makefile:4151: libunwind.la] Error 1
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/qemuriscv64/build=
/build/tmp/work/riscv64imafdc-poky-linux/libunwind/1.8.3/build/src'
| make[1]: *** [Makefile:2932: all] Error 2
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/qemuriscv64/build=
/build/tmp/work/riscv64imafdc-poky-linux/libunwind/1.8.3/build/src'
| make: *** [Makefile:625: all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2039

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


