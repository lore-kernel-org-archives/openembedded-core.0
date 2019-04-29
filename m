Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA4A87DBDD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:55:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c12so16485531wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6hseZyuaPmxDaX4HQdlAa2cxX9H3TkpxPqu+yBp8smc=;
	b=1ofgcoQXKj2k53ew37KiaDgY8WhmkNBORGs77vqJHyO1bDGQSaOFQvGnh6oqNeoam9
	zSEvg0LpJ7T9MB+wwbhRraHIGDmxMjDBpmiZezx91U85ynlpD8SN5txIq8V4vrs6J+nf
	qXp73If175xqLanda3Veu4HdjItaQZ9C0RYMbU10FGFY3AKqPboYgZPVy218Jr8gsZQJ
	3J0KjI7+aGwpfQ4NCF5o4rYWNsTXMprJZAmhtRdrTr6RL8hWmPDLh3Z6Myo7tjOMumSm
	rT/T/K6X7dbfAFpwxcwgQIjqslrjf6BQqtH7d8ThBDFa1CeRVRtWqKNjjvUb5NelLjqV
	o26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6hseZyuaPmxDaX4HQdlAa2cxX9H3TkpxPqu+yBp8smc=;
	b=Mcr0uV8fOJmdHTFxspq3Y2JBgas9LMcgDT94T5voSZIoSMDRogCXm3jsIQa6t6AMGM
	5aoeZDLfwZFjH2SE8XQEVjj08CNqaXRVWgap5AxOS7etbkfIgw6Skmxr2Cd/yYjy0ZFr
	IFS45aD2gcy3aowQ5/VAnuuOA/3MxY/jA6IulYOcbbJSVrRK9hTZxEkGtL6kxxaHf+rf
	qGFdWaTN5zzDZWx7ApFUCyNrcRPgSZqCjQvWmKck39IZp9b/q/iaRPcvC5KznW+VYwmM
	pW3hIsqPUGlhlRi8MeW2TKZsqPFCwp6PNxR6QwQKzT/gOOXwVEXOGDNg3YRPJ3lAIxaS
	h5yg==
X-Gm-Message-State: APjAAAWeHu5aBEgI4xcUgtr+rCSBdQg5GJgpO2Fh7pScBySWu02LBKKs
	EcsUxNqUK4UbMc8gR7UotKa8YSYC7x0=
X-Google-Smtp-Source: APXvYqxSFXGSXUBhi78lqnOlVFOpVuL4g90hPpr9tC+gN7/H2DIAAfuBrlY4sIuFZH70udPDpCTu9g==
X-Received: by 2002:adf:fa4d:: with SMTP id y13mr10712675wrr.4.1556549714270; 
	Mon, 29 Apr 2019 07:55:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r6sm25969378wmc.11.2019.04.29.07.55.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:55:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:55:11 +0100
Message-Id: <20190429145511.8286-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] staging: add ${datadir}/gtk-doc/html to the sysroot blacklist
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
X-List-Received-Date: Mon, 29 Apr 2019 14:55:14 -0000

When api-documentation is enabled the GNOME stack builds API documentation. As
${datadir} is in SYSROOT_DIRS this documentation is in the sysroot but is never
used, wasting time and space.

Add ${datadir}/gtk-doc/html to the blacklist so that the generated documentation
isn't in the sysroot.  Note that we don't blacklist all of ${datadir}/gtk-doc
because gtk-doc itself installs files there which are needed to use gtk-doc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/staging.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 062b2817c88..6bcd0b087a0 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -27,9 +27,10 @@ SYSROOT_DIRS_BLACKLIST = " \
     ${mandir} \
     ${docdir} \
     ${infodir} \
-    ${datadir}/locale \
     ${datadir}/applications \
     ${datadir}/fonts \
+    ${datadir}/gtk-doc/html \
+    ${datadir}/locale \
     ${datadir}/pixmaps \
     ${libdir}/${PN}/ptest \
 "
-- 
2.11.0


