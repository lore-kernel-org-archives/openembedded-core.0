Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7C77274934
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 19:15:52 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id m16-v6so7235546qtg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization;
	bh=/iN5jp0NLGxNrxKnoW5jEgwQf3UWO1AAC3q6BHFWvxU=;
	b=IWgrX5Y7RBQosBY0pWyEORb6rAK06OlkF8yyl1J1c/ANIIpWI985aZpgt9WYjh+Nq0
	IXQWK3ovlIUyb1qZ2MvRgIWiybaMOYNNKY5tXoJVxBBGltnRVrlFKzLR3GslUZaIGR9L
	D5ro9+ELTrpNOQihK+3jHtZBUPCnV8IH3uWb+zJomt831cYdSWTbCwc42igmP+CcxaNH
	EROLBrR1RerWGQgKGQSlBU+UmEN5gABoBMWw1k8UAfeZxAYblsia2EX6REtEtxSTZtzX
	ml2xHSXOQFQEUVU+WpZjEHUWa7Gl7avE47SELym/6479NLJ4kIcsZ5TyfxRXyhKHrK3a
	aDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization;
	bh=/iN5jp0NLGxNrxKnoW5jEgwQf3UWO1AAC3q6BHFWvxU=;
	b=IMGKdKVeYLYjQE/mjOfz9ZEKbI4tEieME1TkTPgkZTf5bQuqHmLz0sDLcxb25mla7k
	kCU028S1j/0WO6++/4i/TXt5BaBm2S1zk17vc7p8iuvzds747jS6EBacsgXx4du+qVIe
	APOpRZLb6bh7fI+sAYFiIwnDthhUcNUjgfb7btmoxApo3lVTfal4laNVJbjf21TEGKmP
	cYBnDGFr+PZM8AV0+1GgIkQo4BKIZAtmk7Qm1Q9AiL1xarHKtWNhpANRZ8ozSghUMdyU
	I8z9D1j0YBmszvLV3gWHnf10pIENmmBqmwECSVoTtfNkj6U1XtjJLnbNj4nSUuzGAyNd
	0YyQ==
X-Gm-Message-State: ALKqPwfI7oc/Bcm3CbePtKO8d4Bv4ipYSKQ0SrNCFkMfvHKx/t5V+w65
	KXFPFveO2dxlS30StQMCBDcNzP1q
X-Google-Smtp-Source: AB8JxZrVql9gEOnsPymFoEARX0SI2C+JowGiMoryaCSMQRNBAh37V4hA9mIeoQWKXimfxKP4FGDALA==
X-Received: by 2002:ac8:5293:: with SMTP id
	s19-v6mr6363685qtn.311.1526584553774; 
	Thu, 17 May 2018 12:15:53 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	s19-v6sm4403831qki.62.2018.05.17.12.15.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 12:15:53 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 16:15:36 -0300
Message-Id: <20180517191536.12283-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] systemd: Add util-linux-umount to RDEPENDS
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
X-List-Received-Date: Thu, 17 May 2018 19:15:53 -0000

Images with systemd fails on reboot with error:

   [FAILED] Failed unmounting Temporary Directory (/tmp).

This happens because busybox umount command doesn't has -c
option. Add util-linux-umount that has this option to fix
this issue.

See details: https://github.com/systemd/systemd/issues/7786

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-core/systemd/systemd_237.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index b7c2113255f..3b0f4580d49 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -478,7 +478,7 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
-- 
2.14.2


