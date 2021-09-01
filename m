Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.8227.1630503931139345104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RZYGbyF1;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 6so3759872oiy.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BAvoXTaEu7iRUKZmW7I2Dryi4zbcSKlLNjIAWS4nZo4=;
        b=RZYGbyF1dtG+NFsiFu//rLz+kRQCHrPaBWtIC9EJYaDlZMVEsNvmSERCwXIZEOrhHr
         b7KRHDnarE8ZVl/8uXpf4XVAofAe/RzybIaPH3OncpmwG3yAjiyl62mBs6PVji4V/PcC
         kjJPrf96DnwuzbtLAP+5zOAXTmygJ0cbWI82I+/FTah2f0mRpRppak3iBpR8TntKwseE
         pE0iPeOHiAEbghb9qTkbXi4y8BznSciw+oiDbiSaTvczcF+EMtfuNofXffFguVqyTXDQ
         0XJhHil24Pbd04pK+cglpUEgsqH70rWGAsMEBNrak4w7NWfzU2WOwqVv6CqBV7xTdRgJ
         Gruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BAvoXTaEu7iRUKZmW7I2Dryi4zbcSKlLNjIAWS4nZo4=;
        b=SKz2TQ5BXfy6BrFWeO8FzVUsS0kQRPsV6Q1vTtXcKSERDzr2aZ2oxjCiv/RWXpq1dW
         XD0DhCMgF/swsvKOwE73TPLtBM9bQvqk3Zsf3mOC1UbdaLJqqgHoGtLGJV8//ShEyFla
         pKQu+fSkcaMWWrFvlPJWqUJR+Njnvo1XyhyjrpKvfVu49yX+AmJ9GMsqCG+ndliTmrp6
         A1QwfHpI2nmHnp8oZfjjaxCp0PBzLn8zaiyLnEvUtDwVCwEouxi/dLYP7DxuIyJ6CaD5
         RUqid5rfVVVs27UwtlkvU3/fNJeNI62rqRcFi8qFZhzyN1JfNPiMu/JZtHPMTZ1aqnG3
         BonQ==
X-Gm-Message-State: AOAM531JwDHRvyZWy8v3JUtqTphCqt51bBKwSNXTd90WbAsCmUJ7k0yE
	s4WvJYpCdqAyjcz+wLdJv7bd+GVp0rA=
X-Google-Smtp-Source: ABdhPJz8aumVL8ktkSkfzlBTp3jjhOpxPD+hNv060Seg6+1ZpDkyDpVxbH963e74g+Xr5bCcE1hHXA==
X-Received: by 2002:a54:4610:: with SMTP id p16mr1075188oip.9.1630503930173;
        Wed, 01 Sep 2021 06:45:30 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:29 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 12/31] classes/create-spdx: Speed up hash calculations
Date: Wed,  1 Sep 2021 08:44:51 -0500
Message-Id: <20210901134510.29561-13-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the bb.utils.sha* utilities to hash files since they are much faster
than the loops we were rolling ourselves

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 49 +++++++++++---------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 2e13b19b5b..2638b3dc97 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -122,6 +122,8 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
     import hashlib
 
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
+    if source_date_epoch:
+        source_date_epoch = int(source_date_epoch)
 
     sha1s = []
     spdx_files = []
@@ -143,22 +145,8 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
                     spdx_file.fileTypes.append(t)
                 spdx_file.fileName = filename
 
-                hashes = {
-                    "SHA1": hashlib.sha1(),
-                    "SHA256": hashlib.sha256(),
-                }
-
-                with filepath.open("rb") as f:
-                    while True:
-                        chunk = f.read(4096)
-                        if not chunk:
-                            break
-
-                        for h in hashes.values():
-                            h.update(chunk)
-
-                    if archive is not None:
-                        f.seek(0)
+                if archive is not None:
+                    with filepath.open("rb") as f:
                         info = archive.gettarinfo(fileobj=f)
                         info.name = filename
                         info.uid = 0
@@ -166,18 +154,21 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
                         info.uname = "root"
                         info.gname = "root"
 
-                        if source_date_epoch is not None and info.mtime > int(source_date_epoch):
-                            info.mtime = int(source_date_epoch)
+                        if source_date_epoch is not None and info.mtime > source_date_epoch:
+                            info.mtime = source_date_epoch
 
                         archive.addfile(info, f)
 
-                for k, v in hashes.items():
-                    spdx_file.checksums.append(oe.spdx.SPDXChecksum(
-                        algorithm=k,
-                        checksumValue=v.hexdigest(),
+                sha1 = bb.utils.sha1_file(filepath)
+                sha1s.append(sha1)
+                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
+                        algorithm="SHA1",
+                        checksumValue=sha1,
+                    ))
+                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
+                        algorithm="SHA256",
+                        checksumValue=bb.utils.sha256_file(filepath),
                     ))
-
-                sha1s.append(hashes["SHA1"].hexdigest())
 
                 doc.files.append(spdx_file)
                 doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
@@ -231,15 +222,7 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
                 if not debugsrc_path.exists():
                     continue
 
-                with debugsrc_path.open("rb") as f:
-                    sha = hashlib.sha256()
-                    while True:
-                        chunk = f.read(4096)
-                        if not chunk:
-                            break
-                        sha.update(chunk)
-
-                file_sha256 = sha.hexdigest()
+                file_sha256 = bb.utils.sha256_file(debugsrc_path)
 
                 if file_sha256 in sources:
                     source_file = sources[file_sha256]
-- 
2.32.0

