Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@openedhand.com>) id 1Px2Jh-0000Z6-CL
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 20:11:34 +0100
Received: from [172.10.10.228] (unknown [67.232.160.146])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 3DDC912EC1CA;
	Tue,  8 Mar 2011 13:30:29 -0600 (CST)
From: Joshua Lock <josh@openedhand.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0c04b8bd89465d186d0ccb6912e7c08aae506541.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
	<0c04b8bd89465d186d0ccb6912e7c08aae506541.1299544029.git.sgw@linux.intel.com>
Date: Tue, 08 Mar 2011 10:47:01 -0800
Message-ID: <1299610021.5026.9.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 (2.32.1-1.fc14) 
X-Mailman-Approved-At: Tue, 08 Mar 2011 20:18:16 +0100
Cc: poky <poky@yoctoproject.org>
Subject: Re: [PATCH 6/8] util-macros: fix DEPENDS in the case of native/nativesdk
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
X-List-Received-Date: Tue, 08 Mar 2011 19:11:34 -0000
X-Groupsio-MsgNum: 329
Content-Type: multipart/mixed; boundary="=-Wk4h4c454hLcCUWZCUoo"

--=-Wk4h4c454hLcCUWZCUoo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-07 at 16:29 -0800, Saul Wold wrote:
From: Dexuan Cui <dexuan.cui@intel.com>
> 
> This fixes [YOCTO #814]
> 
> Without the line fixing nativesdk, bitbake meta-toolchain-gmae would
> get the following:
> 
> Missing or unbuildable dependency chain was: ['meta-toolchain-gmae',
'task-sdk-host', 'qemu-nativesdk', 'libsdl-nativesdk',
'libx11-nativesdk', 'util-macros-nativesdk', 'libgpg-error-nativesdk']
> ERROR: Nothing PROVIDES 'libgpg-error-nativesdk'
> 
> [sgw: inherit gettext]
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../xorg-util/util-macros_1.11.0.bb                |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> index 2bfe514..10de96c 100644
> --- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> +++ b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> @@ -11,12 +11,13 @@ PE = "1"
>  PR = "r0"
>  
>  # ${PN} is empty so we need to tweak -dev and -dbg package
dependencies
> -DEPENDS = "gettext libgpg-error"
> -DEPENDS_virtclass-native = "gettext"
> +DEPENDS = "libgpg-error"
>  
>  RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
>  
> +inherit gettext
> +
>  BBCLASSEXTEND = "native nativesdk"
>  
>  SRC_URI[md5sum] = "8580021f3a9e242ab09d23d62e475d53"
> 
By making this change you've introduced the requirement for native and
nativesdk variants of libgpg-error, we don't want nor need this for the
-native* builds which is why we had a line explicitly setting the
DEPENDS for native.

The right way to do this is to have a similar line for the nativesdk
DEPENDS as per the attached patch (and my josh/bernard branch on
poky-contrib).

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre

--=-Wk4h4c454hLcCUWZCUoo
Content-Disposition: attachment; filename="0001-util-macros-fix-DEPENDS-for-nativesdk.patch"
Content-Type: text/x-patch; name="0001-util-macros-fix-DEPENDS-for-nativesdk.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 48f856c6bdb8c7ddaf23963238ab52fb8856cdd5 Mon Sep 17 00:00:00 2001
From: Joshua Lock <josh@linux.intel.com>
Date: Tue, 8 Mar 2011 10:20:27 -0800
Subject: [PATCH] util-macros: fix DEPENDS for nativesdk

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../xorg-util/util-macros_1.11.0.bb                |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
index 2bfe514..e2c558c 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
@@ -13,6 +13,7 @@ PR = "r0"
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 DEPENDS = "gettext libgpg-error"
 DEPENDS_virtclass-native = "gettext"
+DEPENDS_virtclass-nativesdk = "gettext"
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
-- 
1.7.4


--=-Wk4h4c454hLcCUWZCUoo--
