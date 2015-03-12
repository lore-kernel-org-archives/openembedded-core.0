Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D4E5D73B40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 09:19:07 +0000 (UTC)
Received: by pabrd3 with SMTP id rd3so19038715pab.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AAcZLznDpsgAhsDZMneozY7UV71twtDhrSIj/ZWFH6o=;
	b=wE8iyRRCGZuX72QhVKe6Ff6+FgAcIIW4bak9M5uWZodP+RntHMRQfR8teFQry3iKNP
	0STSOhzZPTfuS6s4R+WYJVAtpJL/9tBkixRbSiHN1a0v9/KgU19ZT1MmGE4ZQpFgzc0e
	oaPDSARHpox2Tx8nel95fjAph+vXfJLHaXV0mh2ryEI5CfnG4/Jf1OMzgSSsdzVbQqTs
	47g+N8pNDJUROdNFyiF+6Yn3qpiT/7fHQ1RY23wSRfPBd4Pj3k8/QOz9Tbt2BChxAs0+
	7nVs+z5+IY+xCw0I5wBUmID5A4vLSNrxWCT4KCe4feqU6GEGotdHgatwIZQMPRpdwWyp
	ZtPA==
X-Received: by 10.66.97.106 with SMTP id dz10mr89469788pab.66.1426151949012;
	Thu, 12 Mar 2015 02:19:09 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id r8sm9995214pdp.10.2015.03.12.02.19.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 02:19:08 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 20:18:56 +1100
Message-Id: <1426151936-20243-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH v2] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 12 Mar 2015 09:19:11 -0000

The ownership needs to be explicitly set otherwise it inherits the user
and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index d5eed08..41f6b2c 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -153,6 +153,8 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
+	chown root:systemd-journal ${D}/${localstatedir}/log/journal
+
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
-- 
2.3.1


