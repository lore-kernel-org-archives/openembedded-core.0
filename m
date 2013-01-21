Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxFtb-0003iq-2S
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 12:50:36 +0100
Received: from mail-wg0-f72.google.com ([74.125.82.72])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 03:35:05 -0800
Received: by mail-wg0-f72.google.com with SMTP id fg15so6390442wgb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 03:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=K2M9dpBFf0R7N1vAHdgNX8HkMWdL684CYtDhNoPPma0=;
	b=nrmeeCTwkLp3al7wanSHEpw5ZpjBrw7Mv51JnRX46R7EHJq+3GKEPUmVWcnZzqtlHT
	1Ki5ENYOAZPxZ4l6GnE327HfAgxElPo/YMACWTca8LhEsU/Xuz7geARLJvSQlCx2GA4z
	awcFJMLov+FjZYE9YUC4qKPm7UVW5CoGAMgp4jdjBGrLO3YoF6SD7HD7oH2yVmMba3Wa
	TXQiCi4KU/SbT4HXhphTQtf7zDnbbrfIIloMt+HccgGoALUz/UJh2wlpjWbV/20sGSyM
	wOiiTttpUuyIb0TuXsWvLbhUXCSRRqZ4ab5/ZOhX7trbVozrdHVeJdUJCdjtv3VMrMmM
	lniQ==
X-Received: by 10.194.88.202 with SMTP id bi10mr25761736wjb.5.1358768103145;
	Mon, 21 Jan 2013 03:35:03 -0800 (PST)
X-Received: by 10.194.88.202 with SMTP id bi10mr25761713wjb.5.1358768102952;
	Mon, 21 Jan 2013 03:35:02 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm18239777wia.10.2013.01.21.03.35.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 03:35:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 11:33:05 +0000
Message-Id: <1358767985-7045-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlaPKiFbrQlOH7VSYEVwnWQFWRQP/pMTF8x9tSJJMawp5gcmeQmdIgLo3QOORyJHW5Ahf5PnRIOfO45agVhZhvaFC5O5KhTaOt3Fz0xNir8PAnimFyrV9a7Se+c9z9P10BpMrkx/QRQGiCJdsQwVM3t8mLoChfO91N3VpWLEpTOTVoosjT86CKy5b5nZGuvjQS7f/E2
Subject: [PATCH] udev: skip in systemd distros, to fix world builds
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
X-List-Received-Date: Mon, 21 Jan 2013 11:50:40 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/udev.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 9f60b17..facad0c 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -99,3 +99,9 @@ do_install_append () {
 
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
+
+# As systemd also builds udev, skip this package if we're doing a systemd build.
+python () {
+    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
+}
-- 
1.7.10.4



