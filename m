Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35D3E6A39B;
	Wed, 29 May 2013 13:45:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TDjLNo012622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2013 06:45:21 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 06:45:19 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 08:51:36 -0500
Message-ID: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 29 May 2013 13:45:22 -0000
Content-Type: text/plain

Background:

At the recent TSC meeting we were discussing ways of removing the PRINC
in favor of the PR server, which should now be standard.  The first step
in this process is coming up with a simple patch that declared PRINC as
deprecated.  If this type of patch is successful, the block of code could
be replaced with a bb.error eventually.

It is not expected that this patch will go in by itself, but instead
should be coordinated with changes to the recipes in common layers such
as openembedded-core, meta-openembedded/meta-* and other community layers.

The commit message follows:

The PRINC logic is now deprecated, the PR server should be used to handle
the automatic incrementing of the PR (package release) field.

A warning message has been added when princ is defined as anything but '0'.

The default setting of '0' has been retained as some layers use embedded
python to increment the PRINC filed.  This fails if the base PRINC is not
defined.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b1642a2..29084a2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -465,8 +465,12 @@ python () {
             appendVar('EXTRA_OECONF', extraconf)
 
     # If PRINC is set, try and increase the PR value by the amount specified
+    # The PR server is now the preferred way to handle PR changes based on
+    # the checksum of the recipe (including bbappend).  The PRINC is now
+    # obsolete.  Return a warning to the user.
     princ = d.getVar('PRINC', True)
     if princ and princ != "0":
+        bb.warn("Use of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service"
         pr = d.getVar('PR', True)
         pr_prefix = re.search("\D+",pr)
         prval = re.search("\d+",pr)
-- 
1.8.1.2.545.g2f19ada


