Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.33])
	by mail.openembedded.org (Postfix) with ESMTP id 630D871AA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 09:49:16 +0000 (UTC)
Received: from 1c58SS-0002FI-VO by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SS-0002GW-Vq
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:16 -0800
Received: by emcmailer; Fri, 11 Nov 2016 01:49:16 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SS-0002FI-VO
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:16 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 11 Nov 2016 10:49:16 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Nov 2016 10:49:04 +0100
Message-ID: <1478857754-61379-2-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCH][krogoth 02/12] curl: CVE-2016-8616
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

case insensitive password comparison

Affected versions: curl 7.7 to and including 7.50.3

Reference:
https://curl.haxx.se/docs/adv_20161102B.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8616.patch | 49 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8616.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8616.patch b/meta/recipes-support/curl/curl/CVE-2016-8616.patch
new file mode 100644
index 0000000..d5d78fc
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8616.patch
@@ -0,0 +1,49 @@
+From b3ee26c5df75d97f6895e6ec4538894ebaf76e48 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Sep 2016 18:01:53 +0200
+Subject: [PATCH] connectionexists: use case sensitive user/password
+ comparisons
+
+CVE: CVE-2016-8616
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102B.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/lib/url.c b/lib/url.c
+--- a/lib/url.c	2016-11-07 08:50:23.030126833 +0100
++++ b/lib/url.c	2016-11-07 09:16:20.459836564 +0100
+@@ -3305,8 +3305,8 @@
+       if(!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) {
+         /* This protocol requires credentials per connection,
+            so verify that we're using the same name and password as well */
+-        if(!strequal(needle->user, check->user) ||
+-           !strequal(needle->passwd, check->passwd)) {
++        if(strcmp(needle->user, check->user) ||
++           strcmp(needle->passwd, check->passwd)) {
+           /* one of them was different */
+           continue;
+         }
+@@ -3369,8 +3369,8 @@
+            possible. (Especially we must not reuse the same connection if
+            partway through a handshake!) */
+         if(wantNTLMhttp) {
+-          if(!strequal(needle->user, check->user) ||
+-             !strequal(needle->passwd, check->passwd))
++          if(strcmp(needle->user, check->user) ||
++             strcmp(needle->passwd, check->passwd))
+             continue;
+         }
+         else if(check->ntlm.state != NTLMSTATE_NONE) {
+@@ -3380,8 +3380,8 @@
+ 
+         /* Same for Proxy NTLM authentication */
+         if(wantProxyNTLMhttp) {
+-          if(!strequal(needle->proxyuser, check->proxyuser) ||
+-             !strequal(needle->proxypasswd, check->proxypasswd))
++          if(strcmp(needle->proxyuser, check->proxyuser) ||
++             strcmp(needle->proxypasswd, check->proxypasswd))
+             continue;
+         }
+         else if(check->proxyntlm.state != NTLMSTATE_NONE) {
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 1f2758c..20c3721 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -16,6 +16,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-5421.patch \
              file://CVE-2016-7141.patch \
              file://CVE-2016-8615.patch \
+             file://CVE-2016-8616.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


