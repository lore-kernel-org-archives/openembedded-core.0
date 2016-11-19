Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B97871B3A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 02:12:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAJ2CXGC001020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 18:12:33 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 18 Nov 2016 18:12:32 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Nov 2016 10:11:00 +0800
Message-ID: <20161119021100.29350-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] ltp: fix an incorrect macro checking
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
X-List-Received-Date: Sat, 19 Nov 2016 02:12:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The previous patch added a check but incorrectly
change the elif to if, then it always return 0
for cpuid if the machine is not __i386__

getcpu01    1  TFAIL  :  getcpu01.c:140: getcpu() returned wrong value expected cpuid:7, returned value cpuid: 0

After this fix:
getcpu01    1  TPASS  :  getcpu() returned proper cpuid:7, node id:0

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch  | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
index d123074..41f2623 100644
--- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
+++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -88,22 +88,19 @@ index c927512..921b107 100644
  
  void cleanup(void);
  void setup(void);
-@@ -164,9 +172,14 @@ static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
+@@ -164,7 +172,11 @@ static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
  {
  #if defined(__i386__)
  	return syscall(318, cpu_id, node_id, cache_struct);
 -#elif __GLIBC_PREREQ(2,6)
-+#if defined(__GLIBC__)
++#elif defined(__GLIBC__)
 +#if __GLIBC_PREREQ(2,6)
 +	*cpu_id = sched_getcpu();
 +#endif
 +#else
  	*cpu_id = sched_getcpu();
  #endif
-+#endif
  	return 0;
- }
- 
 @@ -191,15 +204,20 @@ unsigned int set_cpu_affinity(void)
  	cpu_set_t *set;
  	size_t size;
-- 
2.8.3


