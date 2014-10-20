Return-Path: <jeffrey.honig@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38239601F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 18:31:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9KIVDT8022294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 11:31:13 -0700 (PDT)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 20 Oct 2014 11:31:12 -0700
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9KIVBjf008533	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384
	bits=256 verify=NOT)	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 14:31:11 -0400
Received: (from jch@localhost)	by schlepp.honig.net (8.14.4/8.14.4/Submit) id
	s9KIVB1U008532	for openembedded-core@lists.openembedded.org;
	Mon, 20 Oct 2014 14:31:11 -0400
From: <jeffrey.honig@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Oct 2014 14:30:59 -0400
Message-ID: <1413829859-8489-1-git-send-email-jeffrey.honig@windriver.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Subject: [PATCH] Refuse to run bitbake on a kernel that is too old.
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
X-List-Received-Date: Mon, 20 Oct 2014 18:31:17 -0000
Content-Type: text/plain

From: Jeffrey Honig <jeffrey.honig@windriver.com>

Fixes [YOCTO #6856]

Bitbake.conf now specifies OLDEST_KERNEL to insure that the SDK is not run
on a kernel that is not supported by a component of the SDK (i.e. glibc).  If this
is attempted an error will not be generated until deep into the SDK build.

This changes adds a specific test causing a failure whenever bitbake is run.

Signed-off-by: Jeffrey Honig <jeffrey.honig@windriver.com>
---
 meta/classes/sanity.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5be5efb..3725a0b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -675,6 +675,10 @@ def check_sanity_everybuild(status, d):
     if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
         status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
 
+    # Check that our kernel will work for crosssdk
+    if os.uname()[0] == "Linux" and LooseVersion(os.uname()[2]) < LooseVersion(d.getVar('OLDEST_KERNEL')):
+        status.addresult("The system requires a kernel of at least %s to run\n" % d.getVar('OLDEST_KERNEL'))
+
     sanity_check_conffiles(status, d)
 
     paths = d.getVar('PATH', True).split(":")
-- 
2.1.1


