Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8DF6AFCC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 03:36:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r633aRI8004004
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2013 20:36:27 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 2 Jul 2013 20:36:26 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2013 11:36:23 +0800
Message-ID: <bfa207a7e48a5d71cea1307a24fb4ebee19deb83.1372822287.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1372822287.git.jackie.huang@windriver.com>
References: <cover.1372822287.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] init-ifupdown: set kernel parameters firstly
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
X-List-Received-Date: Wed, 03 Jul 2013 03:36:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

When do ipv6 ready test, some DAD (duplicate address detect) tests failed
since it expect IPV6 will be disabled, but not. even accept_dad has been
set to correct value 2. Further investigation shows the root cause is that
setting the kernel parameter happens after the NIC is upped.

Make kernel parameters be configured before the interfaces is upped, and
duplicate setting the kernel parameters does not have negative effect.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../init-ifupdown/init-ifupdown-1.0/init           |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
index bace9df..fb31c63 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
@@ -58,6 +58,7 @@ check_network_swap() {
 case "$1" in
 start)
 	echo -n "Configuring network interfaces... "
+	sysctl -e -p /etc/sysctl.conf >/dev/null 2>&1
 	ifup -a
 	echo "done."
 	;;
-- 
1.7.4.1


