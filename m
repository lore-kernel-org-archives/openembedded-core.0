Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EA2867316D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KET5OY030340; Fri, 20 Jan 2017 14:29:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t-HeFmEAqZew; Fri, 20 Jan 2017 14:29:05 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KET1gY030334
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 14:29:02 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUaBZ-000843-7D; Fri, 20 Jan 2017 14:29:01 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:28:57 +0000
Message-Id: <1484922537-30954-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484922537-30954-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484922537-30954-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] meta-environment: Ensure all multilib dependencies are accounted for
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
X-List-Received-Date: Fri, 20 Jan 2017 14:29:07 -0000

Currently the recipe depends on the mulitlib libcs all being built
but the dependencies don't account for this. Fix the DEPENDS so
that the requires pieces are all built first rather than relying on
luck.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/meta-environment.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index a250cc8..a2ed229 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -19,6 +19,10 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 inherit cross-canadian
 
+# Need to ensure we have the virtual mappings and site files for all multtilib 
+# variants
+DEPENDS += "${@all_multilib_tune_values(d, 'TOOLCHAIN_NEED_CONFIGSITE_CACHE')}"
+
 do_generate_content[cleandirs] = "${SDK_OUTPUT}"
 do_generate_content[dirs] = "${SDK_OUTPUT}/${SDKPATH}"
 python do_generate_content() {
-- 
2.7.4


