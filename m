Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnB-0006S1-An
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:13 +0200
Received: by bke11 with SMTP id 11so4179714bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=D9Shop5T0zH4Eg3F8KqHV39npoqo8la9Rxo/04En76g=;
	b=DiohS8/QDyMnVoxLWBX+hVkJdv3uPAqSkM4eOd12CRO+vw/gJZe2oDP2SVJyVeQM4O
	Lw8ZdZz6DL1lhMAqa28yHWve6uoY955WUvxOUOj7UeRfQK8LGBnXI2sQJmfiJiwtIQly
	c0UiSLrdZEFQOm082bfAZ5CggFJoJTYNYlRpc=
Received: by 10.204.149.72 with SMTP id s8mr2866235bkv.126.1316807212452;
	Fri, 23 Sep 2011 12:46:52 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.46.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:46:51 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:33 +0400
Message-Id: <1316807201-22623-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 02/10] bitbake.conf: change ccache path to use MULTIMACH_HOST_SYS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2011 19:52:13 -0000

Currently if I build packages for several targets (e.g. for armv5te tosa
and for armv7a beagleboard) oe will use single ccache dir for both of
those targets: build/ccache/arm-oe-linux-gnueabi. However those targets
use different opcodes, different features and binaries created for one
of those targets wont't run on the lower one. So use MULTIMACH_HOST_SYS
for ccache dir, so that it uses something like
build/ccache/armv5te-oe-linux-gnueabi dir.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b7bcc23..730439c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -407,7 +407,7 @@ export PATH
 CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
-export CCACHE_DIR = "${TMPDIR}/ccache/${HOST_SYS}/${PN}"
+export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.7.2.5



