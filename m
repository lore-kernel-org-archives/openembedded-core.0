Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D41C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 17:47:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.110.1672768064700415396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 09:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 896FF2F4;
	Tue,  3 Jan 2023 09:48:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AC4C3F663;
	Tue,  3 Jan 2023 09:47:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] rm_work: handle non-existant stamps directory
Date: Tue,  3 Jan 2023 17:47:34 +0000
Message-Id: <20230103174734.2038458-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 17:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175363

Since 'build/siggen: Rework stamps functions'[1] the stamps directory
for each recipe is only created if there are stamps to be written. Some
recipes - such as package-index - only have nostamp tasks so the stamps
directory is never created, resulting in the rm_work task trying to cd
into a directory that doesn't exist.

Resolve this by simply checking the stamps directory exists before
trying to delete files in it.

[1] bitbake c79ecec580e4c2a141ae483ec0f6448f70593dcf

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/rm_work.bbclass | 101 ++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 49 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 8b5fe1b8083..52ecfafb72d 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -57,55 +57,58 @@ do_rm_work () {
     # Change normal stamps into setscene stamps as they better reflect t=
he
     # fact WORKDIR is now empty
     # Also leave noexec stamps since setscene stamps don't cover them
-    cd `dirname ${STAMP}`
-    for i in `basename ${STAMP}`*
-    do
-        case $i in
-        *sigdata*|*sigbasedata*)
-            # Save/skip anything that looks like a signature data file.
-            ;;
-        *do_image_complete_setscene*|*do_image_qa_setscene*)
-            # Ensure we don't 'stack' setscene extensions to these stamp=
s with the sections below
-            ;;
-        *do_image_complete*)
-            # Promote do_image_complete stamps to setscene versions (ahe=
ad of *do_image* below)
-            mv $i `echo $i | sed -e "s#do_image_complete#do_image_comple=
te_setscene#"`
-            ;;
-        *do_image_qa*)
-            # Promote do_image_qa stamps to setscene versions (ahead of =
*do_image* below)
-            mv $i `echo $i | sed -e "s#do_image_qa#do_image_qa_setscene#=
"`
-            ;;
-        *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write=
_qemuboot_conf*|*do_build*)
-            ;;
-        *do_addto_recipe_sysroot*)
-            # Preserve recipe-sysroot-native if do_addto_recipe_sysroot =
has been used
-            excludes=3D"$excludes recipe-sysroot-native"
-            ;;
-        *do_package|*do_package.*|*do_package_setscene.*)
-            # We remove do_package entirely, including any
-            # sstate version since otherwise we'd need to leave 'plaindi=
rs' around
-            # such as 'packages' and 'packages-split' and these can be l=
arge. No end
-            # of chain tasks depend directly on do_package anymore.
-            "${RM_BIN}" -f -- $i;
-            ;;
-        *_setscene*)
-            # Skip stamps which are already setscene versions
-            ;;
-        *)
-            # For everything else: if suitable, promote the stamp to a s=
etscene
-            # version, otherwise remove it
-            for j in ${SSTATETASKS} do_shared_workdir
-            do
-                case $i in
-                *$j|*$j.*)
-                    mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
-                    break
-                    ;;
-                esac
-            done
-            "${RM_BIN}" -f -- $i
-        esac
-    done
+    STAMPDIR=3D`dirname ${STAMP}`
+    if test -d $STAMPDIR; then
+        cd $STAMPDIR
+        for i in `basename ${STAMP}`*
+        do
+            case $i in
+            *sigdata*|*sigbasedata*)
+                # Save/skip anything that looks like a signature data fi=
le.
+                ;;
+            *do_image_complete_setscene*|*do_image_qa_setscene*)
+                # Ensure we don't 'stack' setscene extensions to these s=
tamps with the sections below
+                ;;
+            *do_image_complete*)
+                # Promote do_image_complete stamps to setscene versions =
(ahead of *do_image* below)
+                mv $i `echo $i | sed -e "s#do_image_complete#do_image_co=
mplete_setscene#"`
+                ;;
+            *do_image_qa*)
+                # Promote do_image_qa stamps to setscene versions (ahead=
 of *do_image* below)
+                mv $i `echo $i | sed -e "s#do_image_qa#do_image_qa_setsc=
ene#"`
+                ;;
+            *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_w=
rite_qemuboot_conf*|*do_build*)
+                ;;
+            *do_addto_recipe_sysroot*)
+                # Preserve recipe-sysroot-native if do_addto_recipe_sysr=
oot has been used
+                excludes=3D"$excludes recipe-sysroot-native"
+                ;;
+            *do_package|*do_package.*|*do_package_setscene.*)
+                # We remove do_package entirely, including any
+                # sstate version since otherwise we'd need to leave 'pla=
indirs' around
+                # such as 'packages' and 'packages-split' and these can =
be large. No end
+                # of chain tasks depend directly on do_package anymore.
+                "${RM_BIN}" -f -- $i;
+                ;;
+            *_setscene*)
+                # Skip stamps which are already setscene versions
+                ;;
+            *)
+                # For everything else: if suitable, promote the stamp to=
 a setscene
+                # version, otherwise remove it
+                for j in ${SSTATETASKS} do_shared_workdir
+                do
+                    case $i in
+                    *$j|*$j.*)
+                        mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
+                        break
+                        ;;
+                    esac
+                done
+                "${RM_BIN}" -f -- $i
+            esac
+        done
+    fi
=20
     cd ${WORKDIR}
     for dir in *
--=20
2.34.1


