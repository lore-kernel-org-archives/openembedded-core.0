Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E72747FBF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjt07k7z3w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281282;
	bh=ID3jUDWmBqfiGR3GGO2/2dca/byibbqBSCcziQcgmN0=;
	h=From:To:Subject:Date:From;
	b=inGmgWUq2ZEafJCBUiH+fY2RzM1Zwpg43K25+jbITTPmJsEau4MstvGTAQK49jsJI
	TYwhhiwgLuftJmTvRbFZNo7TxDzPIOqGHmYjwCqxJ9EeCal9ekpIG8WJYSokNyLetg
	m/7vb3KQshRH+1JE2dKcHPD+3/SK79P3euXDpHdYpziPfakyKbFL/2Jp2dAlqR1dm8
	GLgAnlQYIZuFlb4s0meo6d6/N9p9KU25eiSJNj41XUo8KhLESD1E6wXgGTLfq1Yyeh
	cZkst/vv1wqF85uitEQbMET50ugjRghNS2iZhWTM31azIbUQUi2Kq76EkQhWCFER+o
	KTSx5nos9/dIscRe47gUL8OIyi1C4/OEon0VvlMDlgXpVJgW8nrlXG4iaLDSCLGu/h
	S8/eebJ69Y3P5MsEgPJLEjNdb+i9EcnkSAbi96J0az+GFjCtHFmvP0iGwHn5fzfDre
	6uuBrYHJsQkFGH/i1G3QLrIWzuS2d4UfEMAWPjSilokhTbO+uIfMe8c1D0uCHeHgfp
	c+jdq4FmUhOP5Qg95/r71dMOuu+zzOOnrPTQlYEIkJKZKlcn1HHXG+6PyKrGxG3mWU
	H7Jt8g4GSsQVA1DpMtcFDKQqIIzbrTZZZzI+BJoRyaP6xELI40APqM0UDYIJqQS5mk
	dnihQ5a97uXBl5mleFxC04zI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:33 +0200
Message-Id: <20200117171436.17131-13-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:41 -0000

From: Mattias Hansson <mattias.hansson@axis.com>

do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
which sometimes causes a build error when building a recipe that adds
groups.

This issue only occurs when executing do_prepare_recipe_sysroot for a
recipe that adds groups before finishing a task that depends on pseudo
for a recipe that doesn't add groups.

Signed-off-by: Mattias Hansson <mattihn@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1636c6ef93..d6f566a413 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -476,6 +476,7 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_unpack', 'umask', '022')
         d.setVarFlag('do_configure', 'umask', '022')
         d.setVarFlag('do_compile', 'umask', '022')
-- 
2.17.1


