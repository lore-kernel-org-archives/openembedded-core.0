Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E49D0EE34
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4345.1764104339372724217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t9vCu3Dd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b80fed1505so6811716b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104338; x=1764709138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdY1il5UvyQEzA7wmazVWCfDU0Kq1Gh3y8KGxQRZiO0=;
        b=t9vCu3DdX/7kPB0JDDiQ3UfLwvtdHwBF+8s6JQEKgs9AXntjitcwwoDM+OLYapY8E4
         fpJRkZ46DXJ/APWVnmR1NH7ZETHRxI1Khw/YOd4D/8FqvwhWUKrWWv41XR3Yl7+fMqbP
         LlesRZD8ZHyfib0F+h4aa5UIxTo4x1C+oi9MJCmEc9z07TkIA84n+N7nQ1O5mRQvYWgw
         bGpuFfT80vGXuOVZ5NLiMWK8ElT9unZJJ+6zMWH2/JFxScyg2/6DqAOKA9O6niNkTBwa
         3CUjkFeqym1lYCuNY7D5CY3e5mRoOfyA+NbsolAMzhQI271c84Trlb0/yfdaBvgvGhhM
         XHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104338; x=1764709138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdY1il5UvyQEzA7wmazVWCfDU0Kq1Gh3y8KGxQRZiO0=;
        b=L0UztlTKrmUamqd3PG/NzINjUfYmYFIgGNhT1t2QO60SGY/fbF0tN4G2tlIL4uF9+f
         kXKZVKDV1Ubu1jt9wa0tpLINZMuPbXGCY29riwHcT6mUSf+NCshcrRJkdVABjdv6gkop
         kZ9XGyjexfcooU48JXTOyCKTPaVdIfU2fES+lwrZfe3AHjKleC9itmLWDn6yhlmDbKde
         mFHs9iZ41yOo1qv0m11wjwQJ+SUv2FvS0kgB4MirOicNU5HA1MTA/EHexSWf4cC1QvSl
         SyOcXLlls2Vw/1HKQPJpdEU37Af/R9iNw8bnuzSw6H3QY1MNYLXHnqbN6KF2j/FYy188
         mt5w==
X-Gm-Message-State: AOJu0YxvkV0M4kFOacmLKeBGPR28Ic72Hs1ei75WleYkUr61x/4gHn5r
	aZckQ+ZszeLN0Jhi8sWiI6d2B8Q8xURBe1ZaHKCZQzj/seoCTmdsAPYMT6X/oQfqrBIS8xKbV4F
	80faE
X-Gm-Gg: ASbGncsDNdgWwdG3tthhzg7u1VlgrLa8YFTsLnWvJlo7wnzFRn3ScOODHNgSKuCvo1O
	+wXJjEB5Uda9lJEWgjL0kFmld38r0mn/xHsLzGVXxOWAy9Iu4gp41p0bQtEoDXpJN1PTcJ5F5r+
	GySJSAwakSJXiFr2jvmrzBGZKoYsC4isB3QHT5c8pVe2t4bAHRSI+xVA/981IrT6Qe0Oz/2y1A+
	BVXpsfqzjstUElT8Ktjw7pxCGNtX2++Hs0UEP3NBT6XKahf9Iq3ZjwYcJ+dyM/jk6Ln7iu6dfzf
	q31pD/ExMgGY8Z4MvkG0CJeH2wXnDZE15UrEuHcRaTEab5XruvojZ/w2es74qYq2GDY7oqD5oR0
	ReVo2NIWYVqZ5suz7t9+Cigi1p7qHBFSWy5F6zsFI0LmEwmYT4643JqgO0VH9bgjXOVPHm7sZpc
	Kc8w==
X-Google-Smtp-Source: AGHT+IFDAcH9shxYPY3IRuZ+/XhayE2OMc3oqsPSIJ4vUfhqBuOfZX8WVS3mKqe+hkebl5/I2zLrNg==
X-Received: by 2002:a05:6a20:7d8b:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-3614eb58328mr19346439637.26.1764104338470;
        Tue, 25 Nov 2025 12:58:58 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:58:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/9] Revert "spdx: Update for bitbake changes"
Date: Tue, 25 Nov 2025 12:58:39 -0800
Message-ID: <f3bfb98d1cf928678d9931308c116e9e6ec64ba5.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226786

From: Kai Kang <kai.kang@windriver.com>

This reverts part of commit 4859cdf97fd9a260036e148e25f0b78eb393df1e.

Modification of meta/classes/create-spdx-2.2.bbclass is not backported,
so no need to consider it.

In the commit, it updates spdx according to bitbake change. But the
bitbake commit

* 2515fbd10 fetch: Drop multiple branch/revision support for single git urls

doesn't backport for scarthgap.

So revert the other parts of the commit 4859cdf97fd9a260036e148e25f0b.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/spdx30_tasks.py | 125 ++++++++++++++++++------------------
 meta/lib/oe/spdx_common.py  |   2 +-
 2 files changed, 64 insertions(+), 63 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a2d316301f..0fa9a7d724 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -356,77 +356,78 @@ def add_download_files(d, objset):
     for download_idx, src_uri in enumerate(urls):
         fd = fetch.ud[src_uri]
 
