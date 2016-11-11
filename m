Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2498A71AAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 09:49:17 +0000 (UTC)
Received: from 1c58SV-0002jU-TG by out10a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SV-0002k8-Tj
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:19 -0800
Received: by emcmailer; Fri, 11 Nov 2016 01:49:19 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SV-0002jU-TG
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:19 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 11 Nov 2016 10:49:18 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Nov 2016 10:49:14 +0100
Message-ID: <1478857754-61379-12-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1478857754-61379-1-git-send-email-sona.sarmadi@enea.com>
References: <1478857754-61379-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Cc: sona@enea.se
Subject: [PATCH][krogoth 12/12] curl/url: remove unconditional idn2.h include
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
X-List-Received-Date: Fri, 11 Nov 2016 09:49:19 -0000
Content-Type: text/plain

Mistake brought by 9c91ec778104a [fix to CVE-2016-8625]

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../url-remove-unconditional-idn2.h-include.patch  | 28 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch

diff --git a/meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch b/meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch
new file mode 100644
index 0000000..e2a88e4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/url-remove-unconditional-idn2.h-include.patch
@@ -0,0 +1,28 @@
+From c27013c05d99d92370b57e1a7af1b854eef4e7c1 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 31 Oct 2016 09:49:50 +0100
+Subject: [PATCH] url: remove unconditional idn2.h include
+
+Mistake brought by 9c91ec778104a [fix to CVE-2016-8625]
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/url.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index c90a1c5..b997f41 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -67,8 +67,6 @@
+ bool curl_win32_idn_to_ascii(const char *in, char **out);
+ #endif  /* USE_LIBIDN2 */
+ 
+-#include <idn2.h>
+-
+ #include "urldata.h"
+ #include "netrc.h"
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index a7f6917..7fab7cf 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -26,6 +26,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-8623.patch \
              file://CVE-2016-8624.patch \
              file://CVE-2016-8625.patch \
+             file://url-remove-unconditional-idn2.h-include.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


