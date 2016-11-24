Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8B00471B80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 23:44:31 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u144so24239141wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 15:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Yl5bWIwEhU98g3pM6O/H7ZZ5Y8p//7vfoTflHhcwFfY=;
	b=zRMA++YrolO1dZvQ+j5esXuxPXsbArYNuR6eA7gsXhcvxvrg9ay4vjRJeXIoDCKgoB
	L5ZNAiQVKAP+TFw8+lQB34zSVM0eaLNJpifMm/rsBDKp7vX94ofZuCd1/HHdzlDf2DXJ
	die4tWOyny1siB+bERm5Vyf3xx8J3Q4Khi+E0PB86bzk6+25oK/bFDrAA79xSQGxE1LD
	vk7JesLcE/gUQLuh/VEUj7rX++GbzV7dP/W1WaUgMEX/qiSfqRwkH8bFrllIjdUNSCyk
	F/Xcehq25zry9LNDM25fF9k1cWjtKPNbEELQZiTdCDavZep4tehw7PiirAxciX6YIqcn
	TN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Yl5bWIwEhU98g3pM6O/H7ZZ5Y8p//7vfoTflHhcwFfY=;
	b=g0tBMCzIEsNKYkjcHjilAnoJ7oOMh0v6VlxWFP5WLZ3zC91o1HQQfQ33yP2nQTbZPx
	a8Gem4fTSiPOd6kbGHwShr9VUn9CsWfZM9UcrHwbOQXYHjq2ErTUzqfBqjWn6u8CqRsE
	xq34VEfpJFt7IimzlSCKzHppVrdY4/fdgNroMzch7FRSHXNdhaGaMFw4f+YwRAJrnh11
	P8cYXgOSRefTJLYI4Bz5fxHaMVkQH4aJQSOJjxGWpHFSuYYM3O4VfN9dQr9WoNeGF7i9
	vTKNZtIsR7imFCxCbhmtcjathyDz6pFyiT4a9a4kv2joiahdbEIhaWDBDpp1hpab55O1
	nRYg==
X-Gm-Message-State: AKaTC00nIT44W6OR1bIN+gd/RGksl/oWSh//fwGzG8EuEQgDBAjHvVwTyzvZxS51bft8g6xc
X-Received: by 10.28.134.146 with SMTP id i140mr4784048wmd.100.1480031072245; 
	Thu, 24 Nov 2016 15:44:32 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yg1sm44209118wjb.12.2016.11.24.15.44.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 15:44:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 23:44:24 +0000
Message-Id: <1480031065-19435-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1480031065-19435-1-git-send-email-ross.burton@intel.com>
References: <1480031065-19435-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] insane: add QAPKGTEST, a package-wide equivilant to QAPATHTEST
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
X-List-Received-Date: Thu, 24 Nov 2016 23:44:33 -0000

QAPATHTEST defines a function that is executed for every file in every package.
For tests which just need to look at the datastore this is massive overkill.

Add QAPKGTEST, which is invoked for each package in the recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0ba4cae..407ccee 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -822,6 +822,23 @@ def package_qa_check_staged(path,d):
 
     return sane
 
+# Run all package-wide warnfuncs and errorfuncs
+def package_qa_package(warnfuncs, errorfuncs, skip, package, d):
+    warnings = {}
+    errors = {}
+
+    for func in warnfuncs:
+        func(package, d, warnings)
+    for func in errorfuncs:
+        func(package, d, errors)
+
+    for w in warnings:
+        package_qa_handle_error(w, warnings[w], d)
+    for e in errors:
+        package_qa_handle_error(e, errors[e], d)
+
+    return len(errors) == 0
+
 # Walk over all files in a directory and call func
 def package_qa_walk(warnfuncs, errorfuncs, skip, package, d):
     import oe.qa
@@ -1162,6 +1179,9 @@ python do_package_qa () {
         warn_checks, error_checks = parse_test_matrix("QAPATHTEST")
         package_qa_walk(warn_checks, error_checks, skip, package, d)
 
+        warn_checks, error_checks = parse_test_matrix("QAPKGTEST")
+        package_qa_package(warn_checks, error_checks, skip, package, d)
+
         package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d)
         package_qa_check_deps(package, pkgdest, skip, d)
 
-- 
2.8.1


