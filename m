Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CA0CA0FE0
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3230.1755758737416432251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfY3Ml0I;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24457f5b692so6804485ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758736; x=1756363536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfVWmlFRYukTfTd61yIF+B2gmfwr6my8Ljq0lB5D11s=;
        b=lfY3Ml0I981xJ254nEQFVeieo8ezNuClKSaSCX6hoDQ9HyHNJ9oZ5hm2bPEwmmBBTT
         pYa20UdPoIzk97+02OxqLvLGMlY7MFC5/kf1AF8nse7/hRGIvi/Lo+Y3eDYOhiRFROl8
         qGh8uVseuwMa4jjqNBxGEY5tPFa3TTUMm/Ahg7Jrw75VwXNkqb7Ckp5cAP4FEhABsA3W
         tk5OFauI+DudPibOptos9Z6xoFXKEA4y8qzfwU5IwPPW13qnKfB8qLUh/8IK2LSej53l
         urHg3Asu8JU66ggqJ5vR7pfagNCukSA2hBki8BYApzukHB0vkRTR945T8/pnS1ciWhyC
         s/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758736; x=1756363536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfVWmlFRYukTfTd61yIF+B2gmfwr6my8Ljq0lB5D11s=;
        b=HmsgxrPp3/5hQlNaRXD90tBA/uJU0a/4huh/iQR6RP0FZMa1QhqmOgqn0FkOPJ7imU
         4R/dKgCCuQRjPsLfmbsk/HADWE5gnc7M6yDJXL/XSvnKa912tHYisVaXCo9YFkDijWzv
         ybDktKJfoudSpGwtkhpTI+TQAKs6eRSfdMALtiR2AQf9jUaYgyaff8qbvv8qO2XsuoAd
         7c+jeknI0PLzkjSsBXfHbGXJ4l1mgsibTYo7VEXstvbmdigxjtPjRikV84alTh0lnMqC
         Cj8fU4K3d27OKtz8V57uwvNUJ4WfmVkWubnpYKvJ1kG4OEsBMR2XWe+y3HsgwDHZGgtk
         04zg==
X-Gm-Message-State: AOJu0Yz4kmyGY7rlMbPkyz6xhUw3g84qJM51FEhlVU/yOh69Sp+8Kyhw
	X4wROW/htUnIV+6oWuUIz4vg8xZFhyuHJmwIcN2RcqPKsdbFUTxiLwzTklTBQWhK
X-Gm-Gg: ASbGncvd7HvPWrCXR6WrB5n0Von+TwS7vwWZIOC54Jq9fYB9M9dZSg12gNK5HSszjni
	fb8P5fCK6oDiHdAj4OEGjDWsdBrt0cPxlfBtw0cjAO/dmDJGZszSTnFuZHG5JxyCT1dHy+GcBdX
	oo4SjWQWlNjikTgxSuYNlfqOBhx905peQAOQhwnSIrC9r0L9rc0p1Z/R40wzWDKnVBIEKq6JViV
	ZtkfZVLou1A/zdJP/qjsnVENQ5FAheCUp+qhYqyQp6cJ9hpf+gO7Nnwq9DBReYSdZEH2+f4JXJc
	4CMnBvmtf8GTMYJbDru7Fx4nrLLgUfFyLbhL9fvnFe8aSa41fdaW+S1aJeZoxW//V2tTUlGjbOj
	B4Kp8CEzZ+9G2RMoPnjeo+g==
X-Google-Smtp-Source: AGHT+IEXSIJXkIio39OxoS1UrE/Ne0vtUwNf7agE2TTShESrSxXGTApmaGlEgGemCgkEQvl28GrC+w==
X-Received: by 2002:a17:902:dad0:b0:224:910:23f0 with SMTP id d9443c01a7336-245fedb88e9mr24135905ad.49.1755758736462;
        Wed, 20 Aug 2025 23:45:36 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/9] libc-test: Fix strptime and api/main tests
Date: Wed, 20 Aug 2025 23:45:23 -0700
Message-ID: <20250821064528.754633-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821064528.754633-1-raj.khem@gmail.com>
References: <20250821064528.754633-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222214

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libc-test/0001-Fix-strptime-on-musl.patch | 53 +++++++++++++++++++
 ...-optional-obsolete-_PC-_SC-constants.patch | 44 +++++++++++++++
 meta/recipes-core/musl/libc-test_git.bb       |  4 ++
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-core/musl/libc-test/0001-Fix-strptime-on-musl.patch
 create mode 100644 meta/recipes-core/musl/libc-test/0001-api-unistd-guard-optional-obsolete-_PC-_SC-constants.patch

