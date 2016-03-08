Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3C18762135
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:27:37 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p65so145386644wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=y4cKY8AaK8VDHBR2LLJKoVRvMCWMlQYw1IXFayyjy5E=;
	b=hqjbUbhpGmTYUhc6R9AOdqt/LqNbGuL4kNoUELp7uFo8p0E83yrDKYlbluEVKeeyjK
	HNVNMJuzjSeQXZPUPlZ1pGYZvGuIAvE300/jwpvOf35iqV5MYzjiNoYa/8+wH0F/Bfmd
	DGVIxdDFKl5J0ZAJ7atLKh1kRSFrKodwjkjnen3qLZBqkDVGCPfCF7MDfFTp7GQAh44Y
	/ZpDhFzVAjA65vAf3WHgGPVEE6EsZ/S4zm1OsIYx1vB07OFO3ofkUG7QYpAe4Zc6pIQe
	AjQZXxaxKjf0MxPZAu7QxeJLed3bz6tEXVAj//kAId2kjZJ2GlgwS8XBh9jaCLQsaU4P
	jo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=y4cKY8AaK8VDHBR2LLJKoVRvMCWMlQYw1IXFayyjy5E=;
	b=SK13B+WP+q9rTfqCtkIWvTBBXa9y0CFTitcWTRtiMBgUd3CZPnvq5GXtDXeDOykzSH
	wVwtXPwHTVDR/eRO70skpBCmzbkW93jWKpAdzjHGgLbceyGJzQr0oF4lkcTfXsmQxpqc
	jes/ixZ+MBC6lTilu6gt+jshBqh/1O8ov1sKUimygMHmrmDRn3yrCMyDuPstWFdd48zD
	bRX/CEP7CBOHWNkkYFfw3wDYYfCAaphkY2GKBKHaBXfFE0KkKJBz622AXydbxfRzodaB
	EtWHAm4QBqCsZ6WuPg6w844DQbEyIKYTBhVXxbTByK7cyQHrwQ4+HkCI8F7fmqwH2a6M
	sXGA==
X-Gm-Message-State: AD7BkJJw5LWi1mqv1rLmt7tqEPZz1CGphXcv3q7vBeby8V0oMuxQ/SXXLsL/girpUVlTsoOY
X-Received: by 10.194.78.37 with SMTP id y5mr27975072wjw.78.1457436458204;
	Tue, 08 Mar 2016 03:27:38 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id hq2sm2511604wjb.3.2016.03.08.03.27.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Mar 2016 03:27:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 11:27:35 +0000
Message-Id: <1457436455-20396-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] xmlto: tell xmlto where cp is
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
X-List-Received-Date: Tue, 08 Mar 2016 11:27:39 -0000

xmlto looks for a cp binary, and on e.g. Fedora 23 will find it at /usr/bin/cp
but most other distros have it at /bin/cp.  This causing problems with sharing
sstate between distributions, but as /bin is a symlink on F23 we can safely
force the path to /bin/cp.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 54438ef..71f873f 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -27,7 +27,7 @@ RDEPENDS_${PN}_append_class-target = " \
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF_append = " BASH=/bin/bash XMLLINT=xmllint XSLTPROC=xsltproc"
+EXTRA_OECONF_append = " BASH=/bin/bash GCP=/bin/cp XMLLINT=xmllint XSLTPROC=xsltproc"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/xml/
-- 
2.7.0


