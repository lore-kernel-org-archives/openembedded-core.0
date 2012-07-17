Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrAdR-0001mT-4b
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:28:30 +0200
Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 09:16:40 -0700
Received: by wgbfm10 with SMTP id fm10so3412279wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ywx63zk+cxTpMtIbidL832ceb6dY0pRAK57SQkOmtps=;
	b=MrbwjDIoODy/4gELv+46LPxY8Z6Ie/24EZzspaiAJQgEpHFcCzlKQxDFBdUqR42pzo
	jOaTAldQ8a84fdnP09QNwMni0wmnjK78StjNexnKVzQTHjd9KMDJeOmR/wnOCt+OcFtD
	Bed4Rd7/VWZhmwAGzQ0zcOrrT/c0/yU+T/0A//NGL52m3ACTTNxRS2UbFGJ6dkr7qFLe
	xsFPFag5nkFcLHUfdVZXo9E25P8iTG2racV0VVr4uaYh5/zhmfR88T0ET9z58M68yib2
	EwD3psg3+2wOaX4BkGKaQ4BQbJf3EvBRxnwAZWSDt0hASTmKgdS4aMsxocYyugisAfNp
	3gcA==
Received: by 10.180.97.33 with SMTP id dx1mr5468575wib.18.1342541799089;
	Tue, 17 Jul 2012 09:16:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm27689423wiw.9.2012.07.17.09.16.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:16:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 17:16:19 +0100
Message-Id: <1342541781-26628-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342541781-26628-1-git-send-email-ross.burton@intel.com>
References: <1342541781-26628-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmxQ5BITtNTDSECHyrV4wd98ybZqHvQqHb8eq9T6KV80NrpTvvD3cYosqDCDMR6nxfPzhqh
Subject: [PATCH 1/2] connman: fix build with automake 1.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 16:28:30 -0000

Automake was not installing /usr/lib/connman/plugins, but we need that installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 58cac0b..72d22b6 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -72,6 +72,10 @@ do_install_append() {
 
 	# We don't need to package an empty directory
 	rmdir ${D}${libdir}/connman/scripts
+
+	# Automake 1.12 won't install empty directories, but we need the
+	# plugins directory to be present for ownership
+	mkdir -p ${D}${libdir}/connman/plugins
 }
 
 # These used to be plugins, but now they are core
-- 
1.7.10



