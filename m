Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF757FCF3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 12:20:17 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j42so15902410wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 04:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZLoABNFiMIlJlrgebsJ0KHBlYO2pNKFElpeyyVt1UXI=;
	b=Q0gkYaJ4GglLZmmCkV8Ug22YDWkdXsBzq/W459KaVvUg7NGs7evkhnM6ZYOwWUNGr5
	2QErEsIXW8hGMX8mqmF2N3IokM4/Avz7aNOuwd1feBgKomG+kr+n8py7aqV7DIxdQhnX
	KPd0AgUxLrVkyvVwldYGjF5bYJFAgrdh0+BNvs/CYhUeenXr2U+ervp4E7NSs3Y8qSL9
	9scdrAoSuoWXweFuxxuwCI7Z/OeJM3nLRdstzGK4TwDM5lo5CnUI9nKMFs0osfAYNq8u
	OSU1JmJQ4apMCYCqWdp2qKVlsXiC23fTy3v4MuS7ExcNYk7Je1yu80YqqCdLGk59bgun
	Jd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZLoABNFiMIlJlrgebsJ0KHBlYO2pNKFElpeyyVt1UXI=;
	b=KkgCy1hFC6zbAFhoxboGw8ujSNQuoV8R9OFcWT47UYOcxLqjA5l/O9H1XIaDISri7K
	mjtUqDgDrbfpwg73yPswIfgaO6vFl4bg804lTCWOhBk8T+9jHmEDb3fI9VASyt+ZYIJB
	PTWWIjBiUSWTCyHRVLq0CmLrgFTOP6/v/YlwPBJmrHYZ781aSVORQzUnV5c38g3YxGJ2
	4/gOhowrJIUj1kdrMUyRqaWVolErLfNuWd+5e7EL1gr5oBuRc0Lt5fWg2UjPIvfyWi0B
	BIQJWiIItk9UHFvgG/g59BuVrPwnvbcNdXgofgqnkajiA/SatCBREuhkqZrla5nlVyXv
	uhwQ==
X-Gm-Message-State: APjAAAWqcQl92rKH/LMcvNZe7fFfsdoJsHbOh7ftKOS1g3gC0YAX47i5
	mckrimYhzs5XjJT0W1l/jicW15JlylM=
X-Google-Smtp-Source: APXvYqwJbeuDBq0azeC3n76tBoSNUWdl2DIunqCO1LfbHPJG9R8ty7FQ+CFRuEP0JAyLDMuK7RBtPQ==
X-Received: by 2002:adf:fbc1:: with SMTP id d1mr1903416wrs.267.1575894017996; 
	Mon, 09 Dec 2019 04:20:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a3sm14611177wmh.5.2019.12.09.04.20.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 04:20:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 12:20:07 +0000
Message-Id: <20191209122007.13306-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209122007.13306-1-ross.burton@intel.com>
References: <20191209122007.13306-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] insane: don't use cachedpath
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
X-List-Received-Date: Mon, 09 Dec 2019 12:20:17 -0000
Content-Transfer-Encoding: 8bit

Unless cachedpath is used correctly then it's just a glorified clone of
os.walk, but without any of the recent optimisations in os.walk.  In
this codepath there is no point to using cachedpath.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0564f9c2a41..723348fc8e7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -937,14 +937,13 @@ python do_package_qa () {
     pkgdest = d.getVar('PKGDEST')
     packages = set((d.getVar('PACKAGES') or '').split())
 
-    cpath = oe.cachedpath.CachedPath()
     global pkgfiles
     pkgfiles = {}
     for pkg in packages:
         pkgfiles[pkg] = []
-        for walkroot, dirs, files in cpath.walk(pkgdest + "/" + pkg):
+        for walkroot, dirs, files in os.walk(os.path.join(pkgdest, pkg)):
             for file in files:
-                pkgfiles[pkg].append(walkroot + os.sep + file)
+                pkgfiles[pkg].append(os.path.join(walkroot, file))
 
     # no packages should be scanned
     if not packages:
-- 
2.20.1


