Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C3B0260079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 09:05:35 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id j13so126637355iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 01:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7zYZtvtXoE+7W4YUu8vde85diwi34S6q0Nd26dde2Lc=;
	b=KFL/I67NcPNRrwX79r30zYT3QqauLjab4a/Lt9vmpgQ7szpQt4WJ15vlylgu089v5M
	hrj8gO/BYc+kDnD9iWrO2sbh6TAFjxlh/KJhEpfimnQgNt2zuo/mddmkAZKTOB03HZEm
	J+F/AG/7YWuiR0SiHuSIZ/rfVZp9uQqqKz6DIpudmQ8dPHn+1n8uCfpKPALGQdlzUw7k
	YvVRr6FvyCUOZ4HiSCgScnjhJFD6eQBhWRFXGIBMyWM0RADklWI5ismEoEzhAYvtdyDZ
	hoWRYq4aDXtUbbhn7zzbm3m/IpSL7Q1embM31lLPKaso6bFpiiSc5T3KKCm3WcdCvyUY
	NRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7zYZtvtXoE+7W4YUu8vde85diwi34S6q0Nd26dde2Lc=;
	b=Uxsy4rxcwwwCm3fSWRj5NkM/8+e7vx/bhk00gaNdOkYj0I4lNmvshttc0Ymk2FfogL
	nOb8VdkjD7aiA4xrKdUKN9dFZ0PWNfJFCXMVJSMWInE4YB1KJL0e9MrucFKmDRnOoCXX
	q99kLt/NOxpgBqvmAJC/ExhK5gf0EOHFjBP19L5vMRmW3n5iHRPd6lR12zUoV4LXh8FW
	EpegtJ0S/2YFbHTA1jqJw0LC0puWjFDF0ngYEa1V0gznY1Y19aewgNs+Hthc4R/hTais
	pMVs9L9/Tk8Cn3WkwcY6jrAQd/VsLzpj1ODqdpfShY19aeUNgqa3lXSRiQ+3fS1W6UwA
	RSYA==
X-Gm-Message-State: AIkVDXIn9wrA1PPul8teixEL6DsswnaaF9ecjyFr0ZZRKOvYbRzmJ5MeEXmYj5+6GfLT3tCe
X-Received: by 10.107.167.204 with SMTP id q195mr24688556ioe.170.1485853535823;
	Tue, 31 Jan 2017 01:05:35 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	g82sm9870963ioa.13.2017.01.31.01.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 01:05:34 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 10:05:29 +0100
Message-Id: <20170131090529.5321-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libtasn1: depends on yacc
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
X-List-Received-Date: Tue, 31 Jan 2017 09:05:38 -0000

This fixes a potential pollution by the build host and build error
when yacc isn't installed on the build host:

 | ../../libtasn1-4.9/build-aux/ylwrap: line 175: yacc: command not found
 | Makefile:1116: recipe for target 'ASN1.c' failed
 | make[3]: *** [ASN1.c] Error 127

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-support/gnutls/libtasn1_4.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.9.bb b/meta/recipes-support/gnutls/libtasn1_4.9.bb
index b8ff9eaf7a9..3da5d4bcc56 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.9.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.9.bb
@@ -16,6 +16,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://0004-tools-eliminated-compiler-warnings.patch \
            "
 
+DEPENDS = "bison-native"
+
 SRC_URI[md5sum] = "3018d0f466a32b66dde41bb122e6cab6"
 SRC_URI[sha256sum] = "4f6f7a8fd691ac2b8307c8ca365bad711db607d4ad5966f6938a9d2ecd65c920"
 
-- 
2.11.0