diff --git a/meta/recipes-core/musl/libc-test/0001-Fix-strptime-on-musl.patch b/meta/recipes-core/musl/libc-test/0001-Fix-strptime-on-musl.patch
new file mode 100644
index 00000000000..4c3a2cb21f1
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test/0001-Fix-strptime-on-musl.patch
@@ -0,0 +1,53 @@
+From df26c5206c3234fd2df924cff7ef540af1f2077c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Aug 2025 23:11:40 -0700
+Subject: [PATCH libc-test] Fix strptime on musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl parses the digits for %s but does not populate struct tm
+(it's "parse-only" and intentionally has no effect on tm).
+That's why you get a zeroed-out date like 1900-01-00T00:00:00.
+This is current upstream behavior:
+
+case 's': /* Parse only. Effect on tm is unspecified and presently no effect is implemented.. */
+
+musl's strptime only accepts ±hhmm for %z (e.g., -0600).
+It does not accept ±hh or ±hh:mm. So '-06' fails by design.
+It can be seen that upstream only checks 4 digits after the sign.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/08/20/2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ AUTHORS                   | 1 +
+ src/functional/strptime.c | 4 +++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/AUTHORS b/AUTHORS
+index cf2a394..5e78ef7 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -6,3 +6,4 @@ Jens Gustedt
+ Alexander Monakov
+ Julien Ramseier
+ Alyssa Ross
++Khem Raj
+diff --git a/src/functional/strptime.c b/src/functional/strptime.c
+index b5f8977..f76fa68 100644
+--- a/src/functional/strptime.c
++++ b/src/functional/strptime.c
+@@ -109,10 +109,12 @@ int main() {
+ 
+ 	/* Glibc */
+ 	checkStrptime("1856-07-10", "%F", &tm4);
++#ifdef __GLIBC__
+ 	checkStrptime("683078400", "%s", &tm2);
++#endif
+ 	checkStrptimeTz("+0200", 2, 0);
+ 	checkStrptimeTz("-0530", -5, -30);
+-	checkStrptimeTz("-06", -6, 0);
++	checkStrptimeTz("-0600", -6, 0);
+ 
+ 	return t_status;
+ }
diff --git a/meta/recipes-core/musl/libc-test/0001-api-unistd-guard-optional-obsolete-_PC-_SC-constants.patch b/meta/recipes-core/musl/libc-test/0001-api-unistd-guard-optional-obsolete-_PC-_SC-constants.patch
new file mode 100644
index 00000000000..f5685953192
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test/0001-api-unistd-guard-optional-obsolete-_PC-_SC-constants.patch
@@ -0,0 +1,44 @@
+From 90515d553d03d1f0bec8a4bdf03d02626d3968bb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Aug 2025 23:32:52 -0700
+Subject: [PATCH] api/unistd: guard optional/obsolete *_PC/*_SC constants for
+ musl
+
+musl does not define some POSIX option macros:
+- _SC_XOPEN_UUCP is obsolete and absent on musl
+- _PC_TIMESTAMP_RESOLUTION is optional and may be undefined
+
+Build currently fails when these are referenced unconditionally.
+Wrap the checks in #ifdef so the test compiles on musl without
+claiming support for unavailable names.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/08/20/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/api/unistd.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/api/unistd.c b/src/api/unistd.c
+index 522ccdc..0de547b 100644
+--- a/src/api/unistd.c
++++ b/src/api/unistd.c
+@@ -114,7 +114,9 @@ C(_PC_REC_MIN_XFER_SIZE)
+ C(_PC_REC_XFER_ALIGN)
+ C(_PC_SYMLINK_MAX)
+ C(_PC_SYNC_IO)
++#ifdef _PC_TIMESTAMP_RESOLUTION
+ C(_PC_TIMESTAMP_RESOLUTION)
++#endif
+ C(_PC_VDISABLE)
+ C(_SC_2_C_BIND)
+ C(_SC_2_C_DEV)
+@@ -235,7 +237,9 @@ C(_SC_XOPEN_REALTIME_THREADS)
+ C(_SC_XOPEN_SHM)
+ C(_SC_XOPEN_STREAMS)
+ C(_SC_XOPEN_UNIX)
++#ifdef _SC_XOPEN_UUCP
+ C(_SC_XOPEN_UUCP)
++#endif
+ C(_SC_XOPEN_VERSION)
+ C(STDERR_FILENO)
+ C(STDIN_FILENO)
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index c3b562862ac..5ec307c25be 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -12,6 +12,8 @@ inherit ptest
 SRCREV = "f2bac7711bec93467b73bec1465579ea0b8d5071"
 SRC_URI = " \
     git://repo.or.cz/libc-test;branch=master;protocol=https \
+    file://0001-Fix-strptime-on-musl.patch \
+    file://0001-api-unistd-guard-optional-obsolete-_PC-_SC-constants.patch \
     file://run-ptest \
     file://run-libc-ptests \
 "
@@ -33,8 +35,10 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest = " \
      ${PN} \
+     locale-base-en-us \
      musl-staticdev \
      sed \
+     tzdata \
 "
 
 install_path = "/opt/${PN}"

