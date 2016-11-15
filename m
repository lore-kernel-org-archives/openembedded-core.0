Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.40])
	by mail.openembedded.org (Postfix) with ESMTP id D83A071A07
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:08:23 +0000 (UTC)
Received: from 1c6Zj6-0000Q4-Ua by out11a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj6-0000QZ-Uw
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:24 -0800
Received: by emcmailer; Tue, 15 Nov 2016 01:08:24 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj6-0000Q4-Ua
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:24 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 15 Nov 2016 10:08:24 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 10:08:15 +0100
Message-ID: <1479200900-39007-6-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479200900-39007-1-git-send-email-sona.sarmadi@enea.com>
References: <1479200900-39007-1-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCHv5][krogoth 06/11] curl: CVE-2016-8620
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
X-List-Received-Date: Tue, 15 Nov 2016 09:08:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

glob parser write/read out of bounds

Affected versions: curl 7.34.0 to and including 7.50.3
Reference:
https://curl.haxx.se/docs/adv_20161102F.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8620.patch | 44 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8620.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8620.patch b/meta/recipes-support/curl/curl/CVE-2016-8620.patch
new file mode 100644
index 0000000..613ace3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8620.patch
@@ -0,0 +1,44 @@
+From fbb5f1aa0326d485d5a7ac643b48481897ca667f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 3 Oct 2016 17:27:16 +0200
+Subject: [PATCH] range: prevent negative end number in a glob range
+
+CVE: CVE-2016-8620
+
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102F.html
+Reported-by: Luật Nguyễn
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ src/tool_urlglob.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/tool_urlglob.c b/src/tool_urlglob.c
+index a357b8b..64c75ba 100644
+--- a/src/tool_urlglob.c
++++ b/src/tool_urlglob.c
+@@ -257,6 +257,12 @@ static CURLcode glob_range(URLGlob *glob, char **patternp,
+         endp = NULL;
+       else {
+         pattern = endp+1;
++        while(*pattern && ISBLANK(*pattern))
++          pattern++;
++        if(!ISDIGIT(*pattern)) {
++          endp = NULL;
++          goto fail;
++        }
+         errno = 0;
+         max_n = strtoul(pattern, &endp, 10);
+         if(errno || (*endp == ':')) {
+@@ -277,6 +283,7 @@ static CURLcode glob_range(URLGlob *glob, char **patternp,
+       }
+     }
+ 
++    fail:
+     *posp += (pattern - *patternp);
+ 
+     if(!endp || (min_n > max_n) || (step_n > (max_n - min_n)) || !step_n)
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 9ef5718..e6ad03f 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -20,6 +20,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-8617.patch \
              file://CVE-2016-8618.patch \
              file://CVE-2016-8619.patch \
+             file://CVE-2016-8620.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


