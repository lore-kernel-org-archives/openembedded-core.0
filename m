Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 511227CFAE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 13:52:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h4so12135123wre.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zfJpvI3cg8a9ITbOSUhtSB+pPaIhq+63Tb4p/p+6pow=;
	b=gVMUgntiha10WOmhe5wDe82ZpMoyBGlijyBgOvWEDrFbaiIphX4aZQD2gXkeaFvabG
	Yczqwyunv9IcopGibNcvGaoe4wWJAw0GfjC0MuxGezyV0rC7oXH5poQxxXfcTtYboR30
	HRjYXVFdVEZnZ3GO1VLaqd02UHmzIsjeswBQ3LLEpXV5ShQUy4FJMyUP8zzm0W/B8D6s
	cHzvSbsbDKA9F3GyKQ8TgBM4nF+Aj6EEz2671PbNyBxRNwouVuJ6Y+oNvzVbiYsDTISe
	oymiU3JI4b3DUT9zKxjEcqmx199LBayb4JY491g7fKWrZxoG19yYNeI4KWByYizuiX6n
	XyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zfJpvI3cg8a9ITbOSUhtSB+pPaIhq+63Tb4p/p+6pow=;
	b=D4qyXneqcrH4DCbvILj3/MDKKMbqbjA9CPU28tVJWVOktwXpRpM1kqA36PNGnknEgt
	FYrAiJ1AJTEx0+G2PylxbiNuRybBQYYByCM88gIDVNDL3foTnkKOMy5bx+rrCmntWuw9
	UeWBZkz1JBOLQdmKJ43GZXM2HiHIVadEXgHlT7CYz/+3ZAUFQxIIaKIqf4TNKlEy8hpT
	E2qrD56FDCFUOWqjGbQdFd1XT/+6FXsZPEPLtcXQ/k7b15eIOxA3Y4vwLHUneigQkEz8
	x9h2NRwOJxDRBl6T/SU97CQS7vFMfngCCWrP3zcZc5kvqZIlXMbljggp97b/dsZbbk3A
	v31w==
X-Gm-Message-State: APjAAAXUdkCVd4a9BElzRMl4eEl0NKyRrriYNbZhuO/83EroxFZjaYYP
	BV+e2/fC5iDXhIluKLxd4bzhvfv5
X-Google-Smtp-Source: APXvYqykRWH/IOc332wHMTn/67W0GD5q3u0k6mDp6rCBCMj1hCz0jD0cJ7numSEu9NwRnbhrDEXm1A==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr25232239wrn.109.1554126750764; 
	Mon, 01 Apr 2019 06:52:30 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	r196sm10421385wmf.22.2019.04.01.06.52.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 06:52:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 15:52:16 +0200
Message-Id: <20190401135217.17431-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] insane.bbclass: Trigger unrecognzed configure option for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 13:52:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested with 'unknown-configure-option' in ERROR_QA:

For meson (glib-2.0-native):
1. add 'EXTRA_OEMESON_append = "-Dschnitzel=true -Dwurst=true"'
   | ERROR: glib-2.0-native-1_2.58.3-r0 do_configure: QA Issue: glib-2.0-native: configure was passed unrecognised options: schnitzel wurst [unknown-configure-option]
2. add 'UNKNOWN_CONFIGURE_WHITELIST_append=" schnitzel"'
   | ERROR: glib-2.0-native-1_2.58.3-r0 do_configure: QA Issue: glib-2.0-native: configure was passed unrecognised options: wurst [unknown-configure-option]
3. change to 'UNKNOWN_CONFIGURE_WHITELIST_append=" schnitzel wurst"'
   => builds without issues

For autotools (readline-native):
1. add 'EXTRA_OECONF = "--with-schnitzel --with-wurst"'
   | ERROR: readline-native-8.0-r0 do_configure: QA Issue: readline-native: configure was passed unrecognised options: --with-wurst --with-schnitzel [unknown-configure-option]
2. add 'UNKNOWN_CONFIGURE_WHITELIST_append=" --with-schnitzel"'
   | ERROR: readline-native-8.0-r0 do_configure: QA Issue: readline-native: configure was passed unrecognised options: --with-wurst [unknown-configure-option]
3. add 'UNKNOWN_CONFIGURE_WHITELIST_append=" --with-schnitzel --with-wurst"'
   => builds without issues

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/insane.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 37b8bb0032..c8d18c07f5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1093,12 +1093,16 @@ Rerun configure task after fixing this."""
     ###########################################################################
     # Check unrecognised configure options (with a white list)
     ###########################################################################
-    if bb.data.inherits_class("autotools", d):
+    if bb.data.inherits_class("autotools", d) or bb.data.inherits_class("meson", d):
         bb.note("Checking configure output for unrecognised options")
         try:
-            flag = "WARNING: unrecognized options:"
-            log = os.path.join(d.getVar('B'), 'config.log')
-            output = subprocess.check_output(['grep', '-F', flag, log]).decode("utf-8").replace(', ', ' ')
+            if bb.data.inherits_class("autotools", d):
+                flag = "WARNING: unrecognized options:"
+                log = os.path.join(d.getVar('B'), 'config.log')
+            if bb.data.inherits_class("meson", d):
+                flag = "WARNING: Unknown options:"
+                log = os.path.join(d.getVar('T'), 'log.do_configure')
+            output = subprocess.check_output(['grep', '-F', flag, log]).decode("utf-8").replace(', ', ' ').replace('"', '')
             options = set()
             for line in output.splitlines():
                 options |= set(line.partition(flag)[2].split())
-- 
2.20.1


