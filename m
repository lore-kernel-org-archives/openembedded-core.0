Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBD77F968
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 15:35:31 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id f5so1955318lfp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 07:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aUywt1TVNRUDzE8uZdVM9JMgsAhshMPOLgRgga7JoUY=;
	b=HJ1zL8u4D8MX9IeyRLBeRzE5YffH5ZJnqBtBUFw/2/GEONy1xxX5yit92SIvC+yDIu
	gXmNRCxoZdsE1ySzFTuMGlLHqXdn4Zu/x2id3drRtUrQs5+LYho2Q65l6ykhxn6BMfPH
	IeqUBoqoCoV3SfmhuG4shaFlpxS80GGJJ6VZ0gS/sHnLzzouibMtsLpoGLhLC7y8T4E8
	Fsg58yq65+FVEV/ccIamqf3bojLZiy25dAO7AxuO8lh9ADM41o8exK81si2VRq1JhT4g
	GjkTRHBlTLo1Ce+XG+jjFOeV+wdxZ2EWk7qdBmG6v8kZnP42zGrqgNVzn4GSDLod0xuj
	4Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aUywt1TVNRUDzE8uZdVM9JMgsAhshMPOLgRgga7JoUY=;
	b=hrcNMdV1ph3mOGOK2f0Du/reLwAwYzcP3pVMwPw/mavHlUTLU3Xg2fNKZyIP6GuKfQ
	OBq/873Ggz/7igC1iUNqOWM99ueV3zkEBz0LaI/E3Y8D9KpaUT8vIaOBedW2n2NeLHNq
	iiboYWpTl3ugMMT6JdZOs3Vz6RCid1WmClkD6fAQgIccSuD9fX8F7Rj3Xz8qdKuK2NUa
	b2zGNjoLNxaoPxRVKQITR66CSjQKuecGfzT0EHjhLHMj5O6iDf1A3/RY0jguQdnlzcm2
	zVU8AMTg+NFQMw2eLPcpoHQ9GRq2pkdSDU9eQUOyHIMnHk1SOb4D3Dtwpy+S5r7IRZ9w
	gsMA==
X-Gm-Message-State: APjAAAWg9ISBYO3Tqx+vr9F1g4TZZ3Qeq/v1Ip0pQRFeKrGyf+tRq/Ee
	V6QY2xbqb/5kpHBnRKOBcsYO5d0d
X-Google-Smtp-Source: APXvYqywmbSwJuB8+i3TAlzyZgr42EwqyS3BkfubWDFxUgb0CUz6bvWtTOTu/7M082B7QjejU5IPFQ==
X-Received: by 2002:a05:6512:75:: with SMTP id
	i21mr2797811lfo.180.1573140931443; 
	Thu, 07 Nov 2019 07:35:31 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id 30sm961398lju.52.2019.11.07.07.35.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 07:35:30 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 16:35:15 +0100
Message-Id: <20191107153515.12454-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] rm_work: Simplify logic for setscene promotion
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
X-List-Received-Date: Thu, 07 Nov 2019 15:35:32 -0000
Content-Transfer-Encoding: 8bit

* Instead of overwriting the stamp name with 'dummy', handle
  setscene promotion in the default case block
* Merge '*do_image_complete_setscene*' and '*do_image_qa_setscene*'
  case handling

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/rm_work.bbclass | 49 +++++++++++-------------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 0bbc450100..01c2ab1c78 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -47,39 +47,26 @@ do_rm_work () {
     cd `dirname ${STAMP}`
     for i in `basename ${STAMP}`*
     do
-        # By default we'll delete the stamp, unless $i is changed by the inner loop
-        # (i=dummy does this)
-
         case $i in
         *sigdata*|*sigbasedata*)
             # Save/skip anything that looks like a signature data file.
-            i=dummy
             ;;
-        *do_image_complete_setscene*)
-            # Ensure we don't 'stack' setscene extensions to this stamp with the section below
-            i=dummy
+        *do_image_complete_setscene*|*do_image_qa_setscene*)
+            # Ensure we don't 'stack' setscene extensions to these stamps with the sections below
             ;;
         *do_image_complete*)
             # Promote do_image_complete stamps to setscene versions (ahead of *do_image* below)
             mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
-            i=dummy
-            ;;
-        *do_image_qa_setscene*)
-            # Ensure we don't 'stack' setscene extensions to this stamp with the section below
-            i=dummy
             ;;
         *do_image_qa*)
             # Promote do_image_qa stamps to setscene versions (ahead of *do_image* below)
             mv $i `echo $i | sed -e "s#do_image_qa#do_image_qa_setscene#"`
-            i=dummy
             ;;
         *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_build*)
-            i=dummy
             ;;
         *do_addto_recipe_sysroot*)
             # Preserve recipe-sysroot-native if do_addto_recipe_sysroot has been used
             excludes="$excludes recipe-sysroot-native"
-            i=dummy
             ;;
         *do_package|*do_package.*|*do_package_setscene.*)
             # We remove do_package entirely, including any
@@ -87,30 +74,24 @@ do_rm_work () {
             # such as 'packages' and 'packages-split' and these can be large. No end
             # of chain tasks depend directly on do_package anymore.
             rm -f $i;
-            i=dummy
             ;;
         *_setscene*)
             # Skip stamps which are already setscene versions
-            i=dummy
             ;;
+        *)
+            # For everything else: if suitable, promote the stamp to a setscene
+            # version, otherwise remove it
+            for j in ${SSTATETASKS} do_shared_workdir
+            do
+                case $i in
+                *$j|*$j.*)
+                    mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
+                    break
+                    ;;
+                esac
+            done
+            rm -f $i
         esac
-
-        for j in ${SSTATETASKS} do_shared_workdir
-        do
-            case $i in
-            dummy)
-                break
-                ;;
-            *$j|*$j.*)
-                # Promote the stamp to a setscene version
-                mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
-                i=dummy
-                break
-                ;;
-            esac
-        done
-
-        rm -f $i
     done
 
     cd ${WORKDIR}
-- 
2.21.0


