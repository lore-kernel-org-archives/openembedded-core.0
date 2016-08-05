Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 27EEE77116
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:11:10 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id q128so37084233wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=A6emAxQ+eolmyntN3MgPKtZrn5lBls6wCpnmX8+68Do=;
	b=kXIyv4S2DtMbE6z1mfu9YwRn+aKOkRgwKQ6QbxIrkCKgoMLbLEx0ux3TubVSaPURkY
	lMf9RVUG5dv2LZLUrx8PWBtWo/dGUyaDA7+ur6PIoy+C3TSmhAczbmdPCxyYOzaqWfig
	thfoYDuPgnzbhf2kgt3tiFt1+fTEsOensA5ydeMKWTj3bqF9CQOKBrA/JPicBp+m0J/v
	vykMfmuob52OSVbE9av3pnb4nc2dUDRf764X3NfiwOm4T560yG4Fsp+kQrPOJ535wZdI
	bZ0ePsDYeJjBcNSHjTbOBO/D2WpcQdGdL0VhxxTTQBrlcN7Y7e21E7C1Bs7ic1K2tzoc
	/DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=A6emAxQ+eolmyntN3MgPKtZrn5lBls6wCpnmX8+68Do=;
	b=QHuN56zIIRmzNGWGGs2DNirFnIgi+E8dd4JIRYb/wYBWDyDluiCAlaPn6uVhsuqXfB
	5OV6IzVB9wazmeqB2P6OuNKEBGIxvCXVHcG0kUq3KhwXPT8xjAQCPT0bp13yzyX5HkH2
	0EbWKJsoiXsPoYhiuKCPHsfbqjeoT9Ic4luP1NZ+CQb3MEZSfC6P5Y/rFOgMqHSJ5GnR
	PYQdvE7FHWCxegmozxyGn8Wey62mskUohWmJD639JLzirfcW/hUSq1f+nVqXxsOGIJjo
	OIF5l+20R10YslIys+SK5px3d29gtBqv7mIL6hqd417JQWRcVrQiChRnjohlb4fQ+C/C
	cvKA==
X-Gm-Message-State: AEkoouviqKvaXtPyh5LMJW1a9XpEuSHP0MDF6wYyJub/on6r7/4sIIQ7VoMBPb/C/BV69g6X
X-Received: by 10.28.29.211 with SMTP id d202mr4059275wmd.64.1470413470753;
	Fri, 05 Aug 2016 09:11:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	jq5sm5389320wjc.20.2016.08.05.09.11.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 09:11:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 17:11:07 +0100
Message-Id: <1470413467-10175-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] consolekit: don't ship /var/log/ConsoleKit
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
X-List-Received-Date: Fri, 05 Aug 2016 16:11:11 -0000

This directory is created on demand, and won't be visible if /var/log is a
tmpfs, so don't bother shipping it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 2974e36..ceac0fe 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/s
 PACKAGECONFIG[policykit] = "--with-polkit,--without-polkit,polkit"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--with-systemdsystemunitdir="
 
-FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \
+FILES_${PN} += "${exec_prefix}/lib/ConsoleKit \
                 ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
                 ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
 
@@ -45,6 +45,6 @@ do_install_append() {
 			> ${D}${sysconfdir}/tmpfiles.d/consolekit.conf
 	fi
 
-	# Remove /var/run from package as console-kit-daemon will populate it on startup
-	rm -fr "${D}${localstatedir}/run"
+	# Remove /var/ directories as the daemon creates them as required
+	rm -rf ${D}${localstatedir}
 }
-- 
2.8.1


