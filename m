Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1SuISk-0001yX-CW
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 09:26:22 +0200
X-IronPort-AV: E=Sophos;i="4.77,657,1336341600"; d="scan'208";a="13511308"
Received: from frsnprexc1.usr.ingenico.loc ([10.23.2.11])
	by antispam1.usr.ingenico.loc with ESMTP; 26 Jul 2012 09:14:54 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 26 Jul 2012 09:14:52 +0200
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: SDK and external toolchain
Thread-Index: Ac1q/f/sI5ypejjKTkK7XBagW7wdzw==
From: "Matthieu CRAPET" <Matthieu.CRAPET@ingenico.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: SDK and external toolchain
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
X-List-Received-Date: Thu, 26 Jul 2012 07:26:22 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings,

Updated recently my oe-core and faced an unwanted side effect.
You need to know that I'm using an externel (linaro) toolchain (my
.bb/.inc are a clone of "sourcery" toolchain example).
My toolchain is compiled against a custom (external) eglibc 2.15.

Since commit a0de2a56f19ae4d8cd88e46e96917a7a019fe1ab --
image.bbclass: Add support to build the SDK in parallel with the image
http://cgit.openembedded.org/openembedded-core/commit/?id=3Da0de2a56f19ae=
4
d8cd88e46e96917a7a019fe1ab

my images generation are failing because it tries to compile eglib 2.16
and do_configure fails. I have also 3 errors:
ERROR: Multiple .bb files are due to be built which each provide
virtual/libc (.../meta/recipes-core/eglibc/eglibc_2.15.bb
.../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-tool
chain.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide
virtual/arm-ingenico-linux-gnueabi-libc-for-gcc
(.../meta/recipes-core/eglibc/eglibc_2.15.bb
.../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-tool
chain.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide
virtual/libiconv (.../meta/recipes-core/eglibc/eglibc_2.15.bb
.../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-tool
chain.bb).
 This usually means one provides something the other doesn't and should.

Notice that "PREFERRED_PROVIDER"s are correctly defined (like in
distro/include/tcmode-external-sourcery.inc). And I use bitbake 1.15.3.

For now I fixed it crudely, because I don't need SDK.

diff --git a/meta/classes/toolchain-scripts.bbclass
b/meta/classes/toolchain-scripts.bbclass
index 44284c3..f5fd4d7 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -136,7 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE =3D "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE =3D
"${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
-TOOLCHAIN_NEED_CONFIGSITE_CACHE =3D "${TCLIBC} ncurses"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE =3D "ncurses"

 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
---

populate_sdk_base.bbclass inheric toolchain-scripts which adds the
(unwanted) eglibc dependency.
Maybe this should be conditional from TOOLCHAIN_TARGET_TASK value?  Or
dependencies should be added only when calling
task-core-standalone-sdk-target?
In my use case, when I bitbake an image recipe, I don't want to deal
with SDK.

Concerning errors, is there a way to see what's not provided in order to
fix virtual/libc message (bitbake -e) ?

Best regards,
Matthieu


