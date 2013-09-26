Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1358761105
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:41:40 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so948475wes.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 03:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QHoR92GqkRK8e1CSsWgz1l9GKU2PpqTpDoIiQvf6CWs=;
	b=ZMSk5GU9U7AHRWbaFUAaYyGDmFjIuDHTI5kR4+9+fD3op5xKAw3z2LTquVSCYmDg3S
	qJVsFV9S9WTtKRycqeGaDjHTc8lV7pVGBbdNC18+mmarRKIAyaEUWGfOKoPlbPxqb/vt
	4K6a55Inrct9n5LtXcdUPDyytv2a+yXfXIoiho3tmz+I6oIXb29yxdr7aixOWpJy/8oZ
	wfgM0cQ1eT7ajPkx6Y7ufnLAAwnNhD/x3IsXq8IhqSmfO1v02ApQMrQe8bn188/otUOQ
	UyU+utRsGVuMOL20ZI8HtZUtLfDf+ln+g3wfkEJ889vUvSSDnm3O7NSsYeNf+Uw4UtuB
	YXRQ==
X-Gm-Message-State: ALoCoQmJCaJI2ceOvRFl+i+CL9pjWmzh6mzE5XO1r/lgI5mKvIco/Q8Twi4PGCV6XhJruStiHUpx
X-Received: by 10.180.91.16 with SMTP id ca16mr104418wib.57.1380192101976;
	Thu, 26 Sep 2013 03:41:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id i8sm2167817wiy.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 03:41:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 11:41:35 +0100
Message-Id: <1380192096-19856-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] pseudo: use bbnote/bbwarn instead of echo
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
X-List-Received-Date: Thu, 26 Sep 2013 10:41:43 -0000

In the future bbnote/bbwarn will be integrated into bitbake's logging, so use
those functions instead of echo directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index a4b7aaf..a287629 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -56,15 +56,15 @@ maybe_make32() {
 	fi
 	if $make32; then
 		if ! [ -e "/usr/include/gnu/stubs-32.h" ]; then
-			echo >&2 "WARNING: Can't find stubs-32.h, but usually need it to build 32-bit libpseudo."
-			echo >&2 "If the build fails, install 32-bit developer packages."
-			echo >&2 "If you are using 32-bit binaries, the 32-bit libpseudo is NOT optional."
+			bbwarn "Can't find stubs-32.h, but usually need it to build 32-bit libpseudo."
+			bbwarn "If the build fails, install 32-bit developer packages."
+			bbwarn "If you are using 32-bit binaries, the 32-bit libpseudo is NOT optional."
 		else
-			echo "Attempting to build 32-bit libpseudo.so for ${PN}."
+			bbnote "Attempting to build 32-bit libpseudo.so for ${PN}."
 		fi
 	else
-		echo "Building/installing only 64-bit libpseudo.so for ${PN}."
-		echo "If you need to run 32-bit executables, ensure that NO32LIBS is set to 0."
+		bbnote "Building/installing only 64-bit libpseudo.so for ${PN}."
+		bbnote "If you need to run 32-bit executables, ensure that NO32LIBS is set to 0."
 	fi
 }
 
-- 
1.7.10.4


