Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 296F5608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 15:11:38 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so1497303ead.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 08:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mg/xZJnoAZIhdNrfkKLs0jeFl2kTjxubepresG6+tZk=;
	b=arC7Q8BPlVX2CnDnn/2k9bfYn0GEu4Mo/g+ROAhnqPSe452OylOy7AJrCPJEV9nR6F
	9uFsh+tWRVES/y0ivs8FXNpXlF6P3TnnckKwNtspustZVdGlsKTeKyW2L0VupYhn93X9
	vtZ5LNeemiPFh7KN2dG1t/xatgwxelYZ/+6e98AEb5gXy2E28x6sLu+F8ouxQC4b6qsf
	wnmCxU/yUWzmVXbR/2ShDqehp0NMnm/JgQdD1Dki9yF5YmQrZ2E+3fqxsiqtKp1EwpWs
	N1SrOtnmGGov1oJU2Lg8PGe1Ca3k8Tg/1x6RKZR0ZDFJov/90knG6gJTAFcJUGvJuYWo
	DeSg==
X-Gm-Message-State: ALoCoQnW9rTDnq40Bydat6O7NyPl5XVooDP3PDEZhmFO+2xLNgasDf2/kja5Dl9W5DWdVuoLd72c
X-Received: by 10.14.205.72 with SMTP id i48mr8691899eeo.139.1375974697737;
	Thu, 08 Aug 2013 08:11:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k7sm19909188eeg.13.2013.08.08.08.11.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 08:11:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 16:11:33 +0100
Message-Id: <1375974693-13703-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] wipe-sysroots: don't assume TMPDIR is under BUILDDIR
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
X-List-Received-Date: Thu, 08 Aug 2013 15:11:38 -0000

The previous code used the environment variable BUILDDIR and assumed that TMPDIR
was a subdirectory. This often isn't the case, so instead ask bitbake where the
directories we're about to delete are.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot |   22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index e751a91..4412202 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -18,17 +18,27 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-if [ -z "$BUILDDIR" ]; then
-    echo >&2 "Error: BUILDDIR is not defined, please initialise the build system."
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
+    echo "Could not determine BUILDDIR/STAGING_DIR/SSTATE_MANIFESTS, check above for errors"
     return 1
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


