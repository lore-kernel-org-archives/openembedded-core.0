Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.8716.1614344475955658653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OSh6/kas;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id v15so8517197wrx.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3XkR7LOsKGnvV1TpjNRWkWXnEgRMJjGKomXiIdcwuDA=;
        b=OSh6/kasUzyo82xnFDmTh4MBdcHfF4w8rvIfRfmz1Z6Zv0m3/T2AU4+ynZBhAzYoeg
         tFE97THtyj2kkYmJljTT43DymUC92lsxNcOVFIQ9h1ybPkuwfh/oPWQvMu3uMI1uI0FH
         NwfDh37Fjbob6Vx6i4dcdN9v6kF2ilUJZ5QzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3XkR7LOsKGnvV1TpjNRWkWXnEgRMJjGKomXiIdcwuDA=;
        b=i5ZCmoukGpn2XfUSTyaq4gmI4EsJIkUIdL7cX5P8Lf0F2BWWHEzD7ZGbiISeSWncQ1
         /zhpFBVHVEScseHQiPSL86lfgjdoRs4H5+5Cz75seTWrH88pJ3rFN4S3hLDkzji1spGH
         zu5DEmyQGUCwepSUXz1AVnoAKPyoBpEdAJZu8t7jS2Uek/LXtemsfUFRiDAq5Vtnabtl
         uJL7IHdXZXMXSyKwyDT1snXeAq40YWuhaUa3xsNetcw8d6hZCzUkrJrJxuRd1rtmEMIT
         RnUnqnwT9yqxcLHjjI2uHe+s/gmK08ZnA5KDgzPyWihRR5pzHAIVYNUFZZPb1lS2QIl5
         5fwg==
X-Gm-Message-State: AOAM531xfh9ayHDugYB5dhZsaSzuosP2oqzaPGADcqQM9N+HnioQr+A9
	tTmUqm9arwjCAXfyFaYaZbzMp7bdDQF8kQ==
X-Google-Smtp-Source: ABdhPJyHXA3w/Iu5w9KZP8bNzGh+ES4uFXY2/hUFLVYW9Wgmuyb6LLppXZKgwRQqpqWUeNCiRD6t3w==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr3083466wrv.176.1614344474254;
        Fri, 26 Feb 2021 05:01:14 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:13 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/13] libhandy: Fix reproducibility issue
Date: Fri, 26 Feb 2021 13:01:02 +0000
Message-Id: <20210226130106.3925837-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../libhandy/libhandy/determinism.patch       | 35 +++++++++++++++++++
 meta/recipes-gnome/libhandy/libhandy_1.0.3.bb |  3 +-
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/libhandy/libhandy/determinism.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 03a29241c7d..ce4e8ebe06b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -39,7 +39,6 @@ exclude_packages = [
 	'gstreamer1.0-python',
 	'igt-gpu-tools',
 	'libaprutil',
-	'libhandy-1-src',
 	'libid3tag',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
diff --git a/meta/recipes-gnome/libhandy/libhandy/determinism.patch b/meta/recipes-gnome/libhandy/libhandy/determinism.patch
new file mode 100644
index 00000000000..7c4177f5f50
--- /dev/null
+++ b/meta/recipes-gnome/libhandy/libhandy/determinism.patch
@@ -0,0 +1,35 @@
+hdy-enums*.c.in: Fix reproducibility issue
+
+When full filenames are used in generated sources it makes the resulting
+debug packages non-reproducible. Best practise is to use basename in
+comments instead.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/734]
+
+Index: a/src/hdy-enums-private.c.in
+===================================================================
+--- a/src/hdy-enums-private.c.in
++++ b/src/hdy-enums-private.c.in
+@@ -7,7 +7,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+Index: a/src/hdy-enums.c.in
+===================================================================
+--- a/src/hdy-enums.c.in
++++ b/src/hdy-enums.c.in
+@@ -13,7 +13,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
index 4d2037411d6..f2b9ebf140b 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
@@ -2,7 +2,8 @@ SUMMARY = "A library full of GTK+ widgets for mobile phones"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-0"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-0 \
+           file://determinism.patch"
 SRCREV = "7126d2e8da9dcdeb5751e60ff6a74930804f9637"
 S = "${WORKDIR}/git"
 
-- 
2.27.0

