Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADA66E213
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 23:01:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB5N1sdq014131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 15:01:54 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 15:01:54 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:01:19 -0600
Message-ID: <e3547eb53b3c252d85a876b7f127a8d61114db1a.1386284385.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386284385.git.mark.hatle@windriver.com>
References: <cover.1386284385.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/6][dora] xinetd: CVE-2013-4342
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
X-List-Received-Date: Thu, 05 Dec 2013 23:01:55 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

xinetd does not enforce the user and group configuration directives
for TCPMUX services, which causes these services to be run as root
and makes it easier for remote attackers to gain privileges by
leveraging another vulnerability in a service.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342

the patch come from:
https://bugzilla.redhat.com/attachment.cgi?id=799732&action=diff

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../xinetd/xinetd/xinetd-CVE-2013-4342.patch       | 32 ++++++++++++++++++++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch

diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch b/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
new file mode 100644
index 0000000..0542dbe
--- /dev/null
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
@@ -0,0 +1,32 @@
+xinetd: CVE-2013-4342
+
+xinetd does not enforce the user and group configuration directives
+for TCPMUX services, which causes these services to be run as root
+and makes it easier for remote attackers to gain privileges by
+leveraging another vulnerability in a service.
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342
+
+the patch come from:
+https://bugzilla.redhat.com/attachment.cgi?id=799732&action=diff
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ xinetd/builtins.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xinetd/builtins.c b/xinetd/builtins.c
+index 3b85579..34a5bac 100644
+--- a/xinetd/builtins.c
++++ b/xinetd/builtins.c
+@@ -617,7 +617,7 @@ static void tcpmux_handler( const struct server *serp )
+    if( SC_IS_INTERNAL( scp ) ) {
+       SC_INTERNAL(scp, nserp);
+    } else {
+-      exec_server(nserp);
++      child_process(nserp);
+    }
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 7976570..0e28172 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://Various-fixes-from-the-previous-maintainer.patch \
       file://Disable-services-from-inetd.conf-if-a-service-with-t.patch \
       file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
+      file://xinetd-CVE-2013-4342.patch \
       "
 
 SRC_URI[md5sum] = "77358478fd58efa6366accae99b8b04c"
-- 
1.8.1.2.545.g2f19ada


