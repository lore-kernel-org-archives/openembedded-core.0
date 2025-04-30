Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFC2C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 10:21:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13489.1746008463702631741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 03:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cIPFc/u9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso32738485e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746008462; x=1746613262; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpFqRuYas9nL1A7rYRN1gYxRU9J+8odD5Wb4D/tIeLg=;
        b=cIPFc/u9a2wLI30hZtznV2OzOQUzMvLsEKi7ekVMNJr1QYOnliD/sUopugTiYYnbLm
         oi23QQcmIioqJosZ6G2Tn4NQ/qMh4BKUO9vogDIkYAtuJqbkaDCR4hK8yxaZMgGbW/UN
         92WJapAFoa67uVR13vuyYdrt6CUI+3RcLplls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008462; x=1746613262;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpFqRuYas9nL1A7rYRN1gYxRU9J+8odD5Wb4D/tIeLg=;
        b=uINyPfSl+OEqGx1EPSi0SDvuGI4nhwND3n2u6pPr+hPj2PDwqQhUZlSokaTqVovVC6
         dHS0zWCdyQCzM8l+c6T/prDHTNFzDbBepeA8ePlTCuRRQWl/O+e9nC1Pxc+NaCmPwGwQ
         Qstj3cLpgShZGNuSbAyNDT1cCQdcyUf4ud80wjOguuyoztmRlTckMO7iSW98k0JYVWlY
         3fsS9LyhIcRWU7Mpr9l6nq5S+hFX8nLS/VzJKJEPqczlPrxgdUYEoPILJcXo6BbsfKSk
         oCz5H4Lq61XAZ9VmYKgTsQo2XcsKrqyrHehlBNAHtIYMXhjHntDB6iuOn5DYsLXl0ZDk
         zO2A==
X-Forwarded-Encrypted: i=1; AJvYcCX8GWORJ/I4GORtH2xIXkai0CedkmxsX69C51E6j4aqPH6dFNu2MC8Xtzg7zWCxuzmfh+I45TnGMgkXayMBKGEB+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxbur3O529ANXAtDRAGutDsxL1OJeS74wvOWKPLkbtwZ5bWnvcS
	GQZnnHP5FGQ5gRGgfWy+TmIf47yytcfO3xQseEnNVDK3tDXJFsq8Xu9UvKaCnUvwhReQCuKt/bZ
	L
X-Gm-Gg: ASbGncsuWc18k9EA0wTC8+NOv6iAYsOaLt7/HyrVayPdj6kQPq81E2E9Nn/jWgug4dF
	95Z/h451Nu1linCeHECzqgU8IRUkp4BUwD7c5xQu9Fhi4UBjQQJLpEBi0mkFu21UVTl44dVIEj0
	VZ99L/SY0iCurcdDs34uJEUCKMDE8P87t3Tn28xI+9XV0n6PXP7R8Dq2LNbyFroxOxIHEwi5hA3
	KbuO2nuwMEc2U7Sy4Ots/nzEKGGVfjyUyeft+OPTrXsNQPUn2hBZqoMTcaLfueLXNYzEzH+nfn3
	nTbqrigkNeVFRzRPIkOKRD+sCp2D8WEajkpl0P1dMUW+aS9l/vwjhwbsnlUPUFKfyDQdtlMlz8G
	9s/MUaMKrD2PD/+0Z1LQIGx5MD+tF/g==
X-Google-Smtp-Source: AGHT+IGGQQ0XXnwVCmLvcJnLoj/BqIf4pSGzkNTp4puL3Fw+xzbMg8fHoCbCxfUSYl6QyPSzBxJfKQ==
X-Received: by 2002:a05:600c:3d0c:b0:440:6a68:8260 with SMTP id 5b1f17b1804b1-441b2634ab5mr22971605e9.3.1746008461834;
        Wed, 30 Apr 2025 03:21:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:da55:d8b8:29ea:771c? ([2001:8b0:aba:5f3c:da55:d8b8:29ea:771c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecb60sm19843825e9.11.2025.04.30.03.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:21:01 -0700 (PDT)
Message-ID: <c54692ed0c04efa06eccae718e2be06a96bc1aae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libmatchbox: fix version mismatch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: skandigraun@gmail.com, yi.zhao@eng.windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2025 11:20:59 +0100
In-Reply-To: <50f1c4bb-f7a5-461d-9222-a0b0ffaeb7ab@gmail.com>
References: <20250430003941.561146-1-yi.zhao@windriver.com>
	 <50f1c4bb-f7a5-461d-9222-a0b0ffaeb7ab@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 10:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215740

On Wed, 2025-04-30 at 10:32 +0200, Gyorgy Sarvari via
lists.openembedded.org wrote:
On 4/30/25 02:39, Yi Zhao via lists.openembedded.org wrote:
Backport a patch to update version to 1.13 to match current version.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
=C2=A0...ate-version-to-match-the-tag-version.patch | 30 ++++++++++++++++++=
+
=C2=A0.../libmatchbox/libmatchbox_1.13.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
=C2=A02 files changed, 32 insertions(+), 1 deletion(-)
=C2=A0create mode 100644 meta/recipes-graphics/libmatchbox/files/0001-
configure.ac-update-version-to-match-the-tag-version.patch

diff --git a/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-
update-version-to-match-the-tag-version.patch b/meta/recipes-
graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-
the-tag-version.patch
new file mode 100644
index 0000000000..093adc89ae
--- /dev/null
+++ b/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-
version-to-match-the-tag-version.patch
@@ -0,0 +1,30 @@
+From 18a5c0969cdf2e6e2e20ad29e7b23c6fb58dcd6c Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@eng.windriver.com>
+Date: Tue, 29 Apr 2025 10:25:29 +0800
+Subject: [PATCH] configure.ac: update version to match the tag version
+
+Update version to 1.13 to match the current tag.
+
+Upstream-Status: Backport
+[https://git.yoctoproject.org/libmatchbox/commit/?id=3D18a5c0969cdf2e6e2
e20ad29e7b23c6fb58dcd6c]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ab9f60f..0ef4977 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,5 @@
+ AC_PREREQ(2.53)
+-AC_INIT([libmatchbox], 1.12, [yocto@yoctoproject.org])
++AC_INIT([libmatchbox], 1.13, [yocto@yoctoproject.org])
+ AC_CONFIG_SRCDIR([libmb/mbtray.c])
+=20
+ AC_CONFIG_AUX_DIR(.)
+--=20
+2.34.1
+

I wonder if instead of carrying a patch in master branch for a
Yocto-internal project wouldn't it be better to create a new tag with
the correct version info.

FWIW I agree. I'll create a 1.14.

Cheers,

Richard
>=20
>=20

