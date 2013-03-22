Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UJ3AJ-0007vc-T2
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 15:41:57 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E65F1D20D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 15:25:06 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 15:25:00 +0100
Message-Id: <1363962300-2770-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1363961316.3097.2.camel@ted>
References: <1363961316.3097.2.camel@ted>
Subject: [PATCH] coreutils: disable ACL as we do not depend on it
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
X-List-Received-Date: Fri, 22 Mar 2013 14:41:58 -0000

Coreutils does not depend on ACL but also does not disable it. Effect is
that from time to time I have a copy in sstate-cache which got built
with ACL and then I have problem while building images or sdk:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-standalone-hhvm-sdk-target:
|  *    libacl1 (>= 2.2.51) *
|  * opkg_install_cmd: Cannot install package packagegroup-core-standalone-hhvm-sdk-target.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 04c9eb2..b82bbe4 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -21,7 +21,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
 SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
 SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
 
-EXTRA_OECONF_class-native = "--without-gmp"
+EXTRA_OECONF = "--disable-acl"
+EXTRA_OECONF_class-native = "--disable-acl --without-gmp"
 
 # [ df mktemp base64 gets a special treatment and is not included in this
 bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
-- 
1.8.1.2



