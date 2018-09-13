Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A57D6798C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 11:30:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o18-v6so5874131wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 04:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=y1/AMbgyQQ8+78P4DuLOsoz6FT9d8y86/siiaZKDWmE=;
	b=AwzqNlecL7Qq4eU1fw37iq5M3U4IC/mieyhGV4FxTM3kNaufVQ9On+0Gz9MtMbE8PW
	oxQKogg2qXUHQMYBlg8XmfgJ7+i3qDf57wH6rcNIUO501iNbgcBpc4EzgqDggxsHGQau
	Q3j/szwO0jBJM9oBNt7k38x9jzqNCZOxT8YGvRe5BCGGKIse4Z62aLjmmRr57vzU0QJX
	i//3SyDDLDcKr8Hm/HFAJV/jAGVP1Lgjk8gr0MDdmiqGrSRzHEn8zX8DVTXf4C88+8UH
	89jR1vZdWQQlzuZXJgjBSO5LiYmO+3fFzD2f6oZ9VkHOuuJy5tDLBuGmOQD/Ip48Q0GY
	0KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=y1/AMbgyQQ8+78P4DuLOsoz6FT9d8y86/siiaZKDWmE=;
	b=H1hsRRhV4KxxzYigAH1w355g22lHJIg6uL4RoAcT2O8OeXlueMnYrCo0B548xR3BqU
	GN+hUgE4GibvtlZE4biZ0uOPwENUUsDnfA9nJ5ijOuCq1AdIg0IMyqbYE4jfJgILZ7JR
	bht1prU2HHpRmh14lPl+QbU9cRsaiW+r4a711W5IEZ0oOSFIJaq6RJ4rfTmi/wKJj9he
	sTRRff/UFPYsVX16IQ3jdjN4oz2LZA4fCu5bj0euW8PnobhAje8a2kguvfDksJ9k5uQA
	4BiaifEuItcWMEAyHsbR0/wdceBG/824BWVD7ihsQsQ9Px1N765ul66KmBvCZyNzvRIS
	obGQ==
X-Gm-Message-State: APzg51Cy1winml9+oWqtTxejpkW7438mCHqg/ouO3N23PL2EDSFnBnkN
	9PsHViEKPxQyMQvfMFfHVN3QdCwTIGk=
X-Google-Smtp-Source: ANB0VdYNP88xe9ZQWWTpHHR9uz2l83IlMYJ+mgIAsCMqem9WE8NvHQ9NdtPWNYEzaqj8doKmG3vnzw==
X-Received: by 2002:a1c:8ac4:: with SMTP id
	m187-v6mr4930420wmd.80.1536838241866; 
	Thu, 13 Sep 2018 04:30:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	124-v6sm6665871wmk.20.2018.09.13.04.30.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 04:30:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2018 12:30:39 +0100
Message-Id: <20180913113039.3957-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/selftest/recipetool: fix non-determinism in cmake test
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
X-List-Received-Date: Thu, 13 Sep 2018 11:30:42 -0000

The Navit recipe can depend on fribidi which is now part of oe-core.  Since the
pkgconfig lookup is based on pkgdata the results can change depending on what
has been built, which leads to occasional failures.

Build gtk+ before the test to ensure that the pkgdata is populated with more of
the dependencies, and add fribidi to the generated DEPENDS checklist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 754ea949824..cd15df11a93 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -427,6 +427,8 @@ class RecipetoolTests(RecipetoolBase):
 
     @OETestID(1418)
     def test_recipetool_create_cmake(self):
+        bitbake('-c packagedata gtk+')
+
         # Try adding a recipe
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
@@ -439,7 +441,7 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['SRC_URI'] = 'http://downloads.sourceforge.net/project/navit/v${PV}/navit-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
         checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
-        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib'])
+        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib', 'fribidi'])
         inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-- 
2.11.0


