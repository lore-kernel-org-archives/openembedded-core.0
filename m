Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECDEC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:48 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.23030.1706104903671606748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kkhk/E1c;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ca1b4809b5so2560500a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104902; x=1706709702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/1RMvb5QkneZXH3NMFXE0AA2Gc3ghEWW3uZXOL99Nc=;
        b=kkhk/E1cRqhwyuxjP+8eZQyGeR6bcUSxsQHN25mfahRkBl4Una4Gsg+sPvxBzeOU74
         8hV849z+OJ4vI0Q83tiTl1m16Z3keDQVVBp2Op0gSjBLqCVx9mEIyFo1isImlZAuR0e5
         jwknXthOW1ZHNkrQeJqCawY3b/o1dxcp999mpvM5nIsvgtXcQCaUTlzQhPjHXFRAtsvx
         BsNymxs+x2uX2uvhfc3JtEQ+n+dj2bVpTCBtabSOc9Xn10Stf+f1CMHI3/imvttp8pyP
         ezUAAVzPEHm/MRCzGNZgJrsOfYPzjJoyiTr7LUWZLxaTkPEGaiyuP5mdqwyeBzx3WNtN
         qp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104902; x=1706709702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/1RMvb5QkneZXH3NMFXE0AA2Gc3ghEWW3uZXOL99Nc=;
        b=YB5ClAiYUO6d8b8dxwYFZdsTZOoNpg0OufZwt76Ofe5rU3nNyrs81iv5VAZFsHh5sw
         zH+RH2pZNkcWiZvyNhZC3YbeYXXNUUSvu+kvi0uyQ4yzqk68VMVRrFsyFI46/QJA4dD4
         YXHKx8Ly0WqYb4uK/gNfvlXzDE0GCBQH09RAOC5Zz2W2l32ZIRrtWhjmZWS/Dgd/WoN5
         Glf8QQHxTCDpHndUwbytijWh6+wxGzrhjOjpvnlLgdOrs/5Ee4O6MKDPrnbfMlgjZkp0
         3q7Y3KM0bUHm5nAixzOuJ/bUinjzbj4YfFFTfjVd10Qwz2f41DYIHpHghMApkIwavWBJ
         N/Yw==
X-Gm-Message-State: AOJu0YympGZ06oyekE/cOofEzaKppdtfe9SAg8K/nnSHOOkrrI1US+so
	SelD2ESKCOGVdRoKj5X8SqXDrPYidMGuM0JGdjdSCuTrnhMaFJNnzCIsijs/iQNhdpbXs0FbXta
	B040=
X-Google-Smtp-Source: AGHT+IFCU3WcMaEKu0AW0W4nImUVuvIEeIvo3eZWYM4qm9dVHWXwXaRgo0yuJRa+wA6cySBS9Un6Qw==
X-Received: by 2002:a05:6a20:841c:b0:19a:b80b:59a0 with SMTP id c28-20020a056a20841c00b0019ab80b59a0mr653502pzd.58.1706104902258;
        Wed, 24 Jan 2024 06:01:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/12] sstate: Fix dir ownership issues in SSTATE_DIR
Date: Wed, 24 Jan 2024 04:01:12 -1000
Message-Id: <90d1e97b7c8bce0fb49714923989c63d243eb2da.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194285

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We currently use mkdir -p to create missing parent directories within SSTATE_DIR.
Reading the man page for mkdir mentions that parent directories are created with
the current umask, *not* the mode passed upon the commandline.

We could fix this by setting and resetting the umask but since we already have
decent python code able to do this, move to using that injecting a python function
into the chain of functions already present.

This should help fix the occasional sstate directory creation with the wrong
permissions.

[YOCTO #14385]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae642a4b038c6946e6c8aa9778bf09099d938a31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 5b27a1f0f9..0f11a528b5 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -703,7 +703,7 @@ def sstate_package(ss, d):
     if d.getVar('SSTATE_SKIP_CREATION') == '1':
         return
 
-    sstate_create_package = ['sstate_report_unihash', 'sstate_create_package']
+    sstate_create_package = ['sstate_report_unihash', 'sstate_create_pkgdirs', 'sstate_create_package']
     if d.getVar('SSTATE_SIG_KEY'):
         sstate_create_package.append('sstate_sign_package')
 
@@ -810,6 +810,12 @@ python sstate_task_postfunc () {
 }
 sstate_task_postfunc[dirs] = "${WORKDIR}"
 
+python sstate_create_pkgdirs () {
+    # report_unihash can change SSTATE_PKG and mkdir -p in shell doesn't own intermediate directories
+    # correctly so do this in an intermediate python task
+    with bb.utils.umask(0o002):
+        bb.utils.mkdirhier(os.path.dirname(d.getVar('SSTATE_PKG')))
+}
 
 #
 # Shell function to generate a sstate package from a directory
@@ -822,7 +828,6 @@ sstate_create_package () {
 		return
 	fi
 
-	mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
 	OPT="-cS"
-- 
2.34.1


