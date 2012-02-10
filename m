Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RvpgN-0006w0-GI
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 13:34:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 73C453158B84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:26:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xHwFajArudnb
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:26:20 +0100 (CET)
Received: from [172.22.22.61] (drms-590c5a35.pool.mediaWays.net [89.12.90.53])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 91F4F3158AB0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:26:19 +0100 (CET)
Message-ID: <4F350CEA.70605@opendreambox.org>
Date: Fri, 10 Feb 2012 13:26:18 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F34729A.3020402@opendreambox.org>
	<7113E9EE-BFA2-47CA-94A5-381601F92C7F@dominion.thruhere.net>
	<1443906.UPv3ikXssj@helios>
In-Reply-To: <1443906.UPv3ikXssj@helios>
Subject: [PATCH/RFC v2] xorg-lib: don't build libs unless requested by DISTRO_FEATURES
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
X-List-Received-Date: Fri, 10 Feb 2012 12:34:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10.02.2012 13:19, Paul Eggleton wrote:
> On Friday 10 February 2012 09:38:59 Koen Kooi wrote:
>> I know you're just moving the error message around, but I would suggest
>> changing it to "'x11' not in DISTRO_FEATURES".
> 
> You have to be careful with this, as it will pick up partial words e.g. 
> assuming we had an "x11test" DISTRO_FEATURE then this would also be picked up 
> by this statement; whereas oe.utils.contains() does a split to make it a list 
> first and therefore does not have this issue. I'd suggest leaving it as-is, or 
> if you really want to change it, do a split on the string first.

I think Koen was referring to the error string, see below.

Regards,
Andreas

From 7d9633e0b1ccf85ec72f32d7d39952b467fa5cae Mon Sep 17 00:00:00 2001
From: Andreas Oberritter <obi@opendreambox.org>
Date: Fri, 10 Feb 2012 02:10:15 +0100
Subject: [PATCH] xorg-lib: don't build libs unless requested by
 DISTRO_FEATURES

* If 'x11' is not set in DISTRO_FEATURES, then skip all
 recipes using xorg-lib-common.inc instead of only those
 using libx11.inc.

* One exception: pixman, which is not only used by xorg,
 but also by cairo.

* Improve error message as suggested by Koen.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/xorg-lib/libx11.inc          |    5 -----
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 748a48c..9057edc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -49,8 +49,3 @@ do_compile_prepend() {
 # Multiple libx11 derivatives from from this file and are selected by virtual/libx11
 # A world build should only build the correct version, not all of them.
 EXCLUDE_FROM_WORLD = "1"
-
-python () {
-       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
-       	  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
-}
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index d106054..73a4d1d 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -14,3 +14,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no --without-xmlto"
+
+python () {
+        whitelist = [ "pixman" ]
+        if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
+                raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
+}
-- 
1.7.5.4




