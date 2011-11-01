Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLFPx-0008Kq-Bu for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 15:34:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1ESCVi030585
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 14:28:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30366-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 14:28:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1ES2dQ030579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 14:28:03 GMT
Message-ID: <1320157682.15387.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 14:28:02 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Fix variable problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 14:34:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Before this change:

a) Ownership and permissions of files copied from packages to
   package-split could get lost during the copy process. This change
   ensures they are preserved.
b) Ownership and permissions of directories could also get lost.
   Most of the complexity in this patch is addressing this problem
   ensuring newly created directories match the source ones being
   copied.
c) There was no warning about directories being created but not
   shipped by any package.

This patch fixes all of the above issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a9c510d..0e1d8db 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -916,16 +916,37 @@ python populate_packages () {
 			if file in seen:
 				continue
 			seen.append(file)
+
+			def mkdir(src, dest, p):
+				src = os.path.join(src, p)
+				dest = os.path.join(dest, p)
+				bb.mkdirhier(dest)
+				fstat = os.stat(src)
+				os.chmod(dest, fstat.st_mode)
+				os.chown(dest, fstat.st_uid, fstat.st_gid)
+				if p not in seen:
+					seen.append(p)
+
+			def mkdir_recurse(src, dest, paths):
+				while paths.startswith("./"):
+					paths = paths[2:]
+				p = "."
+				for c in paths.split("/"):
+					p = os.path.join(p, c)
+					if not os.path.exists(os.path.join(dest, p)):
+						mkdir(src, dest, p)
+
 			if os.path.isdir(file) and not os.path.islink(file):
-				bb.mkdirhier(os.path.join(root,file))
-				os.chmod(os.path.join(root,file), os.stat(file).st_mode)
+				mkdir_recurse(dvar, root, file)
 				continue
 
+			mkdir_recurse(dvar, root, os.path.dirname(file))
 			fpath = os.path.join(root,file)
-			dpath = os.path.dirname(fpath)
-			bb.mkdirhier(dpath)
 			if not os.path.islink(file):
 				os.link(file, fpath)
+				fstat = os.stat(file)
+				os.chmod(fpath, fstat.st_mode)
+				os.chown(fpath, fstat.st_uid, fstat.st_gid)
 				continue
 			ret = bb.copyfile(file, fpath)
 			if ret is False or ret == 0:
@@ -939,13 +960,13 @@ python populate_packages () {
 		dir = root[len(dvar):]
 		if not dir:
 			dir = os.sep
-		for f in files:
+		for f in (files + dirs):
 			path = os.path.join(dir, f)
 			if ('.' + path) not in seen:
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.warn("For recipe %s, the following files were installed but not shipped in any package:" % pn)
+		bb.warn("For recipe %s, the following files/directories were installed but not shipped in any package:" % pn)
 		for f in unshipped:
 			bb.warn("  " + f)
 




