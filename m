Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10259.1614941781308894473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 02:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=boQdR8zH;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614941781;
  x=1646477781;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QWXHwbO8zYYvuQVmy9vJ1jTDQyLvhW9uQRKkupWKDhI=;
  b=boQdR8zHcz+3uDTo+61SvWJpojyMSh/j908XJweEoJn9hVLtAHmaByde
   39fTCSt2an+HshlANd+YU0q6eYs3W6zoGEp9ByZmRFC4QlapKSdHKIEzi
   fULYiit3rhmQkgRvAfm9QSlQ7pCYJ5pT+uzGPgxTgNbe/mjbgyexhUVHH
   V+g8Y/ChxNja6wFWByhHF250STIkRvRqK9mbj1yHtFQ0fhbBetYvouZYr
   jUfOId51zUeTlvJLCbgyfXHj93/g4AiZbHJkmDNzIl/Xnrtn5/rom5xGg
   SIHq1VDfrObR4hkWl/yi8ojK64nM8joLq2K21IL1IGbDJyfugUcSdlsRa
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Subject: [PATCH] glib-2.0: Support bbappends again
Date: Fri, 5 Mar 2021 11:56:06 +0100
Message-ID: <20210305105606.8413-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In commit 314cfc7d (glib-2.0: replace THISDIR instead of COREBASE in
find_meson_cross_files --cross-file paths), find_meson_cross_files() was
modified to give an error for files that are not relative to ${THISDIR}.
However, this did not take into account bbappend files. As soon as a
bbappend was used for the glib-2.0 recipe, a huge number of errors would
be produced. This was due to not checking if the files actually existed.

Avoid this whole problem and the need for bb.error() by making the paths
to the cross-files relative to ${THISDIR}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index 882a89da7a..af73e4bef9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -39,11 +39,8 @@ def find_meson_cross_files(d):
     for path in d.getVar("FILESPATH").split(":"):
         for element in sitedata:
             filename = os.path.normpath(os.path.join(path, "meson.cross.d", element))
-            sanitized_path = filename.replace(thisdir, "${THISDIR}")
-            if sanitized_path == filename:
-                bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
-                continue
-            files[filename.replace(thisdir, "${THISDIR}")] = os.path.exists(filename)
+            sanitized_path = "${THISDIR}/" + oe.path.relative(thisdir, filename)
+            files[sanitized_path] = os.path.exists(filename)
 
     items = ["--cross-file=" + k for k,v in files.items() if v]
     d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
