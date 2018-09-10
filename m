Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A716797FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:58:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8A9vgWX010625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 02:57:58 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 10 Sep 2018 02:57:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Sep 2018 18:02:21 +0800
Message-ID: <d5a1d1701202d4323e15cb31c7f9a3afca88a00f.1536573689.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1536573689.git.Qi.Chen@windriver.com>
References: <cover.1536573689.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] autotools: do more cleanup when in do_configure
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
X-List-Received-Date: Mon, 10 Sep 2018 09:58:07 -0000
Content-Type: text/plain

I met the following error when compiling some projects.

| configure: error: `LDFLAGS' has changed since the previous run:
| configure:   former value:  `-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
| configure:   current value: `-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now'
[snip]
| configure: error: changes in the environment can compromise the build
| configure: error: run `make distclean' and/or `rm .././config.cache' and start over

I think when some recipe inherits autotools-brokensep, it should try to
do more cleanups before configure. So also do 'make distclean' and remove
config.cache just as what the error message told us.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/autotools.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 8768a6a..f577461 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -113,6 +113,8 @@ autotools_preconfigure() {
 				cd ${S}
 				if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
 					oe_runmake clean
+					oe_runmake distclean
+					rm -f ${B}/config.cache
 				fi
 				find ${S} -ignore_readdir_race -name \*.la -delete
 			fi
-- 
1.9.1


