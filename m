Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 4D8506BDD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 01:22:07 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id E3145220229;
	Fri,  7 Jun 2019 13:22:02 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 13:21:57 +1200
Message-Id: <20190607012157.16757-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606020544.26181-1-douglas.royds@taitradio.com>
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
Subject: [PATCH v2] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Fri, 07 Jun 2019 01:22:08 -0000

icecc preprocesses source files locally before shipping them off to be compiled
on remote hosts. This preprocessing removes comments, including /* fallthrough */
comments in switch statements that normally prevent the implicit-fallthrough
warning.

Rather than turning off -Werror by patching configure.ac, it is simpler to
disable icecc completely for json-c. There are very few source files to compile,
so the compilation is quick even without icecc.

See https://github.com/icecc/icecream/issues/419

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index edb0e10434..c0f21bdbfd 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -76,6 +76,7 @@ ICECC_ENV_DEBUG ??= ""
 # target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
 #                             prefix" error.
 ICECC_SYSTEM_PACKAGE_BL += "\
+    json-c \
     libgcc-initial \
     target-sdk-provides-dummy \
     "
-- 
2.17.1


