Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB71777B3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 16:26:23 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id w189so43133381pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Mar 2017 08:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VMDlTOc7xjwefgwGFKF7YQyvHecMU8ohaESL1dwY6gY=;
	b=onX5d/c6sDaBEC9CBi4HBGVFrs5AALZfuvcprAqBIdlxQ85bqWXnSce6v50R+Vp8Qv
	wZYZO5VuZHHRrwBXpCJrw2T086a/vY6X6s54Ur/CB1OcarzNSzCa3cBlSOA4/nHnqc5J
	wDkvcjLqIfdFfY/xLFHc9+VrUpeyupYSg+KGrHyOm32uwyb/GY1aWGYU/OWp4959QAhc
	Xxo1RdTKs4oyecF5y9l6BRM9jeCZdHVxEV5VnNJ4kVfztNOhwH+AHDeByQtlGUwAbk7B
	2Sgv9V1oPVsS9bJXtAdSnlD8fn7yskR6CR9VQ9LgfY7JSXKeBXkA8gcU+bg63oKbjqne
	hBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VMDlTOc7xjwefgwGFKF7YQyvHecMU8ohaESL1dwY6gY=;
	b=Ya/VxZztjHr6AZqVFEBaaQIWPsa3x3w3+ak6EH71jzzn7OCVifgzstEXjho9jiXYbW
	qAZ0d/cRWuMlqqnSByHL0h8sekSKpGEvi6t1kB5cmd6QGV0/yJhApYMdaMYNPLPlr1wo
	LlrkJ8uOnvAHkwhdcqa6M+wFbGXB/z/4gl6laDJUlRlgzOvysE4ley8kNNZZKwx3+yop
	ABqMMSZn00xNUmF87CoIpdCWIXo7IWTiNazZkqbjT8XQC40ODAAARkSp3rP6pH0zzo43
	amPD8Uy9RWSr/EW/o7PkmSaHkbwAuTja7whytNS1OhluWN2M21GmbwfjphxCy4NqpLpm
	NGag==
X-Gm-Message-State: AMke39la1xIPku2gG+Rxor75ZYBQW6VyBfcwaIrp3iTlSSD6BbcLV7r/fGWOCwD6ZsYHl0Az
X-Received: by 10.98.75.28 with SMTP id y28mr10361790pfa.157.1488644785233;
	Sat, 04 Mar 2017 08:26:25 -0800 (PST)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	s81sm24932837pgs.18.2017.03.04.08.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Mar 2017 08:26:23 -0800 (PST)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Mar 2017 08:26:15 -0800
Message-Id: <1488644775-25405-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: mdf@kernel.org
Subject: [RFC/PATCH] boost: Fix issue with python-numpy
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
X-List-Received-Date: Sat, 04 Mar 2017 16:26:24 -0000

Boost 1.63 merged Boost.Python numpy support, however there
are no configuration options to turn it off or on.

If PACKAGECONFIG[python] is enabled, now depend on python-numpy
and python3-numpy.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
Hi all,

I'm not sure if this is the entirely correct fix.
I've seen other places like gentoo ([1]) simply patch out the
numpy support to get earlier behavior.

Maybe making it another PACKAGECONFIG[numpy] option
would be desirable?

Cheers,

Moritz

[1] http://bit.ly/2m7WBRW

---
 meta/recipes-support/boost/boost.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 87b6b88..7b55132 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -42,13 +42,13 @@ PACKAGECONFIG ??= "locale"
 PACKAGECONFIG[locale] = ",,icu"
 PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
-PACKAGECONFIG[python] = ",,python python3"
+PACKAGECONFIG[python] = ",,python python3 python-numpy python3-numpy"
 
 BOOST_LIBS += "\
     ${@bb.utils.filter('PACKAGECONFIG', 'locale', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'graph_parallel', 'graph_parallel mpi', \
                          bb.utils.filter('PACKAGECONFIG', 'mpi', d), d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3 numpy numpy3', '', d)} \
 "
 
 inherit python-dir
@@ -61,7 +61,8 @@ python __anonymous () {
     extras = []
     for lib in d.getVar('BOOST_LIBS').split( ):
         # BJAM does not know '--with-python3' (only --with-python)
-        if lib != "python3":
+        # the same goes for numpy and numpy3
+        if (lib != "python3") and (lib != "numpy") and (lib != "numpy3"):
             extras.append("--with-%s" % lib)
         pkg = "boost-%s" % lib.replace("_", "-")
         packages.append(pkg)
@@ -69,6 +70,9 @@ python __anonymous () {
             # special: python*.so matches python3.so !!
             if not d.getVar("FILES_%s" % pkg):
                     d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s.so.*" % lib)
+        elif(lib == "numpy"):
+            if not d.getVar("FILES_%s" % pkg):
+                    d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s.so.*" % lib)
         else:
             if not d.getVar("FILES_%s" % pkg):
                     d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
-- 
2.7.4


