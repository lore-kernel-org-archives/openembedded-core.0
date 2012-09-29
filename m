Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TI0jt-0004N4-1j
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 19:22:05 +0200
Received: by wibhj13 with SMTP id hj13so820875wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 10:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FbboL9BYirBTswG+3HLPFTRQeLteQbT7Fp6hEwCq3Rc=;
	b=iNFknWvqthc5tgxUQDzjDKuofLY9nWqKFtgJ9PhPxLRZHxS2mJYjHdKWw6C16kkc0g
	dIdNfCdcHP76N1QavkW3Gx5w+/6ARyIiTa+094K3P4hW8xCRD4vPDLcL7OAh5XCicEK0
	vYz+M070cimcHQR+vVWe8hNP532vq+nB8ZnbXMa+6ttZ6HWhhCczZZTdg3VcDKIUv2J3
	ONuWso1o1Yo4PnxM/d7Lqxmt28Hy7/HTUBW23cN4G1+xsOLStdS6PdGMgzuwPHOcXDVg
	/iHr8xORL51a7IEoXPigVrJEJqjJ2U6OluSpqJ/QZEoTTxBt+7oaZoptcQNPQgAziwmp
	PpzQ==
Received: by 10.216.135.85 with SMTP id t63mr5102900wei.93.1348938541451;
	Sat, 29 Sep 2012 10:09:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dm3sm6877401wib.3.2012.09.29.10.08.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Sep 2012 10:08:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2012 19:09:12 +0200
Message-Id: <1348938552-10963-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <20120929084317.GH3049@jama.jama.net>
References: <20120929084317.GH3049@jama.jama.net>
Subject: [PATCH] opkg: fix version constraints in conflicts, depends, replaces
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
X-List-Received-Date: Sat, 29 Sep 2012 17:22:06 -0000

* http://code.google.com/p/opkg/issues/detail?id=94

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0009-pkg_depends-fix-version-constraints.patch | 188 +++++++++++++++++++++
 ...depends-fix-version_constraints_satisfied.patch |  37 ++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |   4 +-
 3 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
