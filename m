Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C99FC7199E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 10:08:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y5so620235wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 03:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8g2kkEVKitUTN3lkfDFpJXIPXopGN2nNXfnFyDKPJu8=;
	b=qLGEQd2mi8Ypy7bIfmnkPt/O4S0gOHTXuXufPi8LQNj0zUCVvZltf9EFrCzbA6zOY0
	EoivWUwmQNFcGiZ8ILDci14nvTLUv7xyCCo2VSJVhh5uP/j/l8JHYr9gv6ribkwNIRiB
	dZ1OQM1X80z/7SFesgyLfcRQ7fVRFdprtsLLFf3KnYmNA+xHFCjKZ9I0EE10HGLqA/G+
	4l6pRaDOmTSISv9zNd1g6PlJt8ui87ZHmmeXfB5Rt7pOrgrQin8iTZOuDfX5p20Jntpa
	4lpa2YH2qQf1zHGaEeF+aUI51Vn/uqGvrjWbMtafWzUUbKnfW80+TRD2XOrpCsI2VAqf
	vRAQ==
X-Gm-Message-State: AKS2vOwPKrrXtxkTVpZK/uXNuWFEKLjNBM3TQ1tbndF5SRvonAgSrp4i
	nyVgKlX1FtE64o3Ya7s=
X-Received: by 10.28.156.17 with SMTP id f17mr12481950wme.17.1498471728034;
	Mon, 26 Jun 2017 03:08:48 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n31sm14295840wrn.59.2017.06.26.03.08.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 03:08:47 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 11:08:45 +0100
Message-Id: <20170626100846.3950-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170619103238.2626-1-git@andred.net>
References: <20170619103238.2626-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 1/2] [RFC] base.bbclass: extend PACKAGECONFIG to also allow RRECOMMENDS
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
X-List-Received-Date: Mon, 26 Jun 2017 10:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

It can be useful to add RRECOMMENDS to packages created, based
on certain PACKAGECONFIGs.

In particular where a package depends on certain linux kernel
infrastructure (kernel modules) which might or might not be
built as a module, being able to RRECOMMENDS instead of
RDEPENDS on the relevant packages avoids build failures in
case those modules are built statically into the kernel, i.e.
in case no package is being created for them.

Add another field to the PACKAGECONFIG syntax to achieve just
that.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/base.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 78926656d7..3762c8addc 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -384,7 +384,7 @@ python () {
     # These take the form:
     #
     # PACKAGECONFIG ??= "<default options>"
-    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
+    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends,foo_runtime_recommends"
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
         pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
@@ -426,12 +426,13 @@ python () {
 
         extradeps = []
         extrardeps = []
+        extrarrecs = []
         extraconf = []
         for flag, flagval in sorted(pkgconfigflags.items()):
             items = flagval.split(",")
             num = len(items)
-            if num > 4:
-                bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depend,rdepend can be specified!"
+            if num > 5:
+                bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depend,rdepend,rrecommend can be specified!"
                     % (d.getVar('PN'), flag))
 
             if flag in pkgconfig:
@@ -439,12 +440,15 @@ python () {
                     extradeps.append(items[2])
                 if num >= 4 and items[3]:
                     extrardeps.append(items[3])
+                if num >= 5 and items[4]:
+                    extrarrecs.append(items[4])
                 if num >= 1 and items[0]:
                     extraconf.append(items[0])
             elif num >= 2 and items[1]:
                     extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
+        appendVar('RRECOMMENDS_${PN}', extrarrecs)
         appendVar('PACKAGECONFIG_CONFARGS', extraconf)
 
     pn = d.getVar('PN')
-- 
2.11.0


