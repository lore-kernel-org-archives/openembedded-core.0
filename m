Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E395F7C128
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:27:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 7109F5C08D0;
	Tue, 15 Jan 2019 23:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547591255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=T4jq29RtSUrSH96MMz+v2IUYODcnnpc2ZaV7E9QvHzU=;
	b=SLwYWW9WK6o9p9do6BtCTpBdnf9Co3niCA0Sk7Zc5iLROcrtwic53tkmsQxqFzQ68S0Bha
	GBC0HqiXJrj0LprTUP92ToavkEypEqN+mcUT3gTr2TRg19U8C1AFfBhfoXeRVO+MEzFF3s
	HnvI5tbFUgap02pYf2ZBwetvSIcDg20=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 23:27:26 +0100
Message-Id: <20190115222730.54560-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190115222730.54560-1-stefan@agner.ch>
References: <20190115222730.54560-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 1/5] systemd: only enable polkit if DISTRO_FEATURES asks for polkit
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
X-List-Received-Date: Tue, 15 Jan 2019 22:27:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Only add polkit to PACKAGECONFIG if polkit is in DISTRO_FEATURES.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index be836ffa42..586ef65299 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -76,7 +76,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrmerge', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
@@ -94,7 +94,6 @@ PACKAGECONFIG ??= " \
     myhostname \
     networkd \
     nss \
-    polkit \
     quotacheck \
     randomseed \
     resolved \
-- 
2.13.6


