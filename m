Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SG9oA-0004bs-M1
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 16:06:34 +0200
Received: by qcso7 with SMTP id o7so1371331qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 06:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=M1SeUhtejPK0qdoLCM/HPNiwL6W3AwRo6jq6J7svekg=;
	b=YIfVfQyriLLxAap0eh/nAVkIBUlLDoN+10vGepTEil/CpNNXfgYG/n3WauBtXZsDY3
	O6zSO8qYmhpX0VrgfU5aToHZdDWxBvQ2buQDDfOtse4qfnG9kuqbuYKkCPPGWF6yI8fT
	rCe8n2xrfD+RDqQR5DgQxqhTtloINkmbPL77Tsy+XW3C8LkI2ush9tEDJMBtWjIZZWZN
	ILJfbnMbecyL7aRXwkzdcjfDrkYO6nUjpIau1dVYWpGARxgRZTZl2bTvrVJRxYgO++mI
	f+TIZAQsOxSfNHKdp66qTeS7eFI2Fa2ImsNMQQy+ueqlIFEqqOnLfs8+TuEU8MXKsQdW
	rN3g==
Received: by 10.224.180.141 with SMTP id bu13mr9208438qab.93.1333720641369;
	Fri, 06 Apr 2012 06:57:21 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id 1sm11004164qac.3.2012.04.06.06.57.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 06:57:20 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 16:57:13 +0300
Message-Id: <4803097570d9e27eb3931388eb76fe6d3d00591a.1333720467.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333720467.git.andrei@gherzan.ro>
References: <cover.1333720467.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmUqVtajoT3JTCB7wTjczUGhijF02w9zP5oGe2F14LIDF4rADA/a1hEJE/IXaZJeABFoUP5
Subject: [PATCH 1/1] package.bbclass: needs_ldconfig from linux_so is needed in global namespace
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
X-List-Received-Date: Fri, 06 Apr 2012 14:06:34 -0000

"The suite of statements in a function definition executes with a local namespace
that is different from the global namespace. This means that all variables created
within a function are local to that function. When the suite finishes, these
working variables are discarded."

In this way the needs_ldconfig variable in linux_so never gets True in the statements
below this function. As global statement is generally discouraged, a return value
would be a clean and fast way to solve this issue.

[YOCTO #2205]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/package.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d35667a..c98e8fa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1263,6 +1263,7 @@ python package_do_shlibs() {
 	lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
 	def linux_so(root, path, file):
+		needs_ldconfig = False
 		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
 		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
 		fd = os.popen(cmd)
@@ -1283,6 +1284,7 @@ python package_do_shlibs() {
 					needs_ldconfig = True
 				if snap_symlinks and (file != this_soname):
 					renames.append((os.path.join(root, file), os.path.join(root, this_soname)))
+		return needs_ldconfig
 
 	def darwin_so(root, path, file):
 		fullpath = os.path.join(root, file)
@@ -1382,7 +1384,7 @@ python package_do_shlibs() {
 				if targetos == "darwin" or targetos == "darwin8":
 					darwin_so(root, dirs, file)
 				elif os.access(path, os.X_OK) or lib_re.match(file):
-					linux_so(root, dirs, file)
+					needs_ldconfig = linux_so(root, dirs, file)
 		for (old, new) in renames:
 		    	bb.note("Renaming %s to %s" % (old, new))
 			os.rename(old, new)
-- 
1.7.5.4



