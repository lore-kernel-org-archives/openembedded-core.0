Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.14023.1591372218401274832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 08:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Jcp635H1;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1008; q=dns/txt; s=axis-central1;
  t=1591372218; x=1622908218;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lFkywsDKuOfiP4QKaElk7vqgi7KTXSGSHgcXawJE15M=;
  b=Jcp635H17A6bttbspgSO69iIz0c0kXzZhaCOX1qe32FhGBgz26e1zY5r
   48ZfseC8IGJ9NJmt2iRmD0oeT/m2Jza0h2AV4nt4a6GKndZOh4WTnD8uK
   Nl2POnJpq6g3atNJdr9PCROoVhrgxaRHx58PiGV6o/kjBRhRIbCPs5268
   v41HPT4i+Ij3DAl+1sXLDbdPt8QXoRUUxC6absfZhP8G5xb/xJ5EkI5Vc
   jT7kj6/eUuhrR9wc9UYEOBWIvNFozWB0u4Xk2j0QBslfSQiEp/T4edCqb
   MJCeAE5W0Moac3rBpIk/ObtXyFc3TK/gnf5oGonUsXllK7axsD3AFxTMn
   A==;
IronPort-SDR: HMwaS5ZRoX6MegyIFa07TJx7akwOp1ljRqmQxL0pN/ORpir+ZT13Svwk9QoIUwqDfbUkavCGhs
 O40dByeDH8jscY63yj79eVd3DLLXmf26FJb8O27sQjFZstK3XSlGdSTWB4mUATtTU3y+6LH6k2
 khLZS5ZBaTkdIxAdW4mbuAdffdLgac46R7VXGRT2gevT3LuwO5PWIUZ9tSdYHlyANffuJyfjtC
 87XPm/X4LozfBf9eqMdPzGUa5wpaKSwnshm2t8gogjdytjLB83AbeYERtEG/ggRaj8NU1p/Hdd
 lQs=
X-IronPort-AV: E=Sophos;i="5.73,476,1583190000"; 
   d="scan'208";a="9267852"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][dunfell] Revert "prservice.py: fix do_package with newer Python in Ubuntu 20.04"
Date: Fri, 5 Jun 2020 17:50:12 +0200
Message-ID: <20200605155012.7175-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit 4b26eaf7152fb712aba47a0c746333578f58ee8d.

Since the problem occurred while importing prserv, the solution has
been moved into it instead so it is solved for all cases where prserv
is imported, most notably when using devtool.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/prservice.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 2d3c9c7e50..fcdbe66c19 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -3,10 +3,6 @@
 #
 
 def prserv_make_conn(d, check = False):
-    # Otherwise this fails when called from recipes which e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
-    # No module named '_sysconfigdata'
-    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
-        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
