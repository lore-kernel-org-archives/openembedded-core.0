Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1REchT-0007XZ-Ip
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 10:01:03 +0200
Received: from ad.chargestorm.se (85.231.30.150) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Fri, 14 Oct 2011 09:55:18 +0200
Date: Fri, 14 Oct 2011 09:55:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014075529.GB4437@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [RFC] Preventing race when compiling external kernel modules
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
X-List-Received-Date: Fri, 14 Oct 2011 08:01:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hi,

As I've detailed in [1] (originally in [2], but [1] shows a more typical
error), we're experiencing a race when including several external
modules in our image.

The race occurs during the compile step of the modules. Usually the
problem shows up when compiling (or calculating the dependencies) of
scripts/basic/fixdeps in $STAGING_KERNEL_DIR.

In our local tree, I've circumvented this race by applying a patch like
[3]. (Well, we could likely have put the lock in do_make_scripts()
instead of module_do_compile(), as we have done currently). Obviously,
I'm not proposing to apply this patch, as it depends on lockfile from
the procmail-package (host-package).

I've noticed that we have some bitbake functionality to implement
locking, bb.utils.lockfile() and bb.utils.unlockfile(), but I'm not sure
how to use that to guard the module_do_compile (or do_make_script)
steps, as these are shell scritp functions.

Any advice on how to make a fix that would be upstreamable to
oe-core/yocto? I'd prefer to be able to remove as much local patches as
possible from our internal build tree...

Thanks in advance!
Cheers,
Anders


[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009401.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009371.html

[3]
$ cat 0001-module.bbclass-add-lock-to-prevent-error-bulding-ext.patch 
From 9e23beb2ec499cdba04a11165efe8867ad4dc42a Mon Sep 17 00:00:00 2001
From: Anders Darander <anders@chargestorm.se>
Date: Mon, 10 Oct 2011 14:26:20 +0200
Subject: [PATCH] module.bbclass: add lock to prevent error bulding ext
 modules

When external modules are built, certain files in STAGING_KERNEL_DIR
might get rebuilt.
This raises a potential race condition. Prevent this by using a lockfile
to make external
modules build in sequence.

This patch is not applicable upstream, as it requires lockfile from
procmail.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/module.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 572df0d..46abd81 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -15,6 +15,8 @@ do_make_scripts() {
 }
 
 module_do_compile() {
+       trap "rm -f ${STAGING_KERNEL_DIR}/external_modules.lock; exit 1"
INT TERM EXIT
+       lockfile -r-1 ${STAGING_KERNEL_DIR}/external_modules.lock
        do_make_scripts
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
@@ -23,6 +25,8 @@ module_do_compile() {
                   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
                   AR="${KERNEL_AR}" \
                   ${MAKE_TARGETS}
+       rm -f ${STAGING_KERNEL_DIR}/external_modules.lock
+        trap - INT TERM EXIT
 }
 
 module_do_install() {
-- 
1.7.7


-- 
Anders Darander
ChargeStorm AB / eStorm AB	



