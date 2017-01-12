Return-Path: <andre.draszik@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC5B56FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 10:42:27 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id ey1so1404419wjd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 02:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wOUPh4gApORh7X0BeklLx+I3CJpd/H+FLUXMY6tCqiM=;
	b=iote8uoYbIxhADTnrD992Xz4Qeu4luL/XHahJNV3yFgukUG7wqMYnT1fb2N5aUg8JE
	aaFk6dnRXz5b7dWQ6XknZyHTABs6QWtdZk7HfnH/xqbyIxZNeJMexBjgMnJla1exMHW8
	8TD4kuPyh9ACQnisiKqILT9pkjLw+dR7uMJjBlBEEE5FRfsuLWtrKx65QzlcjqbwskWd
	7iQM8r7XmhfoiAathP5XPu9JTrShlBeeAgYCJrGpCZTvDLuXVuLygHDhW155lgt5zfP2
	pShzeFVy+vUfYyBiARc57evDEakBKmHNFGCN/ULyPkW1dKxz9JiHmHhrVLgpd0z0/weP
	kzEA==
X-Gm-Message-State: AIkVDXJk28VapnjEG0MKwk0henP+2GHwWPySPGImoxo7a+cqQRaZ60AQ9Z9hhtbpTx59yQ==
X-Received: by 10.194.23.67 with SMTP id k3mr7926708wjf.215.1484217747712;
	Thu, 12 Jan 2017 02:42:27 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id w18sm2493498wme.9.2017.01.12.02.42.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 02:42:26 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 10:42:25 +0000
Message-Id: <20170112104225.26253-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] opkg-utils: use D instead of OPKG_OFFLINE_ROOT in postrm
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
X-List-Received-Date: Thu, 12 Jan 2017 10:42:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

While both result in the same in this case, postrm
should really be referring to $D as we do everywhere
else.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 4f90bcd13a..f6265959e9 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -45,8 +45,8 @@ RREPLACES_update-alternatives-opkg = "update-alternatives-cworth"
 RCONFLICTS_update-alternatives-opkg = "update-alternatives-cworth"
 
 pkg_postrm_update-alternatives-opkg() {
-	rm -rf $OPKG_OFFLINE_ROOT${nonarch_libdir}/opkg/alternatives
-	rmdir $OPKG_OFFLINE_ROOT${nonarch_libdir}/opkg || true
+	rm -rf $D${nonarch_libdir}/opkg/alternatives
+	rmdir $D${nonarch_libdir}/opkg || true
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


