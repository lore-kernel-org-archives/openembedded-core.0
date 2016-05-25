Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 May 2016 11:19:08 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id 24E9E6E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 11:19:08 +0000 (UTC)
Received: from dastp.fritz.box ([80.147.195.117]) by mail.gmx.com (mrgmx103)
	with ESMTPSA (Nemesis) id 0MaIw0-1aqBja0fhw-00Jtbg;
	Wed, 25 May 2016 13:14:06 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 13:13:44 +0200
Message-Id: <20160525111344.2893-1-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
X-Provags-ID: V03:K0:MklaFRRMVmtf9Qf6wdVtS+Y6Czl7EvT88FMdiF1pT3phb+OjUYd
	+M8Kcx1WKsCBwyG8hFrUphv01/lyseKBUWBMV/3UY0cwwicbzc+TJYnZJQRFShWRINTYXEr
	rRn5YGinvgGevjR+FnHEMVdhwWP9llvyquH3vQCbO9t/j9g9vom9BnKIuPRF0HAJQrifJQL
	h9QX+ijuaPFge8qAH9eEA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:i2zSNGY+3Y0=:M5tiPpZs9xk7jp6CZz5SKZ
	PxasU0h/yQ2KMMhk0DgaD8KseO90i9yuM23sP8AQ/XOskih2thx6OhdSFlM8Vm/asD2HKEeWz
	GORq3JzYNNHMKnbq9mjPF4P9ayboqT0yiV7wyduC7KXD+ONnuR4GFE5TzL0YOYlGDf/QFIBMk
	Hy0ynphohc0TaEReq97DPSbIQX98SxB9kerKp33RezrBSTRY9maJzm1WtDhkjqdYTlBpcnLZh
	lQDNfzTqjMHvAoN+e+V4I+AVSC1Jv1h6RdpELIddmfErih2kucfkhIqwWAzPHNwOWoZ8DHsD7
	ma+dtCWBQjm9pLf3lK56CFd9dXFZ2MiPXoFKKQY9DoYpu6CNJZ2CGLHn4MZxHd5jfKFiUdwHT
	kysvjIIG0QJ9yMk3CjFOLw2DDv3Ik62qcorAxNYrAdPku+dP0a8EwRkAHRoKPL+4cgtnGBXyA
	R6uTLh1v5WNiZ4mahzxfSTuF5CYSpCL4vRKnQCCkugIfWv+0FohcqaoZ1adSnXcjAWWzXf0UJ
	F5/vJa9DaJiW0pSffXyXEJ1bVRWWDaQG6OmpjlB4RnCnMIAWY6gs/siU3BaL+Ne9c/c0YumQN
	2YwJt94x/aYX//Gt/BFA4nzjEH1x5g2lVjgtUi6x/W4rrm7PEBQTYPFbiAaJp9QBaYkmtlx6d
	XBTkGpD0brJ1Z5w1b7su1TCCNAXn94k72IvmOx7dXJ4lw4TvrrRIHQcUwa0X496ACo88ArpYh
	S8Tqj3LPRyTOssgNvA2Y4j8CwS9iGBJ6mWhHIMKc7Wkb4qmJnJY8eIygETiq6SjkK9aI7aMQo
	Udg8C15
Subject: [krogoth][master][PATCH] dropbear: Remove incorrect SFTPSERVER_PATH from CFLAGS
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
X-List-Received-Date: Wed, 25 May 2016 11:19:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Openssh now installs the sftp-server binary as /usr/libexec/sftp-server,
whereas the dropbear recipe assumes a different path.
Dropbear uses the correct path by default, so it's no longer necessary
to override SFTPSERVER_PATH via CFLAGS.

This fixes SFTP access to systems using dropbear as the SSH server.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta/recipes-core/dropbear/dropbear.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1dce2a5..923d31c 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -46,7 +46,6 @@ BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 EXTRA_OECONF += "\
  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
-CFLAGS += "-DSFTPSERVER_PATH=\\"${libdir}/openssh/sftp-server\\""
 
 do_install() {
 	install -d ${D}${sysconfdir} \
-- 
2.8.3


