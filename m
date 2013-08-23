Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9D51C6B66A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:38:57 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so937435pab.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8JIXsSf/M58ZHaLdH5TpNdZgLDDOMM+ELiG40bAwPGw=;
	b=WhoF6DxMx+njz34l2bVM4Q9g00nRS0gOmiyqlrJ63/gNPC1cd/Ruv1Ahnc6hs+rREi
	RsNUzILqIi5bctkI+484SJLh4QpjYATArNEMcpV64wbTQCe61zJTs9B44QeGwTesHkbu
	FfC4RMHe2UfkW87To471OZ48T83jp7EUp0/vpujB7bXhPdrzzNdgXfdigZIf6cT9JibQ
	uYBlDJaSsN6kVWG1xsnainiA+6RMHcLVGGuBKB06AmgFYJpxXmBLDLfMmbuvgaF5lrQt
	38yYCWiFCWlaItAEToDdYQIWag6hUIg9u6fimwm8btxF7gXx15XLJtyvLRznuhb3UXhp
	9k9A==
X-Received: by 10.68.228.102 with SMTP id sh6mr818369pbc.138.1377279538430;
	Fri, 23 Aug 2013 10:38:58 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id pu5sm2322877pac.21.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:38:57 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:38:57 -0700
Message-Id: <98ac87e184055ce6e94ffb42ab373509bab891d2.1377279474.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1377279474.git.chris_larson@mentor.com>
References: <cover.1377279474.git.chris_larson@mentor.com>
In-Reply-To: <cover.1377279474.git.chris_larson@mentor.com>
References: <cover.1377279474.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/2] nativesdk-ca-certificates: prepopulate ca-certificates.crt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 17:38:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

As postinsts aren't run for nativesdk packages when populating an SDK, we need
to prepopulate up-front.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
index 053fbbe..0ed238b 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
@@ -60,4 +60,10 @@ pkg_postinst_${PN} () {
 
 CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
 
+# Postinsts don't seem to be run for nativesdk packages when populating SDKs.
+CONFFILES_${PN}_append_class-nativesdk = " ${sysconfdir}/ssl/certs/ca-certificates.crt"
+do_install_append_class-nativesdk () {
+    SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
+}
+
 BBCLASSEXTEND += "native nativesdk"
-- 
1.8.3.4


