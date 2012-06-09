Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOw9-00044V-V5
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:54 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3570867pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iCFV7uFkiUXiRiCM6daEj5hSIT2cN6Iee5M1eoo6n/8=;
	b=myRG1zRXsXAzZNgax+DCHFnUd1oio0cWSGbI2P3VxE3i3MxzG/+uRzZSOMiD21/k59
	SHkMHLP4YP4CoJZuHitUHZA8bYt0lA8wI4mL7uJU+UQ6cjDBYLFinfIxx2Uqa/OqlcjV
	C4QOBtn6JaDtx6g0wxd/TPhTmBS50cI2YoDXa5WxerhO3fTko/kE3vk0hyDqHlPMwba8
	N3PkfIzblOaKiOjT2t32sxc0D7hWsTTI2bEpml4ewWiJfaq++2g+nIg0j97AnZjSJVOq
	eRx/uKV3qRcvIUxVLPKUn95w8Fi8YY1YsvgH7LGU5VWi1sor/+MpxhxJJUZFAaDhuNCw
	v0KA==
Received: by 10.68.204.129 with SMTP id ky1mr8011654pbc.32.1339260264700;
	Sat, 09 Jun 2012 09:44:24 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:06 -0700
Message-Id: <c351a227ec2db0171fc482b62614ccca90e5058b.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 08/16] augeas: Fix compilation failure
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
X-List-Received-Date: Sat, 09 Jun 2012 16:54:54 -0000

on uclibc we see this failure
too few arguments to function 'escape'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/augeas/augeas.inc            |    4 ++-
 .../0001-Add-missing-argument-to-escape.patch      |   29 ++++++++++++++++++++
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |    2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 9fe864d..479fb97 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -5,7 +5,9 @@ BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 
-SRC_URI = "http://augeas.net/download/${BP}.tar.gz"
+SRC_URI = "http://augeas.net/download/${BP}.tar.gz \
+           file://0001-Add-missing-argument-to-escape.patch \
+          "
 
 DEPENDS = "readline libxml2"
 
diff --git a/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch b/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
new file mode 100644
index 0000000..3d0d0e3
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 021ea39f8e400225e2d01b4c62eb9d56404f2ecd Mon Sep 17 00:00:00 2001
+From: Michael Chapman <mike@very.puzzling.org>
+Date: Fri, 16 Dec 2011 21:30:07 +1100
+Subject: [PATCH] Add missing argument to escape()
+
+Fixes ticket #242.
+---
+ src/regexp.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/regexp.c b/src/regexp.c
+index cf0ea5d..811087d 100644
+--- a/src/regexp.c
++++ b/src/regexp.c
+@@ -50,7 +50,7 @@ char *regexp_escape(const struct regexp *r) {
+     ret = fa_restrict_alphabet(r->pattern->str, strlen(r->pattern->str),
+                                &nre, &nre_len, 2, 1);
+     if (ret == 0) {
+-        pat = escape(nre, nre_len);
++        pat = escape(nre, nre_len, RX_ESCAPES);
+         free(nre);
+     }
+ #endif
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-extended/augeas/augeas_0.10.0.bb b/meta/recipes-extended/augeas/augeas_0.10.0.bb
index 00921aa..1a08707 100644
--- a/meta/recipes-extended/augeas/augeas_0.10.0.bb
+++ b/meta/recipes-extended/augeas/augeas_0.10.0.bb
@@ -1,6 +1,6 @@
 require augeas.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "fe1834e90a066c3208ac0214622c7352"
 SRC_URI[sha256sum] = "ec111af06186216930176ebe5ecccdf7bf528528aee9acde1d5d70088484afca"
-- 
1.7.5.4



