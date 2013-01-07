Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsAwS-0005tC-FW
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:32:33 +0100
Received: by mail-we0-f172.google.com with SMTP id r3so9996850wey.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=OLADvx7Gd3sECtRkV7mcGO5Xrv/L9YyF5l3DRDLjkQ8=;
	b=mFhRY6HvlY5FuLDH8TgI7fQWdv4iV0uj3V3TBWB2oCaLaL6uuUkvZJvUKF9vAvfRH/
	le93rRH1h7qttEKBVpS6be0TLxKEpV4JpM88FfAguIImtPTDixfkdCHS9YmTUwq3Fr8s
	k4hX3cXn8oHYkI/x8MvUPiORdePDBDZ9jBxJ/R/stHfKXHuEzgQzZKbMsQ5OW7yGcGCM
	kdKZALnHcIRS4isEWzoy/X65whOs+8XhfSRLTw43gSSEZ1z+6RGSIdN185WxUWqfh14S
	bJsfUkf/BHiycS+b4yUUjRwA7UJJ3g9rpFbyPbz6SiLQBRDXTuwMax1wNzA3FP2kkjyA
	5p6g==
X-Received: by 10.194.71.140 with SMTP id v12mr94996046wju.36.1357557443391;
	Mon, 07 Jan 2013 03:17:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i2sm11627622wiw.3.2013.01.07.03.17.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Jan 2013 03:17:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 12:15:40 +0100
Message-Id: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1
Subject: [PATCH] dropbear: don't use IMAGE_FEATURES
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
X-List-Received-Date: Mon, 07 Jan 2013 11:32:34 -0000

* IMAGE_FEATURES are image specific, but dropbear recipe isn't
* if you have debug-tweaks in EXTRA_IMAGE_FEATURES or added to
  IMAGE_FEATURES in distro config, then it will set DISTRO_TYPE
  to debug as expected, but if you add debug-tweaks only in
  your-own-debug-image, then dropbear never sees debug-tweaks and
  your-own-debug-image won't allow empty password login.
* best way would be to patch dropbear to enable empty password by
  runtime config or argument and enable it in ROOTFS_POSTPROCESS_COMMAND
  like openssh_allow_empty_password does, see
  http://permalink.gmane.org/gmane.network.ssh.dropbear/845

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index aa313df..2c170c6 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
@@ -40,7 +40,7 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 EXTRA_OECONF += "\
  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
-DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
+DISTRO_TYPE ?= "debug"
 
 do_install() {
 	install -d ${D}${sysconfdir} \
-- 
1.8.1



