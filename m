Return-Path: <i.efimov@inango-systems.com>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Jan 2020 10:52:16 UTC
Received: from mail.inango-sw.com (mail.inango-systems.com [178.238.230.57])
	by mail.openembedded.org (Postfix) with ESMTP id 8E05A60D1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 10:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 6300A10807B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 12:47:13 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wU5Uo86dZjiT; Fri, 31 Jan 2020 12:47:13 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id E728B1080796;
	Fri, 31 Jan 2020 12:47:12 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com E728B1080796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1580467632;
	bh=OEm5CIy5w24jQ8fsi5TJBt/JnqxkMDSl7GwrqqOs93s=;
	h=From:To:Date:Message-Id;
	b=TYw5M9rKgQRCoKutaDP+OpW1C4ED+4Wq4KAxHaGKFHa6D2swCq6EikKGxJ1F14SgR
	iEIsRMCHK8XmyWE9kT2DO5pQd2BijX/4I7MishssHXWE8usdhLCpfOrm0fmiTtdoDc
	vI5ufQtQs+mtdj6Sq8lFaaWlthrYYdQkNMvyYsxnWEp+0nsost5yJra9iInAkE8uF6
	AXGwiAePDnog5kgdL4FthjZpGqTLY5djBMhs5pY5BxKcW9vksV4Z+kxz+mWeACuiPu
	XzHJWOotWeWKUIXof+4RXDnfBFCz1nVy6ze/wtoFfxbfkEsyVtyzhocJVG3NB5+zuv
	r/fpvG06ixq0g==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iQIVv4pRVH5J; Fri, 31 Jan 2020 12:47:12 +0200 (IST)
Received: from ivane-1.inango.loc (unknown [194.60.247.123])
	by mail.inango-sw.com (Postfix) with ESMTPSA id 839CA108022D;
	Fri, 31 Jan 2020 12:47:12 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 15:46:57 +0500
Message-Id: <20200131104657.26347-1-i.efimov@inango-systems.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lib.oe.path: "copyhardlinktree" should be able to copy folder containng hidden files only
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
X-List-Received-Date: Fri, 31 Jan 2020 10:52:17 -0000

Note: file is "hidden" if it's name starts with dot (.)

sstate.bbclass uses "copyhardlinktree" function to install sstate cache
content. Function "copyhardlinktree" uses "cp" command line which fail on copy
directories with hidden files only.  As a result folder containing only hidden files
cannot be installed from sstate cache.

"cp" source file glob argument has been changed from
  ./.??* ./*
to
  <source>/./

Steps for reproduce:

* Add next lines into some recipe ...

    inherit deploy
    do_deploy() {
        touch ${DEPLOYDIR}/.hidden
    }
    addtask deploy
* ... and try to build it

Error like next will occur:

    Exception: subprocess.CalledProcessError: Command 'cp -afl --preserve=xattr ./.??* ./* /path/to/deploy/images/machine' returned non-zero exit status 1.

    Subprocess output:
    cp: cannot stat './*': No such file or directory

Signed-off-by: Ivan Efimov <i.efimov@inango-systems.com>
---
 meta/lib/oe/path.py | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index fa209b9795..49e13225d0 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -104,17 +104,11 @@ def copyhardlinktree(src, dst):
         # writers try and create a directory at the same time
         cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
-        source = ''
+        source = src
         if os.path.isdir(src):
-            if len(glob.glob('%s/.??*' % src)) > 0:
-                source = './.??* '
-            source += './*'
-            s_dir = src
-        else:
-            source = src
-            s_dir = os.getcwd()
+            source += '/./'
         cmd = 'cp -afl --preserve=xattr %s %s' % (source, os.path.realpath(dst))
-        subprocess.check_output(cmd, shell=True, cwd=s_dir, stderr=subprocess.STDOUT)
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
         copytree(src, dst)
 
-- 
2.17.1


