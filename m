Return-Path: <drew.moseley@northern.tech>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id BB3A96C13D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 15:20:43 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id c189so3556541qke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 08:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google; h=from:to:subject:date:message-id;
	bh=BVim+VMBo4XLLXiHrR2LQ7HJwpfAfT0rubvtyxhszUQ=;
	b=GUg0MGsDoEXT/vFFXQGT+MnVi7VMh08v34f88gT5GiL/vmzP1hhKtKno8S5hF+iQhC
	rYO2FN7GYAs49RKcuoNY3niVrNE4j2hl535h5SKfo2HxVK+1IZd83dPn92Hw8kaUQxUM
	CK+z6LpEe3jtO0b+gpikVU8z2581EGHVfCA2+HRuOkwQ6DzdcP5wupOj5wk7L63YxFWD
	rch8WnEoiHq3TuPsNrIE3qld3Kx3sZd8IqE6zL02WTVOwGZtt2R8qjOnqoJVSETRgmPJ
	NOb9EDo32GmZn7hCWpJTdjKmRbNzjQ/FsndzwXc8PVP1XNvf6QotmnJlICkot+ZXiQs7
	jk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BVim+VMBo4XLLXiHrR2LQ7HJwpfAfT0rubvtyxhszUQ=;
	b=hm0ru4Joz0aOgI8xBA3rQqzDcBfK1Cau/NDq/OYPJsM+KmOTv0K7YI1wifwgmJCFig
	oXd6PB0DBTeENXs1YH4KsimpFO9x+LxprJYiv6D7cW/amUj2iBsdFCylQbfgXj0rEwRi
	J8VwY1jhIjmtmvHR5B1GwBFQSl/7EqDHx44sWf+vSeFw668UDkGSXInvBRJWBbMzVmLk
	KEnuFPWdfxvHf62QixfGFIUfvLzMRNHLZ0OVqGeg2CGaXgdrPWYXRbpsRLH3PgNReD9V
	sx/DucsFKmwHcJm88f7kCkQSXVkOy0Eoi9tC5eTWSN7YnhNs2OorOnZ1sMAZYudvCRdz
	RlSg==
X-Gm-Message-State: APjAAAUa2k5RE1JKu+GUy4Ub8cHSFd2YA6U4CLG3td0pP6BDdnLAMPT6
	+c5viDdaBVHkcLxiSG10kjlKQiF9VD7KQw==
X-Google-Smtp-Source: APXvYqwIKWvI8BabiA2FKI4o7bgc/dVrUd51iHwHCx7NRQPVjbfGBl9qiTugChjxOX8lhRCl4MciLQ==
X-Received: by 2002:a37:5f47:: with SMTP id t68mr30206933qkb.108.1552576844095;
	Thu, 14 Mar 2019 08:20:44 -0700 (PDT)
Received: from ip-172-30-0-144.cloud.cfengine.com
	(ec2-54-89-104-206.compute-1.amazonaws.com. [54.89.104.206])
	by smtp.googlemail.com with ESMTPSA id
	d21sm8580989qkb.47.2019.03.14.08.20.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Mar 2019 08:20:43 -0700 (PDT)
From: drew.moseley@northern.tech
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 15:20:30 +0000
Message-Id: <1552576830-121424-1-git-send-email-drew.moseley@northern.tech>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] networkmanager: Use ALTERNATIVES for resolv-conf handling.
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
X-List-Received-Date: Thu, 14 Mar 2019 15:20:43 -0000

From: Drew Moseley <drew.moseley@northern.tech>

This brings the networkmanager in sync with how systemd-resolved and connman
work. Additionally this allows it to function with a read-only rootFS.

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
---
 .../networkmanager/networkmanager_1.14.4.bb                  | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index 26c40a5..86a5322 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection gtk-doc
+inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection gtk-doc update-alternatives
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -138,6 +138,16 @@ FILES_${PN}-nmtui-doc = " \
 
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service NetworkManager-dispatcher.service"
 
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
+ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
+
 do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
+
+    # For read-only filesystem, do not create links during bootup
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
+    fi
 }
-- 
2.7.4


