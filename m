Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A626CA0EFA
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 20:04:16 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.3943.1755979449156009992
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 13:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0onOu75;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-246181827e9so22746705ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755979448; x=1756584248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnBF/fRH7SxSiJY2h5GzPHXiYdV7h0yq4j+g/J/0xNc=;
        b=I0onOu753IZ1Osbwmd1L1uc8KdOX5amauFqfhjBhzYUuIebDs0qj5wSX7/AHX1QblP
         9uLWIq1cBvlBDR+gkE0Z484Fp6vwg0FDnSAsUhDWQ4N/NV33lb1WB3Qv5hzDSlPGykEI
         AVGkvhIFFXYAwHqjuxs0MSMzFzuULlMSoI5pwZbfgdxIhLig2DrxISYEmF+XOMPxNjyB
         CwCN1XV7w/GQcN7lbI0/L8KoN5vpqTy/jW+QU3A78qbLMP3XxnXsglzVkkAevhGn+znB
         T0+JjLKOrqCEKfo5NXjs8pAMRmc6oC6nLVhu3kT8v3a9ru9S4dmhRz/Bo99fJJoeSaKs
         M5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755979448; x=1756584248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnBF/fRH7SxSiJY2h5GzPHXiYdV7h0yq4j+g/J/0xNc=;
        b=F96geHcQ9dbvpXTUV2ZTQoo/4/AMyZPqOFhkFR618HwwE/Djyz4B3S9Mrwth1nYxSD
         un7fXWxgNy/+yp6auqgs/Tt6kzFSxNu5PnD/PeuQylNiDvnBs0Wi+AzMo5BXRPSdcq7a
         HUehrLRo7Xv1kou2dLnZKt0Rsy/NoJbYhHo1n1gtubXSNpkvdfALCfw9MZ+osMpTWrZG
         f8k/9MqiF9qSP4XPtJWMo9/OOP180cOzwugNU3/6hNHzhQ7nFzFJdPaG2HBjBQ4wIu+M
         x/LdX3NZziIPnXGN6etdUdGeIMMAAu4GQMnzYEt5DUtQawoIMN/DwRQvRFTJlvG6OxxN
         xxhw==
X-Gm-Message-State: AOJu0Yx9HanuxDXlF5hziA5khpB+jN4zWg07NOB7ec428uW1Xd1QEr7R
	vL3k6/h2RncVu2t5G4lGvbn5D1BlLNtVb5Z4KjrES2H34O8pJgNhVzN462NQ87bT
X-Gm-Gg: ASbGncvn8/Y3M3TV6L3iWLfJaifjPNkXRG9n3n2gtiTChh70GAhUsCAeZv5YvppiiK7
	IOWWskKh4cLiW5Wk0AJO0R2x25qMvA0+EKRyXg5VlHlqlv6TFyJnFfOlIwAH6g/eTd+VUjzPPFp
	v8TsHpbXN9ad85VuAhTnYsEsGGrtzHV6pHaggQfOzzvmDqvVGR4jAowiLM0B99OeyDO2nu8SYKI
	DnweIB2g1DxDOYlHL2KnMpvtR8IaXkoAm7McAAwDVaPsSJoTwAl8jd1RWD2TQi82XqG7MoLfS8s
	OkfOnYBpziKQVHN/UHSF3TRi/oAUIs/xTYQJr+uA2zzw0MW7oQwE9+YtcUGDss+E4kDS3W+iyiD
	9KmQfc8OTk2vOlgGsEeaYqP90/vYeut9MvfiU3RtQlTA+q+u7eGxowkNtP1KCq6qSJyeNdpoqm7
	EYbys82SNxOg9GMUKMLBtAj7IMaAaH0c9FEEYVHTdSe7EaR4WyPQ==
X-Google-Smtp-Source: AGHT+IFZRAxpycVOU9tckCyetMLOmTzV85i1z83n3oWpdvSX9Kf1zcMKkH/7JOR4TlkvH6UQ22zb4Q==
X-Received: by 2002:a17:902:ebc5:b0:235:f143:9b07 with SMTP id d9443c01a7336-2462eddcee0mr102405765ad.5.1755979448087;
        Sat, 23 Aug 2025 13:04:08 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214effsm3201153b3a.84.2025.08.23.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 13:04:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libseccomp: fix seccomp_export_bpf_mem out-of-bounds read
Date: Sat, 23 Aug 2025 13:04:04 -0700
Message-ID: <20250823200405.680409-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 20:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222349

Fixes segfaults in ptests on musl
Failed ptests:
{'libseccomp': ['11-basic-basic_errors%%001-00001_11-basic-basic_errors_rc=139']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mp_export_bpf_mem-out-of-bounds-read.patch | 37 +++++++++++++++++++
 .../libseccomp/libseccomp_2.6.0.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/libseccomp/files/0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch

diff --git a/meta/recipes-support/libseccomp/files/0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch b/meta/recipes-support/libseccomp/files/0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch
new file mode 100644
index 00000000000..0d2910846c7
--- /dev/null
+++ b/meta/recipes-support/libseccomp/files/0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch
@@ -0,0 +1,37 @@
+From 83a56d74482ef6b6cc9311b14bf9ea23573f5d4e Mon Sep 17 00:00:00 2001
+From: Alyssa Ross <hi@alyssa.is>
+Date: Thu, 13 Feb 2025 12:05:17 +0100
+Subject: [PATCH] api: fix seccomp_export_bpf_mem out-of-bounds read
+
+*len is the length of the destination buffer, but program->blks is
+probably not anywhere near that long.  It's already been checked above
+that BPF_PGM_SIZE(program) is less than or equal to *len, so that's
+the correct value to use here to avoid either reading or writing too
+much.
+
+I noticed this because tests/11-basic-basic_errors started failing on
+musl after e797591 ("all: add seccomp_precompute() functionality").
+
+Upstream-Status: Backport [https://github.com/seccomp/libseccomp/commit/dd759e8c4f5685b526638fba9ec4fc24c37c9aec]
+Signed-off-by: Alyssa Ross <hi@alyssa.is>
+Acked-by: Tom Hromatka <tom.hromatka@oracle.com>
+Signed-off-by: Paul Moore <paul@paul-moore.com>
+(imported from commit e8dbc6b555fb936bdfb8ab86f9a45fda96a8b7a2)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/api.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/api.c b/src/api.c
+index adccef3..65a277a 100644
+--- a/src/api.c
++++ b/src/api.c
+@@ -786,7 +786,7 @@ API int seccomp_export_bpf_mem(const scmp_filter_ctx ctx, void *buf,
+ 		if (BPF_PGM_SIZE(program) > *len)
+ 			rc = _rc_filter(-ERANGE);
+ 		else
+-			memcpy(buf, program->blks, *len);
++			memcpy(buf, program->blks, BPF_PGM_SIZE(program));
+ 	}
+ 	*len = BPF_PGM_SIZE(program);
+ 
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
index 97988afa27b..998f1b5548d 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -10,6 +10,7 @@ DEPENDS += "gperf-native"
 SRCREV = "c7c0caed1d04292500ed4b9bb386566053eb9775"
 
 SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.6;protocol=https \
+           file://0001-api-fix-seccomp_export_bpf_mem-out-of-bounds-read.patch \
            file://run-ptest \
            "
 

