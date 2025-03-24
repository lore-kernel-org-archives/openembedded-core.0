Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D3BC3600D
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.43707.1742834026680465672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYJ4lYmP;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224341bbc1dso87486385ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834026; x=1743438826; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+tBLibFErLnFMJXc7xO7WapFcCCqxq34J4cSYY0jOE=;
        b=hYJ4lYmPTYz49+wy81dNZm2yCjkNqziUht/oAV9vyIbQR9DsYo2AZx3jqKzENViL55
         2wAPlMZSb+u8+8MkMu4JaNVjBQOCZ1MpfTdyu1zqgbgkQVFL/NUFJfZ3y8snO4VEh7mu
         ATMc+ngGCXX/wSBl06zseBGOGP/hXRYTtroLimZZvwGs8fFMD2JVqu8VyfZtzOttZX3/
         QBoKIShHdfyPa2v6Zdk/wjuvjq8fY6JUFF8Oi8jp++htEgufbm20mJAaMEfy1+nXMb0h
         qqDVz39rQUJt6+YZs5S00FUvw/kw1adV6xa26Eu4MWXCVyhQEiPzP1DUXWDL9f/6kYRT
         Kczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834026; x=1743438826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+tBLibFErLnFMJXc7xO7WapFcCCqxq34J4cSYY0jOE=;
        b=Pc3dvwLDocjIheyB64Q96wVPHYyMph5kXCz07AnpShepZJC8XR5h8kaT+6/JMDSM4r
         SwR8WryINue0gxfbIUPPZ94T4HH87lZOMwkpC+eCTueveB4hXESMdc93vD4ml7wBgYCi
         tWwhxByh2tPGErspJvrQSbV3P6p9g29UsZ4pg1JkXtMteE7PoGvXpuW8k1rnK7+72C9k
         Qx5/4FbmDPAxhworGzr+oP1cmZU6rlDnGdWSf9C0+mWDDVc4Umu873n9hKqBqJoqELB+
         XkvgomjPlh02saKdW/UcxGcE8+0x/o2NTTeT3P4JhwRhu0enLt2WSIrPQNQIEBZC/PT2
         6zag==
X-Gm-Message-State: AOJu0Yy0OuOSY6I7O0kBpqluUbsbCFKD78aafXb9K1sh7/Ajsxy9Rt/R
	tyRj/45Ho2RDWrUSMRA8q1xjlOyeQum8hqMXdLkMKrail9xPbZrnSS0KGKr4
X-Gm-Gg: ASbGncthf7d1sJm7dvCwSL1aSpyyC3yfGK2jKy6/EFiQxX/JwCROG74UfvRgJGr6Ebp
	qPjdtaCUx+ssUHwNGGJccx1l1poXrtmIb+pq7CH7Be48z5PBBnQiRt8E8YXQ8ukvqQWGYNwQWx1
	HbHfdW3uz+W7bw9MtaQ0ZK1c2dD7y+/xUky1kVuTaTi9s3IKhkxBmkrNsBblt2Pwu17YQcE7+Rl
	9rBA9nen7foSUoqXIXsZOPb0dfJ08EJqMRfT0WK7tF+C3kwmhBlso2+H7DeokXqAechAV8qx3hL
	sw8thqlDFgKyTmGzyV9ghFVneUeZwM557mfj5opwbKNYLgA=
X-Google-Smtp-Source: AGHT+IH4q7lJ1UKnnKI6QnTns8scGk6B/xRFs0GeA2WuuYu/OjVv0dNcQ38P7FD5A1boneov3ufQOg==
X-Received: by 2002:a05:6a21:6da0:b0:1fd:e9c8:cf3b with SMTP id adf61e73a8af0-1fe4320601dmr22704839637.30.1742834025892;
        Mon, 24 Mar 2025 09:33:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:26 -0700
Subject: [PATCH 05/21] groff: Fix build with GCC-15 on musl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-5-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213537

part of getopt.c is used in non-glibc libraries needs
attention when compiling with gcc-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-getopt-Fix-type-signature-for-getenv.patch | 27 ++++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb        |  1 +
 2 files changed, 28 insertions(+)

diff --git a/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch b/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
new file mode 100644
index 0000000000000000000000000000000000000000..c69a2b4f6738ff739a96ed7a4f4a87b1afb0a684
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
@@ -0,0 +1,27 @@
+From b68b3c6157c531bdcf5812fd93aadff9c18de6bd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 14:41:23 -0700
+Subject: [PATCH] getopt: Fix type signature for getenv()
+
+This fixes build on musl with GCC 15
+
+Upstream-Status: Inappropriate [Next version is use getopt.c from gnulib]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libs/libgroff/getopt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libs/libgroff/getopt.c b/src/libs/libgroff/getopt.c
+index 6efa529..ce39115 100644
+--- a/src/libs/libgroff/getopt.c
++++ b/src/libs/libgroff/getopt.c
+@@ -122,7 +122,7 @@ static struct _getopt_data getopt_data;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ #endif /* not __GNU_LIBRARY__ */
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 34a42c7e264a63c021076737b326b397ffd8c184..0c2ef6175826a0acd1affaf60b09297a171d858c 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
            file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
            file://0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch \
+           file://0001-getopt-Fix-type-signature-for-getenv.patch \
            "
 
 SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"

-- 
2.49.0


