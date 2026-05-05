Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A19DCD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 07:43:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34104.1777967017580977964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 00:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qn7ruXbr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so77974145e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 00:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777967016; x=1778571816; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PljCGQR2j80V39cYrT/jnK+lzUZVrm/OXGCgBJAkr3g=;
        b=Qn7ruXbrzC2KBh7scIFuebYkvixmhk7E1V72/vNH64a6CiSB77rqT9/K1Gdp2IDgop
         LWggNQe4zsk3+ZJpbqGJ2rp7MDv1Tou0Fph7lmrTn8iLPMF3Bw7XHnXS5GOGWJucnxl3
         XXKUAB2/as/4w8gLs33yueKLbt1AU4tKfkEvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967016; x=1778571816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PljCGQR2j80V39cYrT/jnK+lzUZVrm/OXGCgBJAkr3g=;
        b=TclQkSrcCYncFJhl+nhMhGBIUJcnWYKaEaKXECj/pNYqKyFjue6iD6Mb1Y4LBRTCNE
         1PXEm498HdYjeAVVXpQ7nHjsCAVML/5VaXO1hsMVsMgNP8tCfYhbRf1wKwvN/dzy0Ro3
         x35nz3KkUQiIwmOtcu9k341jDdhIdX0VG1BHGNqF9fgyssuhqzYl6dJEszQsTC29oFWa
         EQGZHOceofE9ghBpRYSEdA0D9c+F6/A3JLEhz9lKVeFwlsPlBRnOcMGLiymwhKwjVxSh
         S/v60ZfkIfCPm9BDDixBh4toDvx/iZDXhmSjH9wPmtA/lNC5t+77V2fbJCrFEekGTiDi
         354A==
X-Forwarded-Encrypted: i=1; AFNElJ8XxnphAvLpULADqr6QbD1pcJfdr7wVq1Z38QozDWHIa0Px2NCuTKeDo2Q6vWvnqddgvF5a82ssZWAV/uAa6zkHlQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/Ux5tO+A9i7xzzuE6IWp8IDB48KJEkUAp3KkQha+zuTaH9aAd
	lbo4M3ssOif6Z/hef7wKDOR5rmkgBkoMamY7veX4BOBKPFIX+Pq7RI97BSmBSIbElfEY3aJk7Cp
	LOMUTm+U=
X-Gm-Gg: AeBDiestN8YfXgl4rq5BVukB4MPN2Gik6JrbSq+1fIwb/xOw0BxZ7TJggvOT76/N/nu
	AVuqi4jDMfHkwAXLqhkAS5tm/CrC/JMXWPXD1WV7+PIVVhGcLraSZyK6JQ4YaYA1XdTr7nFGd8t
	8myB4pHnEsVEd4Db7aXvdIWhnchirlmmfmtDqxAJ0upQMTS2a39quTkNdRCcMOVYs8/SiWnEfiV
	phKCyOCMlawDhCln5EqkE+UXqIGQdaLigc9s35/NiQsa7VesdtrQ/aYpJCq5YTxkfQubjilYVcv
	RjQcy+WNT2gKrUffZe4pB6QlKAhtopJLLD2QPpV1PX6mup0ai3woA1pfgqeCv9wzS0GQXzv0Xxo
	Mmxrzue+NEoDHYDJ2e5qEETJbgGD2lMLPBvXlIfAUZ6HvlXbnmOu5XUtK8PvGj1z3TFzDkbNNla
	P1WF5eW4jo29O2u2LnEJixxBe9bbotBtBfL+h9PjyzbIvqN4g74q8p3vV4+y0jgBO8Ox4mx2WGn
	VN1Gbe4wJ6GqFLWURTIYTmadQg=
X-Received: by 2002:a05:600c:468f:b0:48a:9540:1a3a with SMTP id 5b1f17b1804b1-48a98635f9emr211532255e9.8.1777967015801;
        Tue, 05 May 2026 00:43:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8349:ba09:9e5a:e125? ([2001:8b0:aba:5f3c:8349:ba09:9e5a:e125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48f63sm2381012f8f.16.2026.05.05.00.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:43:35 -0700 (PDT)
Message-ID: <09130fab3a76b8402ad4753bfb1d71fd6775ebd2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quan.Sun@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 05 May 2026 08:43:33 +0100
In-Reply-To: <20260505001613.1203967-1-Quan.Sun@windriver.com>
References: <20260505001613.1203967-1-Quan.Sun@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 07:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236464

On Mon, 2026-05-04 at 17:16 -0700, Quan.Sun via lists.openembedded.org wrot=
e:
> From: Quan Sun <Quan.Sun@windriver.com>
>=20
> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>

The changelog should mention any key changes.

> @@ -26,8 +26,6 @@ do_install:append() {
> =C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${D}${datadir}/icons/
> =C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${D}${includedir}/qemu-plugin.h
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 # Install qmp.py to be used with testimage
> -=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/qemu-python/qmp/
> -=C2=A0=C2=A0=C2=A0 install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-=
python/qmp/
> +=C2=A0=C2=A0=C2=A0 # The qemu.qmp library from the main QEMU repository =
has now been removed.
> =C2=A0}

This looks like a key change that should be mentioned!

Unfortunately, as the code says, testimage uses qmp. We therefore need
to find a new way to provide qmp for testimage. We can't simply delete
it and the comment you've left isn't useful either.

https://github.com/qemu/qemu/commit/e1e49b35b3c3cf6b7c68b6b1df18a477ac3183e=
5

mentioned we should be using:

https://gitlab.com/qemu-project/python-qemu-qmp/


> @@ -26,5 +26,5 @@ index 82cace1..83bbda9 100755
> =C2=A0-fi
> =C2=A0+meson=3D`which meson`
> =C2=A0=20
> - # Conditionally ensure Sphinx is installed.
> -=20
> + # On Haiku, meson might show up in a "non-packaged" subfolder instead, =
see
> + # https://github.com/haiku/haiku/blob/r1beta5/docs/user/storage/storage=
intro.dox
> diff --git a/meta/recipes-devtools/qemu/qemu/0010-meson-fix-subproject-in=
clude-paths-for-standalone-bu.patch b/meta/recipes-devtools/qemu/qemu/0010-=
meson-fix-subproject-include-paths-for-standalone-bu.patch
> new file mode 100644
> index 0000000000..b7d31f0ed7
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0010-meson-fix-subproject-include-p=
aths-for-standalone-bu.patch
> @@ -0,0 +1,52 @@
> +From f013e84d382bc1bd7d49206bdf47c689b0c6fbb5 Mon Sep 17 00:00:00 2001
> +From: Quan Sun <Quan.Sun@windriver.com>
> +Date: Fri, 1 May 2026 13:53:24 -0700
> +Subject: [PATCH] meson: fix subproject include paths for standalone buil=
ds
> +
> +Upstream-Status: Pending

Why Pending? Do we need to dicuss this issue with upstream?

Cheers,

Richard



