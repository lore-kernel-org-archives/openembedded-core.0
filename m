Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76EB672477
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 06:08:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB8685Ah021218
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Dec 2014 22:08:05 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 7 Dec 2014 22:08:04 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 01:08:03 -0500
Message-ID: <1418018883-30831-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] apr: avoid absolute paths for grep
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
X-List-Received-Date: Mon, 08 Dec 2014 06:08:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The apr provides usr/share/build-1/libtool which is required by
the recipe such as apache2, and it will find grep on the host
and set absolute paths in libtool: GREP="/usr/bin/grep"

If we build apr/apr-native on a host that grep is in "/usr/bin/grep",
and re-use the sstate on another host with "/bin/grep", it will fail
when build apache2/apache2-native with:

| tmp/sysroots/x86_64-linux/usr/share/build-1/libtool: line 1093: /usr/bin/grep: No such file or directory
| tmp/sysroots/intel-x86-64/usr/share/build-1/libtool: line 1093: /usr/bin/grep: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/apr/apr_1.5.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.5.1.bb b/meta/recipes-support/apr/apr_1.5.1.bb
index 49a08b0..a27b233 100644
--- a/meta/recipes-support/apr/apr_1.5.1.bb
+++ b/meta/recipes-support/apr/apr_1.5.1.bb
@@ -32,6 +32,11 @@ CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
 CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sctp_uio_h=no"
 
 do_configure_prepend() {
+	# Avoid absolute paths for grep since it causes failures
+	# when using sstate between different hosts with different
+	# install paths for grep.
+	export GREP="grep"
+
 	cd ${S}
 	./buildconf
 }
-- 
1.9.1


