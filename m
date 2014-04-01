Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DC8C86E849
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:09:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31A97jb014098 for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 11:09:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wDc9mI4aUFVY
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 11:09:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31A93wk014076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 11:09:04 +0100
Message-ID: <1396346938.14790.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Apr 2014 11:08:58 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] image/image-prelink/image-mklibs/sanity: Drop pointless EXPORT_FUNCTIONS
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
X-List-Received-Date: Tue, 01 Apr 2014 10:09:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm sick of seeing people adding to EXPORT_FUNCTIONS in these classes
when they clearly have no idea what it does.

Worse, these uses of it are all broken, the naming is incorrect and
they do nothing. Lets remove them and try and preserve any remaining
part of my sanity.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 23456cc..11f082b 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -69,6 +69,3 @@ mklibs_optimize_image() {
 		fi
 	done
 }
-
-
-EXPORT_FUNCTIONS mklibs_optimize_image
diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 53ef47e..d4bb3ae 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -31,5 +31,3 @@ prelink_image () {
 	pre_prelink_size=`du -ks ${IMAGE_ROOTFS} | awk '{size = $1 ; print size }'`
 	echo "Size after prelinking $pre_prelink_size."
 }
-
-EXPORT_FUNCTIONS prelink_image
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 29309f5..94abbc9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -374,8 +374,6 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-EXPORT_FUNCTIONS zap_empty_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
-
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 69d6a24..dd7fe4c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -25,8 +25,6 @@ def sanity_conf_update(fn, lines, version_var_name, new_version):
     with open(fn, "w") as f:
         f.write(''.join(lines))
 
-EXPORT_FUNCTIONS bblayers_conf_file sanity_conf_read sanity_conf_find_line sanity_conf_update
-
 # Functions added to this variable MUST throw an exception (or sys.exit()) unless they
 # successfully changed LCONF_VERSION in bblayers.conf
 BBLAYERS_CONF_UPDATE_FUNCS += "oecore_update_bblayers"



