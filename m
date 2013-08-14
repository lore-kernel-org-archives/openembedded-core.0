Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1EA61220
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 14:13:48 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so4853999eek.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 07:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GyLDWxBTZ9D/XseHGK3l8cwWYFeB4HBmX7Wp2m1q1EM=;
	b=T3RLjcVrRkcZG8W8MO6hO7Kt74K7JaeGdAvfWYjBnG8i7y5EP7IL+xanwdgg9v6I5Y
	dTiCJTy0lKqUZ9PnxFNL1XY/D1ZthzjWEaBCuNbjai+wjIIgHUu1LZ7MAVx96mW/E/A7
	gKo43dGkDk6zMGqTuMkKpcC0ZV8T2VdL4Y7yRk6bJ8hfxTrQZZ3oTcOp/FpgPb2yT+ld
	mcuey9IPsdoc/vkDiCpDuma4EC3ZZuDT3S8MOcYvdxvTmBopNn6Ah/bHP363LGZ32hTL
	04/dico48srTv7aP0Wn7sTa7mGkBBlZiXw198gNd8IjzHTRBNgEMkAZOVVJSl7rKEOZZ
	K2Rg==
X-Gm-Message-State: ALoCoQl5OwKMtrQCuP723hoWq5DKaBz2neja5D7NiN6Lb5ZHGrbo+crcfq96cKLzgXFwyz3/9TBI
X-Received: by 10.15.102.72 with SMTP id bq48mr1218929eeb.85.1376489628663;
	Wed, 14 Aug 2013 07:13:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m54sm75475847eex.2.2013.08.14.07.13.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 07:13:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 15:13:44 +0100
Message-Id: <1376489624-30715-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] wipe-sysroots: don't assume TMPDIR is under BUILDDIR
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
X-List-Received-Date: Wed, 14 Aug 2013 14:13:48 -0000

The previous code used the environment variable BUILDDIR and assumed that TMPDIR
was a subdirectory. This often isn't the case, so instead ask bitbake where the
directories we're about to delete are.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot |   24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index e751a91..2d2cbea 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -18,17 +18,27 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-if [ -z "$BUILDDIR" ]; then
-    echo >&2 "Error: BUILDDIR is not defined, please initialise the build system."
-    return 1
+set -e
+
+ENVS=`mktemp --suffix -wipe-sysroot-envs`
+bitbake -p -e > $ENVS
+
+eval `grep -F SSTATE_MANIFESTS= $ENVS`
+eval `grep -F STAGING_DIR= $ENVS`
+eval `grep -F STAMPS_DIR= $ENVS`
+rm -f $ENVS
+
+if [ -z "$SSTATE_MANIFESTS" -o -z "$STAGING_DIR" -o -z "$STAMPS_DIR" ]; then
+    echo "Could not determine SSTATE_MANIFESTS/STAGING_DIR/STAMPS_DIR, check above for errors"
+    exit 1
 fi
 
 # The sysroots themselves
-rm -rf $BUILDDIR/tmp/sysroots/
+rm -rf "$STAGING_DIR"
 
 # The stamps that said the sysroot was populated
-rm -rf $BUILDDIR/tmp/stamps/*/*/*.do_populate_sysroot.*
-rm -rf $BUILDDIR/tmp/stamps/*/*/*.do_populate_sysroot_setscene.*
+rm -rf "$STAMPS_DIR/*/*/*.do_populate_sysroot.*"
+rm -rf "$STAMPS_DIR/*/*/*.do_populate_sysroot_setscene.*"
 
 # The sstate manifests
-rm -rf $BUILDDIR/tmp/sstate-control/manifest-*.populate-sysroot
+rm -rf "$SSTATE_MANIFESTS/manifest-*.populate-sysroot"
-- 
1.7.10.4


