Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55033C636D6
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 15:06:58 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.17681.1675955208294797907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 07:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gK+X+5T/;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id r28so1882497oiw.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wIqq40cy6Ukc4hD8MdtyH+uqBSsMPSgJ50qMJ+98y0=;
        b=gK+X+5T/yERjPF9iNHeInG2NSZdEc+h5LAGVt8ZN4TP8+oGWF8e14h/yIbyMf0fpSV
         V58vUjT5mSvwf+J6Uc9Ha/4BfhCytM994IgCJ2Y41MmmWqlWGSSgDCox+R7S9rGfWER+
         GVS6XWpHUNXqd1w5pBxMNt8stMkxt3CR2rPOp0EgGqVx/nlapY/z/+2f+vq2f/1OdEE3
         PID5ITQCtGY5rdkBGZEfxxmkVVz76GJrAYUs4lJLEl1p1E0bdrrSkeVGZwu4MgC0hh7S
         E+0qJkVRZ8lfiFJbe+Dt4L4MYlrmFkGwVaLOu3OleQw95nNMzWyuAt18UBBMRY42rZxi
         SevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wIqq40cy6Ukc4hD8MdtyH+uqBSsMPSgJ50qMJ+98y0=;
        b=NdTi388VHIPzAyxGjg5mX4AOI0Awlmin9MziqWswzwfU0y+v7TA66I4dhLwUUE3Z/A
         /s5oNrmbeQjU3UXePyarUDa+HyJEsnJC1+PCJHxZ/Tbjoq9oPPBRSK5R7DBD6SsUoTL+
         0kcrBX7HCj6K3+cQ37u+ONf/lBSfGJxVe3TsetEPQE/p2+f6jBmIxjv2RtgLGaPQKszG
         3Zfcoxb8MamCES6BQagFZrY9lv3urnep2RNgsn748BcunbS3iPdNeVD7eVNaiKrRBkU4
         qbsYNwzJw+LZq0FcMuYztanhVdP/AZmPqnFiYZPbJo+wjz+ipgMDjx/hKebsqCgFlKjD
         aUsA==
X-Gm-Message-State: AO0yUKUto9BnMQ8YWqINjvg25MME5UBzUbLk24gnQnlilHdWOnFqzgst
	JdVqW/OqfUJD4+QZSMgG3uyKS4DLrNM=
X-Google-Smtp-Source: AK7set9l+oSgXpggwuYvBr5ArkN0CIaLsaxCn3SbVo7vTrE1wMKhNjVFzLKrz2iJKBY5V2j75WepzA==
X-Received: by 2002:aca:2114:0:b0:37a:ae85:e571 with SMTP id 20-20020aca2114000000b0037aae85e571mr5088656oiz.12.1675955206245;
        Thu, 09 Feb 2023 07:06:46 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o203-20020acaf0d4000000b0035b4b6d1bbfsm914168oih.28.2023.02.09.07.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:06:45 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] classes/create-sdpx-2.2: Remove image SPDX and index from deploydir
Date: Thu,  9 Feb 2023 09:06:39 -0600
Message-Id: <20230209150639.114504-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230209150639.114504-1-JPEWhacker@gmail.com>
References: <20230209150639.114504-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 15:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176960

Per feedback from users, remove the top level image SPDX file and the
JSON index file from DEPLOYDIR. Having these files here is confusing to
end users because these files are not very useful by themselves, and
having them in DEPLOYDIR makes it unclear which they should be using.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index f0513af083b..9aede86870c 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -14,6 +14,8 @@ CVE_VERSION ??= "${PV}"
 SPDXDIR ??= "${WORKDIR}/spdx"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
+SPDXIMAGEWORK = "${SPDXDIR}/image-work"
+SPDXSDKWORK = "${SPDXDIR}/sdk-work"
 
 SPDX_TOOL_NAME ??= "oe-spdx-creator"
 SPDX_TOOL_VERSION ??= "1.0"
@@ -821,10 +823,12 @@ def spdx_get_src(d):
         d.setVar("WORKDIR", workdir)
 
 do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
+do_rootfs[cleandirs] += "${SPDXIMAGEWORK}"
 
 ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx ; "
 
 do_populate_sdk[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
+do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_combine_spdx; "
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_combine_spdx; "
 
@@ -840,7 +844,7 @@ python image_combine_spdx() {
     img_spdxid = oe.sbom.get_image_spdxid(image_name)
     packages = image_list_installed_packages(d)
 
-    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages)
+    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Path(d.getVar("SPDXIMAGEWORK")))
 
     def make_image_link(target_path, suffix):
         if image_link_name:
@@ -848,12 +852,8 @@ python image_combine_spdx() {
             if link != target_path:
                 link.symlink_to(os.path.relpath(target_path, link.parent))
 
-    image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
-    make_image_link(image_spdx_path, ".spdx.json")
     spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
     make_image_link(spdx_tar_path, ".spdx.tar.zst")
-    spdx_index_path = imgdeploydir / (image_name + ".spdx.index.json")
-    make_image_link(spdx_index_path, ".spdx.index.json")
 }
 
 python sdk_host_combine_spdx() {
@@ -873,9 +873,9 @@ def sdk_combine_spdx(d, sdk_type):
     sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
     sdk_spdxid = oe.sbom.get_sdk_spdxid(sdk_name)
     sdk_packages = sdk_list_installed_packages(d, sdk_type == "target")
-    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages)
+    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages, Path(d.getVar('SPDXSDKWORK')))
 
-def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
+def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx_workdir):
     import os
     import oe.spdx
     import oe.sbom
@@ -944,7 +944,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
             comment="Runtime dependencies for %s" % name
         )
 
-    image_spdx_path = rootfs_deploydir / (rootfs_name + ".spdx.json")
+    image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
         doc.to_json(f, sort_keys=True, indent=get_json_indent(d))
@@ -1020,7 +1020,3 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
             info.gname = "root"
 
             tar.addfile(info, fileobj=index_str)
-
-    spdx_index_path = rootfs_deploydir / (rootfs_name + ".spdx.index.json")
-    with spdx_index_path.open("w") as f:
-        json.dump(index, f, sort_keys=True, indent=get_json_indent(d))
-- 
2.33.0


