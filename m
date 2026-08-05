Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DF1C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 13:37:51 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40443.1785937069694363138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 06:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gWLdXUe7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1600d040e4so140973766b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785937068; x=1786541868; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fNzGr3ApgBcyr7fBm9KZ1KttqyHOChv7j+2bY9RR8yM=;
        b=gWLdXUe7Z8fXLu5KR86kLi3oArcQbHycDMhw34eDq/t+Y6bQqJQufwI1ooaGiCzQuN
         irkGl8ZwNb74wtYZLHja6sbxyJtbGQt6iYIG+/Sp0nuLJttUHnuTDIWyni/d4maXWh2l
         YSC2no6/r77VQoetLriu3ovfHJqH8xOaN9ttU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937068; x=1786541868;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNzGr3ApgBcyr7fBm9KZ1KttqyHOChv7j+2bY9RR8yM=;
        b=I6IWf5/qE6dwjNRVZud9t+pl9DkRaIZjifUU9CSiqUSebT4vD2BBDjwifuN7fjjR3U
         jLBWbb6aUPH/swS3NpzlJXWigHbelEZtBoNyQiaUl0+Pt1KdGvruPXJDx6S5MRKJM/kQ
         +KeYYnLwucdHjy4/hr6CAS87DvFx0a5PfJX4fE7Q6Qq/rqiEEJrVQhRFSejSmDvuvy55
         WwqQvyVAZlHoD1WMGb8TJD8LeTgJToh+qKN+0z7mzxQaskqSF2MTZW176iPZtnx7DsIH
         rlz2MAri44ZJnpBX7rIz2t5Fn3GIeRwvnUfTKM6i+S2Lsr7YnIg+pVFKpNXkHoiAkRd4
         h8Mg==
X-Forwarded-Encrypted: i=1; AHgh+RpPzZw+eA7SYd2JVzWzkbt3139iuDy34XZ4bgwZx06sBZ7jJYEbpRfUuqbGVzMzqj9++y7avyHzDom7RzYfBLLX8A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJ/R80ERkawxJf3AcQB8QlkTQr1iCpD2B1c1QLOUSoufNhn8iY
	soEg6zagHLIs1DeFYWdKIBo97gAZNZM0K9sZLK8z/cj35fH2RTj4Yv4asAdmHMjaUC4=
X-Gm-Gg: AR+sD10hAMpl3QmTGpatE4a0KGok+xsDfUAjXUpBCX4bTg4SJgFjarPelshrjunVQ0C
	325g+TvKChlhe4Y3FqrJxWVADrHkC0xEJ47o91m+dLuKms5ln0a9SGFzC2MRu2VQbex7gqWfL2d
	yUohNLVjG6p4no6KuPn23M1F8ffNCVBMMvHPfkbBTQeGL81TOXIhHTVndYOhlwKs8No9maPDo99
	t8u9vq0VXbtvOl4lSmO96kOfhnn/4B0mcABVkrVn5PfzvlCtIAMnYPoc5fYBqon1P85yPX9UHPw
	/aGCnY1NOswm3LIOnmOU62JRW+DMZ4KGDwYXtojeoV9+7pwqFMs1clqwzSnNed0PiA4UPm5x2Ev
	GhiNVJ5qL89k3HKzG9ltm0iLKZxySlRZUoWsMTzOrfoyg8ATG7U/W+O/h7Mn99GiBf1Id4ppsLM
	Gbxc0DJrLE+IgHM3yp46nulFv+03KEg8UEqa3JfIbpwfF11WL8r2j+CwFvjBe+nnJAucEa7plmZ
	WwcRmfXPJAU+q49ZDfQsGszfywWfQ34jAs3Q/7WQFaaUHK+REE=
X-Received: by 2002:a17:907:7281:b0:c1c:49d9:4c34 with SMTP id a640c23a62f3a-c20247dd3d2mr850846766b.11.1785937067885;
        Wed, 05 Aug 2026 06:37:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:acb0:465d:83cf:164? ([2001:8b0:aba:5f3c:acb0:465d:83cf:164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036227085sm116014066b.5.2026.08.05.06.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:37:47 -0700 (PDT)
Message-ID: <304c833b3d0bae2b9013a34f775f2d0bb405b2ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libtool: upgrade 2.5.4 -> 2.6.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, Jaipaul Cheernam
	 <jaipaul.cheernam@est.tech>, openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2026 14:37:46 +0100
In-Reply-To: <DKH1HUP3GM0Z.2U848KFCSC5C0@bootlin.com>
References: <20260804120503.2878-1-jaipaul.cheernam@est.tech>
	 <DKH1HUP3GM0Z.2U848KFCSC5C0@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 13:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242868

On Wed, 2026-08-05 at 15:20 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Tue Aug 4, 2026 at 2:05 PM CEST, Jaipaul Cheernam wrote:
> > - Upgrade to first stable release of 2.6 series:
> > =C2=A0 https://savannah.gnu.org/news/?id=3D10914
> >=20
> > - Notable changes since 2.5.4:
> > =C2=A0 - New libtool-next-version tool for guiding library version
> > updates
> > =C2=A0 - Objective-C and Objective-C++ tagging support (OBJC, OBJCXX)
> > =C2=A0 - Allow statically linking clang_rt archives by absolute path
> > =C2=A0 - Fix overlinking of dependency libraries on ELF systems
> > =C2=A0 - Pass --target architecture flag and resource-dir for Clang
> > =C2=A0 - SlimCC compiler support
> > =C2=A0 - MSVC and MSYS2 improvements
> >=20
> > - Drop 0005-libtool-Check-for-static-libs-for-internal-compiler-
> > .patch
> > =C2=A0 has been merged upstream.
> >=20
> > - Refresh 0003-libtool-remove-help2man-dependency.patch for new
> > line
> > =C2=A0 offsets and to also remove the libtoolnextv_1 man page target
> > added
> > =C2=A0 in 2.6.2.
> >=20
> > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > ---
>=20
> Hi Jaipaul,
>=20
> Thanks for the upgrade.
>=20
> It looks like this breaks build for ricv platforms (qemuriscv64
> MACHINE):
>=20
> ERROR: libunwind-1.8.3-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-
> worker/qemuriscv64/build/build/tmp/work/riscv64imafdc-poky-
> linux/libunwind/1.8.3/temp/run.do_compile.1756282' failed with exit
> code 1
> ...
> > riscv64-poky-linux-gcc: error: unrecognized command-line option '-
> > WCClinker'; did you mean '-Xlinker'?
> > make[2]: *** [Makefile:4151: libunwind.la] Error 1
> > make[2]: Leaving directory '/srv/pokybuild/yocto-
> > worker/qemuriscv64/build/build/tmp/work/riscv64imafdc-poky-
> > linux/libunwind/1.8.3/build/src'
> > make[1]: *** [Makefile:2932: all] Error 2
> > make[1]: Leaving directory '/srv/pokybuild/yocto-
> > worker/qemuriscv64/build/build/tmp/work/riscv64imafdc-poky-
> > linux/libunwind/1.8.3/build/src'
> > make: *** [Makefile:625: all-recursive] Error 1
> > ERROR: oe_runmake failed
> > WARNING: exit code 1 from a shell command.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2039
>=20
> Can you have a look at the issue?

I have a fix for this in master-next which tested successfully
overnight. Khem also agreed with it so I'll get it sent out.

Cheers,

Richard

