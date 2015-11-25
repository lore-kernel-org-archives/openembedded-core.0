Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEE26057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 19:41:36 +0000 (UTC)
Received: by wmww144 with SMTP id w144so193644168wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 11:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5vPTHSPKJDk7rgX1qdCtZmSaftIuja90WXIGdI+4rek=;
	b=MCHf4kpB+ipfdMxrfd1yjbGguZwP6/3ufv3U/bLY4hlzJeUrXdQjZOCHPl1DEKQXjx
	ySmDTNbWzH4Yp0CV+ZR/SCUEzwkuQ9DoNqTYwYqNcIUy2dhUZNr007dXbq9yhU2OT99a
	Vq44aC0mkNvuiPQZp5bQgxPgSDud9KO5nMCqz2k7JaphTMDwjU8ujHCB7mb7POhRv/yL
	7QdwiEDU4uKOWyxsvFzx9Auy+jbwusWFz+7qgedkUoXRGbaIt2OqTRCI9uc586NLzkyE
	4xz2N6BBBKQqjEGBmg80elKvT0QFCmnFyf+K6u40vgt2LEVdBaZdXh3vruYaXjwIp6JN
	F6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5vPTHSPKJDk7rgX1qdCtZmSaftIuja90WXIGdI+4rek=;
	b=X/D7ejxsRaQMJ2YydZxQSBdM3Y4PCYI4ARf4dEGIq0ECradydafMpjodKm9mV211xA
	wGYIiZPrDNH98duyIgM9iL7wNitV/i9ZTc6+3c3+cVdKgmF5lg79pMN3kAsHHa4ejvqE
	7wtf9iU778eRnr8kT2BsWq+XRBejOUMxCJ6SoDyWj11dgbXQ9DTrFA2nG2NPvuBhYVk9
	6Hjpz4Ce/YM5rZ8SXPtUnKLuGRJmTuz9ljzhl9bp0MzFdgGD7KO2l20hf1g2STiEY2TQ
	M2Ss+md7eWZozZYn6j2rVf1UT5AMSfze/46lkOrxPyB44UweQMOJ0k/4b6Lr833jsJl7
	Ljlg==
X-Gm-Message-State: ALoCoQkr1twsEpKf0NE4LSJokxL7viawtcAjUFDfXzGFGMbN49BiFIv3uP1YPeANzboU2jBFWJu7
X-Received: by 10.194.76.41 with SMTP id h9mr5709763wjw.57.1448480497138;
	Wed, 25 Nov 2015 11:41:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jj3sm17775854wjb.13.2015.11.25.11.41.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 11:41:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 19:32:49 +0000
Message-Id: <1448479970-9542-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] openssl: enable parallel make
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
X-List-Received-Date: Wed, 25 Nov 2015 19:41:38 -0000

openssl 1.0.2d fixes the parallel make problems (commit 8e6bb99), so enable
parallel make again.

[ YOCTO #7347 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 8e8d05f..249f8c4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -50,9 +50,6 @@ PACKAGES =+ " \
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
 
-PARALLEL_MAKE = ""
-PARALLEL_MAKEINST = ""
-
 # The crypto_use_bigint patch means that perl's bignum module needs to be
 # installed, but some distributions (for example Fedora 23) don't ship it by
 # default.  As the resulting error is very misleading check for bignum before
-- 
2.1.4


