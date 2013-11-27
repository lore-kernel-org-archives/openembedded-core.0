Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 384756DE52
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:46:16 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so5048506eak.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uqtmomrmjL8oV2rAD9QOwLvYQw8fpLtuHWEPCfmcPDo=;
	b=h4ZBd1rnDAQpo6TZYvHs8Y4ZLp6cLjiOdhtHRyGcxowwEC64Zar0haBz0jH04hax3a
	RN570EUHD9o3AWI8cwTuHzFhU3rxGJWSoPciQ96pZ1VyfRw6h19OXj4Gca4G5Fh6wny0
	Z0W9rBlUF5VOrygRSRsHibqQU02CQeIWSaHd/THoeCHPd8Tub67EpyectLrOd3ovty48
	IHUYOI8DNpX8uQ9dAoMmAb7PdzCDFLk2XS+61dNTDrbnivYBG5Uiu7089LtpRwxPA4LQ
	JI+jyCVGMRF7YkkCCpWoJSqZmBXalXn0J8ox3jACBPAfbKaFKlA+L1Pfg/Iw8sQnwS9E
	P+Qw==
X-Received: by 10.15.31.138 with SMTP id y10mr3831eeu.136.1385577975526;
	Wed, 27 Nov 2013 10:46:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm22213813eeg.4.2013.11.27.10.46.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Nov 2013 10:46:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 19:46:15 +0100
Message-Id: <1385577975-3742-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1385517143-2228-1-git-send-email-Martin.Jansa@gmail.com>
References: <1385517143-2228-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] icecc: Don't replace non-empty PARALLEL_MAKE with empty ICECC_PARALLEL_MAKE
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
X-List-Received-Date: Wed, 27 Nov 2013 18:46:16 -0000

* it's needed for use-case like this:
  # Inherit icecc here, so that all builders have the same sstate signatures
  INHERIT_DISTRO += "icecc"
  # and then disable its function by default (so that people still need to explicity
  # enable it in local.conf if they have configured icecc and want to use it.
  # You need to set _empty_ value in local.conf to enable icecc function:
  # ICECC_DISABLED = ""
  ICECC_DISABLED ??= "1"
* so default ICECC_PARALLEL_MAKE is still empty, but we want build
  to respect our PARALLEL_MAKE, unfortunately we cannot do something
  like ICECC_PARALLEL_MAKE ??= "${PARALLEL_MAKE}", because that would
  cause PARALLEL_MAKE to reference itself.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index ef8761a..60263a8 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -146,7 +146,7 @@ def icc_version(bb, d):
         return ""
 
     parallel = d.getVar('ICECC_PARALLEL_MAKE') or ""
-    if not d.getVar('PARALLEL_MAKE') == "":
+    if not d.getVar('PARALLEL_MAKE') == "" and parallel:
         d.setVar("PARALLEL_MAKE", parallel)
 
     if icc_is_native(bb, d):
-- 
1.8.4.3


