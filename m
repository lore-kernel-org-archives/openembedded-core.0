Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EACEC4167B
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:07 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.7134.1667530920860211456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1OcsI/E9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id b5so3308078pgb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE8+V/o7V2iglwJ0ZEZBMWOR9YJvU/y95VmbSc3miBM=;
        b=1OcsI/E9CHylgOdC8s4sn8YZvnaTKNzrBEYagv9BCWLO+wIp2sP9Spw1n+HVXoLWBj
         ebBpOU1eeoZdPTP6n9OVqBJK2YuNFiNWQ3D4sdlYdifunGF4BweRu5oSyb7K5R3DprNb
         NUMk7Q4NbIvp18TEyTXdhZkjetW7CnUrp+czs/b8CY30exHDClqoP1JzZ0jX6fDybQsf
         stYFNaMgnnGxistDf2xftUvvnN4fpFe9EXQQDev7FUdD5u/jOaPd+5NPJESs1QtwyAiF
         z+rkl91zsRGydl+LTlroas+YOAiKPgWqu/izrzZ+6UO2SR33jtzf6TsWlV+uKBlA3zd4
         bQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE8+V/o7V2iglwJ0ZEZBMWOR9YJvU/y95VmbSc3miBM=;
        b=eyyARoty4mxl2bJKStYYETjQb+paoVjVZuL0FdQOivKXcx2ek81/NzN3Iv84i7xayn
         M1tyvV0x2WY2KvCskm6Abz2bktzhQNUdn5xqThQSM5tOIy+WZDDQRFzqeBBoW9cBzfzP
         GM5g4u6kVaBnI3UvyxNpBRop9+62UNkpWR7yK3Zc+v+TumZid2vaUgHdb5RIFT3HJBCX
         ezAQv21Q5m4au3571XukCG+/uGTwecUAV3CBDv6HLL6q+1SP/joFXryfXtUMhbm+1JUr
         jKvuw1/khJR0s2SqWEMAuH02ohWLuBT4L8dM0pdUOtNnG3oLulBDLOwadw+MXfq4JAGb
         1OjA==
X-Gm-Message-State: ACrzQf0c9sZh2L44CR/ahCDjZ1JmtYBDBNfPB4BDhnaBf1pTejBJz9vy
	nOvULHmhoHWVDZaEl1Z31912uZLBo7/t+MP2
X-Google-Smtp-Source: AMsMyM4zRjwq4g/K8yjekyrVFKgxDkbwoU8eCI5YEK6qlEk5WjktUCc4U4SIKBjwBAWeFv+1UgHcZw==
X-Received: by 2002:a63:c04f:0:b0:46f:9f4a:593 with SMTP id z15-20020a63c04f000000b0046f9f4a0593mr23615268pgi.482.1667530919867;
        Thu, 03 Nov 2022 20:01:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/31] glib-2.0: fix rare GFileInfo test case failure
Date: Thu,  3 Nov 2022 17:00:56 -1000
Message-Id: <eb208256778a941aa38b8dba1cb0897e36908cdb.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172682

From: Ross Burton <ross.burton@arm.com>

If a access or creation timestamp has 0 microseconds, then the test
fails as it doesn't expect this to be a valid value.  Expand a previous
fix for modification times to cover these timestamps too.

[ YOCTO #14373 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15715e6ad81c97cd50e288f3745615eb19be90d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-info-don-t-assume-million-in-one-ev.patch | 51 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
new file mode 100644
index 0000000000..c33fa88a76
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 14838522a706ebdcc3cdab661d4c368099fe3a4e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 6 Jul 2021 19:26:03 +0100
+Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one events
+ don't happen
+
+The access and creation time tests create a file, gets the time in
+seconds, then gets the time in microseconds and assumes that the
+difference between the two has to be above 0.
+
+As rare as this may be, it can happen:
+
+$ stat g-file-info-test-50A450 -c %y
+2021-07-06 18:24:56.000000767 +0100
+
+Change the test to simply assert that the difference not negative to
+handle this case.
+
+This is the same fix as 289f8b, but that was just modification time.
+---
+ gio/tests/g-file-info.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
+index 59411c3a8..a213e4b92 100644
+--- a/gio/tests/g-file-info.c
++++ b/gio/tests/g-file-info.c
+@@ -239,7 +239,7 @@ test_g_file_info_access_time (void)
+   g_assert_nonnull (dt_usecs);
+ 
+   ts = g_date_time_difference (dt_usecs, dt);
+-  g_assert_cmpint (ts, >, 0);
++  g_assert_cmpint (ts, >=, 0);
+   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
+ 
+   /* Try round-tripping the access time. */
+@@ -316,7 +316,7 @@ test_g_file_info_creation_time (void)
+   g_assert_nonnull (dt_usecs);
+ 
+   ts = g_date_time_difference (dt_usecs, dt);
+-  g_assert_cmpint (ts, >, 0);
++  g_assert_cmpint (ts, >=, 0);
+   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
+ 
+   /* Try round-tripping the creation time. */
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index dd1ea508d2..b5ab6502a3 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.25.1


