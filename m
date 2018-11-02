Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43C9B79F3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 06:08:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA268xaq001815
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 23:08:59 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 23:08:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 14:08:57 +0800
Message-ID: <1541138937-68270-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] unzip: fix for CVE-2018-18384
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
X-List-Received-Date: Fri, 02 Nov 2018 06:08:58 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../unzip/unzip/CVE-2018-18384.patch               | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch b/meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch
new file mode 100644
index 0000000..cc9e2c1
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2018-18384.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Backport [https://sourceforge.net/p/infozip/bugs/53/]
+CVE: CVE-2018-18384
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+--- unzip60/list.c	
++++ unzip60/list.c	
+@@ -97,7 +97,7 @@ int list_files(__G)    /* return PK-type
+ {
+     int do_this_file=FALSE, cfactor, error, error_in_archive=PK_COOL;
+ #ifndef WINDLL
+-    char sgn, cfactorstr[10];
++    char sgn, cfactorstr[1+10+1+1];	/* <sgn><int>%NUL */
+     int longhdr=(uO.vflag>1);
+ #endif
+     int date_format;
+@@ -389,9 +389,9 @@ int list_files(__G)    /* return PK-type
+             }
+ #else /* !WINDLL */
+             if (cfactor == 100)
+-                sprintf(cfactorstr, LoadFarString(CompFactor100));
++                snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactor100));
+             else
+-                sprintf(cfactorstr, LoadFarString(CompFactorStr), sgn, cfactor);
++                snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactorStr), sgn, cfactor);
+             if (longhdr)
+                 Info(slide, 0, ((char *)slide, LoadFarString(LongHdrStats),
+                   FmZofft(G.crec.ucsize, "8", "u"), methbuf,
+@@ -471,9 +471,9 @@ int list_files(__G)    /* return PK-type
+ 
+ #else /* !WINDLL */
+         if (cfactor == 100)
+-            sprintf(cfactorstr, LoadFarString(CompFactor100));
++            snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactor100));
+         else
+-            sprintf(cfactorstr, LoadFarString(CompFactorStr), sgn, cfactor);
++            snprintf(cfactorstr, sizeof(cfactorstr), LoadFarString(CompFactorStr), sgn, cfactor);
+         if (longhdr) {
+             Info(slide, 0, ((char *)slide, LoadFarString(LongFileTrailer),
+               FmZofft(tot_ucsize, "8", "u"), FmZofft(tot_csize, "8", "u"),
-- 
2.7.4


