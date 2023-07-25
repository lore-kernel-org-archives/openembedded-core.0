Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E191C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 16:52:05 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web10.25486.1690303917068933811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 09:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=KDIZbhBs;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1448; q=dns/txt; s=iport;
  t=1690303917; x=1691513517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+ei6qDzjXRW2T+sXZSgkY8DJCilDjqQR42lyzWpXDO0=;
  b=KDIZbhBsoKO+XddSUiySptouGJYL4T0AvyHV/oO4ke9zYBFJ3HgHRyjG
   StyIkBTi9RQVica7f1XqKwGC/NhPSzrRbAfdvdyNCGscVrG3fwYjOvEq3
   HpOEn7Eb34QYxzN2bikVNolgsxEBzYNg8NP8EH7JsXxjVmOi1dnKlWFzD
   g=;
X-IronPort-AV: E=Sophos;i="6.01,230,1684800000"; 
   d="scan'208";a="92776927"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 16:51:56 +0000
Received: from sjc-ads-1437.cisco.com (sjc-ads-1437.cisco.com [171.70.59.129])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 36PGptfO028239
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Jul 2023 16:51:56 GMT
Received: by sjc-ads-1437.cisco.com (Postfix, from userid 500841)
	id 7CE1CCC1251; Tue, 25 Jul 2023 09:51:55 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Subject: [PATCH] file: fix the way path is written to environment-setup.d
Date: Tue, 25 Jul 2023 09:51:48 -0700
Message-Id: <20230725165148.2704533-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.59.129, sjc-ads-1437.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 16:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184853

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

$OECORE_NATIVE_SYSROOT is not escaped, thus it is expanded to an empty string.
This happens to work because we have ${datadir} which in this context is
relocated to the buildtools sysroot after installation of buildtools.

If the $ before OECORE_NATIVE_SYSROOT is escaped, it will be saved to file.sh
as intended, but MAGIC will point to the wrong location because both
OECORE_NATIVE_SYSROOT and datadir resolve to sysroot which doubles the path
like so:
/path/to/buildtools/sysroots/x86_64-xesdk-linux/path/to/buildtools/sysroots/x86_64-xesdk-linux/usr/share/misc/magic.mgc
which does not exist. So, removing reference to OECORE_NATIVE_SYSROOT.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 meta/recipes-devtools/file/file_5.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.44.bb
index 3090d346ed4f..cded1957f037 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.44.bb
@@ -47,7 +47,7 @@ do_install:append:class-native() {
 do_install:append:class-nativesdk() {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/file.sh
-		export MAGIC="$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
+		export MAGIC="${datadir}/misc/magic.mgc"
 	EOF
 }
 
-- 
2.35.6


