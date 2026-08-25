Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C300C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:04:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23686.1787670268918263570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 08:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kn1znhPX;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso39377555e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787670267; x=1788275067; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6XX0y1HoZ56S7yGtBbu8Z7Vihzyqv4O01oZDr4rbg8=;
        b=kn1znhPXT/wqsaCnRFMl+If0VM6J52wUcBTqQPLMqugK1YPsXOqSs9EY8NW6VlSsJW
         ESPe+LF12WTkORPfd5Nwj4hekcq04AqNhC+TNbU7fF3jQiKJKaXHP034kDU5Eq8FXwjk
         Utw+a+d9wFi8u0qu+/11g9mvGw/Nn58HIssqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670267; x=1788275067;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6XX0y1HoZ56S7yGtBbu8Z7Vihzyqv4O01oZDr4rbg8=;
        b=Twq9ZY3ieXwHMjN6F4f9IH27Ws9ciSHLmxTOeZ5JIjOXHYHUeUu07g5g3rAuWvdt4K
         xbmz138eJVEfaL1jtx7S0O36KmY4nJvmYhoFxXpX31LoV/6BWsZ0aLC3t7H9deGHwbPa
         ROREXTKtfROR/MvSp3Lfy/fUqvta6CGuY+WtdhmuOt23lLNPck5VRe86Ps6AKz7B+0j8
         kOifFpDT6ps2JG9WTbI2NIYxxdVMj6N6RVy7TeAzvLytgGqlPKlM9jiEBT9KTkXX21Rw
         UBR4OVSt+uR/ecFLNMM6x6iVPATva/CE+O/ctRkXc/IfLltumN3GizQFN+nC6K4JxN8X
         J0JQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFz1WoiwDKa22aCh4z4rY00l5nGulucupArIg+xoID4Ir+Ubr6+ePj968XKPT67XEJ8uybBxnxB/dw3qUhEs9nrw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kmJeSgmHBdW90+lVH1BLhBjkILcoI80EVUxOVV39KmkQ4SIYLW
	CAZbAIG2XHEWmh4RnnMVnFdHVFwWonmGxqiYCT/Gi3azC4aL1YvMi3Kn6bOF8Hemd68=
X-Gm-Gg: AR+sD12ZugknxBzwlJfserhsfNcRfpDXK4ziuucEtzO0/MUZAcr9Jl5Jb4UoGaseYn9
	iye8hOHeNpa0vgNF9y0zx2QR1wob0ZwhOScWgjkTu3igUhsmFQZobZozD0YBnzmFxKDE+DR3/O6
	3USnwpGk3phKEF4SCLc5o3v7VtnnmlVmO1FtSL0UP2NF1COmPU6pPos0Vwb07ChEwlZRX7+g2NC
	y4g920tMP2RyOw4/8OPlGqRpI2cWVMLB6bZ4VtbJu59UAn6Q3XMFsD0I/Nc8l+AuNTJJtM3Bm+u
	65/5dBZgxQeTtGOmRb2h3obg/FNHLB8waIwgmK1tJkbGd+xH4PS2G7gHxRDBjRlLF5wW8aOTVQj
	8IHa04pck9uhqQSTl8M2ZC5OAe6Oi+0A/P6ITMHd2U9xrspxarzItfsLrY9phGRAYzEb3B9gVdx
	42yxK8hd4ti/SFa3HWvNwuigrk7cT9e2x7AmEflG3DiVwNRr+s3rpYbYBuXyqR9cqjqWsH4LmtC
	TjeOBmEb8j5dfsEIIlugscTM6bKQD9QZqdBtvaBXABteCdxS9B+So60YA0=
X-Received: by 2002:a05:600c:3b04:b0:499:adb5:e7b2 with SMTP id 5b1f17b1804b1-499c19d733emr293406985e9.11.1787670267007;
        Tue, 25 Aug 2026 08:04:27 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d6346ba3sm32747125e9.4.2026.08.25.08.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:04:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 17:04:26 +0200
Message-Id: <DKY47YY3L5UE.1DLQ2RS87JLFQ@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260805083103.2633995-1-deeratho@cisco.com>
 <20260805083103.2633995-2-deeratho@cisco.com>
In-Reply-To: <20260805083103.2633995-2-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 15:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244246

On Wed Aug 5, 2026 at 10:30 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream curl security fix backport for
> CVE-2026-8286. The upstream fix commit is referenced in [1],
> and the public curl advisory is referenced in [2]. The backported
> commit link is also recorded in the embedded patch header.
>
> [1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8=
319ad16
> [2] https://curl.se/docs/CVE-2026-8286.html
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8286.patch             | 81 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch

Hello,

This series does not apply on top of the review branch anymore:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wryn=
ose-review
|ERROR: curl-8.19.0-r0 do_patch: Applying patch '.../wrynose/bitbake-builds=
/poky-wrynose/layers/openembedded-core/meta/recipes-support/curl/curl/CVE-2=
026-8927.patch' on target directory '.../wrynose/bitbake-builds/poky-wrynos=
e/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/sources/curl-8.19.0'
|CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/tm=
p/work/x86-64-v3-poky-linux/curl/8.19.0/recipe-sysroot-native/etc/quiltrc p=
ush', 0, 'stdout: Applying patch CVE-2026-8927.patch
|patching file lib/url.c
|patching file lib/urldata.h
|patching file tests/data/Makefile.am
|Hunk #1 FAILED at 218.
|1 out of 1 hunk FAILED -- rejects in file tests/data/Makefile.am
|patching file tests/data/test1647
|patching file tests/libtest/Makefile.inc
|Hunk #1 FAILED at 100.
|1 out of 1 hunk FAILED -- rejects in file tests/libtest/Makefile.inc
|patching file tests/libtest/lib1647.c
|Patch CVE-2026-8927.patch does not apply (enforce with -f)
|
|stderr: ')
|ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wryno=
se/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/temp/log.do_patch.468848
|ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-c=
ore/meta/recipes-support/curl/curl_8.19.0.bb:do_patch) failed with exit cod=
e '1'

Can you please rebase and send a v2?

Please note that there are other pending curl CVE patches, I'd recommand
reviewing/testing patches to identify conflict at the earliest.

Thanks!
--=20
Yoann Congal
Smile ECS


