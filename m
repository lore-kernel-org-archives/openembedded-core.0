Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CACC02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:01:56 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.112526.1738663308048788033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=jymUZ4q0;
 spf=pass (domain: foundries.io, ip: 209.85.208.53, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcd3454922so12413a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738663305; x=1739268105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7CcnpnQ6xmkom29DnRSYjqEzTX8h0+gdQpdihSbQmc=;
        b=jymUZ4q0Wh9DwLaLjJICTHBh4J5HxC8SRoyw3W/U1H4R2LKWOTzZfubJ0V2rii+snq
         EKFuxE7tvUMRU0SY6YmQ87DaLH7aT9D9XqAFJY48SaIloI/KENeIf36g9mBS/utP0Vbg
         //toJu2kgEVtSbmIZPww7IRDyThbC4j5gUvnRzSpQav/FdO1HRmehqOaDfm6XlDreEAT
         rv47WAulXpc/46ZueP0X9c0oZxvoisrI/glpKiinZ0IBo78JZSAVkEAm05XiuQrk6Amo
         LouVwEvMkOg+TVr3Nq9IUjwHnszUOUFoNkvXdvo856j3Rc248+NbIkJ2MGr0FF9ssyXQ
         X7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663305; x=1739268105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7CcnpnQ6xmkom29DnRSYjqEzTX8h0+gdQpdihSbQmc=;
        b=POA4gsZmViaUDPE6FkZZK4+U15AoZH36Rvpea1tx7UL+17M0kcX3Ix129qBJbT/Wox
         t8jXoI8/I/qOIap7d6FUS/q+fN4Mct5Lx81bn9SaxvQDp6BWijtHuJ/ESWwxnhS7tAiU
         6Ul+v7c6GNuTq7b/Aijen6YYVNa60qkzx2Xz3QA2Nww7nz62JhD+9yEjsrGFCjrzRR73
         REgExJxhjv6ahUjESRbSn4/Luq6m6NtRSJakRlRezRhjPhR6cZZtXaYJRBUlEFJ+YYF8
         YvsT4qeGloced6svpVDUWo3ALg7HFUu4Ah6W7kDBESANyHwtMjJQAGjS6TCtpWDxdJqX
         jlyA==
X-Gm-Message-State: AOJu0Ywj8rQnWJzLTv3XheWbDM6jOc3hDKkMOJbe7kzCa9rLlVaTSHd3
	FE06efEg6fb23sYoyKEOZPMDQrqtF8EtWyT9C7/52Wlp3Ka5y97wkfSQUWWXVMpJNyj2hC8A7NQ
	ib0/WNg==
X-Gm-Gg: ASbGncuS/Pr8ZcHubb5YQQC7uWFQTXnxoerX6lYcYhRI9wLd20PE5NpmdvUsjIzPKj5
	w5Ej4YjTcEacPFsP+K2hCF5utJIEgDiiLPr1CiboSE//hOHgoDmjy2DQZZ/dkTia4bl9DpY7PEc
	EC+ZmoYtEFonS2GaUxAo5cBkTv5nS7DaExyjCtwRkoWBBVXlL5tcFnBxkcZbn5CQaRD9onGjlQE
	XqN5nQTICynSQSa4uoSumiDD42C7h1y2eHZyVrgGjwykKh+cTCLcJ3dmeIMvijddtW7KJvT/aMt
	dreDoTqGG21vFEQdUePTrvY=
X-Google-Smtp-Source: AGHT+IG9YpE25Yoh1DTAclIawQvDBiwFUPqpraE3tcPQKpUb6s5Gy2Eq2QJG2GHuMm2rH5ZSbcV3xw==
X-Received: by 2002:a17:906:c143:b0:ab6:b9c0:1ea2 with SMTP id a640c23a62f3a-ab6cfcea3e7mr2546035266b.25.1738663305282;
        Tue, 04 Feb 2025 02:01:45 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff724sm899065966b.105.2025.02.04.02.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:01:44 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH 4/6] SECURITY.md: fix markdown style issues
Date: Tue,  4 Feb 2025 11:01:12 +0100
Message-ID: <20250204100114.3749576-5-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
References: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210759

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Fix markdown style issues using markdownlint tool [1]:

$ cat SECURITY.md | mdl
(stdin):16: MD013 Line length
(stdin):19: MD013 Line length
(stdin):20: MD013 Line length
(stdin):1: MD026 Trailing punctuation in header
(stdin):6: MD034 Bare URL used
(stdin):16: MD034 Bare URL used
(stdin):19: MD034 Bare URL used

[1] https://github.com/markdownlint/markdownlint
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 SECURITY.md | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/SECURITY.md b/SECURITY.md
index 1b63da4f69..a83e09bb0f 100644
--- a/SECURITY.md
+++ b/SECURITY.md
@@ -1,9 +1,9 @@
-How to Report a Potential Vulnerability?
-========================================
+How to Report a Potential Vulnerability
+=======================================
 
 If you would like to report a public issue (for example, one with a released
 CVE number), please report it using the
-[https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Security Security Bugzilla]
+[Security Bugzilla](https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Security)
 
 If you are dealing with a not-yet released or urgent issue, please send a
 message to security AT yoctoproject DOT org, including as many details as
@@ -13,10 +13,10 @@ and any example code, if available.
 Branches maintained with security fixes
 ---------------------------------------
 
-See [https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS Stable release and LTS]
+See [Stable release and LTS](https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS)
 for detailed info regarding the policies and maintenance of Stable branches.
 
-The [https://wiki.yoctoproject.org/wiki/Releases Release page] contains a list of all
-releases of the Yocto Project. Versions in grey are no longer actively maintained with
-security patches, but well-tested patches may still be accepted for them for
-significant issues.
+The [Release page](https://wiki.yoctoproject.org/wiki/Releases) contains
+a list of all releases of the Yocto Project. Versions in grey are no longer
+actively maintained with security patches, but well-tested patches may still
+be accepted for them for significant issues.
-- 
2.43.0


