Return-Path: <net147@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id F206C65CD0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 01:14:21 +0000 (UTC)
Received: by pdjp10 with SMTP id p10so53757257pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Mar 2015 18:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z0MlpOZE1160exoFBMk6CrVmSd0B8FwfnwZawvYaSqg=;
	b=1B6NcmQthmebhUttlT8ivfufQtGhWnJMcQLEFrBlaQP7Y5mAA7mvciT8LOJsXhZbQ6
	Nw/T1f3yQ7+uLX1FkoAPBUbkP9Hx5dcVi1JbCxkCLI7nrDMomygUXL+fT3rIwHut8LY3
	eKUIeZXa5NJlq5QJuYjYoTGSCsA0FaFIg6XqU3xAgfUE5JvkGGkylnmXdkilAgLnGk/U
	mfAk1sCqL/9jwVmpuyTG4QfxKCOnOqgCrO0uRNr1/8QlbhsZX/7SSP34coHRjm0nXfIG
	LdiupjoB/dlwxN1BYGK77hb9G8dJfVLlmYx2iJ4E0nvdF5s3VudDFuUU8VfKqP8XXfnO
	4V6A==
X-Received: by 10.66.150.165 with SMTP id uj5mr5093816pab.54.1425863662481;
	Sun, 08 Mar 2015 18:14:22 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id tr8sm4592517pab.4.2015.03.08.18.14.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Mar 2015 18:14:21 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 12:13:56 +1100
Message-Id: <1425863636-5742-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Mon, 09 Mar 2015 01:14:22 -0000

Appending to PACKAGEFUNCS results in the font packages missing the
postinst/postrm scripts and the fontconfig cache not being generated
in /var/cache/fontconfig when creating images or installing font
packages. This is because the package data has already been emitted
by emit_pkgdata in PACKAGEFUNCS. Prepend to PACKAGEFUNCS to ensure
add_fontcache_postinsts is executed before emit_pkgdata.

[YOCTO #7410]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/fontcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 2bf1e4b..dcd1f04 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -42,4 +42,4 @@ python add_fontcache_postinsts() {
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
-PACKAGEFUNCS += "add_fontcache_postinsts"
+PACKAGEFUNCS =+ "add_fontcache_postinsts"
-- 
2.3.1


