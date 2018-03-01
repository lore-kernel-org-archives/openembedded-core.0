Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8073271C9F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 12:29:48 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k9so5906968wre.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 04:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/80c2s6TXso1Jj33UgMM4QVX7Sfr203p35MeFoJOywQ=;
	b=Jaiyh5qdKhMdhj1ZK8aptaryBraWBHV2BlKQlr7x4YtFNlBoN/n2iR0dYHJgqzcJSv
	X+r9j8qsH2nsPqbt4rJ+SAMvslF3pZc4F9ZWLQCXjdhrVPMDoCPnc5kilW0puNPmI+cb
	Cxzii7JqT0QmWOSObXkEXReaUaV4uN5kZPzx4L8ntXcDVbR58WMsl3UXYy7n6AnT3Yj1
	9srXj1NDadO8XhSocJW42j2T25/X3ZKGtXBiSG7u8b5Concen3i+GygSEDilVuC2R0se
	z5IeWEL0fg1XvdiR5WiZwCo/ZQA1KjXMyGWwIi1zFZySHI5OQ0DSLr5ly+VisKoGWs9K
	Ww/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/80c2s6TXso1Jj33UgMM4QVX7Sfr203p35MeFoJOywQ=;
	b=Y3z9WA0DND1vmg/WSoGY0pHBPW6ObQnLpVlGm7VCKnjSycaPke0bv+cflyETQF5CV/
	2PLipncUb5hemCzLm4uUWZJH/g4gTTH2rX/6MDLApQvLDR1fc6onAw883HV2HLZ1egCv
	C8DA06PTvv8LpXjiYxX8N4xQRLNuFKBi8kcFVp6Ldaud8mH8AKBfPkMA1P0bIL/KJxs6
	wnWjCGTa1M/TNLl4D/QMdMcsD1FjPMdrWBesbZEbkGFjHCMXpnTuHYjPDnx4Vuc+qISb
	COvqjyw/3wWTvy1F+Up7qTyt3Q43SnCpXo46Z/2zjm7vsbBtGQSeoyd+0TXC14jcZE1e
	Nnhg==
X-Gm-Message-State: APf1xPAhGoGHSsa6HcAo5/KKr1qrU8YjiIv8VidNNHrMql0eI9IInPgX
	9QbdfeIThVP+sBUnrn3WNckFhvGn
X-Google-Smtp-Source: AG47ELsNK0ahN8UTAX1YES6pcyUTG4jqJ36YoDYREdxu811JmvJMEWAF49hb/bci1sX2FbM9UjZocg==
X-Received: by 10.223.173.163 with SMTP id w32mr1683596wrc.204.1519907389084; 
	Thu, 01 Mar 2018 04:29:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y28sm3776679wrd.46.2018.03.01.04.29.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 04:29:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 12:29:46 +0000
Message-Id: <20180301122946.7388-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package.bbclass: fetch PRIVATE_LIBS twice as we iterate twice
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
X-List-Received-Date: Thu, 01 Mar 2018 12:29:48 -0000

The shlibs detection/handling iterates the package list twice, but PRIVATE_LIBS
is only fetched in the first loop which means the second loop only considers the
value set.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e7e93a067a6..317c77585fc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1773,6 +1773,9 @@ python package_do_shlibs() {
     for pkg in packages.split():
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
 
+        private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or d.getVar('PRIVATE_LIBS') or ""
+        private_libs = private_libs.split()
+
         deps = list()
         for n in needed[pkg]:
             # if n is in private libraries, don't try to search provider for it
-- 
2.11.0


