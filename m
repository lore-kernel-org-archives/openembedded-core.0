Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64971C6FA90
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:37:49 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.2088.1663727865797885523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IWHIalhC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id bh13so4578031pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=JdJj5YbV9kB0VgR5CJ2UZAZ6OfxtbIYZTSEgRseBtTo=;
        b=IWHIalhCFrJk9MDGb1CgNpsqmji4mKRcfEL/sqED8MdD0hLU901CeMOSHnFDXBz4q8
         rzKFXTp9+lKYnWOpTh+AX9hV0+LCV+iGl2ZbPRQRdw0rwZeaxU9fT41yVgu+6X97VzqK
         Nsjw8lfvSot4+gbv7+gKXrCIiHSPld350RXX4A0Q7b2jrYdtEMmci3UzwgV0C2vZoRmL
         MNXLDSK61CHpS6u/HUn12GFDs622u4/hCe4hbk7qyEVpnDZfCUvLRo0PaNiEBfTLEh/K
         SMem2UAGWOTPVL1CRNkCJ3SVv9b+ulnTsfPydUwCC7dAb4yACka+j1aWKeEdu99oQiEy
         FywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JdJj5YbV9kB0VgR5CJ2UZAZ6OfxtbIYZTSEgRseBtTo=;
        b=gOfyzPJi0R27fqiZyca5Yuc7fpqZx9lWfs96FjbDXicn4KT7wuOgtsWnz7Wtp5n5DA
         1P/qa/BIsMmnoAiUZtMdEClvXiTtWHyH09DfMM9XK9YyRIUR0EfB0d7kscQ/mBxtdPHu
         tOEnWn+ZjxOI65kaemykkJ9j1LLPJOTluUazYse0MEHvMZmQzM3D/0OYahCTGKZrO74G
         7SFXiqEuxitYwbFKgM4oiuI2C9cZG5lhXYKbUZ5e3NnHHXhOCfp/2Nb/IAhaTyYKIP1T
         h5R1Bq0b/UPAN8UHpxIl48wBkjKm2gUAkfojhQoc0etFedAJsZV+hXUzvLAD6eeCy9VS
         aUlw==
X-Gm-Message-State: ACrzQf1jAiVqJXfTQb1JoeeKhjfjZWksVoOMhXbIytueNwsFl1935a3f
	1sA/BhCafxMSbrbPg9N8Qmmv7ZgWDGMAcpLh
X-Google-Smtp-Source: 
 AMsMyM470C6xbQYD21TxnQOKuwKrGtKTnGJWv1+nNlfxatrgzme9f0ARwIqd/KNbC71pjSl9ASP9ZQ==
X-Received: by 2002:a63:ff4f:0:b0:439:61d6:197 with SMTP id
 s15-20020a63ff4f000000b0043961d60197mr22199654pgk.67.1663727864647;
        Tue, 20 Sep 2022 19:37:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 207-20020a6215d8000000b00537a6b81bb7sm670154pfv.148.2022.09.20.19.37.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:37:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] sqlite3: Fix CVE-2020-35527
Date: Tue, 20 Sep 2022 16:37:13 -1000
Message-Id: 
 <2541fd0d0e2c0919d80d6b0f6262cf2c50fe309b.1663727733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663727733.git.steve@sakoman.com>
References: <cover.1663727733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170922

From: Virendra Thakur <virendrak@kpit.com>

Add patch file to fix CVE-2020-35527

Reference:
http://security.debian.org/debian-security/pool/updates/main/s/sqlite3/sqlite3_3.27.2-3+deb10u2.debian.tar.xz

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-35527.patch         | 22 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35527.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35527.patch b/meta/recipes-support/sqlite/files/CVE-2020-35527.patch
new file mode 100644
index 0000000000..d1dae389b0
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35527.patch
@@ -0,0 +1,22 @@
+From: dan <dan@noemail.net>
+Date: Mon, 26 Oct 2020 13:24:36 +0000
+Subject: [PATCH] Fix a problem with ALTER TABLE for views that have a nested
+ FROM clause. Ticket [f50af3e8a565776b].
+
+Upstream-Status: Backport [http://security.debian.org/debian-security/pool/updates/main/s/sqlite3/sqlite3_3.27.2-3+deb10u2.debian.tar.xz]
+CVE: CVE-2020-35527
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+Index: sqlite-autoconf-3310100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -133110,7 +133110,7 @@ static int selectExpander(Walker *pWalke
+             pNew = sqlite3ExprListAppend(pParse, pNew, pExpr);
+             sqlite3TokenInit(&sColname, zColname);
+             sqlite3ExprListSetName(pParse, pNew, &sColname, 0);
+-            if( pNew && (p->selFlags & SF_NestedFrom)!=0 ){
++            if( pNew && (p->selFlags & SF_NestedFrom)!=0 && !IN_RENAME_OBJECT ){
+               struct ExprList_item *pX = &pNew->a[pNew->nExpr-1];
+               sqlite3DbFree(db, pX->zEName);
+               if( pSub ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 48051593e4..d9e98c9120 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-13632.patch \
            file://CVE-2022-35737.patch \
            file://CVE-2020-35525.patch \
+           file://CVE-2020-35527.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.25.1


