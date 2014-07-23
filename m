Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 384B77077E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 16:05:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6NG5XTu014403 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:05:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GzSL9gVllaxZ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:05:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6NG5igS014984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:05:46 +0100
Message-ID: <1406131544.22985.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 17:05:44 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity: Check for setgid/setuid TMPDIR
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
X-List-Received-Date: Wed, 23 Jul 2014 16:05:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Building in a TMPDIR which has setgid or setuid is a bad idea. We could try and reset
the permissions but since these can also invade into other directories like the cache
or sstate, lets tell the user to fix it instead.

[YOCTO #6519]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ed65814..367b68e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -514,6 +514,7 @@ def check_sanity_version_change(status, d):
         import xml.parsers.expat
     except ImportError:
         status.addresult('Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n')
+    import stat
 
     status.addresult(check_make_version(d))
     status.addresult(check_tar_version(d))
@@ -566,6 +567,11 @@ def check_sanity_version_change(status, d):
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     tmpdir = d.getVar('TMPDIR', True)
     status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
+    tmpdirmode = os.stat(tmpdir).st_mode
+    if (tmpdirmode & stat.S_ISGID):
+        status.addresult("TMPDIR is setgid, please don't build in a setgid directory")
+    if (tmpdirmode & stat.S_ISUID):
+        status.addresult("TMPDIR is setuid, please don't build in a setgid directory")
 
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat



