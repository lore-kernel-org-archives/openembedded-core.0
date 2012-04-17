Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SKAkA-0002aH-SO
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:55:03 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so2643545obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6abhTjzBdmDj5bYe2XDlldOkweasVhzNgUf8zavp9OM=;
	b=1AeWao+342CwdkttqtyLHoiRfgXHY69OrideEwRpUbQAduPJcKvwMQC/pfhOK/R/wF
	NB3GnPX4NU+sG2lsUWyY3IHImJyNwl7nIgQyw8Wc4Git5dljD4A5Gnjn7eadnAIP15xI
	U0Yc4wRhnPIQbYZy44Jid1PyTToaiDbkP1nA4/zdist06gs8G8hom3Eo/oJ7WjkIsUng
	GATOaRVW6kRDluK6DJvWY+uINp1745BOgpScHrRyN1+YEq2AZcQEYbbzH/gVZieuZB8m
	vxJwyIW32M/5WxKjaxAo/m7RRk6igGc8J2SCfL0eHq1Rk7oHtbI5FTkqXpO81z6xBbom
	Hncw==
Received: by 10.182.141.9 with SMTP id rk9mr21919412obb.50.1334677538667;
	Tue, 17 Apr 2012 08:45:38 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id w4sm18810371oeg.12.2012.04.17.08.45.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:45:37 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 10:45:12 -0500
Message-Id: <3289f0b2fa5773360ba3e5a61697ad3c7c1b3ebc.1334677440.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
In-Reply-To: <cover.1334677440.git.kergoth@gmail.com>
References: <cover.1334677440.git.kergoth@gmail.com>
Subject: [PATCH 2/6] libc-package: fix handling for 'precompiled' locales
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
X-List-Received-Date: Tue, 17 Apr 2012 15:55:03 -0000

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



