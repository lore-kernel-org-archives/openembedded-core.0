Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TSpgW-0004nu-OT
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 14:47:20 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TSpTQ-0000lZ-D0
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 14:33:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 13:33:46 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351517628.13864.4.camel@phil-desktop>
Mime-Version: 1.0
Subject: What is TOOLCHAIN_NEED_CONFIGSITE_CACHE for?
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
X-List-Received-Date: Mon, 29 Oct 2012 13:47:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This morning I happened to notice that some/all of my images had a
dependency on ncurses for no obviously good reason.  (Following an
earlier small crusade these are now the only remaining dependencies on
ncurses in my build, so I would quite like to get rid of them.)

It turns out that the dependency in question is due to the code in
toolchain-scripts.bbclass (which is inherited from
populate_sdk_base.bbclass, from image.bbclass) which does:

TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"

[...]

python __anonymous () {
    deps = ""
    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
        deps += " %s:do_populate_sysroot" % dep
    d.appendVarFlag('do_configure', 'depends', deps)
}

The code in question was added in:

commit 9e87f1347788beed181476dc4563085db14a4729
Author: Lianhao Lu <lianhao.lu@intel.com>
Date:   Tue Aug 16 11:15:36 2011 +0800

    toolchain-script.bbclass: Collected cached site config in runtime.
    
    [YOCTO #892]
    Modify the function toolchain_create_sdk_siteconfig to collect the
    cached site config files which are specified by
    TOOLCHAIN_NEED_CONFIGSITE_CACHE in runtime.
    
    Also added task dependency to ensure the cached site config files are
    generated.
    
    Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>

... but I don't entirely understand from that commentary what exactly is
special about ncurses that means it needs to be handled this way.  Can
anybody clarify?

thanks

p.




