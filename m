Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id D9DEB61A56
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 19:47:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v4so7504185wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 11:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D9gROWHUHpm6f5Wg8hEQDajW6A/0R+hviiqO/wuql4o=;
	b=fSx0tuFq+xaYBw57m6fPOsspIY9XFIhbO+4yrty7lzTja6DH5eI+BNrD1V7/tqsll7
	d77mNbg01RkNJw/lUmtp/E/GLEszhvMbX/jt7+RHaFkGOS2Q3E7zY+mdUTm543Gf84sx
	ct2BNLH6xASw0CQWHNwB/bAPNKDJzWkRznkXZzBILCQ8VMkau05BUnuqYb1rjKbdGOvb
	RopxgbMRi4BnMnkABYF7ByNGNeoADVVKHsplvLiq58Av2VRpTL8vhjzBi9Z8R7VWUqg2
	L6XeBF7Lj1drWpmEbaoN5bHEG79kYri7RJ/Te0906XuK+dwgbOAuAHTZldxcgQ5l+nl7
	cH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D9gROWHUHpm6f5Wg8hEQDajW6A/0R+hviiqO/wuql4o=;
	b=onbAkLmmcDTjgvv2fuF+n68u/NLlWzGrr4WFCXA9lj5MK8x7YlH4U47i+WY8iUFJfn
	jPBkLMQ8s1wtOnTzPtHzxA6nTtduNcoRQSdWlTjigSNpK4Zn/jljOKS9IPnhu8LvUesX
	sqHVcrYavfyMF5J2T50++5qhwiRgB5bbPrvR/WKpoa5s7G80F+Byali49TSoMxDpkgAo
	a/k7gjvWKY4WSYcwFEYcKQTL0kG4tzMQPA7FjMJxcRgaCAlQ1Z0pYK0uftLqxXwJZMk4
	FSBxjy+cZuGLeM1L2xA2tBakA0D4HZGKEIt+oKbqEv+bThYzQBUpJr492dTZjniR8zjM
	06mA==
X-Gm-Message-State: APjAAAWeLuMwjwykXywdTOugUl/dhiHPy1eqH9kt0KGOl0he84j5nOKe
	UzJ3Qywr8FXO0oLF+CLjqyVRuh8x
X-Google-Smtp-Source: APXvYqxF9MjMHVLRt/5e63k4DZQK9mFBaqa7+JQwT3A0GwvEFlyn6+waUZQiZOn3b3dORNWRh3h6oA==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr11570051wro.310.1583005656013;
	Sat, 29 Feb 2020 11:47:36 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g10sm19324467wrr.13.2020.02.29.11.47.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 11:47:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 20:47:07 +0100
Message-Id: <20200229194707.14400-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] selftest/tinfoil: fix a race condition
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
X-List-Received-Date: Sat, 29 Feb 2020 19:47:36 -0000
Content-Transfer-Encoding: 8bit

Both test_parse_recipe_initial_datastore and the preceding test
operate on the same recipe, and both change recipe metadata and re-parse
it. In some situations bitbake backend from the first test is
catching the change done by the second test and interprets it as
non-deterministic metadata (not sure if this sentence is entirely
technically correct though :).

The easiest way to avoid is to make the tests operate on two
different recipes.

[YOCTO #13812]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 42a1b6b4f4..1bbb7eeec7 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -68,7 +68,7 @@ class TinfoilTests(OESelftestTestCase):
     def test_parse_recipe_initial_datastore(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
-            testrecipe = 'mdadm'
+            testrecipe = 'psplash'
             best = tinfoil.find_best_provider(testrecipe)
             if not best:
                 self.fail('Unable to find recipe providing %s' % testrecipe)
-- 
2.25.1


