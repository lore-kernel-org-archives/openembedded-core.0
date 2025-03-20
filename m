Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F1DC35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:50:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.7914.1742478606575537102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XHLuYr7H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0618746bso5687915e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742478604; x=1743083404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mg66GdtN2ZJH8V6NFsH5LB1fgVCmB4SH/ov59Vrwd44=;
        b=XHLuYr7HH9P4dStTlaRqWyqOFHmoj8b0k6Nr9jAtEVQDhEvuAdxJ+xfXBLZ8D70MsF
         DMFDGEkV6KKQeVlKWX1fA+ZN6i9JFFF1oVRMKi1ac1Erb2toylDuqjB/Nq4hkKVl5DqJ
         vJz3bVV6V+xbLUs2yXPDjHSBHO44F0DN797I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478604; x=1743083404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mg66GdtN2ZJH8V6NFsH5LB1fgVCmB4SH/ov59Vrwd44=;
        b=IJ8azgJjl1ev6CvlBNg+hUO/JjHzNtTUGlvXc/h1jWc6TNvVH0cUGPO0PRPhCIYTul
         P9zkDsmbY8RZmmbgmottSpy8EzKO+MbxiscQwvWyG+jiOPZ72FXZOnZzQMsjq3vMjnpM
         66oVbT2zIB0N4bwgq8qlacF4KxIIq0jV5fyhdgANzYjQYM5snz3tToLFmZLgDi1Vlm3b
         A8ON0N0+1Ij0Pq+nXZXLaelbtiECV4PJxzNWMkdvuxkvN38jCGycpZT3edfk/fOqjm37
         9kx7UcAuVxPzFVIxYU+Hvv+I0v7Zh1OtwoGjn0krdiD8VJ9etZB6ryO7mGOQSSbZaYG6
         d56Q==
X-Gm-Message-State: AOJu0YyxB90kYFzPRM1tej4Uw2tqoRJt2tWvSJtLLQwwWDmUkYND1M4f
	DLtahTC0tGXxIGu7SaKR66jatxKd9aPLmt5apNF/1kEgJMCUhOJ6A73UKWlViLk6RxpbRYITbG8
	+
X-Gm-Gg: ASbGnct1yhwKSFnwj/p8stlWjrobH7n7qxnxr8SeFzJm1zN192a4ufLflprPIK3d/bx
	V+FbP+I0xHqAkz0sXmGlcRmeL5AzjVk7MUkCvUF/d0QiNm3Jj6CPHlO2Sok5JixcpHOFtIYgWbM
	7jrcqai4PV9PtX06N54H/Wlq0e05C+hb92Ydg8S+6z+4LKkHHk5gPbiKtP5tbn9wA7O9in1FEog
	RYYQkP3BGN9FCXuc48KlKN7Qkt3VytKWbmurYPrH+KX+R34yrhyBJ0eK6nkhD9LQsIjAekDoKqo
	eUj55oelSHVFFCwYZJiHj9bGhp0t+UFFWzwuOQTq4+6a09A5Ckb/3An4ovfrEJ4ZZww1tfe+kA=
	=
X-Google-Smtp-Source: AGHT+IFdlNrkQxKusbri+6jqstRVIjNmWw/uwC1Ajb3JsavVQPvq0ZRakV2M4D7KcLZe0TS/+rke3g==
X-Received: by 2002:a5d:59af:0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-399739de3ecmr6835241f8f.32.1742478604214;
        Thu, 20 Mar 2025 06:50:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35f7sm24111131f8f.13.2025.03.20.06.50.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:50:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] spdx: Update for bitbake changes
Date: Thu, 20 Mar 2025 13:50:01 +0000
Message-ID: <20250320135002.948979-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213398

