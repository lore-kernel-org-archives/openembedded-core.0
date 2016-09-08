Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.42])
	by mail.openembedded.org (Postfix) with ESMTP id 019BF6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 13:34:49 +0000 (UTC)
Received: from 1bhzTc-0002A6-WB by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1bhzTd-0002Aa-U9
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2016 06:34:49 -0700
Received: by emcmailer; Thu, 08 Sep 2016 06:34:49 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1bhzTc-0002A6-WB
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2016 06:34:48 -0700
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0; Thu, 8 Sep 2016
	15:34:48 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 15:33:50 +0200
Message-ID: <1473341630-23751-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
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
Subject: [PATCH][krogoth] curl: security fix for CVE-2016-7141
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
X-List-Received-Date: Thu, 08 Sep 2016 13:34:50 -0000
Content-Type: text/plain

Affected versions:
    Affected versions: libcurl 7.19.6 to and including 7.50.1
    Not affected versions: libcurl >= 7.50.2

Reference to upstream patch:
https://curl.haxx.se/CVE-2016-7141.patch

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-7141.patch | 50 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-7141.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-7141.patch b/meta/recipes-support/curl/curl/CVE-2016-7141.patch
new file mode 100644
index 0000000..eb03afd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-7141.patch
@@ -0,0 +1,50 @@
+From 7700fcba64bf5806de28f6c1c7da3b4f0b38567d Mon Sep 17 00:00:00 2001
+From: Kamil Dudka <kdudka@redhat.com>
+Date: Mon, 22 Aug 2016 10:24:35 +0200
+Subject: [PATCH] nss: refuse previously loaded certificate from file
+
+... when we are not asked to use a certificate from file
+
+Bug: https://curl.haxx.se/docs/adv_20160907.html
+Reported-by: kdudka@redhat.com
+
+Upstream-Status: Backport
+https://curl.haxx.se/CVE-2016-5421.patch
+
+CVE: CVE-2016-7141
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/vtls/nss.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
+index 20c4277..cfb2263 100644
+--- a/lib/vtls/nss.c
++++ b/lib/vtls/nss.c
+@@ -1002,10 +1002,10 @@ static SECStatus SelectClientCert(void *arg, PRFileDesc *sock,
+   struct ssl_connect_data *connssl = (struct ssl_connect_data *)arg;
+   struct Curl_easy *data = connssl->data;
+   const char *nickname = connssl->client_nickname;
++  static const char pem_slotname[] = "PEM Token #1";
+
+   if(connssl->obj_clicert) {
+     /* use the cert/key provided by PEM reader */
+-    static const char pem_slotname[] = "PEM Token #1";
+     SECItem cert_der = { 0, NULL, 0 };
+     void *proto_win = SSL_RevealPinArg(sock);
+     struct CERTCertificateStr *cert;
+@@ -1067,6 +1067,12 @@ static SECStatus SelectClientCert(void *arg, PRFileDesc *sock,
+   if(NULL == nickname)
+     nickname = "[unknown]";
+
++  if(!strncmp(nickname, pem_slotname, sizeof(pem_slotname) - 1U)) {
++    failf(data, "NSS: refusing previously loaded certificate from file: %s",
++          nickname);
++    return SECFailure;
++  }
++
+   if(NULL == *pRetKey) {
+     failf(data, "NSS: private key not found for certificate: %s", nickname);
+     return SECFailure;
+--
+2.7.4
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 6c71760..3670a11 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -14,6 +14,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-5419.patch \
              file://CVE-2016-5420.patch \
              file://CVE-2016-5421.patch \
+             file://CVE-2016-7141.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


