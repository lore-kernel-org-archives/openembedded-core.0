Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RaS3N-0003OQ-OH
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 14:05:53 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RaRwg-0001ME-AZ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:59:00 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:58:57 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323781138.24417.147.camel@phil-desktop>
Mime-Version: 1.0
Subject: python distutils configuration broken?
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
X-List-Received-Date: Tue, 13 Dec 2011 13:05:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Is anybody successfully using distutils from python-native with oe-core
at the moment?  It seems to be rather broken as far as I can tell.

The patch 12-distutils-prefix-is-inside-staging-area.patch does some
stuff like:

+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )

[...]

+        if plat_specific:
+            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
+        else:
+            prefix = plat_specific and EXEC_PREFIX or PREFIX

Firstly, this all goes rather wrong if BUILD_SYS et al aren't exported
(which they aren't by default).  But even after adding the appropriate
exports to my recipe, it ends up looking in the wrong place for the
headers: it synthesizes a path along the lines of
tmp/sysroots/${HOST_SYS}/include, which is wrong since the target
sysroots are namespaced by MACHINE.

Replacing the latter piece of code above with just:

        prefix = os.environ['STAGING_INCDIR'].rstrip('include')

seems to improve the situation for me.  As far as I can tell the
"plat_specific" distinction is useless here since oe-core installs all
the header files into the same place.

Can any python experts comment on this?

thanks

p.




