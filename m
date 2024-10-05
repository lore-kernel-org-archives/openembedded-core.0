Return-Path: <yumx@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2947CCF8869
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 00:45:04 +0000 (UTC)
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by mx.groups.io with SMTP id smtpd.web11.3163.1728089096875422904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 17:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=TQa4yS+5;
 spf=pass (domain: amazon.com, ip: 72.21.196.25, mailfrom: prvs=00128c0f3=yumx@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1728089097; x=1759625097;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z/cGnU0h7A5g34BZ5yOesAIlXXGpSLzloiEL+u+PBEo=;
  b=TQa4yS+5gJCP8B2ruo6MV4FeVMpzMylGZRGqR3iX71jhYB5lZryw/dsj
   3IDf5Dx3o6H2mfry9O8Wf15v1gtkZpQVWVEvnOn/mr0lwZCQJiber2Kpc
   jk1KctyENqhPTf8zJpDBnX2XGJg79WSek2doFtK8sInaZMRDnvLcFA+2S
   k=;
X-IronPort-AV: E=Sophos;i="6.11,178,1725321600"; 
   d="scan'208";a="432724955"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:44:56 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:29293]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.223:2525] with esmtp (Farcaster)
 id a984d618-561e-4a93-b30b-0eeffbf9e7f2; Sat, 5 Oct 2024 00:44:55 +0000 (UTC)
X-Farcaster-Flow-ID: a984d618-561e-4a93-b30b-0eeffbf9e7f2
Received: from EX19D007UWB003.ant.amazon.com (10.13.138.28) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 5 Oct 2024 00:44:55 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19D007UWB003.ant.amazon.com (10.13.138.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 5 Oct 2024 00:44:55 +0000
Received: from email-imr-corp-prod-pdx-all-2b-a57195ef.us-west-2.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Sat, 5 Oct 2024 00:44:54 +0000
Received: from dev-dsk-yumx-2c-7f1f3a17.us-west-2.amazon.com (dev-dsk-yumx-2c-7f1f3a17.us-west-2.amazon.com [10.189.232.106])
	by email-imr-corp-prod-pdx-all-2b-a57195ef.us-west-2.amazon.com (Postfix) with ESMTP id 53925A062D;
	Sat,  5 Oct 2024 00:44:54 +0000 (UTC)
Received: by dev-dsk-yumx-2c-7f1f3a17.us-west-2.amazon.com (Postfix, from userid 22995351)
	id 4635D50D7; Sat,  5 Oct 2024 00:44:54 +0000 (UTC)
From: Max Yu <yumx@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Max Yu <yumx@amazon.com>, Przemyslaw Sobon <psobon@amazon.com>
Subject: [PATCH] sstate: remove corrupted artifacts from local mirror
Date: Sat, 5 Oct 2024 00:44:51 +0000
Message-ID: <20241005004451.79575-1-yumx@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Oct 2024 00:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205237

We observe sstate cache corruptions sometimes which cause rebuilds. That is not
a fatal error as the package has to be rebuilt and updated artifact needs to be
pushed to remote sstate cache mirror. Currently, Yocto does not handle
corruptions properly, where the corrupted artifact is not deleted or
renamed. Later, after the package is built the same corrupted artifact is pushed
to remote mirror and the same procedure is circled again and again.

This change verifies the outcome of the unpacking action and renames the
artifact if a fatal error occurred ("tar" tool returns error 2). In such case we
rename the artifact what causes that a proper one is created and uploaded
overwriting the exisiting one - the corrupted one - in the remote mirror. That
way we break the loop of uploading corrupted file again and again.

Suggested-by: Przemyslaw Sobon <psobon@amazon.com>
Signed-off-by: Max Yu <yumx@amazon.com>
---
 meta/classes-global/sstate.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 11bb892a42..5a7ce35341 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -937,7 +937,12 @@ sstate_unpack_package () {
 		ZSTD="pzstd -p ${ZSTD_THREADS}"
 	fi
 
-	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
+	if ! tar -I "$ZSTD" -xvpf ${SSTATE_PKG}; then
+		echo "Fatal error extracting sstate cache artifacts, file might be corrupted or truncated, renaming"
+		mv ${SSTATE_PKG} ${SSTATE_PKG}.unpack_error
+		exit 2
+	fi
+
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
 	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
-- 
2.40.1