Bitbake is dropping the need for fetcher name iteration and multiple revisions
per url. Update the code to match (removal of the for loop).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass |  51 ++++++-----
 meta/lib/oe/spdx30_tasks.py          | 125 +++++++++++++--------------
 meta/lib/oe/spdx_common.py           |   2 +-
 3 files changed, 88 insertions(+), 90 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 494bde117fe..8f988de8681 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -352,34 +352,33 @@ def add_download_packages(d, doc, recipe):
     for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
         f = bb.fetch2.FetchData(src_uri, d)
 
-        for name in f.names:
-            package = oe.spdx.SPDXPackage()
-            package.name = "%s-source-%d" % (d.getVar("PN"), download_idx + 1)
-            package.SPDXID = oe.sbom.get_download_spdxid(d, download_idx + 1)
+        package = oe.spdx.SPDXPackage()
+        package.name = "%s-source-%d" % (d.getVar("PN"), download_idx + 1)
+        package.SPDXID = oe.sbom.get_download_spdxid(d, download_idx + 1)
 
-            if f.type == "file":
-                continue
+        if f.type == "file":
+            continue
+
+        if f.method.supports_checksum(f):
+            for checksum_id in CHECKSUM_LIST:
+                if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWED_CHECKSUMS:
+                    continue
+
+                expected_checksum = getattr(f, "%s_expected" % checksum_id)
+                if expected_checksum is None:
+                    continue
 
-            if f.method.supports_checksum(f):
-                for checksum_id in CHECKSUM_LIST:
-                    if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWED_CHECKSUMS:
-                        continue
-
-                    expected_checksum = getattr(f, "%s_expected" % checksum_id)
-                    if expected_checksum is None:
-                        continue
-
-                    c = oe.spdx.SPDXChecksum()
-                    c.algorithm = checksum_id.upper()
-                    c.checksumValue = expected_checksum
-                    package.checksums.append(c)
-
-            package.downloadLocation = oe.spdx_common.fetch_data_to_uri(f, name)
-            doc.packages.append(package)
-            doc.add_relationship(doc, "DESCRIBES", package)
-            # In the future, we might be able to do more fancy dependencies,
-            # but this should be sufficient for now
-            doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
+                c = oe.spdx.SPDXChecksum()
+                c.algorithm = checksum_id.upper()
+                c.checksumValue = expected_checksum
+                package.checksums.append(c)
+
+        package.downloadLocation = oe.spdx_common.fetch_data_to_uri(f, f.name)
+        doc.packages.append(package)
+        doc.add_relationship(doc, "DESCRIBES", package)
+        # In the future, we might be able to do more fancy dependencies,
+        # but this should be sufficient for now
+        doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
 
 def get_license_list_version(license_data, d):
     # Newer versions of the SPDX license list are SemVer ("MAJOR.MINOR.MICRO"),
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0618f2f139d..1841b0de4ae 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -356,78 +356,77 @@ def add_download_files(d, objset):
     for download_idx, src_uri in enumerate(urls):
         fd = fetch.ud[src_uri]
 
-        for name in fd.names:
-            file_name = os.path.basename(fetch.localpath(src_uri))
-            if oe.patch.patch_path(src_uri, fetch, "", expand=False):
-                primary_purpose = oe.spdx30.software_SoftwarePurpose.patch
-            else:
-                primary_purpose = oe.spdx30.software_SoftwarePurpose.source
-
-            if fd.type == "file":
-                if os.path.isdir(fd.localpath):
-                    walk_idx = 1
-                    for root, dirs, files in os.walk(fd.localpath, onerror=walk_error):
-                        dirs.sort()
-                        files.sort()
-                        for f in files:
-                            f_path = os.path.join(root, f)
-                            if os.path.islink(f_path):
-                                # TODO: SPDX doesn't support symlinks yet
-                                continue
-
-                            file = objset.new_file(
-                                objset.new_spdxid(
-                                    "source", str(download_idx + 1), str(walk_idx)
-                                ),
-                                os.path.join(
-                                    file_name, os.path.relpath(f_path, fd.localpath)
-                                ),
-                                f_path,
-                                purposes=[primary_purpose],
-                            )
+        file_name = os.path.basename(fetch.localpath(src_uri))
+        if oe.patch.patch_path(src_uri, fetch, "", expand=False):
+            primary_purpose = oe.spdx30.software_SoftwarePurpose.patch
+        else:
+            primary_purpose = oe.spdx30.software_SoftwarePurpose.source
+
+        if fd.type == "file":
+            if os.path.isdir(fd.localpath):
+                walk_idx = 1
+                for root, dirs, files in os.walk(fd.localpath, onerror=walk_error):
+                    dirs.sort()
+                    files.sort()
+                    for f in files:
+                        f_path = os.path.join(root, f)
+                        if os.path.islink(f_path):
+                            # TODO: SPDX doesn't support symlinks yet
+                            continue
 
