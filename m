Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 961136BF66
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 15:20:41 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id m46so3784377wev.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 08:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SQI4S0XFfM+WSk417aR10bWYqjDm65MBl6m/vw5XOo4=;
	b=ZD5IP+hqlHd8mJVxAMDrN9eERtEulLBscaLd8L2rUpxTY7KKs+v6nkVr78Ce9ftsgc
	fsFgAj49Z0A9RKWsgYyq6a8lNXLYYLJNdNESX8t02YUGggCwhERBTszOyYIlRloIfnXZ
	2WWTKH2Tm4oDyo2ehaprWaAZj57OxCAv+cv0z+OyDu1bDSYSebCBKLi/3iBCPeXRRBUk
	GQEYEl29J/WpO2HwB8Kwc4E67yFDG8xWALjOKuZoUAlFa3E/Rmm7rZmHULaskBmVvFOP
	as8PFiMVQa2WA9EHBdwUuIprugGzr/Fivjk6BNrVuTRmVPVqE11eiZv0sbr2OhMDybEm
	D0PQ==
X-Gm-Message-State: ALoCoQlPoRbl8g37ONjcri1h+vjBDYmW9BNLmFm2Oz9c58pQ2w+JDwxh/ILLV2l/RVZ2S+7kFwkn
X-Received: by 10.194.78.78 with SMTP id z14mr6194812wjw.32.1378135241752;
	Mon, 02 Sep 2013 08:20:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id r6sm18524187wiw.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 08:20:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 16:20:37 +0100
Message-Id: <1378135237-5359-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] wipe-sysroot: fix removals
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
X-List-Received-Date: Mon, 02 Sep 2013 15:20:42 -0000

The previous changes were totally broken as quoting globs doesn't work.  Remove
the quotes so the rm commands actually delete the stamps.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index 2d2cbea..1c01166 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -34,11 +34,11 @@ if [ -z "$SSTATE_MANIFESTS" -o -z "$STAGING_DIR" -o -z "$STAMPS_DIR" ]; then
 fi
 
 # The sysroots themselves
-rm -rf "$STAGING_DIR"
+rm -rf $STAGING_DIR
 
 # The stamps that said the sysroot was populated
-rm -rf "$STAMPS_DIR/*/*/*.do_populate_sysroot.*"
-rm -rf "$STAMPS_DIR/*/*/*.do_populate_sysroot_setscene.*"
+rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot.*
+rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot_setscene.*
 
 # The sstate manifests
-rm -rf "$SSTATE_MANIFESTS/manifest-*.populate-sysroot"
+rm -rf $SSTATE_MANIFESTS/manifest-*.populate-sysroot
-- 
1.7.10.4


