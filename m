Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.850.1614275121126912554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 09:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=diVAx6Ok;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id p2so7960729edm.12
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 09:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sFMxfLKj6wgDnTgZgcgOAN9Cnp5Ix/56tHQwlpI7iuA=;
        b=diVAx6OkNhDiNYZlITWQuUKQwpmGwQnK8bUkqPNzeKrlmf+irdIK5Kg67s+6mSfOnl
         kUEWvckc5yTDlix2AOTFyU9V+pRxmKzcmDwCp7HjXghCxjHtPkKL+eTORWXLnJWrUbfv
         OzV+zsrRpexnAjRGPZzBTPN5X8R1jpw2n4DG7WkTcWwkxHKdvvU8DQIkAnKHcKuF9spw
         ccTCwqS+1PDMmtUzGGz2Py5A+2+YKVvIrMLYdbJmrTkLtKTLweC1YibUrMrqahqJHtzB
         Mx1wSCzr00PUskM5Dkyc8da7O6gA8QFQLKPKl5K/hivxtGv4dcw6EMOABEJPL2+Z3wNi
         ybfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sFMxfLKj6wgDnTgZgcgOAN9Cnp5Ix/56tHQwlpI7iuA=;
        b=YFG5f/VqQBQFp9okB6GuoqViLwT7+lGrHxV8p5ljpGduKTffthnl+OX4BTaQ5+SWKN
         sdEIJRF45Q28TYoI9ESzP+iE1crAQB+yWeiLM7kveenZDtsRNUFlWEoAvmFYTF01GnMa
         yXmuTK15dN+Q2An9cICEEtH9KNct9QKqFQgk94mbrx0iBsnt7QMXfmw71W5gR9unNJ5t
         oqyuZqfUbL1XjqO92dumaNkV/sL6FnSMXpd3P573XKAhQqnqOV+BWDT+N7s8GXdPpnuN
         rGAnewHXzvMRosk27BRDTzqPjzHyG5eKDyO1tnfJzswDGUb2iaCUmhJ2Cy8qukU4yNGe
         W0qA==
X-Gm-Message-State: AOAM530cFApLhMafUezm1N3xk83L+vrixHpaU45qtyBnbKnjZkXiWfIX
	qESjQSaZkjD70QVKLv/MrueJ96FQQjsWYA==
X-Google-Smtp-Source: ABdhPJyT0bE5Az+70WfhXmxY+LahWJU52d2+9USPri8XKTID2jAmi3bdSseJo+FYVujIfiMvJxJO2A==
X-Received: by 2002:a50:cd8c:: with SMTP id p12mr4236116edi.114.1614275119550;
        Thu, 25 Feb 2021 09:45:19 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id da12sm3998055edb.52.2021.02.25.09.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 09:45:19 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] glib-2.0: replace THISDIR instead of COREBASE in find_meson_cross_files --cross-file paths
Date: Thu, 25 Feb 2021 18:45:16 +0100
Message-Id: <20210225174516.639740-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* COREBASE works correctly only as long as this recipe is inside of
  COREBASE directory and leaves the full absolute paths if you copy
  this recipe into your own layer (e.g. to backport newer version)

* use THISDIR as all FILESPATH should be relative to that, unless
  there is a .bbappend not only extending FILESPATH, but also adding
  meson.cross.d files there (at which point it also didn't work with
  COREBASE replacements as well already) - show an ERROR in such case,
  I don't think it's common scenario to spend more time to support that.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index 15e9dbaf6f..882a89da7a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -31,7 +31,7 @@ def find_meson_cross_files(d):
     if bb.data.inherits_class('native', d):
         return ""
 
-    corebase = d.getVar("COREBASE")
+    thisdir = d.getVar("THISDIR")
     import collections
     sitedata = siteinfo_data(d)
     # filename -> found
@@ -39,7 +39,11 @@ def find_meson_cross_files(d):
     for path in d.getVar("FILESPATH").split(":"):
         for element in sitedata:
             filename = os.path.normpath(os.path.join(path, "meson.cross.d", element))
-            files[filename.replace(corebase, "${COREBASE}")] = os.path.exists(filename)
+            sanitized_path = filename.replace(thisdir, "${THISDIR}")
+            if sanitized_path == filename:
+                bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
+                continue
+            files[filename.replace(thisdir, "${THISDIR}")] = os.path.exists(filename)
 
     items = ["--cross-file=" + k for k,v in files.items() if v]
     d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
-- 
2.27.0

