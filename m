Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0C5CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:50:50 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2235.1778176240536812453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eFoqCBYX;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3856; q=dns/txt;
  s=iport01; t=1778176240; x=1779385840;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nPO36HIPc3VT+ajaZHcKN92/hRbzWXHppQGKks4yt0I=;
  b=eFoqCBYXmU9NkiW6HwPYzvRAK/srV+cAyCKpPjzHlJoFK1B8x8AOx4Nw
   uOGi5XNMj71V8BQBozJSKdmx4LZFlH9mPKM/hkLVtIB8uX8wvayzPlIqR
   Z0mJ36cNp3iyo2SUx/xPp9GSYmEvzFJ+lo8r/VOBQJCystiMOIFoxcFZs
   svlSQ5V34BEuZ0ie7DVDtHP3pfKOqqqg04AEVGJVHve1rrpN8B5IWVdW4
   zD7dMmRAbHdhafva282ST5nOYae/dzSgzY2AH0ITMq+uZNP2QZpaITPB5
   0hEp1WPzGGNs/IBHOR0IVU+ESnFSL44ehCJ6/HmfpEioAjRldnv7djQrE
   A==;
X-CSE-ConnectionGUID: 2BRrtSJpRUi9582FJBL1TA==
X-CSE-MsgGUID: 8VafnQ60TQu6yi7nMvVi1A==
X-IPAS-Result: =?us-ascii?q?A0BFAgAJ0Pxp/5X/Ja1aglmCV3JfQkmUKoE1bItnkjaBf?=
 =?us-ascii?q?w8BAQEPRA0EAQGEQI16AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBOAEYAVkDAQJPCyMhgwIBgjoDNgIBEbcfgiyBAYMoAYFU2?=
 =?us-ascii?q?EgNglMBCxQBgTiFP4J6hSNbGAGEeicbG4FyhAd2gQUBgRlCAogkBIIigQ6BY?=
 =?us-ascii?q?B6BYIsoSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUuCOXJqg?=
 =?us-ascii?q?QKEYHgjLANOewMLGA1IESwUIxQbBD5uB4pFHQ+BY02BDgErSIFFQSySQ2mRe?=
 =?us-ascii?q?qAdcQoog3SMHo8+hXwaM4QEgVeSPpJSC5h7jgmECZErgRyEaIFoPIFZcBWDI?=
 =?us-ascii?q?glKGQ+OLgoLg2CCZIMAbL4WJDUCCTIBAQcCBw0DC4FokAACJgQDbmABAQ?=
IronPort-Data: A9a23:DnkavaCel7G7rBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDh00jwOm
 2cXXmyCbqyPamT1c9gla4m0ox5U7MPSn9E2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAL9hGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEmd9UFl0NH5Uix+cmXDEU2
 94yDGkxR0XW7w626OrTpuhEnM8vKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY+BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FMqjuS8boOFI7RmQ+0FoE+Wo
 FuYp1jAH08LNYOZ7CS78yuF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:lHktxax27Tbbsg5QdyCBKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:X03uNGwpP4jsvNWH2iPsBgVOMPo/bkb/1E3tIh7lWTxHapexEGO5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Ax0/IpA8deCR8XiTEUfrDvpuQf5dW6qqoMR5Vraw?=
 =?us-ascii?q?b5diFaipVJQmc1R3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,221,1770595200"; 
   d="scan'208";a="736496181"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 May 2026 17:50:39 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 5D22018000266
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 17:50:39 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 09A54CC1600; Thu,  7 May 2026 10:50:39 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] python3-requests: backport fix for CVE-2026-25645
Date: Thu,  7 May 2026 10:50:26 -0700
Message-Id: <20260507175026.4092131-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236615

From: Ross Burton <ross.burton@arm.com>

When unpacking zip files requests uses predictable paths. Backport a fix
to use randomly generated pathnames to mitigate injection attacks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe846d71b647fb06e6a87cb45a2dd9b0889e2891)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
new file mode 100644
index 0000000000..3bebba6572
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
@@ -0,0 +1,46 @@
+From 66d21cb07bd6255b1280291c4fafb71803cdb3b7 Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Wed, 25 Mar 2026 08:57:56 -0600
+Subject: [PATCH] Merge commit from fork
+
+Prior to version 2.33.0, the `requests.utils.extract_zipped_paths()` utility function
+uses a predictable filename when extracting files from zip archives into the system
+temporary directory. If the target file already exists, it is reused without validation.
+A local attacker with write access to the temp directory could pre-create a malicious
+file that would be loaded in place of the legitimate one. Standard usage of the Requests
+library is not affected by this vulnerability. Only applications that call
+`extract_zipped_paths()` directly are impacted. Starting in version 2.33.0, the library
+extracts files to a non-deterministic location. If developers are unable to upgrade,
+they can set `TMPDIR` in their environment to a directory with restricted write access.
+
+CVE: CVE-2026-25645
+Upstream-Status: Backport [https://github.com/psf/requests/commit/66d21cb07bd6255b1280291c4fafb71803cdb3b7]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/requests/utils.py | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/requests/utils.py b/src/requests/utils.py
+index d8803e6e91..54959bb8ab 100644
+--- a/src/requests/utils.py
++++ b/src/requests/utils.py
+@@ -282,12 +282,13 @@ def extract_zipped_paths(path):
+         return path
+ 
+     # we have a valid zip archive and a valid member of that archive
+-    tmp = tempfile.gettempdir()
+-    extracted_path = os.path.join(tmp, member.split("/")[-1])
+-    if not os.path.exists(extracted_path):
+-        # use read + write to avoid the creating nested folders, we only want the file, avoids mkdir racing condition
+-        with atomic_open(extracted_path) as file_handler:
+-            file_handler.write(zip_file.read(member))
++    suffix = os.path.splitext(member.split("/")[-1])[-1]
++    fd, extracted_path = tempfile.mkstemp(suffix=suffix)
++    try:
++        os.write(fd, zip_file.read(member))
++    finally:
++        os.close(fd)
++
+     return extracted_path
+ 
+ 
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.4.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
index b86ecfba52..9ebdd4f08a 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.4.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -3,13 +3,12 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI:append:class-nativesdk = " \
-           file://environment.d-python3-requests.sh \
-"
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
-inherit pypi python_setuptools_build_meta
+SRC_URI += "file://CVE-2026-25645.patch"
+SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-- 
2.35.6


