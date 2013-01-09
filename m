Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TsqqU-0000ZP-2S
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 09:17:12 +0100
Received: from [192.168.101.47] (afplatform.bmw-carit.intra [192.168.101.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 24AA64003E;
	Wed,  9 Jan 2013 08:23:50 +0100 (CET)
Message-ID: <50ED23F7.6040903@oss.bmw-carit.de>
Date: Wed, 09 Jan 2013 09:01:59 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] site/common: deactivate a runtime check for ipv6-support in, python >=2.7.1 that fails when cross-compiling
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
X-List-Received-Date: Wed, 09 Jan 2013 08:17:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In configure there is a runtime check to determine buggy getaddrinfo and 
as we
are cross-compiling this check goes wrong. If ipv6 is enabled in python, the
failed test is reported as fatal error with the message
Fatal: You must get working getaddrinfo() function.

Setting ac_cv_buggy_getaddrinfo=no deactivates the runtime check and 
allows to
compile python with ipv6 enabled.

This commit was derived from the commit 
700b75e7661062aa93cf81205b78c8bf7609922d
in the Classic OpenEmbedded Development Tree.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
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

+# python: deactivate a runtime check for ipv6-support in python >=2.7.1 
that fails when cross-compiling
+ac_cv_buggy_getaddrinfo=no
-- 
1.7.9.5



