Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECDEC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:27 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.21284.1691683518382093105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ffRNfvUW;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a7d402fc6fso513125b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683517; x=1692288317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmyreRujEswO/GQZAv0FpEzi1ajs0LpVnbxe997ZLns=;
        b=ffRNfvUWLGO4+jCSjVkjohNkcwASkMWqlfuD3iphRZuCCe9+JdWF8E9B0l2nzFNyOM
         waVZqxT2nbrxj1jB4Lew5uZktK5nextWWb90LL3Twhv1YcsAo42qNlYJ5c2AZFRIvTY8
         P7hJrWw7pET6ybpQ0zSkvYzO+KbfrT+Zj0QPKM1o9EpLI9snVWSFVcCtMRlssbVGDww6
         oHu75CVHId9E/5PpWvDNeLqfM5swGESQqH3fibHZc7824UfGzp1fjCJDz/doeZqNn75T
         W6Ljf7XBYscwkvYtmNP+BnpDo152QBMc61aIadUaHbsT8QEL9uitXUX2LeBUZ4RMRSXV
         jDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683517; x=1692288317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmyreRujEswO/GQZAv0FpEzi1ajs0LpVnbxe997ZLns=;
        b=UR/TE1gg41QbgMqHF+YeICC5lTzAz6Ui6jOn8ADwesMiFNKE7TPhtVSmnigf77cyOR
         Ix4KhPgMLzGfgCjqyUqw4kb8eIVsBld9d5PI0oSsCMeYQR7EFUm0HKKV4pR2Swdmeqic
         NC5fKfoz4Rw/X34esbCZ6rg4tdpZ0ZffljLkabit6icx+Yv0UStLSXonuSwwDWil+nDc
         UXx7XGiVD+153jizg+sQDpa7lJaBSj2SgIS2bgc7a1FfFCkQDM6jQHk8o8CWo5ZrZWE0
         2FX+DqGkMate+i5Y8N6VSA9GSSfr5iTM4NZdLtfe2SLuIci73UgCmPbz1oW+OYwcX+y2
         R46Q==
X-Gm-Message-State: AOJu0YwLvID2jSg57AsJmTHb3uBQS1dmUqeXpiovgQVrnLUWlNAIo7bm
	vwgPrzhXedRs6T05HaLbELfAVLRJR+RYu5camlI=
X-Google-Smtp-Source: AGHT+IFJgO7l1qqILCNo4EAJTLytgH+WwbWG8/2leojDfOb4XieGiGOWB4MxEROnpqO+/BRyPGZS+A==
X-Received: by 2002:a05:6808:190f:b0:3a4:8b4:bba9 with SMTP id bf15-20020a056808190f00b003a408b4bba9mr3601674oib.44.1691683517280;
        Thu, 10 Aug 2023 09:05:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/37] Revert "rootfs-postcommands.bbclass: add post func remove_unused_dnf_log_lock"
Date: Thu, 10 Aug 2023 06:04:14 -1000
Message-Id: <d38e40661acfbd84197a7731f0dd02d16fba7c59.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185777

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was not well researched or explained, and obscures a problem elsewhere:
if dnf leaves lock files around, the problem should be fixed at the source,
and not in an after-the-fact function.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49bad18012a4079f0dbfe6c541a46ec508940f28)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 7538c8b0b5..690fa976aa 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -49,8 +49,6 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
 
-ROOTFS_POSTPROCESS_COMMAND += 'remove_unused_dnf_log_lock;'
-
 inherit image-artifact-names
 
 # Sort the user and group entries in /etc by ID in order to make the content
@@ -278,11 +276,6 @@ empty_var_volatile () {
 	fi
 }
 
-remove_unused_dnf_log_lock() {
-	if [ -e ${IMAGE_ROOTFS}/log_lock.pid ]; then
-		rm -rf ${IMAGE_ROOTFS}/log_lock.pid
-	fi
-}
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
2.34.1


