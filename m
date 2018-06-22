Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 83EFA75522
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 15:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 74D899C31C1;
	Fri, 22 Jun 2018 11:12:43 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id Bhk_b9mT2N2g; Fri, 22 Jun 2018 11:12:42 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DA9FA9C32E3;
	Fri, 22 Jun 2018 11:12:42 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 3Sp7vQvFoaec; Fri, 22 Jun 2018 11:12:42 -0400 (EDT)
Received: from workotop.localdomain (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id BB6189C31C1;
	Fri, 22 Jun 2018 11:12:42 -0400 (EDT)
Date: Fri, 22 Jun 2018 11:12:42 -0400
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20180622151242.mjrjr7zpjturgjow@workotop.localdomain>
References: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
	<e3c72d4c-57bd-a444-43c8-0796939089d8@windriver.com>
	<20180622023556.4mzxbx534yfo4kpm@workotop.localdomain>
MIME-Version: 1.0
In-Reply-To: <20180622023556.4mzxbx534yfo4kpm@workotop.localdomain>
User-Agent: NeoMutt/20180512
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: quote SYSTEMD_SERVICE in prerm and postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 15:12:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v2 looks like the snippet below, but I'm not very fond of these path
manipulations. Any suggestion for a better solution?

Regards,
-- 
Damien

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 589e73c855..9bacdecb9b 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -81,10 +81,27 @@ python systemd_populate_packages() {
         if not pkg_systemd in packages.split():
             bb.error('%s does not appear in package list, please add it' % pkg_systemd)
 
+    def systemd_path_replace(pkg, old, new):
+         services = d.getVar('SYSTEMD_SERVICE_' + pkg, True)
+         if services:
+             services = services.replace(old, new)
+             d.setVar('SYSTEMD_SERVICE_' + pkg, services
+
+    def systemd_path_unescape(pkg):
+        systemd_path_replace(pkg, r'\\x2d', r'\x2d')
+
+    def systemd_path_escape(pkg):
+        systemd_path_replace(pkg, r'\x2d', r'\\x2d')
 
     def systemd_generate_package_scripts(pkg):
         bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 
+        # Some systemd config files may have paths that contain escape
+        # characters, but systemctl will fail to install these units if
+        # paths are not escaped, so tweak these paths during generation
+        # of prerm and postinst scripts
+        systemd_path_escape(pkg)
+
         # Add pkg to the overrides so that it finds the SYSTEMD_SERVICE_pkg
         # variable.
         localdata = d.createCopy()
@@ -102,6 +119,8 @@ python systemd_populate_packages() {
         prerm += localdata.getVar('systemd_prerm')
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
+        systemd_path_unescape(pkg)
+
 
     # Add files to FILES_*-systemd if existent and not already done
     def systemd_append_file(pkg_systemd, file_append):
@@ -130,7 +149,7 @@ python systemd_populate_packages() {
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
             for key in keys.split():
                 # recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
-                cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
+                cmd = "grep %s '%s' | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
                 pipe = os.popen(cmd, 'r')
                 line = pipe.readline()
                 while line:


On Thu, Jun 21, 2018 at 10:35:56PM -0400, Damien Riegel wrote:
> Hi,
> 
> On Fri, Jun 22, 2018 at 09:29:37AM +0800, ChenQi wrote:
> > Hi Damien,
> > 
> > If some recipe has more than one unit file, this patch will cause problem
> > for it.
> 
> That's a good point, let me see if I can come up with a solution that
> addresses that.
> 
> Regards,
> -- 
> Damien
> 
> > 
> > Best Regards,
> > Chen Qi
> > 
> > 
> > On 06/22/2018 04:35 AM, Damien Riegel wrote:
> > > Systemd mount configuration file must have a name that match the mount
> > > point directory they control. So for instance, if a mount file contains
> > > 
> > >      [Mount]
> > >      ...
> > >      Where=/mnt/my-data
> > > 
> > > The file must be named `mnt-my\x2ddata.mount`, or systemd will refuse to
> > > honour it.
> > > 
> > > If this config file contains an [Install] section, it will silently fail
> > > because the unit file is not quoted when systemctl is called. To fix
> > > that, quote `${SYSTEMD_SERVICE}` in prerm and postinst hooks.
> > > 
> > > Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> > > ---
> > >   meta/classes/systemd.bbclass | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> > > index 1b134322fb..589e73c855 100644
> > > --- a/meta/classes/systemd.bbclass
> > > +++ b/meta/classes/systemd.bbclass
> > > @@ -34,10 +34,10 @@ if type systemctl >/dev/null 2>/dev/null; then
> > >   		systemctl daemon-reload
> > >   	fi
> > > -	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
> > > +	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} "${SYSTEMD_SERVICE}"
> > >   	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> > > -		systemctl --no-block restart ${SYSTEMD_SERVICE}
> > > +		systemctl --no-block restart "${SYSTEMD_SERVICE}"
> > >   	fi
> > >   fi
> > >   }
> > > @@ -51,10 +51,10 @@ fi
> > >   if type systemctl >/dev/null 2>/dev/null; then
> > >   	if [ -z "$D" ]; then
> > > -		systemctl stop ${SYSTEMD_SERVICE}
> > > +		systemctl stop "${SYSTEMD_SERVICE}"
> > >   	fi
> > > -	systemctl $OPTS disable ${SYSTEMD_SERVICE}
> > > +	systemctl $OPTS disable "${SYSTEMD_SERVICE}"
> > >   fi
> > >   }
> > 
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

