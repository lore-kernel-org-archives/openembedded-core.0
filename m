Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 573D275D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 02:00:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6620LmK023611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jul 2015 19:00:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Sun, 5 Jul 2015 19:00:21 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 09:59:30 +0800
Message-ID: <420375e6b2530660687099c64dc948dc05c86e0b.1436147616.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436147616.git.kai.kang@windriver.com>
References: <cover.1436147616.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] volatile-binds: correct path of command umount
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
X-List-Received-Date: Mon, 06 Jul 2015 02:00:23 -0000
Content-Type: text/plain

It calls /sbin/umount to stop service var-volatile-lib. But umount is
installed into directory /bin. Correct it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index fee7275..7a3e45a 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -54,6 +54,7 @@ END
         # after the volatile /var/lib is mounted.
         sed -i -e "/^Before=/s/\$/ systemd-random-seed.service/" \
                -e "/^WantedBy=/s/\$/ systemd-random-seed.service/" \
+               -e "/^ExecStop=/s/sbin/bin/" \
                var-volatile-lib.service
     fi
 }
-- 
1.9.1


