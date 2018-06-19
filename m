Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1125571B48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 10:51:50 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id a12-v6so20071267wro.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 03:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Eqxwda8Za07IZZ2TcmXevAgCiMBgOpoKdej12KLfj2g=;
	b=Jasc6mfdnC/LpGQZn/HAZ6L397d3+4ZWV+YJGXxa10v6xBk4hInRVtEOXELKp8tSYI
	uIK2DvtiAKryrG3XtmMEIRT3BZ6jesYMDPOf3cszq1+e3cHxVI2KgEvTjPPSDSbdkCdA
	du1oq/menXr7L1sR/dIJP+5XRy8RPAINVgYZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Eqxwda8Za07IZZ2TcmXevAgCiMBgOpoKdej12KLfj2g=;
	b=Xfz1MyQ1ulIOgasVNIMDDaG5h9mjbCt1JdTqiSDHdPdL0mDK9KKOisb9ukk1V3C/2y
	5kRDGjm7qzj58u04dF8KZywYbNdwtsEuEUrEeOX7C48Nqcr8Rd4WkbC0+jCy9Z2I4w48
	7yQHODtD6PkQRBJLb/i+c1GrudgwlGpcQ4VYu2L6y07IS8Kg+orzhcP7N58y0hHaNa4K
	Uo+fcnh4EHbQnHRp5Eeu1vl6zpgjRFCPOF6CQHAQt/vfLzTExuFYXX8ctei/8Dx+IpFh
	3bRH6vIuqbODZFiaJNCDY/9ELJSKEJMUJkESrZ74hWkn0usgxC1moqxXOKQsDIDzeyK1
	JwxQ==
X-Gm-Message-State: APt69E3b1m/NUYO2QmzJ+qnHLaPPfA2VH/JlTgTAowbT5h6jRfsnONuc
	0dS0iKhIL9ZUV9E88upYeXskdCR/oSw=
X-Google-Smtp-Source: ADUXVKJMu+Dw5AIujD1L4OydGQys0Yq5yDtGknuSnR3Pbu6XOhiwKPiKpJgLd50p/3oSwSU56/NGSA==
X-Received: by 2002:adf:fa07:: with SMTP id
	m7-v6mr14427305wrr.228.1529405511621; 
	Tue, 19 Jun 2018 03:51:51 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n12-v6sm15312083wrp.69.2018.06.19.03.51.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 03:51:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 11:51:44 +0100
Message-Id: <20180619105144.10687-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
References: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/5] rm_work: Simplify looping code
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
X-List-Received-Date: Tue, 19 Jun 2018 10:51:51 -0000

The current looping structure is confusing, simplify it a bit
to improve readability. Should be no functionality changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rm_work.bbclass | 78 ++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 036680f5fad..10e134b9585 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -50,47 +50,46 @@ do_rm_work () {
         # By default we'll delete the stamp, unless $i is changed by the inner loop
         # (i=dummy does this)
 
+        case $i in
+        *sigdata*|*sigbasedata*)
+            # Save/skip anything that looks like a signature data file.
+            i=dummy
+            ;;
+        *do_image_complete_setscene*)
+            # Ensure we don't 'stack' setscene extensions to this stamp with the section below
+            i=dummy
+            ;;
+        *do_image_complete*)
+            # Promote do_image_complete stamps to setscene versions (ahead of *do_image* below)
+            mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
+            i=dummy
+            ;;
+        *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_build*)
+            i=dummy
+            ;;
+        *do_addto_recipe_sysroot*)
+            # Preserve recipe-sysroot-native if do_addto_recipe_sysroot has been used
+            excludes="$excludes recipe-sysroot-native"
+            i=dummy
+            ;;
+        *do_package|*do_package.*|*do_package_setscene.*)
+            # We remove do_package entirely, including any
+            # sstate version since otherwise we'd need to leave 'plaindirs' around
+            # such as 'packages' and 'packages-split' and these can be large. No end
+            # of chain tasks depend directly on do_package anymore.
+            rm -f $i;
+            i=dummy
+            ;;
+        *_setscene*)
+            # Skip stamps which are already setscene versions
+            i=dummy
+            ;;
+        esac
+
         for j in ${SSTATETASKS} do_shared_workdir
         do
             case $i in
-            *sigdata*|*sigbasedata*)
-                # Save/skip anything that looks like a signature data file.
-                i=dummy
-                break
-                ;;
-            *do_image_complete_setscene*)
-                # Ensure we don't 'stack' setscene extensions to this stamp with the section below
-                i=dummy
-                break
-                ;;
-            *do_image_complete*)
-                # Promote do_image_complete stamps to setscene versions (ahead of *do_image* below)
-                mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
-                i=dummy
-                break
-                ;;
-            *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_build*)
-                i=dummy
-                break
-                ;;
-            *do_addto_recipe_sysroot*)
-                # Preserve recipe-sysroot-native if do_addto_recipe_sysroot has been used
-                excludes="$excludes recipe-sysroot-native"
-                i=dummy
-                break
-                ;;
-            *do_package|*do_package.*|*do_package_setscene.*)
-                # We remove do_package entirely, including any
-                # sstate version since otherwise we'd need to leave 'plaindirs' around
-                # such as 'packages' and 'packages-split' and these can be large. No end
-                # of chain tasks depend directly on do_package anymore.
-                rm -f $i;
-                i=dummy
-                break
-                ;;
-            *_setscene*)
-                # Skip stamps which are already setscene versions
-                i=dummy
+            dummy)
                 break
                 ;;
             *$j|*$j.*)
@@ -98,9 +97,10 @@ do_rm_work () {
                 mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
                 i=dummy
                 break
-            ;;
+                ;;
             esac
         done
+
         rm -f $i
     done
 
-- 
2.17.1


