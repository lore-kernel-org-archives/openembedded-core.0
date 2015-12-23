Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 41E0873188
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:48:31 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p187so145724011wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=H83jK58YqZsdiAyf7PNFC6vl/+/Hzv5jJWsphr4NzX8=;
	b=o+N9cwcjyojzD3rW9mmge+j8U52fOcDX2XlVgADNjbn7qns9U64ncu9XCJFTDlnBqU
	WmiExrCOG+DQAGFRk9zbiZyos60FC5rfUf5JkSjypntEck9g+hT0M6XWMVVuv5rsJNwm
	njDHeClo+i9doIekV04UXPWyGRU5AJz4/G4GpcLckcQoJ+LIjXXILXBwod0a6vgoT1Ib
	KpIpfKjZQZ/UeWkYgE1CCtHqs720eXpnmg9upajo5hRplDqxdUy3hScgdp8gzv4nQNuj
	C6UL/1i5H9JC0srikJTzIM5p7U4BCrxWzsjoMoTfLjyDDTxSrN/7KzQJuPKER2R5Jk4f
	3ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=H83jK58YqZsdiAyf7PNFC6vl/+/Hzv5jJWsphr4NzX8=;
	b=jySl1YXvqGSDKkr/sf4C2gKfkyDVBc7Or9r5G6CK8wSOBKZZs+YFHygVd1FCnfdvmD
	+fhb0sQG20AH1hCYUkYCONybUykhkSHtTBbX1kZ2gDvt5CiwbIj5NNe9ZNxJTRE+sNNv
	g+IOFaU19ezN1P2y993jFIMUgZb8txVXjNbuqayNhwPEnzghv1Uw0PT1o3+nZ36tWeIR
	paDtarzb/r8cDBcMgMZmAOgcqbuPiwcDenyFPZE5ZhM7xV/lGWKljvCpNpnBwwN0F6vN
	mY8+iwoQGgo0ZoZkh3oeSHoM1x3Sx4G9iKhRb/Y0Fd+Deuoi3+XwTYnlRHvSjxqj4FGO
	w0cQ==
X-Gm-Message-State: ALoCoQnrEqc9sfr4f3PhvgTsloVWZjhORWLN/Rf51Ytir6jArQuPX8UKq5f01b7M6rkgUrhnKhCHwc1ZxSZw+IntcZ37aGSZ9A==
X-Received: by 10.194.236.6 with SMTP id uq6mr33692267wjc.126.1450878512171;
	Wed, 23 Dec 2015 05:48:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r74sm29503024wmb.2.2015.12.23.05.48.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Dec 2015 05:48:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 13:48:29 +0000
Message-Id: <1450878509-3827-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] oeqa/selftest: support sets in devtool comparisons
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
X-List-Received-Date: Wed, 23 Dec 2015 13:48:32 -0000

The devtool and recipetool tests do literal string comparisons, but for some
fields the ordering could be irrelevant and potentially non-deterministic.  For
example, the recipetool_create_simple test started failing with:

AssertionError: 'GPLv2 Unknown' != 'Unknown GPLv2' : values for LICENSE do not match

The ordering of the LICENSE field isn't relevant.  So, if the expected value is
a set(), split the string into a set too and compare those.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py    | 2 ++
 meta/lib/oeqa/selftest/recipetool.py | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 6f76ce7..1eadd6b 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -44,6 +44,8 @@ class DevtoolBase(oeSelfTest):
                     needvalue = checkvars.pop(var)
                     if needvalue is None:
                         self.fail('Variable %s should not appear in recipe')
+                    if isinstance(needvalue, set):
+                        value = set(value.split())
                     self.assertEqual(value, needvalue, 'values for %s do not match' % var)
 
 
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 34e383f..85a40f7 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -413,7 +413,7 @@ class RecipetoolTests(RecipetoolBase):
             self.fail('recipetool did not create recipe file; output:\n%s' % result.output)
         self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['LICENSE'] = 'Unknown GPLv2'
+        checkvars['LICENSE'] = set(['Unknown', 'GPLv2'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4 file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         # We don't check DEPENDS since they are variable for this recipe depending on what's in the sysroot
         checkvars['S'] = None
-- 
2.6.4


