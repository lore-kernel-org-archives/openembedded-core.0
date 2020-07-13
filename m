Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.20442.1594649854686068431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AnDV5nbx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id i14so6050032pfu.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=L0rAnLmG7jUZUZZKeXZuhONKhF/WjWrqzJentbs6d0Y=;
        b=AnDV5nbx0t46AHGxyGnGz0Q0+SAsf2/E0YYkCBtfALZJ1w7Ko6pNDiLsvN/GQwC2bo
         9r7C0za1+/0ORuEUpLkpm5FTL/Z8d42nyXrre5908HzjdGmRwAxRKlNBwwKnQ2d4KGEg
         GZ8WFTwsEXIpRQiWZ+J8jLoxlRMOov15ijdo+OugfmE30AnR2S5wmkwGWzmncMiXNUbP
         BVWY0FJkbt3+pHAL7SDw8O5YVLMvfM9/b9M7TUuHs/YbOc+NmuEV9ju5XyLdjzm3LroM
         0SO15f+n/ozjTeyWPcNnPlfYAKPyxUCykJU0uNmCdpcrWsMlbd1+nvq39LHa2Bqf7yS2
         EtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=L0rAnLmG7jUZUZZKeXZuhONKhF/WjWrqzJentbs6d0Y=;
        b=HaefUuUvD2gC3NX+uDjRKhV8bHiL3fYUv+4yw9OPK0jS+COXuFWM4dQaBgMZTo8Ews
         Qw1CbncqhB3ydBx5o9SuiUX5e2Umj4wLUg2fI1Wuh7U9GQ4qgtAX55kV6y0KTnKZy8sp
         ecdZVgCRU5vhXarYQLk/ZBZLmRfP71sjUGdF6dozDCQTU9RbJkOHa4fBqFtjwWhpCJCm
         2k1nbWfYErSW3tIstqP3j27zD73v4FJ4W+NqHL68/v0Az3jE9rg6PP2i4FY9qe9p3A5v
         S17WUM4VUbVcMvDpD1G4yAj4dw8GMYu5trO/QyYMedNStoigET/hQUujeUXjp/XTIjUm
         wwLw==
X-Gm-Message-State: AOAM533yBJ9ANP7niBgSPdra2MNv8/H0x5DsRsR6PI8+zzJ7HZ5pw2rK
	DKpQX2+nSYu5xHELqINfAwrbYL1GfJJPDA==
X-Google-Smtp-Source: ABdhPJxNb0h2fx8e4elAwbFCaB6KjkNpNcLgSlG4FJlCb1/Q4/djyl9wnZlTkTzzi1ue1KqhbuTwOA==
X-Received: by 2002:a62:2ad6:: with SMTP id q205mr102388pfq.316.1594649853821;
        Mon, 13 Jul 2020 07:17:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/15] kernel/yocto: fix search for defconfig from src_uri
Date: Mon, 13 Jul 2020 04:16:54 -1000
Message-Id: <11089e06bfb3d0defb52825ffba978d085385569.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Andrey Zhizhikin <andrey.z@gmail.com>

Fetcher provides full paths to defconfig and scc files, which awk
comparison operator does not catch during construction of
src_uri_defconfig and sccs_from_src_uri lists. This causes the
src_uri_defconfig variable to come out empty, and fails further
validation if defconfig is only supplied via SRC_URI.

Replace comparison operator with awk match function which searches for
sub-string during filtering, effectively placing defconfig from SRC_URI
into src_uri_defconfig and scc files in sccs_from_src_uri respectively.

Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f52ce0fa98bf3bd72df7467031001f3128c145f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 41d8620e67..54a1a1627a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -156,9 +156,10 @@ do_kernel_metadata() {
 	# a quick check to make sure we don't have duplicate defconfigs If
 	# there's a defconfig in the SRC_URI, did we also have one from the
 	# KBUILD_DEFCONFIG processing above ?
-	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
+	src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") != 0) { print $0 }' RS=' ')
 	# drop and defconfig's from the src_uri variable, we captured it just above here if it existed
-	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
+	sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") == 0) { print $0 }' RS=' ')
+
 	if [ -n "$in_tree_defconfig" ]; then
 		sccs_defconfig=$in_tree_defconfig
 		if [ -n "$src_uri_defconfig" ]; then
-- 
2.17.1

