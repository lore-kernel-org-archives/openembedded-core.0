Received: from exprod5ob109.obsmtp.com ([64.18.0.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <malcolm.crossley@ge.com>) id 1Qo1D2-0003aa-6O
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 00:43:40 +0200
Received: from Alpmlip06.e2k.ad.ge.com ([12.43.191.1]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTjcrF9BWNSyjZGLd8NZuN9a9kNydekVi@postini.com;
	Mon, 01 Aug 2011 15:39:20 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 01 Aug 2011 11:51:51 -0400
Received: from es-641xt3j.amer.consind.ge.com (HELO [3.138.54.93])
	([3.138.54.93])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 01 Aug 2011 11:51:48 -0400
Message-ID: <4E36CB93.2030006@ge.com>
Date: Mon, 01 Aug 2011 16:51:47 +0100
From: Malcolm Crossley <malcolm.crossley@ge.com>
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tune-powerpc: Set TUNE_PKGARCH instead of adding to it on powerpc machine tune.inc files
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
X-List-Received-Date: Mon, 01 Aug 2011 22:43:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Set TUNE_PKGARCH instead of adding to it on powerpc machine tune.inc 
files.The ppce300c2 tune file already sets the TUNE_PKGARCH variable 
instead of adding to it.

Adding to the TUNE_PKGARCH variable is causing the TUNE_PKGARCH to not 
match the PACKAGE_EXTRA_ARCHS variable. This then meant the packaging 
mechanism could not find the packages to install into the rootfs. E.G. 
powerpcppce500mc was not in PACKAGE_EXTRA_ARCHS.

Signed-off-by: Malcolm Crossley <malcolm.crossley@ge.com>
---

I chose to implement it this way because it mirrored how the ppce300c2 
and core2.inc tune file's are done. If the intention is to keep the 
"powerpc" on the front then the PACKAGE_EXTRA_ARCHS variable will need 
to be changed instead.

diff --git a/meta/conf/machine/include/tune-ppc603e.inc 
b/meta/conf/machine/include/tune-ppc603e.inc
index 7c05394..fb6abaf 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc

  TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", 
"-mcpu=603e", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", 
"ppc603e", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", 
"ppc603e", "", d)}"

  AVAILTUNES += "ppc603e"
  TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce500.inc 
b/meta/conf/machine/incl
ude/tune-ppce500.inc
index c34d631..53c8038 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc

  TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", 
"-mcpu=8540",
"", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", 
"ppce500", ""
, d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500", 
"ppce500", "",
  d)}"

  TUNEVALID[spe] = "Enable SPE ABI extensions"
  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", 
"-mabi=spe -mspe", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc 
b/meta/conf/machine/include/tune-ppce500mc.inc
index 73217dd..8cbaec3 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc

  TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", 
"-mcpu=e500mc", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", 
"ppce500mc", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", 
"ppce500mc", "", d)}"

  AVAILTUNES += "ppce500mc"
  TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc 
b/meta/conf/machine/include/tune-ppce500v2.inc
index 819d68a..1594e51 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc

  TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", 
"-mcpu=8548", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", 
"ppce500v2", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", 
"ppce500v2", "", d)}"

  TUNEVALID[spe] = "Enable SPE ABI extensions"
  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", 
"-mabi=spe -mspe", "", d)}"


