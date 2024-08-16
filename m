Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20F0C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:56:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.142597.1723791388510636007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jV8xblfx;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ff67158052so12914495ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 23:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723791387; x=1724396187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5D//lRMzVXzXF0+cspnhDTYmsMiaak1oTfzDQAyAxU=;
        b=jV8xblfx3Y7/b+shCNjsQWePWF7WYPjS1Q6dkI8UtryEuzom1L4qya+Nb3YoL+AX4M
         SxruU+mLKapuFjcgP/WhQWGzaZ2HF5POVTpVBNyM1ovVWl01b6Ifay4t4DMlNbJD/XaZ
         s34MyS0UUe89YY9dQW7X2py72qi0F5hLnBqt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723791387; x=1724396187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5D//lRMzVXzXF0+cspnhDTYmsMiaak1oTfzDQAyAxU=;
        b=vqK2cy2WyEY1tEBW6oaVtRMA/4qPhREQ++Tpbt+JhicDLbked2B0tFgmZoEb000xeR
         IKg128JMy+9/m4eF/7FTTDbZUup/htOKxl1PuTIyO64BbvDMMNPDvYdfWHnJTsXefGUY
         uBj45XhIygUkkz8XWfMTDAXC+wPZ8HiFEuNJ1bgrVL3GxwHVz2/9ekm3GwkaQZBwp754
         bmYO7soo9CNjqZFjrF3StSpkrHe7MzTwYVYgCQ2+X3whVW6BEnyUeRAa8KOAxjZW0ajo
         HjAYj1qyANO/0l302g4GOOoyFmtjLxnhYnl2+NAEr6ijqnQIuqPU8iKindHlOneZUdu0
         f5Vg==
X-Gm-Message-State: AOJu0YzKpmQKa1/uVfhaiKBtMAsV+Z5+gbsKOH6/jrW6eRC2FoB6TZ4v
	t/ss377E9EwRyD5EUhw9lEkAZoIMxrWdvo7hwqCf2YC2FP5LbguX8RIYjghUFiu/gjP+8xfsva7
	O
X-Google-Smtp-Source: AGHT+IF5Ue0oMUSZotNMX3LjPXRwWjnwh1VNoxx5+tJjiUnBv4TGwQLTDe7Ioxili8E5gqptigda4Q==
X-Received: by 2002:a17:902:d4cd:b0:1fd:6b87:2147 with SMTP id d9443c01a7336-20203e49444mr22030865ad.6.1723791387336;
        Thu, 15 Aug 2024 23:56:27 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.47.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03797c0sm19733685ad.163.2024.08.15.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:56:26 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] Tiff: Security fix for CVE-2024-7006
Date: Fri, 16 Aug 2024 12:26:19 +0530
Message-Id: <20240816065619.7357-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 06:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203458

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/818fb8ce881cf839fbc710f6690aadb992aa0f9e]

CVE's Fixed:
CVE-2024-7006 libtiff: NULL pointer dereference in tif_dirinfo.c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libtiff/tiff/CVE-2024-7006.patch          | 64 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
new file mode 100644
index 0000000000..217de0ea92
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
@@ -0,0 +1,64 @@
+From 818fb8ce881cf839fbc710f6690aadb992aa0f9e Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 1 Dec 2023 20:12:25 +0100
+Subject: [PATCH] Check return value of _TIFFCreateAnonField().
+
+Fixes #624
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/818fb8ce881cf839fbc710f6690aadb992aa0f9e]
+CVE: CVE-2024-7006
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ libtiff/tif_dirinfo.c |  2 +-
+ libtiff/tif_dirread.c | 15 ++++++---------
+ 2 files changed, 7 insertions(+), 10 deletions(-)
+
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index a212d01..95226a8 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -797,7 +797,7 @@ _TIFFFindOrRegisterField(TIFF *tif, uint32_t tag, TIFFDataType dt)
+ 	fld = TIFFFindField(tif, tag, dt);
+ 	if (fld == NULL) {
+ 		fld = _TIFFCreateAnonField(tif, tag, dt);
+-		if (!_TIFFMergeFields(tif, fld, 1))
++		if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
+ 			return NULL;
+ 	}
+ 
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 0e283fc..1781166 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -3735,11 +3735,9 @@ TIFFReadDirectory(TIFF* tif)
+ 				    dp->tdir_tag,dp->tdir_tag);
+ 				/* the following knowingly leaks the 
+ 				   anonymous field structure */
+-				if (!_TIFFMergeFields(tif,
+-					_TIFFCreateAnonField(tif,
+-						dp->tdir_tag,
+-						(TIFFDataType) dp->tdir_type),
+-					1)) {
++                const TIFFField *fld = _TIFFCreateAnonField(
++                    tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
++                if (fld == NULL || !_TIFFMergeFields(tif, fld, 1)) {
+ 					TIFFWarningExt(tif->tif_clientdata,
+ 					    module,
+ 					    "Registering anonymous field with tag %"PRIu16" (0x%"PRIx16") failed",
+@@ -4502,10 +4500,9 @@ TIFFReadCustomDirectory(TIFF* tif, toff_t diroff,
+ 			TIFFWarningExt(tif->tif_clientdata, module,
+ 			    "Unknown field with tag %"PRIu16" (0x%"PRIx16") encountered",
+ 			    dp->tdir_tag, dp->tdir_tag);
+-			if (!_TIFFMergeFields(tif, _TIFFCreateAnonField(tif,
+-						dp->tdir_tag,
+-						(TIFFDataType) dp->tdir_type),
+-					     1)) {
++            const TIFFField *fld = _TIFFCreateAnonField(
++                tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
++            if (fld == NULL || !_TIFFMergeFields(tif, fld, 1)) {
+ 				TIFFWarningExt(tif->tif_clientdata, module,
+ 				    "Registering anonymous field with tag %"PRIu16" (0x%"PRIx16") failed",
+ 				    dp->tdir_tag, dp->tdir_tag);
+-- 
+2.35.7
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index b4af179e76..209b38b8f2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -53,6 +53,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-2.patch \
            file://CVE-2023-6277-3.patch \
            file://CVE-2023-6277-4.patch \
+           file://CVE-2024-7006.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


