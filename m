Received: from e06smtp10.uk.ibm.com ([195.75.94.106])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1Ray3N-00076q-9t
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 00:16:01 +0100
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Wed, 14 Dec 2011 22:58:50 -0000
Received: from d06nrmr1307.portsmouth.uk.ibm.com ([9.149.38.129])
	by e06smtp10.uk.ibm.com ([192.168.101.140]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Wed, 14 Dec 2011 22:58:48 -0000
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id pBEMwlVn2699448
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 22:58:47 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost.localdomain
	[127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id pBEMwloa024436
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 15:58:47 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-224-84.boeblingen.de.ibm.com [9.152.224.84])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id pBEMwkDp024425; Wed, 14 Dec 2011 15:58:46 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 23:58:30 +0100
Message-Id: <1323903512-7344-2-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1323903512-7344-1-git-send-email-ken.werner@linaro.org>
References: <1323903512-7344-1-git-send-email-ken.werner@linaro.org>
x-cbid: 11121422-4966-0000-0000-000000DEDEB6
Subject: [PATCH 1/3] Rename do_configure_prepend to do_pre_configure and add it before do_configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 23:16:01 -0000

Defining a new task instead of using configure_prepend allows inheriting
recipes to override the pre_configure task.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 meta/classes/libc-package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 1796d3d..b2accb6 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -39,10 +39,10 @@ python __anonymous () {
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
-do_configure_prepend() {
+do_pre_configure() {
         sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
-
+addtask pre_configure before do_configure
 
 
 # indentation removed on purpose
-- 
1.7.5.4



