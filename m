Received: from mail.fim.uni-passau.de ([132.231.1.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leitl@fim.uni-passau.de>) id 1QJULf-0004HS-IZ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 19:34:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.fim.uni-passau.de (Postfix) with ESMTP id 57CF792239
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 19:31:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.fim.uni-passau.de
Received: from mail.fim.uni-passau.de ([127.0.0.1])
	by localhost (mail.fim.uni-passau.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id zqtOE5XnEOFK
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 19:31:41 +0200 (CEST)
Received: from darkx.localnet (p5DC74A89.dip.t-dialin.net [93.199.74.137])
	by mail.fim.uni-passau.de (Postfix) with ESMTPSA id 0A7BA92238
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 19:31:41 +0200 (CEST)
From: Franz Leitl <leitl@fim.uni-passau.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 9 May 2011 19:32:06 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38.4-23-default; KDE/4.6.1; x86_64; ; )
References: <201105090016.46391.leitl@fim.uni-passau.de>
	<1304958486.18625.11.camel@doubt>
In-Reply-To: <1304958486.18625.11.camel@doubt>
MIME-Version: 1.0
Message-Id: <201105091932.06238.leitl@fim.uni-passau.de>
Subject: Re: Patch for fixing build issues with external kernel modules.
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
X-List-Received-Date: Mon, 09 May 2011 17:34:23 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

Am Montag 09 Mai 2011, 18:28:06 schrieben Sie:
> > I've tried to get compcache kernel module building against 2.6.34 from
> > shr- core but found some issues with kernel.bbclass and module.bbclass.
> > 
> > The kernel.bbclass deletes the .c files from scripts directory which are
> > later needed by make prepare to recreate bound.h and other files.
> > Compcache kernel module, for example, depends on bounds.h.
> 
> The bounds.h should not need to be recreated. It is created during the
> build of the kernel, and since 2.6.26, the makefile knows not to remove
> it.
Compache does not build without bounds.h and this file is missing in the staging directory for what ever reason.

> > The module.bbclass finally needs to call "make prepare" and also set
> > KERNEL_PATH in do_install when calling oe_runmake to get everything
> > installed correctly.
> 
> Since we copy over the source tree after a simple clean, make prepare
> should also not be necessary:
> 
>   clean		  - Remove most generated files but keep the config and
>                     enough build support to build external modules
I could not find bounds.h in the staging directory, thus i tried to recreate it with "make prepare" which failed as "make prepare" complains about missing bounds.c which was note deleted by "make clean" but the kernel.bbclass' extra cleaning of the script directory.
Even if "make prepare" may not be necessary in most cases shouldn't it be fixed so that it would work properly in case someone really needs it?

> So I'm curious about your workflow and why you are hitting these two
> issues. Can you share your recipes?
Workflow? I've just tried to build the compache recipe from classic OE which I have modified to use the latest source from compcache mercurial repository and added some stuff so it works with oe-core.
Why I'm hitting those problems is explained above.
I can send the recipe, but I have to prepare a patch first, as compcache needs some additional patches to build with OE/bitbake.

> >  I also added KERNELDIR as compcache's Makefile is using it and the
> > classes from classic OE had it also set.
> 
> I'm not familiar with compcache, but generally speaking we can't get in
> the habit of modifying the recipe classes to support whatever variables
> random external module Makefile expect. See recipes-kernel/hello-mod for
> an example Makefile that builds an external module using the existing
> infrastructure. You may just need a patch to the compcache Makefile for
> it to work within the existing infrastructure.
I already have to patch the Makefile, so changing the Makefile's KERNELDIR to OE's KERNEL_PATH would be no problem.

I removed the KERNELDIR as suggested, hope the patch is included and a bit more acceptable this time.


Regards,
Franz


---
 meta/classes/kernel.bbclass |    2 +-
 meta/classes/module.bbclass |    5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 70a782f..9835130 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -149,7 +149,7 @@ kernel_do_install() {
 	#
 	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
 	make -C $kerneldir _mrproper_scripts
-	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[sS]" -exec rm '{}' \;
 	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
 	# Remove the following binaries which cause strip errors
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 572df0d..eeb7772 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -11,7 +11,9 @@ inherit module-base
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} scripts
+		-C ${STAGING_KERNEL_DIR} scripts
+	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+		-C ${STAGING_KERNEL_DIR} prepare
 }
 
 module_do_compile() {
@@ -28,6 +30,7 @@ module_do_compile() {
 module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
+		KERNEL_PATH=${STAGING_KERNEL_DIR}   \
 	           KERNEL_SRC=${STAGING_KERNEL_DIR} \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 	           modules_install
-- 
1.7.1




