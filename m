Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QodDL-00089p-9l for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:18:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FE859026185
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:14:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25105-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 16:14:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73FE1db026179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 16:14:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 16:13:43 +0100
Message-ID: <1312384423.2344.678.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libzypp: Correctly handle - in package architecture names
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
X-List-Received-Date: Wed, 03 Aug 2011 15:18:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If package architectures contain - characters this needs to be mapped
to something else in (_) since its illegal in C variable names.

[YOCTO #1313 partially]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 6e8fe16..bb36a90 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -54,7 +54,7 @@ do_archgen () {
 	echo ""									>> zypp/poky-arch.h
 	echo "#ifndef POKY_ARCH_H"						>> zypp/poky-arch.h
 	echo "#define POKY_ARCH_H 1"						>> zypp/poky-arch.h
-	echo "#define Arch_machine Arch_${MACHINE_ARCH}"			>> zypp/poky-arch.h
+	echo "#define Arch_machine Arch_${MACHINE_ARCH}" | tr - _		>> zypp/poky-arch.h
 	echo "#endif /* POKY_ARCH_H */"						>> zypp/poky-arch.h
 	echo ""									>> zypp/poky-arch.h
 	if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
@@ -65,7 +65,7 @@ do_archgen () {
 			all | any | noarch)
 				continue;;
 		esac
-		echo "    DEF_BUILTIN( ${each_arch} );"				>> zypp/poky-arch.h
+		echo "    DEF_BUILTIN( ${each_arch} );"	 | tr - _		>> zypp/poky-arch.h
 	  done
 	  echo "#endif /* DEF_BUILTIN */"						>> zypp/poky-arch.h
 	  echo ""									>> zypp/poky-arch.h
@@ -77,7 +77,7 @@ do_archgen () {
 			all | any | noarch)
 				continue;;
 		esac
-		echo "  extern const Arch Arch_${each_arch};"			>> zypp/poky-arch.h
+		echo "  extern const Arch Arch_${each_arch};" | tr - _		>> zypp/poky-arch.h
 	done
 	echo "#endif /* POKY_EXTERN_PROTO */"					>> zypp/poky-arch.h
 	echo ""									>> zypp/poky-arch.h
@@ -89,9 +89,11 @@ do_archgen () {
 				continue;;
 		esac
 		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-		  echo "  const Arch Arch_${each_arch} (_${each_arch});"		>> zypp/poky-arch.h
+		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/poky-arch.h
+		  echo "(_${each_arch});" 					>> zypp/poky-arch.h
 		else
-		  echo "  const Arch Arch_${each_arch} ( IdString ( \"${each_arch}\" ) );"		>> zypp/poky-arch.h
+		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/poky-arch.h
+		  echo "( IdString ( \"${each_arch}\" ) );" 			>> zypp/poky-arch.h
 		fi
 	done
 	echo "#endif /* POKY_PROTO */"						>> zypp/poky-arch.h




