Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.72297.1629391930231810236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WoWz6gRh;
 spf=pass (domain: konsulko.com, ip: 209.85.219.50, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f50.google.com with SMTP id u17so689142qvn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ivhGhljoIsBHIzU62w8mh00d8IjOLokXcatQ9kefWwc=;
        b=WoWz6gRhE27IXDmvHhJrGzgitQW+38XaweqKwWyo+o4kp/x3lDpzfQ15KAQUhD2LT2
         TUNzbV/GtYEUTPTHYu4EmDzEX3dJajQIqPU+I3fesKcP+u1I7uiuJX3UNUEA1qR+iVVS
         6acXNhuRtOsLrWJ1o0U581lxE3OkJYL6VSHoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ivhGhljoIsBHIzU62w8mh00d8IjOLokXcatQ9kefWwc=;
        b=c3/HXkTIBnaEFj9JyCi31Gk/NkSctRY/LLtBT4yai1DUplpRmx3V/Yim4quOMWLMZe
         IK8ztovKgd3Dbk/CPa1OFcLaCnzPN5C5P8VH/Rbs2rdfZakBlzUtHECWBl+qRjcAlrOU
         iQstyMRFqh24Jujn0dUmqvisLLvA+LHDw3lEYEYlTg06kB0bLSK1+MziK+idEAHsMvbC
         HVg6+28+xXj4VXCx2Y0oPJjFeJLYCgIQnSbbf7Lo3zNtvxl1mXkNJodossx5es66TeTr
         fTWizwzCrNkaOl9RnP4ZalK+ph0z4vcyz6Bh+0KdsZ57xtN6NJhLYID+N9YSw41E4f9X
         39EA==
X-Gm-Message-State: AOAM531Rk8iDh26zfjpEaDoNBCabuEvw+PcSpdcpXuUtFvkaAt6B4+Ep
	SGgXHSWhOo5YLVlW0wyNDtZ7vP0HVXEjdw==
X-Google-Smtp-Source: ABdhPJx6lzPBTO1sIDP1PMmt78B9DCa6xixACeZBKqG1poiFiHxzcb3yobAc36an20Y1sk7XQTHAFg==
X-Received: by 2002:a05:6214:a45:: with SMTP id ee5mr15515654qvb.9.1629391929154;
        Thu, 19 Aug 2021 09:52:09 -0700 (PDT)
Return-Path: <scott.murray@konsulko.com>
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id k24sm1847401qki.11.2021.08.19.09.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 09:52:08 -0700 (PDT)
From: "Scott Murray" <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Paul Barker <paul@pbarker.dev>
Subject: [PATCH 1/1] prservice: remove connection caching
Date: Thu, 19 Aug 2021 12:51:55 -0400
Message-Id: <cfd7ee07ef735c930773dd3298b5ce84abff986b.1629387539.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is a follow on of the the PR server rework in bitbake to add
read-only support.  The shift to using the bb.asyncrpc code in the PR
server and client brings issues with respect to reuse of the same
asyncio loop in different processes.  This patch removes the PR service
connection caching to avoid one source of this problem.  It is believed
that in practice this should have little impact on overall performance.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---

NOTE: Do not apply this without the prerequisite bitbake PR server
      rework patches, see the bitbake-devel for the v6 patchset.

 meta/classes/package.bbclass |  5 ++---
 meta/lib/oe/prservice.py     | 25 ++++++++++++-------------
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e17f0c797e..c4c5515d5d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -714,9 +714,7 @@ python package_get_auto_pr() {
         return
 
     try:
-        conn = d.getVar("__PRSERV_CONN")
-        if conn is None:
-            conn = oe.prservice.prserv_make_conn(d)
+        conn = oe.prservice.prserv_make_conn(d)
         if conn is not None:
             if "AUTOINC" in pkgv:
                 srcpv = bb.fetch2.get_srcrev(d)
@@ -725,6 +723,7 @@ python package_get_auto_pr() {
                 d.setVar("PRSERV_PV_AUTOINC", str(value))
 
             auto_pr = conn.getPR(version, pkgarch, checksum)
+            conn.close()
     except Exception as e:
         bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
     if auto_pr is None:
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 15ce060ff6..339f7aebca 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -11,7 +11,6 @@ def prserv_make_conn(d, check = False):
         if check:
             if not conn.ping():
                 raise Exception('service not available')
-        d.setVar("__PRSERV_CONN",conn)
     except Exception as exc:
         bb.fatal("Connecting to PR service %s:%s failed: %s" % (host_params[0], host_params[1], str(exc)))
 
@@ -22,31 +21,29 @@ def prserv_dump_db(d):
         bb.error("Not using network based PR service")
         return None
 
-    conn = d.getVar("__PRSERV_CONN")
+    conn = prserv_make_conn(d)
     if conn is None:
-        conn = prserv_make_conn(d)
-        if conn is None:
-            bb.error("Making connection failed to remote PR service")
-            return None
+        bb.error("Making connection failed to remote PR service")
+        return None
 
     #dump db
     opt_version = d.getVar('PRSERV_DUMPOPT_VERSION')
     opt_pkgarch = d.getVar('PRSERV_DUMPOPT_PKGARCH')
     opt_checksum = d.getVar('PRSERV_DUMPOPT_CHECKSUM')
     opt_col = ("1" == d.getVar('PRSERV_DUMPOPT_COL'))
-    return conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
+    d = conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
+    conn.close()
+    return d
 
 def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksum=None):
     if not d.getVar('PRSERV_HOST'):
         bb.error("Not using network based PR service")
         return None
 
-    conn = d.getVar("__PRSERV_CONN")
+    conn = prserv_make_conn(d)
     if conn is None:
-        conn = prserv_make_conn(d)
-        if conn is None:
-            bb.error("Making connection failed to remote PR service")
-            return None
+        bb.error("Making connection failed to remote PR service")
+        return None
     #get the entry values
     imported = []
     prefix = "PRAUTO$"
@@ -70,6 +67,7 @@ def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksu
                 bb.error("importing(%s,%s,%s,%d) failed. DB may have larger value %d" % (version,pkgarch,checksum,value,ret))
             else:
                imported.append((version,pkgarch,checksum,value))
+    conn.close()
     return imported
 
 def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
@@ -125,4 +123,5 @@ def prserv_check_avail(d):
     except TypeError:
         bb.fatal('Undefined/incorrect PRSERV_HOST value. Format: "host:port"')
     else:
-        prserv_make_conn(d, True)
+        conn = prserv_make_conn(d, True)
+        conn.close()
-- 
2.31.1

