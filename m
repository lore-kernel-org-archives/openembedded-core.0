Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2898477294
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:03 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82466996pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3Ub78YXd17byLqpwNdl5YGyh2lQQtkL3fGuvUzaPMsk=;
	b=h5U06LOWyXwLksEQhlR9OYjkeZo3Eem7UG9zZGYfnFTGPxvPFP3jOhzIA3jLPsP3ov
	NxUwL9yeBcDgw5HpQA9LtuuzT5074LAPJjZujWJK+LUkBJi7/BdoQcNA7/4FbsQlQQLY
	W33hSwWV7xDncdzd19+jyO//MWYkPk59Wzpz/qizU5Ah6z8g3dNgjecOSx8GvRmsBg42
	1LNlyVCGUVaN5TzpZf4867LOaWJuQ3xFiqSaGjIaCFI2pY37BB+uFRVQx4g0aZAvr+ak
	Vzgqdlpr/BTCTb8gzbu2Ab1/Npzz7gbOGVb4LJZRYvc3rVbR7WNFB65CACJOWKiQbhxG
	CCUQ==
X-Received: by 10.68.244.199 with SMTP id xi7mr26939955pbc.87.1447371664176;
	Thu, 12 Nov 2015 15:41:04 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yz3sm16726614pbb.37.2015.11.12.15.40.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:02 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:35 -0700
Message-Id: <b92f5d005ec80c9ed04e2064b76497808e65fff2.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
References: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/7] systemd: for valgrind, define VALGRIND=1
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

Per the systemd README, this should be defined to run systemd under valgrind,
otherwise false positives will be triggered.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 18c2448..08696e7 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -127,6 +127,9 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 
+# per the systemd README, define VALGRIND=1 to run under valgrind
+CFLAGS .= "${@base_contains('PACKAGECONFIG', 'valgrind$', ' -DVALGRIND=1', '', d)}"
+
 # disable problematic GCC 5.2 optimizations [YOCTO #8291]
 FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
 
-- 
2.2.1


