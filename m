Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25D996E22B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 23:52:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB5Nqsl5015397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 15:52:54 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 15:52:54 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:52:18 -0600
Message-ID: <0f146340373f5f14b28428cc097a2b4a1663a6f0.1386287395.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386287394.git.mark.hatle@windriver.com>
References: <cover.1386287394.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/6][master] acpid: CVE-2011-1159
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
X-List-Received-Date: Thu, 05 Dec 2013 23:52:55 -0000
Content-Type: text/plain

From: Yue Tao <yue.tao@windriver.com>

acpid.c in acpid before 2.0.9 does not properly handle a situation in which
a process has connected to acpid.socket but is not reading any data, which
allows local users to cause a denial of service (daemon hang) via a crafted
application that performs a connect system call but no read system calls.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1159

Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-bsp/acpid/acpid.inc                      |  3 ++-
 meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 40293c5..a384265 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -6,7 +6,8 @@ LICENSE="GPLv2+"
 
 SECTION = "base"
 SRC_URI = "${SOURCEFORGE_MIRROR}/acpid/acpid-${PV}.tar.gz \
-           file://init"
+           file://init \
+           file://set_socket_noblock.patch "
 
 inherit update-rc.d
 
diff --git a/meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch b/meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
new file mode 100644
index 0000000..54d6435
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
@@ -0,0 +1,10 @@
+--- a/acpid.c
++++ b/acpid.c
+@@ -307,6 +307,7 @@ main(int argc, char **argv)
+ 				non_root_clients++;
+ 			}
+ 			fcntl(cli_fd, F_SETFD, FD_CLOEXEC);
++			fcntl(cli_fd, F_SETFL, O_NONBLOCK);
+ 			snprintf(buf, sizeof(buf)-1, "%d[%d:%d]",
+ 				creds.pid, creds.uid, creds.gid);
+ 			acpid_add_client(cli_fd, buf);
-- 
1.8.3.4


