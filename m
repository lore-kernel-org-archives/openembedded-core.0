Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877F2C54ED1
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1094.1747839570895209233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ycng+2EU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-232059c0b50so39678625ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839570; x=1748444370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkLwKTLV3mRN2DXU2rBg/FF7gDwOpFzsQMoVmFwvMmI=;
        b=Ycng+2EUS8lUWbFaLARcG3OimCABkyLKx6oqwBifoDYMl8PPTVLN6iPdTaPWRQtkG9
         5mehGIKtBHyhvuqCvC76Rs4fXHqnEpfGLZowivZVUqOTZ4GwnOjsKruIKzCc97++zKdg
         x/7t8CAv6wg7Xvum4GmGiKaMgIQLX5ciKZRYQZCFAVIQVSlIL0FzvZ+4S9kMIvfmwtKQ
         OByDS4c4SU8qkj9RdDggcw7JMTVKXiemOlwO//+oMgGCwDLRn0rW8v90TsA5r2O/o39o
         EXeaJFtNyryCqEfPT5SAdj2ykf9OwKCK5hjVO2JQJrxc+4XY4hpsFNroerl3EazH/bVW
         zzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839570; x=1748444370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkLwKTLV3mRN2DXU2rBg/FF7gDwOpFzsQMoVmFwvMmI=;
        b=Yio/wU7rvKWox2dbvbub+wsDTLq+xBOks92F75hOSncsYbRzUKIjXUEAqcESoXUQYK
         QRv4cKL8DnkyUSteVR7hCTBZtdQMtPvhZm+w8DGjUkBBUSIFd2fWYmL9h/VHhjGs2ge4
         +70wjOalJ4t2laGlZWkN/fjEv+n32IMAu7pknKdZFrPRJsmrvN5U1AvDCuRjV5WudTqr
         2otGhb4G2ws/8CQh8g1REwtfvtQWLg6BENhGFedExwpdv7XWmCyEJidxXiYJiLkNPEHa
         Hee0cr+/skIAvI+b+LYR3kDFgCTCFX/9zklBaolR3Auu956xX9A6tGeiqfvuu54iyeLN
         DL5A==
X-Gm-Message-State: AOJu0YxRbEiFrd3f3N5xsY90u99pLNZ4PHrLnVY7BiQkSF4P/6u1tgFJ
	iNJ2qdWyENALd0Yqo71qEDBi1suFObtq1ACfdPtCHLd7gpEeFQw6z3NMkJGnjiuCV5HXJJQ/0K1
	aOhqO
X-Gm-Gg: ASbGncuEGzGohKNNFPC/JUz1XnSk6y3QPUtkZkiFU9zVUmJm3OUoSCP4LEaIzTHWsp8
	9ieTT7vmX04duXmM0UF9kFTCnuC2Gi65aW5lP3uXRMs8XKCHhc1/mcXtwgz1fbs5SI3wYwmhRM6
	LaDG067aweZVgIzSl6q8uTnUbHxArQwlQq8TrWpCFeknWoVqerG2h2ayqJ3wtV+g8LGGCP4LhS0
	MwKkCUs0wIlj3GbbDXSQEk3WuhMQhZqdpZc982DWsPOLk5ussWxe3BqsCYcszcEDILF3wt7bN+9
	E8UM4wLhJnGHpdbM27sEQRSU1iDZ8MXIh9ItA4WCAp0=
X-Google-Smtp-Source: AGHT+IGbDogAjyqt1X0MEGcfX7+YVn3blCJPWDyY3eAsOqXhTH8wqBDGoanfFriRxQFXz9AIQEeahg==
X-Received: by 2002:a17:902:f610:b0:215:9bc2:42ec with SMTP id d9443c01a7336-231de37f1e3mr249423455ad.47.1747839570148;
        Wed, 21 May 2025 07:59:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/7] connman :fix CVE-2025-32366
Date: Wed, 21 May 2025 07:59:15 -0700
Message-ID: <02e046149b1cc5eca5188eec7b4e1a9970b97faf.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747839445.git.steve@sakoman.com>
References: <cover.1747839445.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217038

From: Praveen Kumar <praveen.kumar@windriver.com>

In ConnMan through 1.44, parse_rr in dnsproxy.c has a memcpy length
that depends on an RR RDLENGTH value, i.e., *rdlen=ntohs(rr->rdlen)
and memcpy(response+offset,*end,*rdlen) without a check for whether
the sum of *end and *rdlen exceeds max. Consequently, *rdlen may be
larger than the amount of remaining packet data in the current state
of parsing. Values of stack memory locations may be sent over the
network in a response.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32366

Upstream-patch:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2025-32366.patch      | 41 +++++++++++++++++++
 .../connman/connman_1.42.bb                   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
new file mode 100644
index 0000000000..0eb7360685
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
@@ -0,0 +1,41 @@
+From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
+From: Yoonje Shin <ioerts@kookmin.ac.kr>
+Date: Mon, 12 May 2025 10:48:18 +0200
+Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
+
+In Connman parse_rr in dnsproxy.c has a memcpy length
+that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
+and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
+than the amount of remaining packet data in the current state of
+parsing. As a result, values of stack memory locations may be sent
+over the network in a response.
+
+This patch adds a check to ensure that (*end + *rdlen) does not exceed
+the valid range. If the condition is violated, the function returns
+-EINVAL.
+
+CVE: CVE-2025-32366
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 1a5a4f3..50b2d55 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -985,6 +985,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
+	if ((offset + *rdlen) > *response_size)
+		return -ENOBUFS;
+
++	if ((*end + *rdlen) > max)
++		return -EINVAL;
++
+	memcpy(response + offset, *end, *rdlen);
+
+	*end += *rdlen;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index 3a1c9802bd..9b3abbe258 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -8,6 +8,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
            file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
            file://CVE-2025-32743.patch \
+           file://CVE-2025-32366.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.43.0