-                            inputs.add(file)
-                            walk_idx += 1
+                        file = objset.new_file(
+                            objset.new_spdxid(
+                                "source", str(download_idx + 1), str(walk_idx)
+                            ),
+                            os.path.join(
+                                file_name, os.path.relpath(f_path, fd.localpath)
+                            ),
+                            f_path,
+                            purposes=[primary_purpose],
+                        )
 
-                else:
-                    file = objset.new_file(
-                        objset.new_spdxid("source", str(download_idx + 1)),
-                        file_name,
-                        fd.localpath,
-                        purposes=[primary_purpose],
-                    )
-                    inputs.add(file)
+                        inputs.add(file)
+                        walk_idx += 1
 
             else:
-                dl = objset.add(
-                    oe.spdx30.software_Package(
-                        _id=objset.new_spdxid("source", str(download_idx + 1)),
-                        creationInfo=objset.doc.creationInfo,
-                        name=file_name,
-                        software_primaryPurpose=primary_purpose,
-                        software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
-                            fd, name
-                        ),
-                    )
+                file = objset.new_file(
+                    objset.new_spdxid("source", str(download_idx + 1)),
+                    file_name,
+                    fd.localpath,
+                    purposes=[primary_purpose],
                 )
+                inputs.add(file)
 
-                if fd.method.supports_checksum(fd):
-                    # TODO Need something better than hard coding this
-                    for checksum_id in ["sha256", "sha1"]:
-                        expected_checksum = getattr(
-                            fd, "%s_expected" % checksum_id, None
-                        )
-                        if expected_checksum is None:
-                            continue
+        else:
+            dl = objset.add(
+                oe.spdx30.software_Package(
+                    _id=objset.new_spdxid("source", str(download_idx + 1)),
+                    creationInfo=objset.doc.creationInfo,
+                    name=file_name,
+                    software_primaryPurpose=primary_purpose,
+                    software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
+                        fd, fd.name
+                    ),
+                )
+            )
 
-                        dl.verifiedUsing.append(
-                            oe.spdx30.Hash(
-                                algorithm=getattr(oe.spdx30.HashAlgorithm, checksum_id),
-                                hashValue=expected_checksum,
-                            )
+            if fd.method.supports_checksum(fd):
+                # TODO Need something better than hard coding this
+                for checksum_id in ["sha256", "sha1"]:
+                    expected_checksum = getattr(
+                        fd, "%s_expected" % checksum_id, None
+                    )
+                    if expected_checksum is None:
+                        continue
+
+                    dl.verifiedUsing.append(
+                        oe.spdx30.Hash(
+                            algorithm=getattr(oe.spdx30.HashAlgorithm, checksum_id),
+                            hashValue=expected_checksum,
                         )
+                    )
 
-                inputs.add(dl)
+            inputs.add(dl)
 
     return inputs
 
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index e1b26edaaf6..4caefc7673a 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -239,6 +239,6 @@ def fetch_data_to_uri(fd, name):
     uri = uri + "://" + fd.host + fd.path
 
     if fd.method.supports_srcrev():
-        uri = uri + "@" + fd.revisions[name]
+        uri = uri + "@" + fd.revision
 
     return uri

