Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A8426C5B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:14:57 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r11-v6so19000749wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lm4F2Oiso0woO3tkjhJHkCYSeuxg8S9rFwsoexxKruw=;
	b=QhxedvibjbeWKxbKH1vcH+3DiquAumULPX9+xGNInA42w8ky72n6o8WN/8X0vmGM6l
	BOwZ204ipvy9VZxTUEmhryw/XnReFiAdi6bJ2QD6VYdxb1aXZv3pepk/5BEU4Zw7Geau
	mCWLoSxaVKTqXjU0vWaYJ87j7RBMRZXMLxv+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lm4F2Oiso0woO3tkjhJHkCYSeuxg8S9rFwsoexxKruw=;
	b=LXPp2OG3860EH875YfE/kkb1KYOuEj2Hata0KCjDzyLqtHDlFRsbecR4CPB6t7TTtn
	XREyBxF3RZC1Br/wdv5hZyRGm4c3OORNam5ifMnyQwryxwiHC3J+MscfAj94akR0eYIJ
	7iO7VDfryZU11IiGrxbjUruh5+OhsQ/epD07KGjld93wINxNuO1P3aJrAvwGQzSi2mhB
	ECh+mZAtR033TqHAc+GkU9baS/9yjtqP7QBM48p+jgbptq94juZZD4FJcgFXTloEyUFM
	29AY7dkF9l2qB/6q52bu/8Ucfux1ufN2Q7XTFwwsopnMzU0ZvE0cF3lGRLU+wmtzobxY
	ifQA==
X-Gm-Message-State: AGRZ1gL+lLCYmiWD5PPEGizWWoJqNVPYuM9U/jMJWXseq0vuxqq2gWSK
	OGoo1aze42YtzpGQccw/R1Ir273lhKc=
X-Google-Smtp-Source: AJdET5coSORYofunRBM9K/KhDcaSrnokl/MxkuTgUMoapAVFlDZN/XpGrDbP14OyOLtM8aV4cUUssQ==
X-Received: by 2002:a7b:c003:: with SMTP id
	c3-v6mr22457120wmb.133.1543252498341; 
	Mon, 26 Nov 2018 09:14:58 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r196sm1583445wmd.40.2018.11.26.09.14.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:14:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2018 17:14:53 +0000
Message-Id: <20181126171453.21100-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181126171453.21100-1-richard.purdie@linuxfoundation.org>
References: <20181126171453.21100-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] oeqa/selftest/signing: Use do_populate_lic target instead of do_package
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
X-List-Received-Date: Mon, 26 Nov 2018 17:14:58 -0000

This should speed the test up signficiantly without any loss of functionality
for the purposes of the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 76c587a5c27..4fa99acbc94 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -153,10 +153,10 @@ class Signing(OESelftestTestCase):
             self.add_command_to_tearDown('rm -rf %s' % builddir)
 
             bitbake('-c clean %s' % test_recipe)
-            bitbake(test_recipe)
+            bitbake('-c populate_lic %s' % test_recipe)
 
-            recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
-            recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
+            recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz.sig')
+            recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz')
 
             self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
             self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
-- 
2.17.1


