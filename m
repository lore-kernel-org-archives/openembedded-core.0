Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8F36B60424
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 16:46:57 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id l4so1079203lbv.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=O0oNwxCfbu+NLQX71z2A/jyK91xILoX+uRbz+bMvLGQ=;
	b=xKZnFHsGPJwGrwqITIyZQxOG0zk/owD0qZfJJ95JwjtuFbkxrCcj1NC8anyQ5qpB7k
	QXIHn/U3WLN4YnszK2gjOwqiLdQSDDoa+2Zg/nqZb1aoZCScrUTJDDAgIVZjRzr1si++
	6XRfGE4FU2R2U3dkmQIDt13J2XnXShWs+QixmhsA8R9QZefiAlE6heWj1tg5P3y5looo
	JwPgxHjOgqK5opJomw5zJdrCHt6IdIwMbmHLihJPlRTHjr8FhF6WKBQ11E3nAKZQDRoN
	U96IjZ+TN57XC+EFN2oh2EsCkK8I1oduJWa+7Igj2T5KhBBPL5fXbegLK7VHeV9eiEPW
	ZnyA==
X-Received: by 10.152.87.229 with SMTP id bb5mr6547336lab.75.1408034818145;
	Thu, 14 Aug 2014 09:46:58 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id xu8sm3386002lab.41.2014.08.14.09.46.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Aug 2014 09:46:57 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 16:46:51 +0000
Message-Id: <1408034811-7024-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] opkg: Protect add-exclude.patch from malloc failure
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
X-List-Received-Date: Thu, 14 Aug 2014 16:47:04 -0000

In the code added by add-exclude.patch, the return values of malloc and realloc
were not checked before being dereferenced.

In opkg we can use xmalloc and xrealloc instead of malloc and realloc. These
functions terminate the program instead of returning NULL if memory allocation
fails.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg/add-exclude.patch | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
index cf95ee2..c684534 100644
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -1,4 +1,4 @@
-From 45a1e33a048f479b15b99d09df3dd1b62fef0253 Mon Sep 17 00:00:00 2001
+From 5d707bbfcafd88b8b5b5821972c8c958fc3b2039 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@paulbarker.me.uk>
 Date: Fri, 28 Mar 2014 15:20:22 +0000
 Subject: [PATCH 2/2] opkg-0.2.x: add-exclude
@@ -12,10 +12,14 @@ no error will be generated.
 The lifespan of the exclude_list covers the execution of the process,
 so there is no need to free the data.
 
+v2: Use xmalloc instead of malloc and xrealloc instead of realloc. In opkg,
+these functions are guaranteed not to return NULL.
+
 Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
 ---
  libopkg/opkg_conf.c   |  1 +
  libopkg/opkg_conf.h   |  2 ++
@@ -76,7 +80,7 @@ index d2d279e..b572e18 100644
  		    if (satisfying_pkg != NULL) {
  			 satisfier_entry_pkg = satisfying_pkg;
 diff --git a/src/opkg-cl.c b/src/opkg-cl.c
-index 0315d41..0db2794 100644
+index 0315d41..67366b9 100644
 --- a/src/opkg-cl.c
 +++ b/src/opkg-cl.c
 @@ -45,6 +45,7 @@ enum {
@@ -103,11 +107,11 @@ index 0315d41..0db2794 100644
 +			tuple = xstrdup(optarg);
 +			if (!conf->exclude_list) {
 +				conf->exclude_count = 1;
-+				conf->exclude_list = malloc(sizeof(char *) * conf->exclude_count);
++				conf->exclude_list = xmalloc(sizeof(char *) * conf->exclude_count);
 +				conf->exclude_list[conf->exclude_count - 1] = tuple;
 +			} else {
 +				conf->exclude_count++;
-+				conf->exclude_list = realloc(conf->exclude_list, sizeof(char *) * conf->exclude_count);
++				conf->exclude_list = xrealloc(conf->exclude_list, sizeof(char *) * conf->exclude_count);
 +				conf->exclude_list[conf->exclude_count - 1] = tuple;
 +			}
 +			break;
@@ -123,5 +127,5 @@ index 0315d41..0db2794 100644
  	printf("\t                                than the higher version one if more\n");
  	printf("\t                                than one candidate is found.\n");
 -- 
-1.9.1
+2.0.4
 
-- 
2.0.4


