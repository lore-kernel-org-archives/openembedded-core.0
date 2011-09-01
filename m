Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QzAPJ-00037D-Hh
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 18:46:25 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QzAKZ-0006fv-VF
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 18:41:32 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Sep 2011 17:41:31 +0100
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314895291.19905.197.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 01 Sep 2011 16:46:25 -0000
X-Groupsio-MsgNum: 9014
Content-Type: multipart/mixed; boundary="=-Hs3TuPkWxsLOjRWxVYNy"

--=-Hs3TuPkWxsLOjRWxVYNy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 15:46 +0100, Phil Blundell wrote:
> I just tried using useradd.bbclass for the first time (in an effort to
> make dbus installable on a readonly-rootfs) and it doesn't seem to be
> working very well for me.
> 
> The root of my problem seems to be the code below.  As far as I can
> tell, what's happening is that process_root_flag() consumes all the
> command line arguments to useradd, which means that the subsequent call
> to getopt() in process_flags() just returns immediately because there is
> nothing left for it to do.  The upshot of all this is that the switches
> on the command line are simply ignored and useradd doesn't do what I
> wanted.
> 
> Is anybody else using this code successfully in oe-core with a
> nontrivial USERADD_PARAM?

So, I added a strategic "optind = 1" to useradd.c and the situation
seems to have improved a bit.  However, I've encountered a couple of
other issues which are slightly annoying:

a) with the attached patch, dbus itself no longer requires a postinst to
be run at boot time.  Which is cool.  Unfortunately, inheriting useradd
causes it to now depend on shadow (which wasn't previously in my image)
and shadow itself isn't currently amenable to read-only-rootfs either so
my image build still fails.  I guess the answer to this is to have
shadow excluded (by some or other mechanism) during rootfs construction
for non-package-management-enabled images.

b) the useradd.bbclass stuff seems to try to apply itself to
virtclass-native packages as well, which was causing an error during
do_install() for dbus-native.  I worked around this by adding

USERADD_PARAM_${PN}_virtclass-native = ""
GROUPADD_PARAM_${PN}_virtclass-native = ""

to the recipe, but it seems as though the class should probably be
sorting this out for itself.

p.


--=-Hs3TuPkWxsLOjRWxVYNy
Content-Disposition: attachment; filename="dbus.diff"
Content-Type: text/x-patch; name="dbus.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a8ecda8..7010002 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -14,11 +14,21 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
            file://dbus-1.init"
 
-inherit autotools pkgconfig gettext update-rc.d
+inherit autotools pkgconfig gettext update-rc.d useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-d ${MESSAGEHOME} -g ${MESSAGEUSER} -r -N ${MESSAGEUSER}"
+GROUPADD_PARAM_${PN} = "${MESSAGEUSER}; netdev"
+USERADD_PARAM_${PN}_virtclass-native = ""
+GROUPADD_PARAM_${PN}_virtclass-native = ""
 
 INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
 
+MESSAGEUSER=messagebus
+MESSAGEHOME="${localstatedir}/run/dbus"
+UUIDDIR="${localstatedir}/lib/dbus"
+
 CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
 
 DEBIANNAME_${PN} = "dbus-1"
@@ -38,38 +48,22 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${datadir}/dbus-1/services \
-               ${datadir}/dbus-1/system-services"
+               ${datadir}/dbus-1/system-services \
+	       ${MESSAGEHOME} \
+	       ${UUIDDIR}"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
-pkg_postinst_dbus() {
-	# can't do adduser stuff offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	MESSAGEUSER=messagebus
-	MESSAGEHOME=/var/run/dbus
-	UUIDDIR=/var/lib/dbus
-
-	mkdir -p $MESSAGEHOME
-	mkdir -p $UUIDDIR
-	chgrp "$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || addgroup "$MESSAGEUSER"
-	chown "$MESSAGEUSER":"$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || \
-		adduser --system --home "$MESSAGEHOME" --no-create-home --disabled-password \
-			--ingroup "$MESSAGEUSER" "$MESSAGEUSER"
+pkg_postinst_${PN}() {
+	chgrp "${MESSAGEUSER}" "${MESSAGEHOME}"
+	chown "${MESSAGEUSER}":"${MESSAGEUSER}" "${MESSAGEHOME}"
+	chown "${MESSAGEUSER}":"${MESSAGEUSER}" "${UUIDDIR}"
 
-	chown "$MESSAGEUSER":"$MESSAGEUSER" "$UUIDDIR"
+	chown root:"${MESSAGEUSER}" $D${libexecdir}/dbus-daemon-launch-helper
+	chmod 4754 $D${libexecdir}/dbus-daemon-launch-helper
 
-	grep -q netdev: /etc/group || addgroup netdev
-
-	chown root:"$MESSAGEUSER" /usr/libexec/dbus-daemon-launch-helper
-	chmod 4754 /usr/libexec/dbus-daemon-launch-helper
-
-	# add volatile after new user/grp are created
-	echo "d messagebus messagebus 0755 /var/run/dbus none" > /etc/default/volatiles/99_dbus
-	if [ -e /etc/init.d/populate-volatile.sh ] ; then
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
 }
@@ -95,6 +89,12 @@ do_install() {
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
 	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
+
+	install -d ${D}${UUIDDIR}
+	install -d ${D}${MESSAGEHOME}
+
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d messagebus messagebus 0755 /var/run/dbus none" > ${D}${sysconfdir}/default/volatiles/99_dbus
 }
 
 do_install_virtclass-native() {

--=-Hs3TuPkWxsLOjRWxVYNy--
