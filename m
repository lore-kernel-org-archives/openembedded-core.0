Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A53678280
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v599jYGQ010582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jun 2017 02:45:34 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Jun 2017 02:45:33 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Jun 2017 05:45:31 -0400
Message-ID: <d3fa5353a75efd6bc2253bc09974b763112e8b5a.1497001417.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1497001417.git.dengke.du@windriver.com>
References: <cover.1497001417.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: add task do_prepare_recipe_sysroot before do_configure
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
X-List-Received-Date: Fri, 09 Jun 2017 09:45:34 -0000
Content-Type: text/plain

When recipe inherit archiver.bbclass and enable:

    ARCHIVER_MODE[src] = "configured"

output errors:

    automake: command not found

This is because no recipe-sysroot-native directory, so there is no native
environment before executing do_configure, we can check it at the line 254
in archiver.bbclass:

    prefuncs = d.getVarFlag('do_configure', 'prefuncs')
    for func in (prefuncs or '').split():
        if func != "sysroot_cleansstate":
            bb.build.exec_func(func, d)
    bb.build.exec_func('do_configure', d)

So it is necessary to add the task do_prepare_recipe_sysroot before executing
the do_configure task.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/classes/archiver.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 18c5b96..4775786 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -247,6 +247,7 @@ python do_ar_configured() {
                 bb.build.exec_func('do_kernel_configme', d)
             if bb.data.inherits_class('cmake', d):
                 bb.build.exec_func('do_generate_toolchain_file', d)
+            bb.build.exec_func('do_prepare_recipe_sysroot',d)
             prefuncs = d.getVarFlag('do_configure', 'prefuncs')
             for func in (prefuncs or '').split():
                 if func != "sysroot_cleansstate":
-- 
2.8.1


