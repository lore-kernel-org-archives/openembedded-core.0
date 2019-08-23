Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0187F3AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:53:03 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f19so6216343plr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XMas5NN4aSHBMxIWT50oSFhR3eg1jDYh+WkhSFSzslE=;
	b=QKEqgorxOhPMsyR76mosKYe9q8gFZWYN4KckUeznfE+76a3jANDrrhQ/cWpYkbIMQa
	RaUF00Q264KpRFcWKMi03jH1pFZ3oyNaQTk07SovJP+P5Sce9gK63sa84pHVt1xCOZCo
	RgbhxVdYa5JvFewVrvX8f4q6ffrdCQbJeDQSxZmeSc1MwAL8M1QH+21jn0GSNz24rxLI
	HKnqN+3Yp+EiRsT3aOeKl8Px81nbX3oWojnXtNfuLfSBpNgA8SdbvxYHjZhJRpJvtZ5J
	TTIP8RO72GfufLMnusBFChUb0bKVX9U9CWcETBQ9SrbTJRnACkUzTEU5ktNPll3XBPWR
	RwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XMas5NN4aSHBMxIWT50oSFhR3eg1jDYh+WkhSFSzslE=;
	b=fpnIPsegj5vr9bFPqmFwhrbX85ovO4mb8g0Qw3nQplqlWBmpwtDvm6ZWXh5/LVB7e+
	6oiUZBJycf7l9zXW776+WyO9su2wilc6B5UbZrPNghVUXDjKUtRg9vFxupopcwMsfhOX
	LALxEYDF+nCcHoZbRF1VGHWvFTWZYtsnxx+2Sr9vrsnoOU2UQo07hfwZtnvad/72PYba
	zyIhT0xfCn6SOdBFIXnTiZkMMY98alWRr05gdnzOQv93PjA4dSaJde9hcf94bW/ekszG
	1KfbPubofm10uOnoQE2F5MGNYhOJxiUsa8AH2WrxmYfWyYQ+WwB5NkPHLbd1j3C9FmzE
	aKTQ==
X-Gm-Message-State: APjAAAUwLascjOeiWqOa+yXy8wbVUyaEOjbUsukaKx3yN8QBxoegxVt7
	ZOSdds+Kzf6DswCjoVXBkxsMVats
X-Google-Smtp-Source: APXvYqynsr7HoMIGZSlTJcPH4fpHoIM8NFcGDBmLNRwJ2PVs+Awgy+Rn2jEEKDIUV7SV8pw4kgdo+A==
X-Received: by 2002:a17:902:b094:: with SMTP id
	p20mr7040652plr.320.1566593584207; 
	Fri, 23 Aug 2019 13:53:04 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:53:03 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:43 -0700
Message-Id: <1566593504-21918-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 12/13] sqlite3: make CFLAGS consistent across native, nativesdk and target cases
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
X-List-Received-Date: Fri, 23 Aug 2019 20:53:03 -0000

The previous simplification:

  https://git.openembedded.org/openembedded-core/commit/?id=604777acfc54d285f315b622bd147ed02d55d6fd

looked OK but didn't actually work as expected. The native and
nativesdk classes re-set CFLAGS after the += has been applied and
so any modifications made via += are lost. Use _append instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 7cf23d0..044af5e 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -47,10 +47,10 @@ EXTRA_OECONF = " \
 CFLAGS_append = " -fPIC"
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
-CFLAGS += "-DUSE_PREAD"
+CFLAGS_append = " -DUSE_PREAD"
 
 # Provide column meta-data API
-CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
+CFLAGS_append = " -DSQLITE_ENABLE_COLUMN_METADATA"
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 
-- 
1.9.1


