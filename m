Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9FFE66A961
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 10:27:43 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p60so5102698wes.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 03:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7spEp3Fh8PuJ6GeduBkpAQLa5HTqgjNIFM3o4snkhdI=;
	b=KV6ensVSe/5I/MHeCE+YjrR5NmbWCwItBm+/xeDp4TbkC+NmTB3CsDBdwxKHQs8oCN
	alt2RREMUEdZHnio2L2iaSzsQiX+K1VCtj5DFWQxxaJze40DwGaA7gROwmqmOVBqH4qc
	F9dGhYyJ9Wxz7Exwvd8N5ZeZlHUP+Q8KJ5SNW/VXL2zhjvZsmGIaN2NbkHW5p/pe1EBc
	Y0zdPqL8XDtUe72SZPqfV9nabNg45fqcAsVQFFdLtXzPXLF4S3LedfTfowR5ZuZU4bBL
	YYkvNl9JimVwOR/1bdySD21IKHsA/PIGYEyf3BhVDfcms+Uh6uUboH8vKu9ueEYJHt4k
	acOw==
X-Received: by 10.180.74.10 with SMTP id p10mr3992377wiv.39.1371032863076;
	Wed, 12 Jun 2013 03:27:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cw8sm2395082wib.7.2013.06.12.03.27.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 03:27:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 11:24:20 +0100
Message-Id: <1371032660-1076-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlrEoRFxZH23GjykSXRTzikt+vNa02Skqki2HUxL1Mz3PPLpYMlJMGBMdYG4SuQcO+yqHvE
Subject: [PATCH] runqemu: when tunctl can't be found, say what package builds it
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
X-List-Received-Date: Wed, 12 Jun 2013 10:27:44 -0000

If runqemu is used without actually building any qemu images (i.e. you
downloaded the images) it's likely that qemu-helper-native hasn't been built.
Instead of just saying what command can't be found, tell the user how to solve
their problem.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/runqemu-ifdown |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index 710d297..8b8c5a4 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -45,7 +45,7 @@ NATIVE_SYSROOT_DIR=$2
 
 TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
 if [ ! -e "$TUNCTL" ]; then
-	echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DIR/usr/bin'"
+	echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DIR/usr/bin', please bitbake qemu-helper-native"
 	exit 1
 fi
 
-- 
1.7.10.4


