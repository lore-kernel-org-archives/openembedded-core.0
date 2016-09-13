Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA3E277121
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 05:49:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8D5n9aq001544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 22:49:09 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 12 Sep 2016 22:49:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2016 13:32:31 +0800
Message-ID: <20160913053231.14144-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] boost: Replace math::static_lcm with integer
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
X-List-Received-Date: Tue, 13 Sep 2016 05:49:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Replace math with integer according to the commit upstream:
---
de05d62aea8e7309026806acf76370e5b1ed9cf3
Replace math::gcd,lcm with integer.
---

or it fails with:
./boost/pool/pool.hpp:363:28: error: 'math' has not been declared

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch b/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
index 0cd97cc..917617a 100644
--- a/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
+++ b/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
@@ -26,7 +26,7 @@ index c47b11f..417a1e0 100644
 +    size_type max_chunks() const
 +    { //! Calculated maximum number of memory chunks that can be allocated in a single call by this Pool.
 +      size_type partition_size = alloc_size();
-+      size_type POD_size = math::static_lcm<sizeof(size_type), sizeof(void *)>::value + sizeof(size_type);
++      size_type POD_size = integer::static_lcm<sizeof(size_type), sizeof(void *)>::value + sizeof(size_type);
 +      size_type max_chunks = (std::numeric_limits<size_type>::max() - POD_size) / alloc_size();
 +
 +      return max_chunks;
-- 
2.8.1


