Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TNsFw-0002iW-VP
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 23:31:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TNs39-0005GH-5X
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 23:18:11 +0200
Message-ID: <1350335734.4470.108.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2012 22:15:34 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: wrong umask used for creating sstate-cache directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2012 21:31:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've been experiencing a problem for a while with the group write bit
going missing on directories which are created inside sstate-cache.
This afternoon I finally had some time to investigate the cause of the
problem.

What appears to be happening is that, due to the way that sstate hooks
in its prefuncs/postfuncs, sstate_package() ends up inheriting any umask
which was set on the that that it's wrapping.  In particular, for
reasons that I'm not entirely clear about, base.bbclass does:

    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
        d.setVarFlag('do_configure', 'umask', 022)
        d.setVarFlag('do_compile', 'umask', 022)
        d.appendVarFlag('do_install', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
        d.setVarFlag('do_install', 'fakeroot', 1)
        d.setVarFlag('do_install', 'umask', 022)
        d.appendVarFlag('do_package', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
        d.setVarFlag('do_package', 'fakeroot', 1)
        d.setVarFlag('do_package', 'umask', 022)
        d.setVarFlag('do_package_setscene', 'fakeroot', 1)

and staging.bbclass does:

	do_populate_sysroot[umask] = "022"

sstate_create_package() takes care to explicitly change the mode on the
newly-created archive file to 0664, but there is no equivalent handling
for the directories created by the mkdirhier() calls in sstate_package()
and those end up getting their mode determined by the umask in effect.

In order to work around this problem I've applied this patch locally:

--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -507,7 +507,11 @@ python sstate_task_postfunc () {
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
         bb.build.exec_func(intercept, d)
+    omask = os.umask(002)
+    if omask != 002:
+       bb.note("Using umask 002 (not %03o) for sstate packaging" % omask)
     sstate_package(shared_state, d)
+    os.umask(omask)

but this is clearly not ideal for general consumption either since some
people might actually want umask 022 for those directories.  The ideal
thing would be if bitbake could either restore the original umask before
running the postfuncs, or at least allow code in the postfunc to find
out what the original umask was so that it could restore it for itself.

Any better suggestions?

p.




