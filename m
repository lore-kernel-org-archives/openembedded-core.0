Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 454CB77087
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:42:49 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id gy3so29654352igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7igJx+nUuYumXKmGXgbRjThTqLamI2aKQV4rEXr6Qfc=;
	b=aVC2t4rAz4IDE/Z4BeHXaAW1hEhXv6wFMkEonoV40/3imf6V5Z9QAeNzjBBrB4wpmk
	RY8IeF/UyIn+UXEBNUqA1IPOAABnCZXZLe3mqxCnVy1TALoyvfYsSRYL4jby/an18zxV
	lYG5Y2UDalBWraAyofCGUb7NGJ+jm+edU9Y5tow0qoapE/62lTiSfJ2pKNDeb8W2/Hgq
	JUlO7dG6l0wrAQnhwA2K6T47wRcAkmCIJHGNH8Zr3+lf5zwv2WGIiONrECt1FfbrBNoo
	8oIX7Feo0d88f4C5avlYmI77xrMDwNHRyNJKI/7Fhc2+HuPwa6ib7toCSAavH35QS+lf
	ixEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7igJx+nUuYumXKmGXgbRjThTqLamI2aKQV4rEXr6Qfc=;
	b=Mhp8WczojLFXpidYoRE0y+G8tkLrxnlYjbGUPJ44dyiBUBD5WPyvV8TqQrxk+Vsb3R
	vgsD0dz3cUShXPAbHlA9zf6vwk4mjco+DtKuZT/uOufTgwn7UE4txsN9GeozENd/AFSA
	xn0jeSrWKSQ6B/OoI+3yQBePz5jTsehJR7E07c9qHX/RctcaYsi0J9rBMXlkHvj5itrX
	qrOMXbH6FBkgDmDlfScdEVwTZAlz37Hr3CvgFISGzAfcmfVuHknbQ+oKPZKW/28WcEpt
	RXZwgy6fXniS+4Yt/YqowJm0XAqY6VUiCwFvkPmZHVa2fD+tdSOY1zTgqf9x2UyLtDLC
	+RxA==
X-Gm-Message-State: AD7BkJLPDTelxPyKxG62L33emsS4kiu6j5HBAUBnsAaRxcYbU1Po8mrZNO4QC7wB0sdU12Gf
X-Received: by 10.107.159.137 with SMTP id i131mr7933124ioe.29.1459777332958; 
	Mon, 04 Apr 2016 06:42:12 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56B6F.dip0.t-ipconnect.de.
	[87.165.107.111]) by smtp.gmail.com with ESMTPSA id
	g67sm11657048ioe.34.2016.04.04.06.42.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:42:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:41:42 +0200
Message-Id: <4175fcd194d3292917e7ae37788c3b92e7e37bf3.1459776943.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
References: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1459776943.git.patrick.ohly@intel.com>
References: <cover.1459776943.git.patrick.ohly@intel.com>
Subject: [PATCH 4/5] package_manager.py: better error handling in opkg's package listing
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
X-List-Received-Date: Mon, 04 Apr 2016 13:42:49 -0000

opkg does not return a non-zero exit code even if it found
errors. When that happens, parsing the output leads to strange
follow-up errors.

To avoid this we need to check explicitly for non-empty
stderr. Reporting only that on a failure also leads to shorter error
messages (stdout may be very large).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oe/package_manager.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 0d23d8b..b4b359a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -468,13 +468,16 @@ class OpkgPkgsList(PkgsList):
     def list_pkgs(self, format=None):
         cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
 
-        try:
-            # bb.note(cmd)
-            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
-
-        except subprocess.CalledProcessError as e:
+        # opkg returns success even when it printed some
+        # "Collected errors:" report to stderr. Mixing stderr into
+        # stdout then leads to random failures later on when
+        # parsing the output. To avoid this we need to collect both
+        # output streams separately and check for empty stderr.
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        cmd_output, cmd_stderr = p.communicate()
+        if p.returncode or cmd_stderr:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
 
         return self.opkg_query(cmd_output)
 
-- 
2.1.4


