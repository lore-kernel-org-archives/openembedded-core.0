Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93BF16AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 08:15:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K8FRap012655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Sep 2016 01:15:27 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 01:15:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 20 Sep 2016 04:15:23 -0400
Message-ID: <00a74627bbc662e9c42e0d2bc0a0d6b2adeaab4a.1474359109.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1474359109.git.hongxu.jia@windriver.com>
References: <cover.1474359109.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: make install with --nosignature and --nodigest work
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
X-List-Received-Date: Tue, 20 Sep 2016 08:15:26 -0000
Content-Type: text/plain

It fixed the following issue:
1). With option '--nodigest --nosignature', installing package
with bad signature failed
======
root@localhost:~# rpm -ivh --nodigest --nosignature  hello-bogus.rpm
error: hello-bogus.rpm: Header V4 DSA signature: BAD, key ID 09753bc
======

2). Without option '--nodigest --nosignature', installing package
with bad signature is successful
======
root@localhost:~# rpm -ivh hello-bogus.rpm
Preparing...                ########################################### [100%]
   1:hello                  ########################################### [100%]
root@localhost:~# rpm -q hello
hello-1.0-r1.1.x86_64
======

[YOCTO #10308]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...0001-system.h-query.c-support-nosignature.patch | 75 ++++++++++++++++++++--
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch b/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
index 77dc5b6..d8636c4 100644
--- a/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
+++ b/meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
@@ -8,13 +8,29 @@ Subject: [PATCH] system.h/query.c: support nosignature
   otherwise, when use --nosignature would read database and verify
   signature, this is not expected.
 
-Upstream-Status: Submitted [Sent email to rpm-devel@rpm5.org]
+Upstream-Status: Rejected [Sent email to rpm-devel@rpm5.org]
+http://rpm5.org/community/rpm-devel/5655.html
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+lib/rpminstall.c: support nosignature
+* !QVA_ISSET -> QVA_ISSET
+Reversing QVA_ISSET:
+- The macro QVA_ISSET(qva->qva_flags, SIGNATURE) invoking in
+  lib/rpminstall.c means qva->qva_flags has bitmap VERIFY_SIGNATURE.
+  And the bitmap assigning in lib/poptQV.c means rpm cli have option
+  --nosignature. (It is weird that SIGNATURE in QVA_ISSET means
+  --nosignature)
+
+  The upstream said he will remove all the SUPPORT_NOSIGNATURES code.
+  See upstream reply http://rpm5.org/community/rpm-devel/5655.html
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- lib/query.c | 6 +++---
- system.h    | 4 ++--
- 2 files changed, 5 insertions(+), 5 deletions(-)
+ lib/query.c      |  6 +++---
+ lib/rpminstall.c | 12 ++++++------
+ system.h         |  4 ++--
+ 3 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/lib/query.c b/lib/query.c
 index 50a7453..b761d76 100644
@@ -43,6 +59,56 @@ index 50a7453..b761d76 100644
  	VSF_SET(vsflags, NOHDRCHK);
      }
      VSF_CLR(vsflags, NEEDPAYLOAD);	/* XXX needed? */
+diff --git a/lib/rpminstall.c b/lib/rpminstall.c
+index af6a51b..2a23343 100644
+--- a/lib/rpminstall.c
++++ b/lib/rpminstall.c
+@@ -566,19 +566,19 @@ int rpmcliInstall(rpmts ts, QVA_t ia, const char ** argv)
+ 	vsflags = (rpmVSFlags) rpmExpandNumeric("%{?_vsflags_install}");
+     vsflags = (rpmVSFlags) 0;	/* XXX FIXME: ignore default disablers. */
+ #if defined(SUPPORT_NOSIGNATURES)
+-    if (!QVA_ISSET(ia->qva_flags, DIGEST)) {
++    if (QVA_ISSET(ia->qva_flags, DIGEST)) {
+ 	VSF_SET(vsflags, NOSHA1HEADER);
+ 	VSF_SET(vsflags, NOMD5HEADER);
+ 	VSF_SET(vsflags, NOSHA1);
+ 	VSF_SET(vsflags, NOMD5);
+     }
+-    if (!QVA_ISSET(ia->qva_flags, SIGNATURE)) {
++    if (QVA_ISSET(ia->qva_flags, SIGNATURE)) {
+ 	VSF_SET(vsflags, NODSAHEADER);
+ 	VSF_SET(vsflags, NORSAHEADER);
+ 	VSF_SET(vsflags, NODSA);
+ 	VSF_SET(vsflags, NORSA);
+     }
+-    if (!QVA_ISSET(ia->qva_flags, HDRCHK)) {
++    if (QVA_ISSET(ia->qva_flags, HDRCHK)) {
+ 	VSF_SET(vsflags, NOHDRCHK);
+     }
+     VSF_SET(vsflags, NEEDPAYLOAD);
+@@ -784,19 +784,19 @@ int rpmErase(rpmts ts, QVA_t ia, const char ** argv)
+     vsflags = (rpmVSFlags) rpmExpandNumeric("%{?_vsflags_erase}");
+     vsflags = (rpmVSFlags) 0;	/* XXX FIXME: ignore default disablers. */
+ #if defined(SUPPORT_NOSIGNATURES)
+-    if (!QVA_ISSET(ia->qva_flags, DIGEST)) {
++    if (QVA_ISSET(ia->qva_flags, DIGEST)) {
+ 	VSF_SET(vsflags, NOSHA1HEADER);
+ 	VSF_SET(vsflags, NOMD5HEADER);
+ 	VSF_SET(vsflags, NOSHA1);
+ 	VSF_SET(vsflags, NOMD5);
+     }
+-    if (!QVA_ISSET(ia->qva_flags, SIGNATURE)) {
++    if (QVA_ISSET(ia->qva_flags, SIGNATURE)) {
+ 	VSF_SET(vsflags, NODSAHEADER);
+ 	VSF_SET(vsflags, NORSAHEADER);
+ 	VSF_SET(vsflags, NODSA);
+ 	VSF_SET(vsflags, NORSA);
+     }
+-    if (!QVA_ISSET(ia->qva_flags, HDRCHK)) {
++    if (QVA_ISSET(ia->qva_flags, HDRCHK)) {
+ 	VSF_SET(vsflags, NOHDRCHK);
+     }
+     VSF_CLR(vsflags, NEEDPAYLOAD);	/* XXX needed? */
 diff --git a/system.h b/system.h
 index 2ff8906..ad4619a 100644
 --- a/system.h
@@ -61,3 +127,4 @@ index 2ff8906..ad4619a 100644
   * Permit ar(1) payloads. Disabled while rpmio/iosm.c is under development.
 -- 
 2.9.0
+
-- 
2.8.1


