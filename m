Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TReBP-0005KW-77
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 09:18:20 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so2352779pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9XaSGJiyhi64GccwfbrYDSw7q0u/pOYvD1NxDsSMqn0=;
	b=02ot4TD69qo37Mn5sDidORdB35wKsQQJVb6GMJ5ArjH+E+CC96t9BXv4KdPxmaIx0L
	HXQU3SQKQQOtVaVU+vvq8+Kw28lYKEoAwnMZThnGIREvQV1zONQlpnIRGSOnr001Wv4x
	+rCyrFBoB7dWG1Ua+oLgtZuKJzMYnZD9qHTaZ8tLU0JWVIXRY5XObQmuwnwOdVRb0xWV
	TQ6O+2PzxnpE3uBLdcDP2XQaphx8LoGa/7PyYK5hQ20bwGTAl/icgzKd4dJOUjKtIwlD
	4bZYCRCt59u/hW68ZjpKTR3VZNrwQ+muVTjazOmp2pN/ww2fkept43kpRNMpSusJAGjB
	GATQ==
Received: by 10.66.73.6 with SMTP id h6mr59528507pav.69.1351235088265;
	Fri, 26 Oct 2012 00:04:48 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id mt15sm719980pbc.49.2012.10.26.00.04.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 00:04:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 00:03:49 -0700
Message-Id: <1351235029-31096-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bitbake.conf: Change systemd_unitdir definition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 07:18:20 -0000

systemd_unitdir indicates the arch independent
files which are basically scripts and unit files
and systemd wants then to be in /lib always even
when base_libdir is  /lib64, hence we have to reflect
that and not use base_libdir to define it. Otherwise
on architectures where base_libdir is lib64 e.g. ppc64
or multilibbed x86_64 this wont work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5cb5b13..e7fa731 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -31,6 +31,7 @@ export localstatedir = "${base_prefix}/var"
 export infodir = "${datadir}/info"
 export mandir = "${datadir}/man"
 export docdir = "${datadir}/doc"
+export systemd_unitdir = "/lib/systemd"
 
 # Architecture dependent paths
 export bindir = "${exec_prefix}/bin"
@@ -39,7 +40,6 @@ export libexecdir = "${exec_prefix}/libexec"
 export libdir = "${exec_prefix}/${baselib}"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
-export systemd_unitdir = "${base_libdir}/systemd"
 localedir = "${libdir}/locale"
 
 # Linkage between native/cross/nativesdk layouts
-- 
1.7.9.5