new file mode 100644
index 0000000..27df307
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0009-pkg_depends-fix-version-constraints.patch
@@ -0,0 +1,188 @@
+From b6a4d289499ac4c4def48401edadd775eccc387c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 29 Sep 2012 11:38:03 +0200
+Subject: [PATCH 9/9] pkg_depends: fix version constraints
+
+* factor parsing version constraint to str_to_constraint and use that
+  from pkg (pkg_version_satisfied) and also pkg_depends (parseDepends)
+* fix constraint_to_str(), for EARLIER and LATER it was using '<' and
+  '>' which is parsed later as EARLIER_EQUAL and LATER_EQUAL
+* show notice when deprecated '<' or '>' is used
+
+Upstream-Status: Submitted
+http://code.google.com/p/opkg/issues/detail?id=94
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libopkg/pkg.c         | 36 +++++++++++--------------
+ libopkg/pkg_depends.c | 73 +++++++++++++++++++++++++++++----------------------
+ libopkg/pkg_depends.h |  1 +
+ 3 files changed, 59 insertions(+), 51 deletions(-)
+
+diff --git a/libopkg/pkg.c b/libopkg/pkg.c
+index 255c673..1e98b9c 100644
+--- a/libopkg/pkg.c
++++ b/libopkg/pkg.c
+@@ -968,28 +968,24 @@ pkg_version_satisfied(pkg_t *it, pkg_t *ref, const char *op)
+      int r;
+ 
+      r = pkg_compare_versions(it, ref);
++     char *op2 = op;
++     enum version_constraint constraint = str_to_constraint(&op2);
+ 
+-     if (strcmp(op, "<=") == 0 || strcmp(op, "<") == 0) {
+-	  return r <= 0;
+-     }
+-
+-     if (strcmp(op, ">=") == 0 || strcmp(op, ">") == 0) {
+-	  return r >= 0;
+-     }
+-
+-     if (strcmp(op, "<<") == 0) {
+-	  return r < 0;
+-     }
+-
+-     if (strcmp(op, ">>") == 0) {
+-	  return r > 0;
+-     }
+-
+-     if (strcmp(op, "=") == 0) {
+-	  return r == 0;
++     switch (constraint) 
++     {
++     case EARLIER_EQUAL:
++          return r <= 0;
++     case LATER_EQUAL:
++          return r >= 0;
++     case EARLIER:
++          return r < 0;
++     case LATER:
++          return r > 0;
++     case EQUAL:
++          return r == 0;
++     case NONE:
++          opkg_msg(ERROR, "Unknown operator: %s.\n", op);
+      }
+-
+-     opkg_msg(ERROR, "Unknown operator: %s.\n", op);
+      return 0;
+ }
+ 
+diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
+index a72eed7..4b7a2a5 100644
+--- a/libopkg/pkg_depends.c
++++ b/libopkg/pkg_depends.c
+@@ -781,7 +781,7 @@ constraint_to_str(enum version_constraint c)
+ 	case NONE:
+ 		return "";
+ 	case EARLIER:
+-		return "< ";
++		return "<< ";
+ 	case EARLIER_EQUAL:
+ 	       return "<= ";
+ 	case EQUAL:
+@@ -789,12 +789,51 @@ constraint_to_str(enum version_constraint c)
+ 	case LATER_EQUAL:
+ 	      return ">= ";
+ 	case LATER:
+-	     return "> ";
++	     return ">> ";
+ 	}
+ 
+ 	return "";
+ }
+ 
++enum version_constraint
++str_to_constraint(char **str)
++{
++	if(!strncmp(*str, "<<", 2)){
++		*str += 2;
++		return EARLIER;
++	}
++	else if(!strncmp(*str, "<=", 2)){
++		*str += 2;
++		return EARLIER_EQUAL;
++	}
++	else if(!strncmp(*str, ">=", 2)){
++		*str += 2;
++		return LATER_EQUAL;
++	}
++	else if(!strncmp(*str, ">>", 2)){
++		*str += 2;
++		return LATER;
++	}
++	else if(!strncmp(*str, "=", 1)){
++		*str++;
++		return EQUAL;
++	}
++	/* should these be here to support deprecated designations; dpkg does */
++	else if(!strncmp(*str, "<", 1)){
++		*str++;
++		opkg_msg(NOTICE, "Deprecated version constraint '<' was used with the same meaning as '<='. Use '<<' for EARLIER constraint.\n");
++		return EARLIER_EQUAL;
++	}
++	else if(!strncmp(*str, ">", 1)){
++		*str++;
++		opkg_msg(NOTICE, "Deprecated version constraint '>' was used with the same meaning as '>='. Use '>>' for LATER constraint.\n");
++		return LATER_EQUAL;
++	}
++	else {
++		return NONE;
++	}
++}
++
+ /*
+  * Returns a printable string for pkg's dependency at the specified idx. The
+  * resultant string must be passed to free() by the caller.
+@@ -949,35 +988,7 @@ static int parseDepends(compound_depend_t *compound_depend,
+ 	  /* extract constraint and version */
+ 	  if(*src == '('){
+ 	       src++;
+-	       if(!strncmp(src, "<<", 2)){
+-		    possibilities[i]->constraint = EARLIER;
+-		    src += 2;
+-	       }
+-	       else if(!strncmp(src, "<=", 2)){
+-		    possibilities[i]->constraint = EARLIER_EQUAL;
+-		    src += 2;
+-	       }
+-	       else if(!strncmp(src, ">=", 2)){
+-		    possibilities[i]->constraint = LATER_EQUAL;
+-		    src += 2;
+-	       }
+-	       else if(!strncmp(src, ">>", 2)){
+-		    possibilities[i]->constraint = LATER;
+-		    src += 2;
+-	       }
+-	       else if(!strncmp(src, "=", 1)){
+-		    possibilities[i]->constraint = EQUAL;
+-		    src++;
+-	       }
+-	       /* should these be here to support deprecated designations; dpkg does */
+-	       else if(!strncmp(src, "<", 1)){
+-		    possibilities[i]->constraint = EARLIER_EQUAL;
+-		    src++;
+-	       }
+-	       else if(!strncmp(src, ">", 1)){
+-		    possibilities[i]->constraint = LATER_EQUAL;
+-		    src++;
+-	       }
++	       possibilities[i]->constraint = str_to_constraint(&src);
+ 
+ 	       /* now we have any constraint, pass space to version string */
+ 	       while(isspace(*src)) src++;
+diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
+index ca0801f..685a722 100644
+--- a/libopkg/pkg_depends.h
++++ b/libopkg/pkg_depends.h
+@@ -87,6 +87,7 @@ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
+ int pkg_dependence_satisfiable(depend_t *depend);
+ int pkg_dependence_satisfied(depend_t *depend);
+ const char* constraint_to_str(enum version_constraint c);
++enum version_constraint str_to_constraint(char **str);
+ int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
+ 
+ #endif
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch b/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
new file mode 100644
index 0000000..ffcbc4b
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0010-pkg_depends-fix-version_constraints_satisfied.patch
@@ -0,0 +1,37 @@
+From 02d96ebf8c6cdbe3402506ad041bbb4806179273 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 29 Sep 2012 18:56:01 +0200
+Subject: [PATCH 10/10] pkg_depends: fix version_constraints_satisfied
+
+* with
+  Package: a
+  Version: 1
+  and
+  Conflicts: a (<< 1)
+  we have comparison == 0, but constraint EARLIER is not satisfied!
+
+Upstream-Status: Submitted
+http://code.google.com/p/opkg/issues/detail?id=94
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libopkg/pkg_depends.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
+index 4b7a2a5..58c4a99 100644
+--- a/libopkg/pkg_depends.c
++++ b/libopkg/pkg_depends.c
+@@ -464,7 +464,8 @@ int version_constraints_satisfied(depend_t * depends, pkg_t * pkg)
+     else if((depends->constraint == LATER) &&
+ 	    (comparison > 0))
+ 	return 1;
+-    else if(comparison == 0)
++    else if((depends->constraint == LATER) && 
++	    (comparison == 0))
+ 	return 1;
+     else if((depends->constraint == LATER_EQUAL) &&
+ 	    (comparison >= 0))
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 820a224..d89a3f6 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -9,6 +9,8 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
   file://0006-detect-circular-dependencies.patch \
   file://0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch \
   file://0008-select_higher_version.patch \
+  file://0009-pkg_depends-fix-version-constraints.patch \
+  file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -16,4 +18,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
-- 
1.7.12



