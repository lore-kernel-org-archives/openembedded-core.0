Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TB4nY-0006pg-Mc
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 16:17:13 +0200
Received: by eaad12 with SMTP id d12so836706eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=S3rTz5vCkx+JnFr9tX+ULg7lc3cPeUaRZg+Ekvtmzno=;
	b=j/fA1vLV/VnarbsPZ1G8PTivSzqHmxU54luOvTCVHq4e7nBD03Lkr3llDPxXYi/5ds
	M+I7PQW0bITqQsUxqJOdVh4MhfVInOG+58hZdyfSs8uahC6xSf0RMTZz2cj9G5m7szfM
	UEuHOZt+YCHqAPM4MgoR5grSebS0BOanxMK3CYWdzgzftjTxZqOW2HWOJEzvKDVBoddn
	Ja1FBG1R/cy5tpw3Rruld3sSK2f9goiyZkdoh2UviYlgWyNiFVN1LYkv+iZ4ghGrCaQd
	UarQMkzEgqq2ALTMo27dJyWYn/jRvU4KXMUHBupMjA2jew1qqN7TdnubEhTAcxuewIue
	8img==
Received: by 10.204.157.7 with SMTP id z7mr3955277bkw.14.1347285882996;
	Mon, 10 Sep 2012 07:04:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs2sm7291654bkc.1.2012.09.10.07.04.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 07:04:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 16:04:38 +0200
Message-Id: <1347285878-14778-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <20120910124518.GB3502@jama.jama.net>
References: <20120910124518.GB3502@jama.jama.net>
Subject: [PATCH] eglibc-initial-2.16: add kconfig-frontends-native to depends
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
X-List-Received-Date: Mon, 10 Sep 2012 14:17:13 -0000

* fixes:
  | make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/eglibc-initial-2.16-r8+svnr20393/eglibc-2_16/libc'
  | make[1]: *** No rule to make target `/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/conf', needed by `config'.  Stop.
  | make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/eglibc-initial-2.16-r8+svnr20393/eglibc-2_16/libc'

* it's because, eglibc-initial.inc overwrites DEPENDS from eglibc_2.16.bb
  $ grep DEPENDS eglibc_2.16.bb
  DEPENDS += "gperf-native kconfig-frontends-native"
  $ grep DEPENDS eglibc-initial.inc
  DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"

  and it's included after eglibc_2.16.bb
  $ head -n 3 eglibc-initial_2.16.bb
  require eglibc_${PV}.bb
  require eglibc-initial.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
index f6b09ac..de45079 100644
--- a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
@@ -1,6 +1,8 @@
 require eglibc_${PV}.bb
 require eglibc-initial.inc
 
+DEPENDS += "kconfig-frontends-native"
+
 # main eglibc recipes muck with TARGET_CPPFLAGS to point into
 # final target sysroot but we
 # are not there when building eglibc-initial
-- 
1.7.12



