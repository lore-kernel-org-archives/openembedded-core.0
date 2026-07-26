Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B71C54F4C
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7374.1785054613920877252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BBxTUhvh;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so13019325e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054612; x=1785659412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fYWIlcCfPF8HEzUIF3LN7y3/8rTSGSRfaqyvv1BIPJM=;
        b=BBxTUhvhZ6EN3Ig5pTDFN4vPjSufhq1wqX+7U2MaZwpoKYmfGYqlVBtL06I4PmRRaf
         0k8PU0UAerWuskObr4HRwLD3tzM9rwZ3MRFl7po10UckcY+pCvFcOO0UPv625D+p02h/
         7hf6/cDe6NPEpWFTKTKew+ck+cHTiUTiG/FQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054612; x=1785659412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fYWIlcCfPF8HEzUIF3LN7y3/8rTSGSRfaqyvv1BIPJM=;
        b=lhI+tyoCg2urb9MUse6N3ScWSDMGTifKgXMHEQZwrupUHYTwrKa/FIaHQDqpK5rVs5
         z+/aivczrIBlkdS1yqTPA02xqwye7e51pksZOempt3FQd29dGbhUqJEj9iiIK1seH5f8
         NWP22C62jfUvWjlzEEiPueOd76zGt79nJbgsA1+OV/o/0pAdoeg8wtonrO43mh2ydZLH
         +/HdTG7HAsQ1Uk/rLA/XzZfa1mxzLM9amasLDMQBSf8PB1a6t/1Y6DA4dp4Ig7XrS8f/
         D8rTUKyg1I8YaQ8OUV/sVinRkG/tNbH/97BjLSDjWgAo3vE7RsKCLsSFProVVSrtQvjE
         NelQ==
X-Gm-Message-State: AOJu0Ywn7pkadQI5tbos15ttr8Y4lHz27pBlq4LmRDX3RG8bupdtiOSW
	lgTko6KkhYqiNahSyikot8God4CVQVasWrja6r1bZzYH+3VE4ExH9IzqEqoqzctWoiBTgyiq8My
	T+r/v8CI=
X-Gm-Gg: AR+sD12CHz83qB3vbMS+d4s+odehfgkAPigKgFltEKOw/5Tb9prFsd4LzM3zw/1Jus8
	B1iyIM+0TifP0QmISWx1S3HjT2f9eM8eujEsx/zhwDY9w/swKguUc84/gvU366mQ5mvVONLqJ15
	Tpssf/gXIryo78sIxDgjhF7tr0pPhLLz4+kJcSwvbotH7AK1pOYpHHtLomO8s4quu3QzMl2BwqD
	r2OKy5Y39Cm8wriI4Ves5C/quQ2WXHhTduCTImRIE+W/2MZXxWAbVjGbWJ/sSTNc9WUPnlzDkyD
	xlaZeKurIYoA5/tI015u7Tz05AujeDHqnjTg/pmouTIbFHoJ3/JCKyAyo6OUVGrwjRPoFQ1OliT
	BRm5pynISXhImJbGFAcztiFSwrW1aiO3t29B+fom0+JKCufHODe/owjNVaxKQbvlf0fspt8azQD
	dXMZuPk/CPbf5G6NJtWaTxwD/ni42jZQQDf9fLcjkuVfV6ly6zTEw0YBxs8nT0yee0DaiATb5+g
	m7T2A==
X-Received: by 2002:a05:600c:3e10:b0:495:443b:1bbb with SMTP id 5b1f17b1804b1-496b57160dcmr50820475e9.25.1785054612063;
        Sun, 26 Jul 2026 01:30:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/31] libxml2: Fix CVE-2026-11979
Date: Sun, 26 Jul 2026 10:29:29 +0200
Message-ID: <e2a9a776855ea1de5c7c6817d282ea2f555395ef.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241986

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-11979

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-11979.patch       | 70 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
new file mode 100644
index 00000000000..427026b345f
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
@@ -0,0 +1,70 @@
+From d8566dd918c612078dfb3ee1a95d7bb6f0656bfe Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 22 May 2026 12:21:20 +0200
+Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
+
+CVE: CVE-2026-11979
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
+
+Backport Changes:
+- The commit modifies test/catalogs/test.sh.
+- test/catalogs/test.sh does not exist in the libxml2 v2.12.10
+  source used in Scarthgap and was introduced later version
+  libxml2 v2.14.0 [1].
+- The test changes were omitted; only the required fix in
+  xmlcatalog.c was backported.
+
+[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/f06fc933cdaea2ce8e9cea275fdbf4edb85f9837
+
+(cherry picked from commit c2e233fc1b341685fc99621b2768b503f777a72e)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ xmlcatalog.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/xmlcatalog.c b/xmlcatalog.c
+index 588802b41..51569b879 100644
+--- a/xmlcatalog.c
++++ b/xmlcatalog.c
+@@ -114,6 +114,12 @@ static void usershell(void) {
+ 	       (*cur != '\n') && (*cur != '\r')) {
+ 	    if (*cur == 0)
+ 		break;
++            /* Do not read beyond the command array capacity */
++            if (i >= (int)sizeof(command) - 2) {
++                printf("Invalid command %s\n", cur);
++                i = 0;
++                break;
++            }
+ 	    command[i++] = *cur++;
+ 	}
+ 	command[i] = 0;
+@@ -131,6 +137,11 @@ static void usershell(void) {
+ 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
+ 	    if (*cur == 0)
+ 		break;
++            if (i >= (int)sizeof(arg) - 2) {
++                printf("Invalid arg %s\n", arg);
++                i = 0;
++                break;
++            }
+ 	    arg[i++] = *cur++;
+ 	}
+ 	arg[i] = 0;
+@@ -143,6 +154,11 @@ static void usershell(void) {
+ 	cur = arg;
+ 	memset(argv, 0, sizeof(argv));
+ 	while (*cur != 0) {
++            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
++                printf("Too much arguments\n");
++                break;
++            }
++
+ 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
+ 	    if (*cur == '\'') {
+ 		cur++;
+-- 
+2.35.6
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 2bfa78324f6..d476ba14b6e 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -31,6 +31,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-02.patch \
            file://CVE-2026-0992-03.patch \
            file://CVE-2026-1757.patch \
+           file://CVE-2026-11979.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