-        file_name = os.path.basename(fetch.localpath(src_uri))
-        if oe.patch.patch_path(src_uri, fetch, "", expand=False):
-            primary_purpose = oe.spdx30.software_SoftwarePurpose.patch
-        else:
-            primary_purpose = oe.spdx30.software_SoftwarePurpose.source
-
-        if fd.type == "file":
-            if os.path.isdir(fd.localpath):
-                walk_idx = 1
-                for root, dirs, files in os.walk(fd.localpath, onerror=walk_error):
-                    dirs.sort()
-                    files.sort()
-                    for f in files:
-                        f_path = os.path.join(root, f)
-                        if os.path.islink(f_path):
-                            # TODO: SPDX doesn't support symlinks yet
-                            continue
+        for name in fd.names:
+            file_name = os.path.basename(fetch.localpath(src_uri))
+            if oe.patch.patch_path(src_uri, fetch, "", expand=False):
+                primary_purpose = oe.spdx30.software_SoftwarePurpose.patch
+            else:
+                primary_purpose = oe.spdx30.software_SoftwarePurpose.source
+
+            if fd.type == "file":
+                if os.path.isdir(fd.localpath):
+                    walk_idx = 1
+                    for root, dirs, files in os.walk(fd.localpath, onerror=walk_error):
+                        dirs.sort()
+                        files.sort()
+                        for f in files:
+                            f_path = os.path.join(root, f)
+                            if os.path.islink(f_path):
+                                # TODO: SPDX doesn't support symlinks yet
+                                continue
+
+                            file = objset.new_file(
+                                objset.new_spdxid(
+                                    "source", str(download_idx + 1), str(walk_idx)
+                                ),
+                                os.path.join(
+                                    file_name, os.path.relpath(f_path, fd.localpath)
+                                ),
+                                f_path,
+                                purposes=[primary_purpose],
+                            )
 
-                        file = objset.new_file(
-                            objset.new_spdxid(
-                                "source", str(download_idx + 1), str(walk_idx)
-                            ),
-                            os.path.join(
-                                file_name, os.path.relpath(f_path, fd.localpath)
-                            ),
-                            f_path,
-                            purposes=[primary_purpose],
-                        )
+                            inputs.add(file)
+                            walk_idx += 1
 
-                        inputs.add(file)
-                        walk_idx += 1
+                else:
+                    file = objset.new_file(
+                        objset.new_spdxid("source", str(download_idx + 1)),
+                        file_name,
+                        fd.localpath,
+                        purposes=[primary_purpose],
+                    )
+                    inputs.add(file)
 
             else:
-                file = objset.new_file(
-                    objset.new_spdxid("source", str(download_idx + 1)),
-                    file_name,
-                    fd.localpath,
-                    purposes=[primary_purpose],
-                )
-                inputs.add(file)
-
-        else:
-            dl = objset.add(
-                oe.spdx30.software_Package(
-                    _id=objset.new_spdxid("source", str(download_idx + 1)),
-                    creationInfo=objset.doc.creationInfo,
-                    name=file_name,
-                    software_primaryPurpose=primary_purpose,
-                    software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
-                        fd, fd.names[0]
-                    ),
+                dl = objset.add(
+                    oe.spdx30.software_Package(
+                        _id=objset.new_spdxid("source", str(download_idx + 1)),
+                        creationInfo=objset.doc.creationInfo,
+                        name=file_name,
+                        software_primaryPurpose=primary_purpose,
+                        software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
+                            fd, name
+                        ),
+                    )
                 )
-            )
 
-            if fd.method.supports_checksum(fd):
-                # TODO Need something better than hard coding this
-                for checksum_id in ["sha256", "sha1"]:
-                    expected_checksum = getattr(
-                        fd, "%s_expected" % checksum_id, None
-                    )
-                    if expected_checksum is None:
-                        continue
+                if fd.method.supports_checksum(fd):
+                    # TODO Need something better than hard coding this
+                    for checksum_id in ["sha256", "sha1"]:
+                        expected_checksum = getattr(
+                            fd, "%s_expected" % checksum_id, None
+                        )
+                        if expected_checksum is None:
+                            continue
 
-                    dl.verifiedUsing.append(
-                        oe.spdx30.Hash(
-                            algorithm=getattr(oe.spdx30.HashAlgorithm, checksum_id),
-                            hashValue=expected_checksum,
+                        dl.verifiedUsing.append(
+                            oe.spdx30.Hash(
+                                algorithm=getattr(oe.spdx30.HashAlgorithm, checksum_id),
+                                hashValue=expected_checksum,
+                            )
                         )
-                    )
 
-            inputs.add(dl)
+                inputs.add(dl)
 
     return inputs
 
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 4caefc7673..e1b26edaaf 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -239,6 +239,6 @@ def fetch_data_to_uri(fd, name):
     uri = uri + "://" + fd.host + fd.path
 
     if fd.method.supports_srcrev():
-        uri = uri + "@" + fd.revision
+        uri = uri + "@" + fd.revisions[name]
 
     return uri
-- 
2.43.0


