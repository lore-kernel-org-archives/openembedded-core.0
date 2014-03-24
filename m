Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 629B06FB2B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 09:24:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O9OKjY017932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 02:24:21 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 24 Mar 2014 02:24:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 05:24:17 -0400
Message-ID: <193839e768c2b96ced5cac7b6b20f9ec1d4c409c.1395653020.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1395653020.git.liezhi.yang@windriver.com>
References: <cover.1395653020.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: build setpriv requires libcap-ng
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
X-List-Received-Date: Mon, 24 Mar 2014 09:24:23 -0000
Content-Type: text/plain

There might a failure when build util-linux with the meta-selinux layer:

[snip]
sys-utils/setpriv.c:21:20: fatal error: cap-ng.h: No such file or directory
 #include <cap-ng.h>
                    ^
compilation terminated.
[snip]

Use PACKAGECONFIG to fix the problem.

[YOCTO #6026]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 51c982a..ad7aac7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -57,6 +57,9 @@ PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuse
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] = "--enable-socket-activation --with-systemdsystemunitdir=${systemd_unitdir}/system/, --disable-socket-activation --without-systemdsystemunitdir"
 
+# Build setpriv requires libcap-ng
+PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
+
 FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
-- 
1.7.10.4


