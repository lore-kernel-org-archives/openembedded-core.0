Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 681E3601A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 15:50:39 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f82so154495167wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 07:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5yuFBELmCA6vEZ5IdNNvD0w6VrJNIHmvipmM2NGT0iM=;
	b=USjI8eyNYWS+QWtOdiyGkobQadHGAr12iyta8d33RqylgXbxyj63WeujkIc0FK7cHF
	elyKdXMERBptvVK03gpFBINs2z/2ZaDgbkgjjh59pqVmGcj6KaOntU7+Uatd9I3RYjzI
	ck7GX6Bq8q8epxEhrAz3UH/agaHAmOUDY1kersx8y+TXzuZl3Fj90o84H0bMfeR790n5
	L5zErxBDQzU2fhj3sK9Qako6Nwn2spswjPYnhx9HVrbsh6MaibZZSJCO2tnL45u0yxl9
	W8DGgGP+xOnhMODkDffSgaxo4N7Rv4uMidZP+unDJur3sv7ipxwXuBJkRiCAeGQqu4Cw
	1K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5yuFBELmCA6vEZ5IdNNvD0w6VrJNIHmvipmM2NGT0iM=;
	b=j14B7gIzAO8yelKaMEtoCVghUaY4A3+YnGaFQaE7DRE57hFXa+yKAzaY2jPR3PHq49
	jsZAWqLU0JQcIsX4NbYVrsHYBBKJ5M1Gm9/PkynMWftC+f5LSNyQCN90g6NpgMoJ5wOX
	2UuI+/sxfHtBbqCs7zMvydpUtWdxuzHpOaXl7J2VcCDJPY9MdHlaz0kps0MtJmwdlMj1
	KgikUqgbtmvxOwuBNGWj0DAfIjKYVjCIP9p7H7zj1VYRknO3TkhxUVGnlZCxq5m1DXuT
	q3eMLuzYVP5yo9Azx5xDI+3r6FJjxazHuAltzTPwQv+Pf4xR0/TPz735nKaqkHLY3Rj8
	XaPQ==
X-Gm-Message-State: ABUngvdckLr535NpYRlXIABJY61vYK+WPMLxzM6yrL25T+47jdHDXrADTU2O7jf95Dksezvg
X-Received: by 10.28.150.75 with SMTP id y72mr18236940wmd.47.1479397840075;
	Thu, 17 Nov 2016 07:50:40 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 14sm4448462wmk.1.2016.11.17.07.50.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 07:50:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 15:50:35 +0000
Message-Id: <1479397835-26630-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][RFC] classes: add gitupstream class
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
X-List-Received-Date: Thu, 17 Nov 2016 15:50:41 -0000

This class lets you use BBCLASSEXTEND to add a variant of the recipe that
fetches from git instead of a tarball.

For example:

 BBCLASSEXTEND = "gitupstream"
 SRC_URI_class-gitupstream = "git://git.example.com/example"
 SRCREV_class-gitupstream = "abcd1234"

This variant will have DEFAULT_PREFERENCE set to -1 so it needs to be selected
to be used, and any git-specific tweaks can be done with the class-gitupstream
override, for example:

 DEPENDS_append_class-gitupstream = " gperf-native"

 do_configure_prepend_class-gitupstream() {
    touch ${S}/README
 }

It currently only supports creating a git variant of the target recipe, not
native or nativesdk.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gitupstream.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/classes/gitupstream.bbclass

diff --git a/meta/classes/gitupstream.bbclass b/meta/classes/gitupstream.bbclass
new file mode 100644
index 0000000..64aab61
--- /dev/null
+++ b/meta/classes/gitupstream.bbclass
@@ -0,0 +1,23 @@
+CLASSOVERRIDE = "class-gitupstream"
+
+# TODO doesn't let you gitupstream a native recipe yet
+
+python gitupstream_virtclass_handler () {
+    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
+    if "gitupstream" not in (e.data.getVar('BBCLASSEXTEND', True) or ""):
+        bb.warn("Don't inherit gitupstream, use BBCLASSEXTEND")
+        return
+
+    # TODO sanity check somehow?
+
+    d.setVar("DEFAULT_PREFERENCE", "-1")
+    d.setVar("S", "${WORKDIR}/git")
+
+    # Modify the SRCREV, if the recipe hasn't used PV_class-gitupstream to
+    # assign a +gitX PV already.
+    pv = d.getVar("PV", True)
+    if "+git" not in pv:
+        d.setVar("PV", pv + "+git${SRCPV}")
+}
+addhandler gitupstream_virtclass_handler
+gitupstream_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
-- 
2.8.1


