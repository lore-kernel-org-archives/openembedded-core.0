Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A1CF4770D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:54:57 +0000 (UTC)
Received: by pasz6 with SMTP id z6so31689967pas.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rPIblvbnYwEdsjRkQNWI4G/G6VFtNeDiAo7hwKmUsvc=;
	b=S0kYJaXEZb2mvlofnVbKFR5vbjsKykmebrMH9oihpi4d6/cDnjZ+oKY5xegABkG8/2
	0UROqU1htkYJ5pxaGAK5eAcrR2PHlW6vXOoAZIXNkMyyf+f5glqKSwOXaWBT5Fzh408P
	u+ECxiDvWvH4XGfY224+anKU2gKU1h211GEtVgnc6HR4WDpphs5hWf22eO9bvRFdhau6
	TFWtncLv2pBY5Za9mR0QtpwcjUl94rxF9ij7H0x8DnMRlsEOrqh6UuJ45lZoVQB7Ozkr
	j/oqazpDIpPt6MI7T4ApvriI0nYuCf2zYCUdcBcPIIZE02aIz/OUUZ2MngjFJIvP7QIK
	x+GA==
X-Received: by 10.66.194.16 with SMTP id hs16mr36440727pac.93.1446591297606;
	Tue, 03 Nov 2015 14:54:57 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	ha3sm31427036pbb.28.2015.11.03.14.54.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 14:54:57 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 16:54:35 -0600
Message-Id: <1446591276-28139-4-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
In-Reply-To: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
References: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 3/4] systemd: add machine-id to conffiles
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
X-List-Received-Date: Tue, 03 Nov 2015 22:54:59 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

If / is mounted read-write machine-id will be overwritten on first boot.
This change ensures that the machine-id file persists across package
upgrades to systemd.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/systemd/systemd_225.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 5106401..5f6be82 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -268,7 +268,8 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
-CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
+CONFFILES_${PN} = "${sysconfdir}/machine-id \
+                ${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/logind.conf \
                 ${sysconfdir}/systemd/system.conf \
                 ${sysconfdir}/systemd/user.conf"
-- 
2.6.2.11.gb05c2f9


