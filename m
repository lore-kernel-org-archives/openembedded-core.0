Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 58DB3724CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 15:08:19 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so10429672wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 07:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k8NQt1j9szBOAcRfbAU1+KFvlLUMw0AmnWKvha5WGnE=;
	b=JuCjz0VFMBp/HawHfM5pvCuVyFJ59sYre/+zmJFty1fRWfBATBzXPPGpvuBlkZ5UIa
	JzSMwM0LdlzF3ojOLejXMaVY9jEDcFHdw/oBdKcccdq1dch5dDVdnTYP/ckuydHmFo16
	b7GKYatPS/P0FdWcquXk9cfxgznkNNC3X2kui28lYiF8xRIdgw7gc9MghKbdh6OSylLy
	IlpYlKqDa3fvc0t8T8Cv3bxnxwvikYHdkALr9Oyioi8mgiOSGL+gw8c+foE9uSGcQEIW
	f2ZWdRrXbzB54sXdWiE3mAIW0RPSlrLpkNgrrniCfTWteKrShNB1ToftY8vWs3v6+Oto
	gjrA==
X-Gm-Message-State: ALoCoQnxEFB2iguDel+iGv9kNPTP3kGPm79tpTfgBSIY8HAIw689yOX4fbXV3CV+KvdXgFpjxaPK
X-Received: by 10.194.235.193 with SMTP id uo1mr5538838wjc.105.1418137698894; 
	Tue, 09 Dec 2014 07:08:18 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	iz19sm14182871wic.8.2014.12.09.07.08.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 07:08:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 15:07:38 +0000
Message-Id: <1418137658-22934-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] python-pycurl: build docstrings to fix rebuilds
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
X-List-Received-Date: Tue, 09 Dec 2014 15:08:26 -0000

On a rebuild base.bbclass will invoke "make clean" to ensure that old build
objects are not used. This will delete docstrings.c and the only way to
re-generate that is with a dedicated setup.py target.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-pycurl_7.19.5.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.5.bb b/meta/recipes-devtools/python/python-pycurl_7.19.5.bb
index a21a426..e4619c7 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.5.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.5.bb
@@ -29,6 +29,11 @@ export STAGING_LIBDIR
 
 BBCLASSEXTEND = "native"
 
+# Ensure the docstrings are generated as make clean will remove them
+do_compile_prepend() {
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py docstrings
+}
+
 do_install_append() {
 	rm -rf ${D}${datadir}/share
 }
-- 
1.7.10.4


