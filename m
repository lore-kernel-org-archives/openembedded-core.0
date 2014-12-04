Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 638CE60670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 14:21:42 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so22639740wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 06:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Gr/upk8wnXSdud4mszETm4H6kYEMwgkCfHXrXSXn2vk=;
	b=DnlKVO/K/y6o+ANHhEwJfr2a3QAViOH9bvfGnamahmdOxIe+eVT/ht83TIj7nuP1tZ
	gJJYWfUyxykTnHdhlP61ZIBuBbOT1IMS3uuY5fdLcRiF/3mT6CbGg/+1TyuM709I9UhA
	btOPxRzYqZLU3ubAzpyH9oX+MnfJHSk+Ww4NyOgrl00sydG+SMI97H0WC5J7gFc7Zb7n
	kAtzN4PLTWiMcMhu7u8gkb4gFoX2UiSOLWn2msH0m82RLw2X/1o4rUiVpqy2eDFj1I7k
	heG9IhVVO2xxWFd+RcOhJPSn9w/O0TFyMwt7U5bncequjVqpOZ6GeTE6B8+3x6wF4+nK
	19YA==
X-Gm-Message-State: ALoCoQmGkstcMczLVMNnQ+Gj4VzC/XkckaIL9zHrFT6/mt3kDMWBQP9aFo0PTJzNSmzxNz9VdFM0
X-Received: by 10.180.198.211 with SMTP id je19mr21452233wic.27.1417702902464; 
	Thu, 04 Dec 2014 06:21:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	pl1sm25499820wic.16.2014.12.04.06.21.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 06:21:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 14:21:07 +0000
Message-Id: <1417702870-27012-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/4] base.bbclass: fix CLEANBROKEN logic
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
X-List-Received-Date: Thu, 04 Dec 2014 14:21:50 -0000

The evalation order was incorrect in some situations (CLEANBROKEN=1 and
GNUmakefile exists) the clean would be executed incorrectly.

Add brackets to correct the logic.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f3185b4..de81a7d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -226,7 +226,7 @@ base_do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
 		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
 			cd ${B}
-			if [ "${CLEANBROKEN}" != "1" -a -e Makefile -o -e makefile -o -e GNUmakefile ]; then
+			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
 				${MAKE} clean
 			fi
 			find ${B} -name \*.la -delete
-- 
1.7.10.4


