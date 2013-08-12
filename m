Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 370AC61222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 10:42:12 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so3425928eek.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 03:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XxzPdsgKUVltk9TMs8WDyvGS9z34WWN4SnytGz5z9gA=;
	b=NdNOekqSd0UskolLjsDndm0KIrZpU2Pp3ndIbfCmDGj8JYJM4F86CiA2LTlRXia6aT
	mJmTDgGJ06e1X+urbyiH4QmBtWXA0LbJp7RDh2YzUdrESoIR9vnqGbSnJ27DNUe6gMo9
	rHUax3xfNx/Mh11zwfyCgvnBx7GJSeS4ogWV2x/eMORaFNnIoKX/Wz0ijlkdiBeBAa76
	KfJnDB0K2MFaorN6BXC5Nb6ZoB7DfkXOcda8qF36y1ibv0iGW60zwGRjSEDR5pjig0Xb
	0ZKnO2map7wxr3SbYCOL4TnVilowALJf7zb0Lngdbuv3aviQ/RR4M0ce9ersRSHHJiM9
	2lEQ==
X-Gm-Message-State: ALoCoQmvfBCLVLtZ+i/HLi79JtJLEQRd9izlYJ336deRQApvCsaysYiOS1FRE6CSyKqTjFPh9W2V
X-Received: by 10.15.24.129 with SMTP id j1mr25328976eeu.17.1376304132096;
	Mon, 12 Aug 2013 03:42:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a1sm56272047eem.1.2013.08.12.03.42.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 03:42:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2013 11:41:49 +0100
Message-Id: <1376304109-2925-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V4] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Mon, 12 Aug 2013 10:42:13 -0000

oe-setup-builddir substitutes ##COREBASE## which seems like it should have the
same value as the variable ${COREBASE}.  In reality it doesn't as ##COREBASE##
is substituted with the value of $OEROOT (the location of the oe-init-build-env
script), whereas ${COREBASE} is set by oe-core to the parent directory of meta/.
If oe-core's meta/ isn't a top-level directory then ##COREBASE## and ${COREBASE}
have different values, which can lead to confusion.

To resolve this, deprecate (but still substitute) ##COREBASE## and substitute
 ##OEROOT# for $OEROOT.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-setup-builddir |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d5d8d98..adb55c7 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -101,7 +101,10 @@ EOM
 
     # Put the abosolute path to the layers in bblayers.conf so we can run
     # bitbake without the init script after the first run
-    sed "s|##COREBASE##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    sed "s|##OEROOT##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
+    # to replace it for compatibility.
+    sed -i -e "s|##COREBASE##|$OEROOT|g" $BUILDDIR/conf/bblayers.conf
 fi
 
 # Prevent disturbing a new GIT clone in same console
-- 
1.7.10.4


