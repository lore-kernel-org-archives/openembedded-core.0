Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59A5CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 15:42:43 +0000 (UTC)
Received: from smarthost01b.ixn.mail.zen.net.uk (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69.1762184559917636755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 07:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=RpX3qOud;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.21, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1vFwhZ-007y19-F3
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Nov 2025 15:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=n8sy3iGi/k+36wHTUum3yb98p1ITyGXSMFIWgAEjshs=; b=Rp
	X3qOudd8hTKhHbiQNL3KiFxBBURD6VDyIzrc1fweO+JiSRPeOfJ+ubTC6ERe4JW6Ftq07WWu/KZ7b
	cRVc482Tx68tC186AKJUuUBkR+ZEpBFuvk/3i9CLxDIcZG1n0LEHO7IExL1vJF4VwgRE0M2lQzyHn
	JcuE27RC5oeIQE3jmon5dfsRIsRsmSW9AGOrMIaH2NoQ5NED7qWSCyCNgetE6hRFsaMvRgJmfeHl9
	+UrX6mGIXVu677d18iEWdPLBqF2pZXNRtz9V20jiRffZUonWdfXDscpd1/ImhnGYSj1YcrMgKET8R
	jowNenz2bYlr3X4ZhdI/HPEwNzvsNsTw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1vFwhY-002B4s-2Q;
	Mon, 03 Nov 2025 15:42:36 +0000
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] sanity: Emit the error message if CONNECTIVITY_CHECK_MSG is set
Date: Mon,  3 Nov 2025 15:42:34 +0000
Message-Id: <20251103154234.3072747-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01b-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 15:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225665

From: Mike Crowe <mac@mcrowe.com>

Users may still be interested in the actual error message even if there
is a custom message for failure of the connectivity check since the
cause may be intermittent.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes-global/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 6934e071a3..c89ff2c51f 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -368,6 +368,8 @@ def check_connectivity(d):
                 msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
                 msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
                 msg += "    access if all required sources are on local disk.\n"
+            else:
+                msg = "%s.\n%s" % (err, msg)
             retval = msg
 
     return retval
-- 
2.39.5


