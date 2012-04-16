Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsvZ-00055g-5g
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:37 +0200
Received: by obceq6 with SMTP id eq6so1435998obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6abhTjzBdmDj5bYe2XDlldOkweasVhzNgUf8zavp9OM=;
	b=jLjJIKt660WtA7CYN7VAtRke0cqLzv64cTjjt3MIYrAGm5JVNAc6Nvv/pOCVF5QAIl
	PCR1kqIfhD0BqYd3OvzqJnxGbRZWkzGVAq8/fsaFZjg/jUzmDVk4TdCezwH8kRpZmZhi
	qle6NuKI6M9WP+G1/9isfWkV/QkzLJpt3hSru6g4v/8lDJgrcyvvDnvwG0mFwKdkZTh6
	rb+yzU9HQd2Rb8zq42laUeTMZx2oh7MlcxrSSx40tEaNE1GUABPUt0zWtBXJrhtkzJde
	P6N7kH9xRogop4hV6GbnteeVvs0NXFcyYOz15rKPAWaXcAB0cAqkyBrhVnq8X3uQTfBo
	1JWw==
Received: by 10.182.131.7 with SMTP id oi7mr18056465obb.74.1334609051507;
	Mon, 16 Apr 2012 13:44:11 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hh2sm20659762obb.1.2012.04.16.13.44.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:44:10 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:43:59 -0500
Message-Id: <3289f0b2fa5773360ba3e5a61697ad3c7c1b3ebc.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
References: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
Subject: [PATCH 2/7] libc-package: fix handling for 'precompiled' locales
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 20:53:37 -0000

Due to how the 'supported' locales were being generated (added '  ' twice for
locales with '.' in them), one could end up with the locale-base packages in
your PACKAGES twice, causing packaging problems with eglibc-locale.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/libc-package.bbclass |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index bb4ba68..65feae2 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -221,11 +221,13 @@ python package_do_split_gconvs () {
 		supported = []
 		full_bin_path = d.getVar('PKGD', True) + binary_locales_dir
 		for dir in os.listdir(full_bin_path):
-			dbase = dir.split(".")
-			d2 = "  "
-			if len(dbase) > 1:
-				d2 = "." + dbase[1].upper() + "  "
-			supported.append(dbase[0] + d2)
+			elements = dir.split('.', 1)
+			locale = elements[0]
+			if len(elements) > 1:
+				charset = elements[1]
+			else:
+				charset = ''
+			supported.append('%s %s\n' % (locale, charset))
 
 	# Collate the locales by base and encoding
 	utf8_only = int(d.getVar('LOCALE_UTF8_ONLY', True) or 0)
-- 
1.7.7



