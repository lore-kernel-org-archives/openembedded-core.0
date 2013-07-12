Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA1896B1A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:29:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6C9TdvJ028206
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 02:29:39 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 12 Jul 2013 02:29:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 17:29:29 +0800
Message-ID: <fdaa714fb7981b448aaa21855b6aad2bb5160526.1373599041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373599041.git.hongxu.jia@windriver.com>
References: <cover.1373599041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] pmount: allow users in disk group to perform pmount/pumount
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
X-List-Received-Date: Fri, 12 Jul 2013 09:29:38 -0000
Content-Type: text/plain

* changed ownership group for /usr/bin/pmount and /usr/bin/pumount to 'disk';
* deny execution rights to other users except 'root' and those belonging
  to 'disk' group;
* set setuid bit to both apps;

So, basically, in order for a normal user to be able to pmount/pumount
the device, it must be a member of 'disk' group.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/pmount/pmount_0.9.23.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/pmount/pmount_0.9.23.bb b/meta/recipes-extended/pmount/pmount_0.9.23.bb
index 0d357b9..54504c7 100644
--- a/meta/recipes-extended/pmount/pmount_0.9.23.bb
+++ b/meta/recipes-extended/pmount/pmount_0.9.23.bb
@@ -27,3 +27,8 @@ inherit autotools
 
 SRC_URI[md5sum] = "db19f5bf3151b1b41705ec7bafa439d3"
 SRC_URI[sha256sum] = "db38fc290b710e8e9e9d442da2fb627d41e13b3ee80326c15cc2595ba00ea036"
+
+do_install_append() {
+    chown root.disk ${D}/${bindir}/pmount ${D}/${bindir}/pumount
+    chmod o-x,u+s ${D}/${bindir}/pmount ${D}/${bindir}/pumount
+}
-- 
1.8.1.2


