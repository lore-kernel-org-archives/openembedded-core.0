Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id A4FEF72E7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:42 +0000 (UTC)
Received: by pdiy13 with SMTP id y13so8565508pdi.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LuGOQAFiDha6PLStjz1/5Rk8d++ckNjoveGDpv0yO8E=;
	b=MlZhIy8LLQoaOuWwDJN/NDr4C4QQoTMV+kzPR8+UZOUGoiLEnK9tQ+nVuAc+vPLJam
	zRTGFuvp40daGDefIxYWbwO5Hsq+r3DvCBKWQP4nNMZuEl6LMlaEeUeDXFZ+jd5qJQZp
	xWZaEyNNKadFjHhyTdg17nNBjwRimJfPEojnRym42F8vK5eh8qBYA6raPpusCatlRy5v
	ARNj1vUjXvfFrExlO9UYny2WWR+iBPzWbKGCvUxE30lAaVNFXSybJSu7xQfFF2kuHTCw
	PJOatVLBmKsaIWMi7tukbvTtUeq6e6VY0N1KMgtG69cW7KnzVIa9Ka1owt2OsawwSJYq
	0I4w==
X-Received: by 10.66.184.144 with SMTP id eu16mr5882220pac.18.1423152344244;
	Thu, 05 Feb 2015 08:05:44 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:53 -0800
Message-Id: <e8cda455722f87fffa3101597c8c15f704f94adb.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 45/61] package.bbclass: Let PR server update PKGV, not PV
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:43 -0000

From: Mike Looijmans <mike.looijmans@topic.nl>

PV is the package version as we need it to be during the build. PKGV is the
final version as it ends up in the package, and defaults to PV.

The packager handled builds without PR-server by replacing the AUTOINC string
in PKGV, but when the PR-server is being used, the script replaces the contents
of PKGV with the PV if the PV contains "AUTOINC". Thus the packager overrides
any change to PKGV the recipe might have made.
This breaks classes like gitpkgv that provide a correctly numbered PKGV, the
number as calculated by that class will simply be replaced with a 0-based index
from the PR-server.

This patch makes the packager look at the PKGV version instead of the PV, and
update the PKGV only based on the PKGV contents as set by the recipe.

See also the discussion here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100329.html

From investigating the history of the code and changes in the past year, the
use of "pv" instead of "pkgv" appears to be just an oversight, introduced in:
commit b27b438221e16ac3df6ac66d761b77e3bd43db67 "prs: use the PRServer to replace the BB_URI_LOCALCOUNT functionality"
A later commit 865d001de168915a5796e5c760f96bdd04cebd61 "package/prserv: Merge two similar functions into one"
silently fixed this only for the case without PR-server by using pkgv there.

(From OE-Core rev: 7895c0a67d381ff66668fca5207bd196f36c91db)

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 320ec0e..4cddbef 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -403,9 +403,10 @@ python package_get_auto_pr() {
     if not (host is None):
         d.setVar("PRSERV_HOST", host)
 
+    pkgv = d.getVar("PKGV", True)
+
     # PR Server not active, handle AUTOINC
     if not d.getVar('PRSERV_HOST', True):
-        pkgv = d.getVar("PKGV", True)
         if 'AUTOINC' in pkgv:
             d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
         return
@@ -428,11 +429,11 @@ python package_get_auto_pr() {
         if conn is None:
             conn = oe.prservice.prserv_make_conn(d)
         if conn is not None:
-            if "AUTOINC" in pv:
+            if "AUTOINC" in pkgv:
                 srcpv = bb.fetch2.get_srcrev(d)
                 base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
                 value = conn.getPR(base_ver, pkgarch, srcpv)
-                d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
+                d.setVar("PKGV", pkgv.replace("AUTOINC", str(value)))
 
             auto_pr = conn.getPR(version, pkgarch, checksum)
     except Exception as e:
-- 
1.9.1


