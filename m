Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77245D66BB9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:07 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.64668.1732680724912094487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FAsBCcG7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7f71f2b136eso5118182a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680724; x=1733285524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h/57eVIUd/Hd1x/CoMEujq0nlznAeijLvrvdtSwVAc=;
        b=FAsBCcG7W/CIfeXPgqLpJkZhZy9wy3nkISa/qVDoGeiG6QKF0lqsxqXxVhBxtXAbZO
         2Ege382EXkV3hsfQjhdvY7Eo3KJ6FBGvXRjOsHEa/tEgVZXMTD1TttJ5B7kTtbjX33zv
         9ZIUcnH6qw0wFA3b4trwON+qGxw4QbbmQgNc6R/zBBGWeR/Q/+FpOUDk65JTgwFE17f4
         ZFa6cP8F/X+23bqceNfYJDMvRb+woPXQmn8eG47Nti96MKiLWpHXScPkMb4qZi6g7Ypw
         g8YcF7qqSkYzml8ZM1r6HDoWZu0VkJ+0jpSCzLEqwvo/UdtDbwxybzgV2AFEb091fVMK
         u+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680724; x=1733285524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h/57eVIUd/Hd1x/CoMEujq0nlznAeijLvrvdtSwVAc=;
        b=jqk8ndu34sEY+v/j/opYPb0o6OSSiJSaxUWVY9s7f82ztzKgxkhYPu3y6QwWwqQERD
         bAnNHlrHuV36ykPEplTqsoj2TrcY/nqC3JqKdvu/okYmZkHx8mV2voWloT1Sq/jI7gPe
         JhKsO7GkIuRqIt9dKq/lMYw3TLF99EK7w2+Hj/SjZ1rSpR+OZG+k3XSiKYSrJNrNhqrd
         xG1P+45nkoeEFCYXJ/xXncFEC8ockgW8Www7eZChU1yxBXCRZzNxyocjhzMjDx77hyEh
         2/YXmH6EBut6wQxCEVyEwIv7XB0x30oQx6DUvlfrLU7C5z6H4kgIehY2G1N7EyPZ8GyC
         HZcQ==
X-Gm-Message-State: AOJu0YySpnVLjsdtCq6mbTKMTdSvWce/TrkuGrkaYSVL12mJrj5+mvLY
	+gxQLDty7C9LppDGPA43N3gztL5v8zFBCxH8IfqZhWPZ72LFECp8KTgsTzcrt7bQEpg5ZsKdxIb
	+
X-Gm-Gg: ASbGncsFdxlVHbN3pD0a6bn9/uspWwK5ru5uLfASXsoHeTCh1eeaAzXSyYVjA8oKIT+
	oenQ3Cn8l3j8ngZ5fMBmdmSNwLe4dthCPmiQ7ETg2HDdybFK8SvF7bXnOggRCAVaFYjCZm1r5Xz
	Z1kOx+FsssTss8uMyiEoLmeBAC0jSnnnGbRHsUP8uY1fKWUD4HY56z9fN0e7RaNA/u9qRcLmnMY
	zsEu3kpmOuArc6fRIwh/4mcLlb8WTDfQozsOfc=
X-Google-Smtp-Source: AGHT+IGSSt/98fDlGsVPPWepdoLCnJFAveuAg/dFbXFC564HRJA73xaiZhSeTbkMypdBQgj2MYZRuw==
X-Received: by 2002:a05:6a20:748f:b0:1e0:d10f:806c with SMTP id adf61e73a8af0-1e0e0afa675mr3010946637.6.1732680724045;
        Tue, 26 Nov 2024 20:12:04 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/18] linux-yocto/6.10: bsp/genericarm64: disable ARM64_SME
Date: Tue, 26 Nov 2024 20:11:28 -0800
Message-Id: <3a6e6639b0dc4a49adfba15e720bb884d9859aa7.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207902

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: disable ARM64_SME
    Date: Thu, 21 Nov 2024 15:53:35 +0000

    From upstream:

        arm64: Kconfig: Make SME depend on BROKEN for now

        commit 81235ae0c846e1fb46a2c6fe9283fe2b2b24f7dc upstream.

        Although support for SME was merged in v5.19, we've since uncovered a
        number of issues with the implementation, including issues which might
        corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
        patches to address some of these issues, ongoing review has highlighted
        additional functional problems, and more time is necessary to analyse
        and fix these.

        For now, mark SME as BROKEN in the hope that we can fix things properly
        in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
        very little extant hardware, this should not adversely affect the vast
        majority of users.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 022f9814cb9d6d420e9d89a746f4c67b452c498f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index fa78313a9e..7c0425bb27 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
-SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
+SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index d21fd63d38..891dcb596a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
+SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 45d7bfd619..3718077ea9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
+SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


