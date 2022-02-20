Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2B1C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 15:15:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.22055.1645370157477329979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YbHUNbAk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u1so22822052wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 07:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IvjPsP//7qMHf5h9gPn7UxfPctjq6Y5Tvh0G6foCpKU=;
        b=YbHUNbAkj0/D2yWhk/NHX3FL9XQ7aU2OTJFB+NwQH7VSLgSeP5l4XWfG5JiJxSeurx
         ovsk2aGKQRxFLieWHKcGnf1ruTQkhJswSGFXme/EvBWx7jm8BMlgmemildvqo6PCVUNN
         MvzpIZ6IhtgdcjQkl87Tebuc70PSkG9jCd6ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IvjPsP//7qMHf5h9gPn7UxfPctjq6Y5Tvh0G6foCpKU=;
        b=3lXD3dBc8ihRL96Uob5OcRzcZT8it81irWK7PK5VwQjNdX3B/tj2t0NXiYZlsdTgQu
         QV+0Hwd1dEumupMVi4WhFUi4BakFKV9nVNBaZ3yM+xmu60QjFcL8Eqhy5UAupYeBsgxP
         k8pjxw8U0ddNlVGqXfWkW2JIIy4rq2LAF+SYmVSNoDicgTpYbGPfuSeK5LVpUMHOTEoT
         jiERd2fSHcStdN/UmRbHxJwEHojq6q7dW0fFvmw31BPu2gK9m+bgp5LZr4im766PMr/V
         KpTLoU9RDF+7X2eiRs9li8iIlzsA+gExr5XPLYepIcFSAo7LrqYnJQ2ncYDdTGXIZ2Ac
         PdtQ==
X-Gm-Message-State: AOAM530LI1Ilha6zdMWLLy5j4ncu3UO6Q8eMy63KXHRPr3ifKiMXate5
	NjpAE24FfdL+U6/4/TOGKr1sGe9diq6NGqh8
X-Google-Smtp-Source: 
 ABdhPJz1ueejEfzEbG2amOsIeeUCDiaz1UCdpoLUXmSHmQYgfIlNbLQb3uyEbki4F1+sbp5StsSaLQ==
X-Received: by 2002:a5d:6884:0:b0:1e4:ed7b:fd71 with SMTP id
 h4-20020a5d6884000000b001e4ed7bfd71mr12920039wru.550.1645370155736;
        Sun, 20 Feb 2022 07:15:55 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9355:e71:cc42:42f1])
        by smtp.gmail.com with ESMTPSA id
 q76sm5329883wme.1.2022.02.20.07.15.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:15:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] tiff: Add backports for two CVEs from upstream
Date: Sun, 20 Feb 2022 15:15:53 +0000
Message-Id: <20220220151553.3117584-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220220151553.3117584-1-richard.purdie@linuxfoundation.org>
References: <20220220151553.3117584-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 15:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161988

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |  0
 ...99c99f987dc32ae110370cfdd7df7975586b.patch | 30 +++++++++++++++++
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch | 32 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  4 ++-
 4 files changed, 65 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/libtiff/{files => tiff}/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch (100%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
similarity index 100%
rename from meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
rename to meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
diff --git a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
new file mode 100644
index 00000000000..0b41dde606d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
@@ -0,0 +1,30 @@
+From 561599c99f987dc32ae110370cfdd7df7975586b Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 5 Feb 2022 20:36:41 +0100
+Subject: [PATCH] TIFFReadDirectory(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #362)
+
+Upstream-Status: Backport
+CVE: CVE-2022-0562
+
+---
+ libtiff/tif_dirread.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 2bbc4585..23194ced 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -4177,7 +4177,8 @@ TIFFReadDirectory(TIFF* tif)
+                     goto bad;
+                 }
+ 
+-                memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
++                if (old_extrasamples > 0)
++                    memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
+                 _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
+                 _TIFFfree(new_sampleinfo);
+         }
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
new file mode 100644
index 00000000000..74f9649fdf1
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
@@ -0,0 +1,32 @@
+From eecb0712f4c3a5b449f70c57988260a667ddbdef Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 6 Feb 2022 13:08:38 +0100
+Subject: [PATCH] TIFFFetchStripThing(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #362)
+
+Upstream-Status: Backport
+CVE: CVE-2022-0561
+
+---
+ libtiff/tif_dirread.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 23194ced..50ebf8ac 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5777,8 +5777,9 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32_t nstrips, uint64_t** l
+ 			_TIFFfree(data);
+ 			return(0);
+ 		}
+-                _TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
+-                _TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
++		if( dir->tdir_count )
++			_TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
++		_TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
+ 		_TIFFfree(data);
+ 		data=resizeddata;
+ 	}
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index a0745020b8c..6b933a409b8 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch"
+           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
+           file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
+           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch"
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
 
-- 
2.32.0


