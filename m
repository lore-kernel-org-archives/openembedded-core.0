Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 61F877F35C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:47:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so8134840wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 03:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5SXahGZOob6RQY9895ThwFJHJrlISC9WeOsGIiHult8=;
	b=WZfcpSq6Lnerq3KrAs0zJdPB7uX2OyP6a2fkPhe2xnvybA3JFBkoetsljTWj+E+FVU
	4KAWFiP6vm+FnR/RUhi9MT3hY9iXVwnlcbf0AQYpkCvoRcDdCrExZLiKUwenBrJnMWyd
	JSoXJh6KjrmRhBklVRzTwKfKfuHiufK6AHD1o/JtBbTpZtwwU3nlan41WrQjYCMya+7Q
	Z4Ub3UPD2KtIqUePEXKUBxgG6J92UlaGvUJGILOfBmLtb4Z78Q46sdOBa2h8EWhuGkxU
	cZknOBzlkMZYCv9mWI51bFf+Y2u0X7WEEhqXRkpKRfhXxds1D67GrgwW8OsEgkgTmJ8M
	ktNQ==
X-Gm-Message-State: APjAAAWO+jOwLye4KZDpUf1PwnKwdGHoF5ldfQGFX+eELS0rn0jtKDXq
	aAPHjz+HPWoCledTYAGmYDKfvgWu
X-Google-Smtp-Source: APXvYqxvjAlEsGzO/M+KbYArKXS6UE4LnBpKhrpO6HEUe3/FN26AezQle24Du2y4C99vyNgW1THMXA==
X-Received: by 2002:adf:e747:: with SMTP id c7mr19333770wrn.384.1571654820907; 
	Mon, 21 Oct 2019 03:47:00 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s10sm17111334wrr.5.2019.10.21.03.47.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 03:47:00 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 11:46:59 +0100
Message-Id: <20191021104659.27059-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH] connman: mark connman-wait-online as SYSTEMD_PACKAGE
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
X-List-Received-Date: Mon, 21 Oct 2019 10:47:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The connman-wait-online package currently isn't marked as
systemd-enabled package. This means it is impossible to
auto-enable the service during image creation or package
installation, as no preset files and no pkg_postinst()
snippet is being created.

This change should have been done as part of the
upgrade to v1.31

Note:
connman-wait-online is needed when connman is in use
in more complex network/interface setups for systemd's
network-online.target to report success.
systemd-networkd's systemd-networkd-wait-online.service
alone doesn't work in such scenarios and simply times
out, as it know nothing about the expected network/
interface configuration, meaning the target doesn't
boot successfully (systemctl list-units --failed),
and long delays are seen, caused by waiting for the
systemd-networkd-wait-online.service timeout.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ee00479926..fb38ab4fc1 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -59,7 +59,7 @@ INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
 python __anonymous () {
-    systemd_packages = "${PN}"
+    systemd_packages = "${PN} ${PN}-wait-online"
     pkgconfig = d.getVar('PACKAGECONFIG')
     if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
         systemd_packages += " ${PN}-vpn"
-- 
2.23.0.rc1


