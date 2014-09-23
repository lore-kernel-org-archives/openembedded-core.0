Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8251160167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NGGrfm030726; Tue, 23 Sep 2014 17:16:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DrwxVHZHtzg4; Tue, 23 Sep 2014 17:16:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NGGn1o030723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 23 Sep 2014 17:16:50 +0100
Message-ID: <1411489011.15825.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 23 Sep 2014 17:16:51 +0100
In-Reply-To: <542188F7.3080007@dresearch-fe.de>
References: <54216293.4040907@dresearch-fe.de>
	<1411478501.15825.40.camel@ted> <542188F7.3080007@dresearch-fe.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Lianhao Lu <lianhao.lu@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: hash generation/PR service problem with xuser-account and other packages
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
X-List-Received-Date: Tue, 23 Sep 2014 16:17:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-23 at 16:51 +0200, Steffen Sledz wrote:
> Hi Richard, thanx for this detailled explanation. It is another step on my way to understand all this. ;-)
> 
> > The other recipes will need investigating since I doubt its this issue
> > for them.
> 
> Is there someone who can do this work in a similar brightening way Richard did?

I had a look at run-postinsts:

MACHINE=qemux86 bitbake run-postinsts
MACHINE=qemuarm bitbake run-postinsts

ls tmp/stamps/all-poky-linux/run-postinsts/

Hmm, two different sigdata files for do_package.

bitbake-diffsigs tmp/stamps/all-poky-linux/run-postinsts/1.0-r9.do_package.sigdata.*
(assumes only two sigdata files there, idea is to compare them)

Difference is the OVERRIDES variable. We therefore dump one of the files:

bitbake-diffsigs tmp/stamps/all-poky-linux/run-postinsts/1.0-r9.do_package.sigdata.X | grep OVERRIDES

and see that OVERRIDES is depended on in two places:

List of dependencies for variable systemd_populate_packages is set(['systemd_prerm', 'D', 'exec_prefix', 'OVERRIDES', 'sysconfdir', 'SYSTEMD_PACKAGES', 'systemd_postinst', 'nonarch_base_libdir', 'PACKAGES'])
List of dependencies for variable populate_packages_updatercd is set(['D', 'updatercd_postrm', 'OVERRIDES', 'INITSCRIPT_NAME', 'INHIBIT_UPDATERCD_BBCLASS', 'MLPREFIX', 'updatercd_postinst', 'updatercd_preinst', 'updatercd_prerm', 'INIT_D_DIR', 'PACKAGES', 'INITSCRIPT_PACKAGES', 'UPDATERCPN'])

So the patch to fix this is:

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index a6ad723..708ba89 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -55,6 +55,8 @@ fi
 
 
 systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
+systemd_populate_packages[vardepsexclude] += "OVERRIDES"
+
 
 python systemd_populate_packages() {
     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 3c5414b..bc1aa7d 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -72,6 +72,7 @@ PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
 PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
 
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
+populate_packages_updatercd[vardepsexclude] += "OVERRIDES"
 
 python populate_packages_updatercd () {
     def update_rcd_auto_depend(pkg):


since OVERRIDES isn't a needed dependency here, its effect is all that matters, not its contents.

Cheers,

Richard









