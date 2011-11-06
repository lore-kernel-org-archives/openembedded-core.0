Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RNCsb-0007VK-Pu
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 01:16:02 +0100
Received: from mail92.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 471E91000B2D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2011 21:37:03 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Nov 2011 22:31:12 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.6?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 6 Nov 2011 22:31:11 +0200
Message-ID: <4EB6EE8E.4000401@eukrea.com>
Date: Sun, 06 Nov 2011 21:31:10 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: scott.a.garman@intel.com
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
References: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
	<840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
	<4EA825F0.1030504@windriver.com> <4EA83ACB.4040001@intel.com>
In-Reply-To: <4EA83ACB.4040001@intel.com>
X-Ovh-Tracer-Id: 17189958304504720714
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -80
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeffedrtddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvddtmd
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: useradd changes to dbus, base-passwd
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
X-List-Received-Date: Mon, 07 Nov 2011 00:16:02 -0000
X-Groupsio-MsgNum: 11975
Content-Type: multipart/mixed; boundary="------------020409020508030006050201"

--------------020409020508030006050201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Scott,

Le 26/10/2011 18:52, Scott Garman a =E9crit :
> Grepping through our classes, it looks like I can detect the nativesdk =
within
> useradd.bbclass by checking for bb.data.inherits_class('nativesdk', d).
>
> I've filed a bug for this and will develop a patch to ensure useradd is
> becomes a no-op for nativesdk builds:
>
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1702
>
here is a patch tentative which allowed me to compile meta-toolchain-qte.
Is that the right way to solve the problem (in which case I'll submit the=
=20
patch with comment & sob)?

Thanks
Eric

--------------020409020508030006050201
Content-Type: text/plain;
 name="fix_dbusnativesdk.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fix_dbusnativesdk.patch"

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index fb70b3e..cbcc9e9 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,9 +3,16 @@ USERADDPN ?= "${PN}"
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
-DEPENDS_append = " base-passwd shadow-native shadow-sysroot"
 RDEPENDS_${USERADDPN}_append = " base-passwd shadow"
 
+def useradd_dep_append(d):
+	deps = ' '
+	if not bb.data.inherits_class('nativesdk', d):
+		deps = ' shadow-native shadow-sysroot base-passwd'
+	return deps
+
+DEPENDS_append = "${@useradd_dep_append(d)}"
+
 # This preinstall function will be run in two contexts: once for the
 # native sysroot (as invoked by the useradd_sysroot() wrapper), and
 # also as the preinst script in the target package.
@@ -96,8 +103,17 @@ useradd_sysroot_sstate () {
 	fi
 }
 
-do_install[prefuncs] += "useradd_sysroot"
-SSTATEPOSTINSTFUNCS += "useradd_sysroot_sstate"
+
+python () {
+	if not bb.data.inherits_class('nativesdk', d):
+		funcs = bb.data.getVarFlag('do_install', 'prefuncs', d) or ""
+		funcs += 'useradd_sysroot'
+		bb.data.setVarFlag('do_install', 'prefuncs', funcs, d)
+		d.setVar('SSTATEPOSTINSTFUNCS', (bb.data.getVar('SSTATEPOSTINSTFUNCS', d, True) or "").join("useradd_sysroot_sstate"))
+}
+

 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index caa781c..99b2fc7 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -105,4 +105,8 @@ do_install_virtclass-native() {
 	# dbus-glib-native and dbus-glib need this xml file
 	./bus/dbus-daemon --introspect > ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
 }
+
+do_install_virtclass-nativesdk() {
+	autotools_do_install
+}
 BBCLASSEXTEND = "native nativesdk"

--------------020409020508030006050201--
