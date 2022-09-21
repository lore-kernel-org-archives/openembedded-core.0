Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74696C6FA92
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:37:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.2081.1663727863522724612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xz4aiuU9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id e68so4555626pfe.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=7upKRVMhfjwcAtmIm6l8YKr9S9XEkl04z8gvIdOCg2U=;
        b=xz4aiuU95lqS8xIUMf/8m0ScUFy4PE4Ze5GcQ6f7+eGmQD7iokuVE6jVFuNHv40VI2
         BFXbp1CVyd9WAPx+wVdgS1aBkVyA6xTzPsIA9Qgrh9ZPPPCs0cle5XZCU6A+AnUGmSKC
         QUFrs/YZfsHj9X0J+RSxTm7tZairTRqsDL9Hzjqdz76aEcxWCTZf2FBaQoAu2UJsfUB9
         +d30ER6lu4FiHafPUg/YQHBj9bD8nNEt7iLgfimvpXIGK4FAxBCHkTaIt1cR3alHdGov
         hUV4bdFdF2Gr7q7QLvjPe2Pfbh6GuPWGT0ypPp9R0lYODyvpRLO+68d7AIcXLTDrjk6O
         sb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7upKRVMhfjwcAtmIm6l8YKr9S9XEkl04z8gvIdOCg2U=;
        b=XxN3BKkaldwc9AzXTEiq/2erQinM4Q+XzjNxKZR4u1y+dAPoKbCR3OwQfYlRCQ8qTW
         69B+5F6YDvUl+36WlnpPvj7LK1+TP0v551Ewri/FtxZxC6HyeX1xvw5TdyY3zs+AU4TR
         Y+A7dmPmN8UXYn48hbax9kkvqIollIZGJrH5Cy4z74wZ0l9y/yLUgGL1kGY/Tk4txUVS
         Cgqei5YfdlCNOU0vhrZQqUT3f/ENjK7cB5AGOrYsUC292hdrN7H0366tSPcSANhJMVuC
         Lp6vC2Vxnllm7zicVm6dKVPVjlCCMyh3nGAj8UKHkZ3wEO0FZX4rRQIIg9dJtOfXeDEC
         U/FA==
X-Gm-Message-State: ACrzQf152l6VVVL6/eCE7LkKVDtDhJkLlelZwYLhoAb3dYkTQ4knseNE
	DZ5jOwAgG4bwsYrnJH9Vw5cez175wwEc9NmI
X-Google-Smtp-Source: 
 AMsMyM7HG1uNZ2NN24y/MjggqgK5+8cVgcy/Ox8GLNYNYtuo21VjkVwAn3W8d7mKphu5MGCVuztwyA==
X-Received: by 2002:a05:6a00:1ad0:b0:545:b61b:fe7 with SMTP id
 f16-20020a056a001ad000b00545b61b0fe7mr26234242pfv.25.1663727862427;
        Tue, 20 Sep 2022 19:37:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 207-20020a6215d8000000b00537a6b81bb7sm670154pfv.148.2022.09.20.19.37.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:37:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] sqlite3: Fix CVE-2020-35525
Date: Tue, 20 Sep 2022 16:37:12 -1000
Message-Id: 
 <ced472cf1d195a1a856d24240dbd6ee91140a347.1663727733.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170921

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2020-35525

Reference:
http://security.debian.org/debian-security/pool/updates/main/s/sqlite3/sqlite3_3.27.2-3+deb10u2.debian.tar.xz

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-35525.patch         | 21 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35525.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35525.patch b/meta/recipes-support/sqlite/files/CVE-2020-35525.patch
new file mode 100644
index 0000000000..27d81d42d9
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35525.patch
@@ -0,0 +1,21 @@
+From: drh <drh@noemail.net>
+Date: Thu, 20 Feb 2020 14:08:51 +0000
+Subject: [PATCH] Early-out on the INTERSECT query processing following an
+ error.
+
+Upstream-Status: Backport [http://security.debian.org/debian-security/pool/updates/main/s/sqlite3/sqlite3_3.27.2-3+deb10u2.debian.tar.xz]
+CVE: CVE-2020-35525
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+Index: sqlite-autoconf-3310100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -130767,6 +130767,7 @@ static int multiSelect(
+         /* Generate code to take the intersection of the two temporary
+         ** tables.
+         */
++        if( rc ) break;
+         assert( p->pEList );
+         iBreak = sqlite3VdbeMakeLabel(pParse);
+         iCont = sqlite3VdbeMakeLabel(pParse);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 3440bf4913..48051593e4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-13631.patch \
            file://CVE-2020-13632.patch \
            file://CVE-2022-35737.patch \
+           file://CVE-2020-35525.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.25.1


