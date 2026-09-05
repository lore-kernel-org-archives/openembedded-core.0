Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AF2C79FA9
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2600.1788641132281020534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q65lSRsv;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba14so1927243f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641130; x=1789245930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TH+pDBfmQmOHZapKeEsv9RuadGN3fgUqaecmPz+wPIY=;
        b=q65lSRsv/XDwTZv52vfUODGFUx2GnrR+nuYdfqQhZ3zseAQh7QheElKDgF8vvHE7ko
         gkppIkm/cmyLMHfEF4bwqHqn64T1UvI5CxW7USfmfOdVY6Tae374xdCHNQeRUHtf1UKV
         9KAMdiajkXB+S4XXcZnCoaXx3Q1JnN6Ssu9fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641130; x=1789245930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TH+pDBfmQmOHZapKeEsv9RuadGN3fgUqaecmPz+wPIY=;
        b=cnJCsTJK0V5ZfK1Nd5XxNu6aysZTdWObrK5NhlC5JxvMXMVjw1k7BHmuD3ldw+fILE
         OV5NRafq4To+BPQILgSc/95yXL0bTERsmH2pfKHwdQDm0NbZPYViK7XwWqhjGIAMpsAh
         fNhqi9l7wDsywQu+Px0DBoQOaC5RSWgorjHAsD/CF2d2Entn9WcnbX0cHtz8ox2tsDJG
         SIEFO0Wq3RatfgdrXjh5BCt6abQ62HNnZml9FDB/ERwUzVjP/AvsiCd4FFysbk6UXmCH
         nEMW3enNQV4VCl5UDOpMcMYHCoMhlSU00U7wjtfZteJ6M/7hmN1GpDIXj589N69nIgG6
         Jb5w==
X-Gm-Message-State: AFuF++kYANXW7dsj+abZxn/9DrMPPmp5H+DgKmcKSC1ScQTJh5xdDxnu
	hPqTCmBlJT811tsQr9bQfiDAoUPPFtueBkSq3AAebbwGuFSfsYA0PxtZdB2Sa78mYAXkYlHsRBt
	LTdlvXFQ=
X-Gm-Gg: AYBFou2JMvYfil4w2bk6LWjXSMEZdNRzu4Y99E8aujBvEOeJ7b/z6jpw9tt/HU0uVw1
	AX1FIlKse3+QvE9Wb2I7N/MTUrad7mT6G3j6y55UY65WmFT+vMhx6fwF/cW7+4Mkzcr3xX0/BEY
	4cEJTQ0ZlKyyTBBpEfe09s5JEQ9nMRYZwfSIc5q9oE+wguAh2MLNYLKXJ0ET2+oXXhb5Vq8Qx+3
	g1nkBL7K/9znL1xhZDMmBsP22KXv/p6UTDaAxABuQOLzixg8pjNDtY8Lztb2wQmFmKROBjwzu33
	n1Mv1kMFMwq8jJExLeO8h45cOcjK1BtnflhsD5WW++iqvhVs8Smby1MyXY5/SCeyLZi4w2tiB+n
	1RIUSXhEtMkkZXyBiDBIUxj8c7hY22oadKc9AWKZ2e5iXDEHBpCgL0sFRHG2SadLtZ8tHX/AFnB
	YiGvm55AnSFVy/RHiPbWhsmhtkNV+/6gPo8jmuf39ANXsrPZz41X152sE10lXbdngaeYnAX/64B
	HSYLREyK0abRRQ3CmLuj0wNLgc3CWS+hftaKd7MVrXOabk9qLo4m/0D4yva+CmCog==
X-Received: by 2002:a05:6000:470c:b0:485:8a46:705c with SMTP id ffacd0b85a97d-4858a4671b8mr12233156f8f.46.1788641130532;
        Sat, 05 Sep 2026 13:45:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/40] libssh2: Fix CVE-2026-58051
Date: Sat,  5 Sep 2026 22:44:36 +0200
Message-ID: <6e2a6bb91130873b08ff845a28620a8efaa436cb.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245187

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream fix for CVE-2026-58051 using the
commit in [1].
The CVE advisory [2] describes an uninitialized
publickey-list entry cleanup issue affecting libssh2
through 1.11.1.

[1] https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58051

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-58051.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
new file mode 100644
index 00000000000..68f71efe68e
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
@@ -0,0 +1,34 @@
+From 8cb6cf1244e8d62175bf5df32a400f00ddadb40d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <vszakats@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 19:12:21 +0200
+Subject: [PATCH] publickey: fix potential arbitrary free in
+ `libssh2_publickey_list_fetch()` (#2127)
+
+Due to uninitialized list entry.
+
+Reported-and-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+CVE: CVE-2026-58051
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a]
+
+(cherry picked from commit a9758da45a52bc8c630ec9493804d0c6ea30b24a)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/publickey.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..87bc894f 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -972,6 +972,7 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+                 list = newlist;
++                memset(&list[keys], 0, sizeof(list[keys]));
+             }
+             if(pkey->version == 1) {
+                 unsigned long comment_len;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 52684ae74ef..3c72f844adf 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \
            file://CVE-2026-58050.patch \
+           file://CVE-2026-58051.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

