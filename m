Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB724CCA473
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.64582.1656876999617003520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rRwMLLLp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id a15so7163398pfv.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7TF3c6xrkMpiSXmgSTabxuU+FWDdz7T6ny93UN95McU=;
        b=rRwMLLLpzVxYorQ771epD1olm2FtqkFPucjSX+JTkkULEa+yPw4pySKjMuiiGbyQ6J
         rQUXsbY385kXvL1SSXNJB9djMFXklewOeebW/6ZM3d9Hxa4Nv9mQ/mlnI+1h/DnMZhGx
         Wge965ACOAU1YC/m241Ap+OkVFNsGoCdPmvW2RcJX0Q8UynzYJDcxm2EEdZ3tL5XbuSs
         1B7T5QvOq/E9o3b1wF5xOzVkIzQPbZjJlM2I7m6hbrOUnmcxaDk4KdPAJR/R09cBJlG4
         1sbLkXhD4HDdQbc7qtkPfyYripjdPzl3xgJ/AyVhHVtclfrOEe2sbZ9BIXmdl4LdSHYw
         Ic5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7TF3c6xrkMpiSXmgSTabxuU+FWDdz7T6ny93UN95McU=;
        b=eCTSWKuYD+/Jmcr9PCSzjNkKDocT1gLpedUOns/84gLDT8uRfQef7wYSoQLfG/PIeD
         JiMyaCemPKa3ZmZx7zY8fUy/MKxCZ+AKC8egtJv+Qj8vXcTMd2wxHP856JahyhZluON9
         raFADd7RivzhaQ4FnGr7eD1szKp2sTZGskp3QFY4Y57nFXKP9dMea3Fdws3t5eCAtL+T
         fcyjwTplwb4f74kzIpAhOZzLJYqxUV2bua8JLR551XoGWy1bnsos68xeRKIZhn+1lFew
         dfoIuZ6hMhKES38RcXy9M1KjEkQmCIYYgSeaJwBfPZGhNs4uIUm/hdxPu67kAxvBDMM3
         fChw==
X-Gm-Message-State: AJIora/jlbIRgMJ3dQfSrCWO+O2TPIZerVDYWumKOhSoXX3ZZhcqe5Xp
	s56nhbjWB5Rm9q4qMsNHHVP/Jvh1QocHJFQm
X-Google-Smtp-Source: 
 AGRyM1vYVHbYYkVxv96CbRFI74xu8pwMNqe01FCRmim9AnzjoPRmn4TuRSo0Dw81tobeyPVat5xDtw==
X-Received: by 2002:a05:6a00:1491:b0:528:1aa1:743c with SMTP id
 v17-20020a056a00149100b005281aa1743cmr18977471pfu.84.1656876998491;
        Sun, 03 Jul 2022 12:36:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/30] busybox: fix CVE-2022-30065
Date: Sun,  3 Jul 2022 09:35:40 -1000
Message-Id: 
 <aacc1091d8d17b817c6ad1108d9ab44b234bc08e.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167565

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf3d981b0303eab91d4cb19092ac27b489c8ad27)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2022-30065.patch      | 29 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-30065.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch b/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
new file mode 100644
index 0000000000..25ad653b25
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
@@ -0,0 +1,29 @@
+Fix use-after-free in awk.
+
+CVE: CVE-2022-30065
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2022-June/089768.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+fixes https://bugs.busybox.net/show_bug.cgi?id=14781
+
+Signed-off-by: Natanael Copa <ncopa at alpinelinux.org>
+---
+ editors/awk.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 079d0bde5..728ee8685 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -3128,6 +3128,9 @@ static var *evaluate(node *op, var *res)
+ 
+ 		case XC( OC_MOVE ):
+ 			debug_printf_eval("MOVE\n");
++			/* make sure that we never return a temp var */
++			if (L.v == TMPVAR0)
++				L.v = res;
+ 			/* if source is a temporary string, jusk relink it to dest */
+ 			if (R.v == TMPVAR1
+ 			 && !(R.v->type & VF_NUMBER)
+-- 
+2.36.1
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index f2f1b35902..edf896485e 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
+           file://CVE-2022-30065.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


