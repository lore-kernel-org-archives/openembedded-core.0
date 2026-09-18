Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DEEC982DF
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 17:20:43 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16175.1789752034983986542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 10:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VjRhQvko;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso8045645e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789752033; x=1790356833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qOp+Ukn0WvZX6CsXGMBXvlDuK6rXk7qx00oKeU4BrA=;
        b=VjRhQvkoyI7LRD0shqKiZattEvPdByVP5/lm+c/CYkIJgE+b8Fl7weOPCCqBp2BmH5
         1CWhA8NxHEco8f9GM/eINiexPmZWMny7kYL6Q20b38LxkfmSFzQN51P23tPykdnGpJxs
         Y5pa2EHEMVovjmAX3LIX6PnwjqnajC9vMJKhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752033; x=1790356833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9qOp+Ukn0WvZX6CsXGMBXvlDuK6rXk7qx00oKeU4BrA=;
        b=KujiQNhzThuK6RRwbNIzcQQDSPiLuTqB2BGTkGJ+nv+84em4lFqGVXdYNQ0zUqnnF/
         UB5qQP3/iyTUwu52iIIEV+BCObDGixjKdTT7UfHLnPpFfMM6hx+DTul3adTESn3C5ERk
         GzCusRZmZOW7s3hhWTm5kZVOBN1y4n+LvnCKsvTilPmClfbMSqkllfFNYfZ6TYRr6lg+
         hvo4tY1S4gle08+4fHsxBW76AMg/FBL8B+lkDuB0viOxNTtJlLejlfhowVlpla46JDOQ
         HMghkeaxiIH0U8PD+7ttpfFr3YdPXqROgD5vIxXbGzmZKT3zcnJ7hM65ez/6WcphfJOg
         N9xg==
X-Gm-Message-State: AFuF++ltk+bSTNQtXkM5TgYrcj6F5ibw38fVyjc2jLEt2pvpELx73F31
	S/Ty7DhDuK2/9eZszgh/xMtzQoqbolpzjGPq68cFChByaYUhvZQn7SrMrrnuuA+CRd6OLbbN7PA
	uNf9IJHw=
X-Gm-Gg: AYBFou0ephJfsMHIcoYB9VY1fcigEtVGSpAtgFkAKocpsqoB5aywO/7fMNplsZt+4lU
	uel5Xwmqy9cGRsdsfxfodibN6deOKhePR3uClbmYAnau/VdamZ2xCZYAss0fnQ3HXuhltdW3VaR
	PQC6ksve1ZhRpiEJ8tw6w7qDaOahvOy4mKdbT0k71VHJ0T76e1qSX7E0osMvpRKMCrsmJTKZ8OE
	2+WiX7AsFyNFRQqjI52R5BWhdt5z650Irsmfw9OPMUelVCCo9MzMdnyi6xUNDmU73j9wcNFl3oY
	ow+7byV/EdRyTO0w5oN96myQEKfEzDOxG/HXHAWQ8XPIUjWrijXgBZ+4FSxU0HHmCnyb9fwJWXO
	ZlFoAowTWin37lmVnr711wR5UkiRRMxELswwyJXv6k5lzAeb4hOwBUADLRss9EsLgc1nrz/3iw6
	dCPmcIJcBG3cACRMsc0Xd+2J8P1dKFzL3U7ij5fXeQLB3CjdumLjs7w/nTIE2hrNSO/TXna1rMD
	+RbKrLK83GSG2PBtq7oObiwkJU=
X-Received: by 2002:a05:600c:354e:b0:49f:bd3c:bc1d with SMTP id 5b1f17b1804b1-49fc573a7famr44303825e9.24.1789752033024;
        Fri, 18 Sep 2026 10:20:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:22f8:9184:5b80:7430])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm71174935e9.2.2026.09.18.10.20.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:20:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] site/common-glibc: Set gnulib locale variables
Date: Fri, 18 Sep 2026 18:20:28 +0100
Message-ID: <20260918172031.2871246-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 17:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246219

These locale variables are determined by running test binaries. Our sysroots
don't really set up locales properly and the results vary depending on the
host architecture and the locales installed.

Fix the values to a known set of locales that could be installed if the
user does so which is at least determinsitic. These are selected so the m4
recipe ptests run successfully.

An extra mbrtoc32 macro needs to also be set to have zh_CN work correctly on target.

We still need the musl equivalent to this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/site/common-glibc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 29f96da48d6..4dbfb4cb57f 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -67,9 +67,19 @@ gl_cv_func_mbrtowc_sanitycheck=${gl_cv_func_mbrtowc_sanitycheck=yes}
 gl_cv_func_mbrtowc_null_arg=${gl_cv_func_mbrtowc_null_arg=yes}
 gl_cv_func_mbrtowc_retval=${gl_cv_func_mbrtowc_retval=yes}
 gl_cv_func_mbrtowc_nul_retval=${gl_cv_func_mbrtowc_nul_retval=yes}
+gl_cv_func_mbrtoc32_utf8_locale_works=yes
 
 # va_copy and _va_copy
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
 ac_cv_func_va_copy=${ac_cv_func_va_copy=yes}
 ac_cv_func___va_copy=${ac_cv_func___va_copy=yes}
+
+# gnulib locale-en.m4 and friends look at the sysroot or host locales
+# we need something deterministic
+gt_cv_locale_en_utf8=en_US.UTF-8
+gt_cv_locale_fr=fr_FR.iso88591
+gt_cv_locale_fr_utf8=fr_FR.UTF-8
+gt_cv_locale_zh_CN=zh_CN.GB18030
+gt_cv_locale_ja=ja_JP.euc_jp
+gt_cv_locale_tr_utf8=tr_TR.UTF-8

