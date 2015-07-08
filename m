Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0A373B10
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 07:58:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t687wn7A007476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 00:58:50 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Jul 2015 00:58:49 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 15:53:19 +0800
Message-ID: <1436341999-14362-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] apr: Fix packet discards HTTP redirect
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
X-List-Received-Date: Wed, 08 Jul 2015 07:58:53 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Disconnect the connection by poll() timeout.
If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
apr_socket_recv() returns EAGAIN.

Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp>
Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../apr/Fix-packet-discards-HTTP-redirect.patch    | 32 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch

diff --git a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
new file mode 100644
index 0000000..6805b8b
--- /dev/null
+++ b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
@@ -0,0 +1,32 @@
+Fix packet discards HTTP redirect.
+
+Disconnect the connection by poll() timeout.
+If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
+apr_socket_recv() returns EAGAIN.
+
+Upstream-Status: Pending
+
+Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp>
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ network_io/unix/sendrecv.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c
+index c133a26..e8faf15 100644
+--- a/network_io/unix/sendrecv.c
++++ b/network_io/unix/sendrecv.c
+@@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, char *buf, apr_size_t *len)
+                       && (sock->timeout > 0)) {
+ do_select:
+         arv = apr_wait_for_io_or_timeout(NULL, sock, 1);
++        if ((arv == APR_TIMEUP) && (sock->timeout == 0)) {
++            *len = 0;
++            return EAGAIN;
++        }
+         if (arv != APR_SUCCESS) {
+             *len = 0;
+             return arv;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index aac6276..c1f7f38 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configfix.patch \
            file://run-ptest \
            file://upgrade-and-fix-1.5.1.patch \
+           file://Fix-packet-discards-HTTP-redirect.patch \
 "
 
 SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
-- 
1.9.1


