Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57C4EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 08:19:58 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web11.2854.1689927593682223685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 01:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=H5HfMxdi;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1452; q=dns/txt; s=iport;
  t=1689927593; x=1691137193;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+tWdInQQz1Y3OdS80AyH4T7JuvFZ/PE5rat76ubaoeM=;
  b=H5HfMxdi53xTtg9Fs8Vj2+a/hSsl+Dl+bpMcM7xe+kPR6gGfHIQzgtWi
   t2HoZTluZNQpYLkuHrTDKJeK3DaIeSI2u8VPgN/ppTzFNQ8VX6Dd2aFlb
   iDJYj66/hL4SnH9DYm0RF+t5cG79RHTRnJmz7140e1L1LDCAC3YNRgqq/
   Y=;
X-IronPort-AV: E=Sophos;i="6.01,220,1684800000"; 
   d="scan'208";a="90190741"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:19:53 +0000
Received: from sjc-ads-914.cisco.com (sjc-ads-914.cisco.com [171.70.57.106])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 36L8JpNJ009169
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 21 Jul 2023 08:19:52 GMT
Received: by sjc-ads-914.cisco.com (Postfix, from userid 500841)
	id C67E2CC1293; Fri, 21 Jul 2023 01:19:50 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Subject: [PATCH] file: return wrapper to fix builds when file is in buildtools-tarball
Date: Fri, 21 Jul 2023 01:18:56 -0700
Message-Id: <20230721081856.1067869-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.57.106, sjc-ads-914.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 08:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184673

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

Wrapper that adds proper path to magic file was removed in
47db876d09d9a4394048579c21d0b394450ce681 in favor of
environment-setup.d/file.sh which now contains `MAGIC` environment variable.
This breaks builds that rely on external buildtools with `file` included in
buildtools-tarball (e.g. via TOOLCHAIN_HOST_TASK) because do_populate_sysroot
task invokes `file` via `subprocess.check_output` (in is_elf function) and
doesn't use variables from files in environment-setup.d. To address this use
case, we need to preserve the wrapper, but also have
environment-setup.d/file.sh for the purposes described in
47db876d09d9a4394048579c21d0b394450ce681.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 meta/recipes-devtools/file/file_5.44.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.44.bb
index 3090d346ed4f..08343842307c 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.44.bb
@@ -45,6 +45,7 @@ do_install:append:class-native() {
 }
 
 do_install:append:class-nativesdk() {
+	create_wrapper ${D}/${bindir}/file MAGIC=${datadir}/misc/magic.mgc
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/file.sh
 		export MAGIC="$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
-- 
2.35.6


