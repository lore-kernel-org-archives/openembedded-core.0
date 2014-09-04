Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C628710B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:05:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8475vPb011873
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 00:05:58 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 00:05:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Sep 2014 00:05:56 -0700
Message-ID: <030c29236dc8bc0b8df2f9a2973c0997a91023b5.1409813992.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409813992.git.liezhi.yang@windriver.com>
References: <cover.1409813992.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: update the timestamps after install
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
X-List-Received-Date: Thu, 04 Sep 2014 07:05:59 -0000
Content-Type: text/plain

Update the sstate file's timestamps after it is installed, it will be
very useful for removing the old sstate file, especially, it's not easy
to remove when use the shared SSTATE_DIR, we can easily remove them with
this change, for example:

$ find state-cache -type f -ctime +10 -exec rm -f {} \;

Will remove the sstate file which isn't used by recent 10 days.

We can use the -atime, but it is not always available, for example,
when mounted with "-o noatime".

The touch is a very light weight action, and the
scripts/sstate-cache-management.sh also requires this.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ead829e..885912d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -618,6 +618,7 @@ sstate_unpack_package () {
 	mkdir -p ${SSTATE_INSTDIR}
 	cd ${SSTATE_INSTDIR}
 	tar -xmvzf ${SSTATE_PKG}
+	touch --no-dereference ${SSTATE_PKG}
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
-- 
1.7.9.5


