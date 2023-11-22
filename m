Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7297CC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.10882.1700620288042332511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q4iVdlz7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6cb55001124so296879b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620287; x=1701225087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhYpSg88zo5M40vu3/gaFohrNs1MWlDAUqtWJyFmEGc=;
        b=q4iVdlz7qhqhbbLH8U8SCB3wC3YngBGcamYs7x1ovnC+7fOjMSo4Jt/LaZdnfMNDJX
         SZ/PFqzazsbZLrvSq4+N1m/62Uf/Q2cSYpiiwQ3d3H99Y4tXmTtyu194r6AAPxls1OyO
         zqtybR4JbRaix1HQyfHJzZ2AiE7+o6M5FzS/wX+PftiW2xIvFRP1S1lyNnecTDfb8QS0
         HKy7WVCABFnTDu+1tMxgFUM13Eviebnqaz4sbQMyMDWwlwJedMiS/1I8tbO1XAr8P7ji
         j45iWmBP/F/HkEdkdw1HAPe3i0nD5BfeukffL12OtJ7kAse6wI/0SwXH92ari9P8wQoJ
         5ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620287; x=1701225087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhYpSg88zo5M40vu3/gaFohrNs1MWlDAUqtWJyFmEGc=;
        b=vOhylIE4EQ/On2P35nBqEpirikYf7oPk321inETWjM/sY67dQO2n6W9Un5W8LbXgbZ
         opeepT8G2b9TaTYDGUoMD4tkNFq162BML+sMfF4s9HwjI+Bv1xgqYpsUCzu0rp3N9Hrd
         dyAAQ/AO3wZSSR4nZo5T+4kd9IWgWz8Papg/EjSNmVkGP0YCUwasPY6kEfCXFfSv1jHi
         eu6MOS6lzEgwLCgZQCC8u79BReJT1jiqKZ7gU1Dk9ta5WGVrUkmdpTvYt8AQZerg68E4
         GngEbAC3CPUi7YCTHbgbRgdq4X8VadhO+5VA7lwdRlQI3kW/SPCOs35cGCI+elH0ETEn
         sbig==
X-Gm-Message-State: AOJu0Yy+1BB1cI4kdEOV6hZEK5CxBwykFqKnwhhKDacG3fL4l9QXPDfv
	YwzWqXGpll8Zuv2BGZDKqrJfCufaFuMMQKtjtbOLvw==
X-Google-Smtp-Source: AGHT+IFQYJaX3ZH1+Lxla83W9vsDlVIflXmCSFHfEDUZcsFunBZx2Nb03z96YdfST8eSixmo/X4wOA==
X-Received: by 2002:a05:6a20:1613:b0:18a:da90:68ec with SMTP id l19-20020a056a20161300b0018ada9068ecmr1625104pzj.2.1700620287077;
        Tue, 21 Nov 2023 18:31:27 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] avahi: fix CVE-2023-38470
Date: Tue, 21 Nov 2023 16:31:02 -1000
Message-Id: <bc211ae0e597d40f938f9a25bfc0fcbb228d90b6.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191004

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi. A reachable assertion exists
in the avahi_escape_label() function.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38470.patch          | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index ac04b42614..a2ad9058d6 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://handle-hup.patch \
            file://local-ping.patch \
            file://CVE-2023-38471.patch \
+           file://CVE-2023-38470.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
new file mode 100644
index 0000000000..5cf9af6fd6
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
@@ -0,0 +1,59 @@
+From 26806dbde54c5b40a2bf108d334ba59ec9d242d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Tue, 11 Apr 2023 15:29:59 +0200
+Subject: [PATCH]Ensure each label is at least one byte long
+
+The only allowed exception is single dot, where it should return empty
+string.
+
+Fixes #454.
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c]
+CVE: CVE-2023-38470
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-common/domain-test.c | 14 ++++++++++++++
+ avahi-common/domain.c      |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
+index cf763ec..3acc1c1 100644
+--- a/avahi-common/domain-test.c
++++ b/avahi-common/domain-test.c
+@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     printf("%s\n", s = avahi_normalize_name_strdup("fo\\\\o\\..f oo."));
+     avahi_free(s);
+
++    printf("%s\n", s = avahi_normalize_name_strdup("."));
++    avahi_free(s);
++
++    s = avahi_normalize_name_strdup(",.=.}.=.?-.}.=.?.?.}.}.?.?.?.z.?.?.}.}."
++		    "}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.}.}.}"
++		    ".?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.?.zM.?`"
++		    "?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}??.}.}.?.?."
++		    "?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.?`?.}.}.}."
++		    "??.?.zM.?`?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}?"
++		    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM."
++		    "?`?.}.}.}.?.?.?.r.=.=.?.?`.?.?}.}.}.?.?.?.r.=.?.}.=.?.?."
++		    "}.?.?.?.}.=.?.?.}");
++    assert(s == NULL);
++
+     printf("%i\n", avahi_domain_equal("\\065aa bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
+     printf("%i\n", avahi_domain_equal("A", "a"));
+
+diff --git a/avahi-common/domain.c b/avahi-common/domain.c
+index 3b1ab68..e66d241 100644
+--- a/avahi-common/domain.c
++++ b/avahi-common/domain.c
+@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char *ret_s, size_t size) {
+         }
+
+         if (!empty) {
+-            if (size < 1)
++            if (size < 2)
+                 return NULL;
+
+             *(r++) = '.';
+--
+2.40.0
-- 
2.34.1


