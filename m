Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7C478049
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 17:17:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m127so9699975wmm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UQXDpaTYMoe443EDZi3Gd6b7ZauwQtV+HUJ7TTaypX8=;
	b=FQTktXVjJXZ3k6UoIbL4/LNxnPAiEE2qJIfrsjCKc5Xxv0SJQYUL/QetODfE+U97wt
	dndkY9qEbJdBCwSuP+pyRR8AQwMqGv112usDfPGk+3JHsq9O0TbdHG7u1mqwIziboLyk
	bb37GPlvcnb9XmoiIC7iJm53Gy9zdKvWXCHeAG6DBCoNDOEPo86928H52BKIuKJUZ6po
	0hsG+H3sifRjL/3hl9DI9aVBCkjUFaud3jR3p7jB+cuTlJ/7H0XQeaZw0Bcq8ktLlpZZ
	A7WMsqblUSPMWEhRtXcoN+Mq3OP8Dvirjz+gTzYf3TMWp8SC9CJ5C93IvDH9uZcNcCQf
	hf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UQXDpaTYMoe443EDZi3Gd6b7ZauwQtV+HUJ7TTaypX8=;
	b=acYzDH4nMQZGM7Hkt+YkqXJNaQl/q4ElFbK4wPR+kreE9iZoGa6NPtgQCvBsza7gv6
	4uF4fJuPYJGqo8Ycj560yJ0jFuVSlaxYGfrKvcwbre8bLC7YenGFVuWgEqPhrz+/DkkM
	AoX4oqP/B0ndBGLMMzQGv5iUdgkZmbP2Ob2g90mPvZ7nViJ87ye5qKMWMv+u+eWE3Aik
	ciCYYGsMEL55IkFCatY8AJML36c3+6Kd4+klQppwLtFjAgdYO8TANjdCTwr/aFXThELf
	TXfEWpHBtndOPL+TwSC4kfjIxmIMY6GwqtBHwKUIkIPzdH/2cDvZTePArcBufsquORhU
	72CA==
X-Gm-Message-State: AHPjjUg44Xt+qxIRDXnebPK4z2NW/i7UEKutakXsnEGnMEbrL15LQcfD
	TLJ4SuSePkhuaMfor6SNzVWYWA==
X-Google-Smtp-Source: AOwi7QB+OgsU6Df4k2VPpOjZJSpRqk93rpQnIHNgyDlNJ3qTslaqk/rfCZkczLESNCgtkcE856QHyQ==
X-Received: by 10.80.227.136 with SMTP id b8mr18483721edm.275.1506446234464;
	Tue, 26 Sep 2017 10:17:14 -0700 (PDT)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	z102sm5585239ede.85.2017.09.26.10.17.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 10:17:13 -0700 (PDT)
From: andreas.kling@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 19:17:08 +0200
Message-Id: <20170926171708.19010-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170925085929.16112-1-andreas.kling@gmail.com>
References: <20170925085929.16112-1-andreas.kling@gmail.com>
Subject: [PATCH v2] systemd: move pam files to own package
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
X-List-Received-Date: Tue, 26 Sep 2017 17:17:14 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  move pam related files to already existing systemd-pam package.
  add runtime dependencies to required pam plugins.

  This ensures pam plugins required by /etc/pam.d/systemd-user
  to open a user session are installed.

  systemd[1]: Starting User Manager for UID 994...
  systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)

  v2: improve commit message

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 meta/recipes-core/systemd/systemd_234.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 881896bfb5..137070e48b 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -100,7 +100,7 @@ PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PN}-pam"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 # Update NAT firewall rules
@@ -435,6 +435,17 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
 
+RDEPENDS_${PN}-pam += " \
+                        pam-plugin-unix \
+                        pam-plugin-loginuid \
+                        pam-plugin-keyinit \
+"
+
+FILES_${PN}-pam = " \
+                    ${sysconfdir}/pam.d/ \
+                    ${base_libdir}/security/*.so \
+"
+
 CONFFILES_${PN} = "${sysconfdir}/machine-id \
                 ${sysconfdir}/systemd/coredump.conf \
                 ${sysconfdir}/systemd/journald.conf \
@@ -451,7 +462,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/machine-id \
                 ${sysconfdir}/modules-load.d/ \
-                ${sysconfdir}/pam.d/ \
                 ${sysconfdir}/sysctl.d/ \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
@@ -460,7 +470,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/resolv-conf.systemd \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
-                ${base_libdir}/security/*.so \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \
-- 
2.14.1


