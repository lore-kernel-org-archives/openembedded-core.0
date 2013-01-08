Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TsWqj-000059-2u
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:56:05 +0100
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 49A134005E;
	Tue,  8 Jan 2013 11:02:50 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 11:40:33 +0100
Message-Id: <1357641633-18077-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
Cc: Lukas Bulwahn <Lukas.Bulwahn@oss.bmw-carit.de>
Subject: [PATCH] site/common: deactivate a runtime check for ipv6-support in python >=2.7.1 that fails when cross-compiling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 10:56:09 -0000

In configure there is a runtime check to determine buggy getaddrinfo and as we
are cross-compiling this check goes wrong. If ipv6 is enabled in python, the
failed test is reported as fatal error with the message
Fatal: You must get working getaddrinfo() function.

Setting ac_cv_buggy_getaddrinfo=no deactivates the runtime check and allows to
compile python with ipv6 enabled.

This commit was derived from the commit 700b75e7661062aa93cf81205b78c8bf7609922d
in the Classic OpenEmbedded Development Tree.

Signed-off-by: Lukas Bulwahn <Lukas.Bulwahn@oss.bmw-carit.de>
---
 meta/site/common |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/site/common b/meta/site/common
index 5da3ff4..1214a13 100644
--- a/meta/site/common
+++ b/meta/site/common
@@ -15,3 +15,5 @@ shadow_cv_utmpdir=${localstatedir}/run
 shadow_cv_logdir=${localstatedir}/log
 shadow_cv_passwd_dir=${bindir}
 
+# python: deactivate a runtime check for ipv6-support in python >=2.7.1 that fails when cross-compiling
+ac_cv_buggy_getaddrinfo=no
-- 
1.7.9.5



