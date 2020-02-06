Return-Path: <ross@burtonini.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 943F56062D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 22:07:09 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so564817wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q+tcBGq7BL9U2BUFSi1N/LNfBx0ABS+yTkIDMZJo4Wk=;
	b=vjVSe64KdoB+XI4FPzUxr8+Ib3YeaNtAmDpF0QI96RDQtnLuZWMDb/iOrXqCEpbCa+
	7oyPuLCNNifZY1YnZ7jqbW0jRlCxQjWTxykYqmZu6gediMSF31cZZlQdbyUfaS3ok5Ne
	QemOg/F11obO94bLNh/CSqB8lXXh2rRsCJbxzIERUlWIoPDJdfc1AqNxOZvw0WxmtFGU
	Q1t9jFWdTZqBO3VEolKxrnAIP7iUtlbG0zyENUFOGdJB9Pq2CqZ5wIsEeeTX0H7oqHWj
	WCAQq0TlwoxOdhAgHbz8LpMZGzEO4RWkSga5MHr5HVBGMQv+GL/HgntenB5LerzJCPq6
	8YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q+tcBGq7BL9U2BUFSi1N/LNfBx0ABS+yTkIDMZJo4Wk=;
	b=SdGs2G8RrbAwNwF20ByKVZ00roZojpQcpNqBeeDy8yo8Ood98rFPp5/YHQd/UdESkR
	zZCJdrlmiFBT9eemvKTfvBYwTPSoLhiFuTZ5fRvPtHiTLGk3yrcwikri6Iwl7kEz9qiY
	+0T8bKlBUfUjzYPgLMvIC05rlcY9WjCcyBCXGlu0fgpNsFWcSMiTiQLbbhwU+UkKYdsg
	iHkF9n+OgSW+BTfIAMoBxs8VgHNuPv8jnZUb7tH3Y12mi9B+7m3XfHL09xW1p/TL9TQn
	ZxWQFZdj4C8WA6oMX9Aj0ZSGvF0WDdCrfalTAmfKdxMFzZ8qjGadHmyv/WtEhYKU/4QY
	gwmg==
X-Gm-Message-State: APjAAAV/MqirguVZc2v59ruK32RAKg15P4ks2SZbER/oDbEYaw7UmDSc
	qjLMrknTfKN+AEyF0EEV4ADYzizwXYeYqA==
X-Google-Smtp-Source: APXvYqwbPHkawNnPZVpJwzOJ1ldN29ZK1cszLLOIX5R9NWRjByJxE4Equ+uf3C5AaytRNGMhalqEFQ==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr6927991wmi.116.1581026829956; 
	Thu, 06 Feb 2020 14:07:09 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w1sm844680wro.72.2020.02.06.14.07.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 14:07:09 -0800 (PST)
From: Ross Burton <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2020 22:07:04 +0000
Message-Id: <20200206220704.1109-1-ross@burtonini.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] perl: don't package the host configuration
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
X-List-Received-Date: Thu, 06 Feb 2020 22:07:09 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

`make install` installs xconfig.h, which is the configuration of the
*build host* used when building miniperl, used to bootstrap the Perl
build.

As this changes depending on the build host, remove don't install it.

[ YOCTO #13372 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index d4b6bb32b43..8af9dfa4a2c 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -139,6 +139,10 @@ do_install() {
     # Fix up shared library
     rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
     ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
+
+    # This is the native configuration for the bootstrap perl, don't need it
+    # packaged.
+    rm -f ${D}${libdir}/perl5/${PV}/*/CORE/xconfig.h
 }
 
 do_install_append_class-target() {
-- 
2.20.1


