Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0C25461011
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 05:31:00 +0000 (UTC)
Received: from [12.157.112.67] (helo=[10.71.2.210])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W57Rq-0008Bn-BZ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jan 2014 06:31:00 +0100
Message-ID: <1390195849.2441.1.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 05:30:49 +0000
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: Commit b92a3e9d093bc9421aa38a40bc6bfd559a16b3be
	introduced a dependency on udev,
	which is undesirable for distros which don't otherwise
	require or build udev (and, as such,
	don't have any interest in the rules.d files). [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] alsa-utils: Add PACKAGECONFIG for udev
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
X-List-Received-Date: Mon, 20 Jan 2014 05:31:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit b92a3e9d093bc9421aa38a40bc6bfd559a16b3be introduced a dependency
on udev, which is undesirable for distros which don't otherwise require 
or build udev (and, as such, don't have any interest in the rules.d files).

Make this conditional on a PACKAGECONFIG setting so that it can be turned
off.  If it's off, we don't depend on udev and don't ship the rules.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index 831b9b8..3384453 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -7,6 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0 udev"
 
+PACKAGECONFIG ??= "udev"
+PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
+
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
@@ -18,7 +21,7 @@ SRC_URI[sha256sum] = "02bfac39092f3b68d743c23ad3d688d6c5aa8df69f2ccd692c5b8282ed
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
 # please close bug and remove this comment when properly fixed
 #
-EXTRA_OECONF = "--disable-xmlto --with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d "
+EXTRA_OECONF = "--disable-xmlto"
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
 inherit autotools gettext
@@ -82,4 +85,10 @@ do_install() {
 	# We don't ship this here because it requires a dependency on bash.
 	# See alsa-utils-alsaconf_${PV}.bb
 	rm ${D}${sbindir}/alsaconf
+
+	if ${@base_contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
+	   # This is where alsa-utils will install its rules if we don't tell it anything else.
+	   rm -rf ${D}/lib/udev
+	   rmdir --ignore-fail-on-non-empty ${D}/lib
+	fi
 }
-- 
1.8.5




