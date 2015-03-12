Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id EFE3173B3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 09:20:23 +0000 (UTC)
Received: by paceu11 with SMTP id eu11so19046245pac.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 02:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=y9FOv6EfFmXSX+UM3nxICUqZblTCr1M2S6k4YTd2AXI=;
	b=im/gwA+yUf2Y1u0eGhoovjEntQvaSbjogPCGcpFY5FJHvXgv0zve65bU5QG4KfAYc7
	16RRzdig27fY8WYe1b5/aerKrZWUBYK/uinS9OXoS38h4TDsJpd/TIEnPiEJkfcFLZp6
	1nS+ySfycbn6cDbM1YcFlm2k2kBkMEorh0jhdElgTUKFlU5TG1zbyubvl8N8nU46ehyR
	KE6hIXkL/x6ETNllxLaUK8lak/lc0u9dtBvYlA0a6sNYTq5miN8qfWcj3wFU0JmikzgP
	7IFU/IDXJ2FhLSKiLcIDNkKLNrZVpDxv2/GlH14rpM9YKarDGadqkioyHjAStySiFIPE
	/vqg==
X-Received: by 10.66.233.194 with SMTP id ty2mr28519861pac.4.1426152024694;
	Thu, 12 Mar 2015 02:20:24 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id pm9sm9871374pdb.59.2015.03.12.02.20.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 02:20:23 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 20:20:11 +1100
Message-Id: <1426152011-20488-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [dizzy][PATCH v2] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 12 Mar 2015 09:20:24 -0000

The ownership needs to be explicitly set otherwise it inherits the user
and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 3852841..1eb4019 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -136,6 +136,8 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
+	chown root:systemd-journal ${D}/${localstatedir}/log/journal
+
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
-- 
2.3.1


