Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AA9576C5C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 14:05:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p4so9388296wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=99hp0zA8dQDW9U/O29cR8JgW5qE70xTt8yNk/RVGCj4=;
	b=h948pE6NbH/07gblA/0WoMqgHpKngWbJrY/22qALO37AwXNi4RDIikW0PUXW16dDYL
	vlQGqdoShKY9q0JaMB8A2GYGv1aZdxwDCtpaZex5By2vdA0669ft22iLtVVPi4flbzie
	CFy5jZjcujVmfFKKnhHxqhVPst6Lg0SOjaQQzqUtzGRd1Zc4UN1Y82z3ArjkuiJNThgz
	1UaEm1XJ053yntN4DP3hJw7XK3ipnTpMtKNSqVyC4FzwKCDUvlTHp0giAlwVwbnmDRPE
	UF1JB4clLkO0KsLsLHQ8HsooDjt1+Fxdecqh2NOkrqTaO94rtU245v+a3b4Ccu8Nnatm
	g5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=99hp0zA8dQDW9U/O29cR8JgW5qE70xTt8yNk/RVGCj4=;
	b=DWspROGHws9uszGsi/7lWSq4f4QrMKVBtPwJ4VvfOxadsnQLNe5SJPK/YZHDg+t8Hr
	Lmrw+RlN70MUOdGQYtF25fo3/LyUmQ4FVi37RruS6o1NaWP+8URRmIy3js1FP5cFc4Zm
	Xq8tCx7vjzahvBXpgTfkqKgoymkHwMGwbrHs2zrsfKFRfEbT/7hKgD1OZgUbz0NFA7o9
	PIKJMkVceqtdTui7Nm4O12tdRzawZIyhJX4zYU0jKzZX/rCBU0mGMp8M2kuO9+H/aHuI
	eFQuZ0R8bvAis5y4K4JMhXFtgjw5i9xcB8P+Fpe/rbfA7mLn7hD2ig5/1sEDqATtqSjt
	OqLg==
X-Gm-Message-State: AA+aEWZAnIDM+weZCMX5Mjtge5PPssr+rujMtyaT7XCJL0RXMBORz2vR
	Y87xQe1bjzELYkf0ptRcilF+q81lEgM=
X-Google-Smtp-Source: AFSGD/Wx3NkcWKtRLREZTXkHNW87MtVZzMyCDz5DqaUm5QVTGpwiNrmng7aWroFNgKez0RUZRCrlDQ==
X-Received: by 2002:a5d:6249:: with SMTP id
	m9-v6mr9530388wrv.314.1542895521001; 
	Thu, 22 Nov 2018 06:05:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 133sm2318362wme.9.2018.11.22.06.05.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 06:05:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 14:05:15 +0000
Message-Id: <20181122140516.10420-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] openssl: output the configure data in do_configure
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
X-List-Received-Date: Thu, 22 Nov 2018 14:05:21 -0000

To aid debugging configure, dump the configdata in do_configure.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 1234b64b864..8d5d4b146e7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -114,6 +114,7 @@ do_configure () {
 	# environment variables set by bitbake. Adjust the environment variables instead.
 	PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
+	perl ${B}/configdata.pm --dump
 }
 
 do_install () {
-- 
2.11.0


