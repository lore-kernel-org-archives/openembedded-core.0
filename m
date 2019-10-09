Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D75837F4CC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 14:44:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h4so3362971wrv.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9rt3SRBzwUoGFsQcTtocgmrHLjDZOLV55SjkPATGSRg=;
	b=b7cdP7nKUSk5f1hzoHq9ziYeINonwJwJfthNY4rstrQsFwmgFMVPcsasRCnoOxas+0
	pCbF8+AFlgrRV2TUk9JnJsotYofXrhviWSoyxjx2WJ3iXlMFyWg6xVA9EDgx+qBVLunq
	YPDdn4HhEq3Ly6bO0TaOyK59CIXIwYxjtCCUjwzhhpgVnTiWH5f87eLNqdLp8RM+sgHn
	Z5nzCsFihqhP62PP7DXCUsz9jzsj7z7pmWRBamQShsNiUDDtukl8ss/FjWv4owF7ZB1f
	3L8iMpi+2Lfp6yVfinaovk/mSPApVLHp291AEPbVGe6KPUuzgABoOnifEzZb9uPsgV3b
	TfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9rt3SRBzwUoGFsQcTtocgmrHLjDZOLV55SjkPATGSRg=;
	b=p2yhvBR8sxig4JPLSQ4Xq33ojJK8Z4WiBP8Z7bjbmaiI1FDBxXvGte9AUrMSbv2shY
	hCpI3j5O1YwYTOxdp6BldI7ah4GKEHt0ztFRo1osPpw1fA5siaqCxWdiAWHxCckXs/uG
	YLGnqBQig7JzKsEW3OwfMg8fiWvGGK/qsNdXLaHGa8ZEJ+0Xag65wKsnYvlznSTDbkSY
	MuRoLNAEpfrAE3Oey+dljgZilOL1D0pqzcDxvW9YcBq3eyDLDoTRiqwse4/3gOq4WxFj
	/s6r0nQtUas0c42Xb9FkBFjZvNBNXTB5a5pBWZdceFYnN4BTWeYjMtIk9bjABxCur6zW
	gP5w==
X-Gm-Message-State: APjAAAWpPiwgdrUHxjztgRK72OItXrmv6DgLBOlEvu2vTC09vptpBkWG
	/1HUnnQm6g3156JyfVI2HwDwL+69
X-Google-Smtp-Source: APXvYqxdWEUQeWadPqY+9A34DuC8aqehwz3RQY8n1dJNKzAfjPQVx4xcLyk8FCO5Pn/SNUv+cNjqGQ==
X-Received: by 2002:adf:aacc:: with SMTP id i12mr3253572wrc.15.1570632298501; 
	Wed, 09 Oct 2019 07:44:58 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	n22sm1789883wmk.19.2019.10.09.07.44.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 07:44:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 16:44:46 +0200
Message-Id: <20191009144447.86018-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [RFC PATCH 1/2] license.bbclass: split incompatible license check into a helper function
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
X-List-Received-Date: Wed, 09 Oct 2019 14:44:59 -0000

This would help with checking incompatible licenses at do_rootfs step
in image creation, where it is beneficial to pass the license string
directly to the function.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/license.bbclass | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index adca881c85b..648a4d78922 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -287,17 +287,7 @@ def incompatible_license_contains(license, truevalue, falsevalue, d):
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
     return truevalue if license in bad_licenses else falsevalue
 
-def incompatible_license(d, dont_want_licenses, package=None):
-    """
-    This function checks if a recipe has only incompatible licenses. It also
-    take into consideration 'or' operand.  dont_want_licenses should be passed
-    as canonical (SPDX) names.
-    """
-    import oe.license
-    license = d.getVar("LICENSE_%s" % package) if package else None
-    if not license:
-        license = d.getVar('LICENSE')
-
+def incompatible_pkg_license(d, dont_want_licenses, license):
     # Handles an "or" or two license sets provided by
     # flattened_licenses(), pick one that works if possible.
     def choose_lic_set(a, b):
@@ -311,6 +301,19 @@ def incompatible_license(d, dont_want_licenses, package=None):
     return any(not oe.license.license_ok(canonical_license(d, l), \
                dont_want_licenses) for l in licenses)
 
+def incompatible_license(d, dont_want_licenses, package=None):
+    """
+    This function checks if a recipe has only incompatible licenses. It also
+    take into consideration 'or' operand.  dont_want_licenses should be passed
+    as canonical (SPDX) names.
+    """
+    import oe.license
+    license = d.getVar("LICENSE_%s" % package) if package else None
+    if not license:
+        license = d.getVar('LICENSE')
+
+    return incompatible_pkg_license(d, dont_want_licenses, license)
+
 def check_license_flags(d):
     """
     This function checks if a recipe has any LICENSE_FLAGS that
-- 
2.17.1


