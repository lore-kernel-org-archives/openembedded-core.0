Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id C84D3788AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:34 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id e22so1565138wra.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wltxqtLNFibrh63Mxa0DVHuXOdk5vocIEh+ol6Ed3PA=;
	b=Xeo1dBDOXLlDTQgwllAdSzL0FhYPuy/+gt3ndYlA+93QPu0j+uN65gzhAxbyIyCrcv
	u1mWp9eVhB6cSZ+YuTJtSnUWUEpHhqIGempVI4jqSwnV6CmJxIs2vzhkZ2D9SrecD/Pt
	f+G6nhzKnDa73veANFioRqO/k05++qGbbofEkCfSTcHaESzyD+2orhjsR7ykNDzhobaF
	JzRiVZxpDEx8BPheCyo/uB6vqsAR7rhAe2jvsy6kS+ulTxhkv9phJCuLCdRuwHwDXmpo
	p91df2Uw9Ccpovwh7Cug7d6/VoZZq6L/0MP3LO5X4660+phM0CE3ux7t8rFkteuer6FD
	Ml2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wltxqtLNFibrh63Mxa0DVHuXOdk5vocIEh+ol6Ed3PA=;
	b=SE0CIXiLf4Bw7dyhuNVIhdpqIdOusKFUHNm3NBPuUc9Z/XoxzP9FNUXCoKd+npocCy
	isEWLi0gWFm8zQ7lPEOPoPvNpXBIStmiHRkT2TwU2EO8sT58StpeRcTR+CPWRtb0RrkH
	5tQGM/OtIyaf/IBb8L13dYhqe1508Iu1yb6OjqVD7jx5vSZ6otxMXBw82oX/Lgwyl56f
	wXMq+wbBDS+RowMsVvMMUDDr7oerqpXoSmlsyKcLH4cfQ/a7YTQOKtjVSS4MDzKkwwzl
	5xrwPKZ8LyeZ2c5UqkFZyUXU1hPEsiK8WBd9C8WneEA9Oyq9xhlbmzAyKmqWaL7z2xWg
	g0WA==
X-Gm-Message-State: AElRT7G0bUayXXspl4jLe8Uika7fi/C9f+tCxyXp+ewNivz5ms+GeFD1
	dGM2dBzxz51a7zedf0FJ869utQ==
X-Google-Smtp-Source: AG47ELsmGQFQEzdi+jYTERCj2Od4UGfxGNl+C1GUrtsyYw3Rgulk2eLCZmXkVPtmC0rJ/BtclPGR9w==
X-Received: by 10.223.142.21 with SMTP id n21mr2771681wrb.85.1520728955504;
	Sat, 10 Mar 2018 16:42:35 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x78sm5888306wmd.2.2018.03.10.16.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:14 +0000
Message-Id: <31a098032eb82eb40eaa3952de4d29ab472e368a.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 02/16] buildstats.bbclass: Avoid index exception in /proc/PID/io parsing
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:35 -0000

From: Pavel Modilaynen <pavelmn@axis.com>

There is some probability (depends on system load) to get empty
or line containing "0" as the last line while reading /proc/PID/io.
Avoid build failure by checking if line contains separator
":" before split.

Backport from pyro commit b26feaf51af55f17fad79dbd53dd3ec0a37c38ff

Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
Signed-off-by: Daniel Lublin <daniel@lublin.se>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildstats.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 599a219984..415d2ee820 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -31,6 +31,11 @@ def get_process_cputime(pid):
                 i = f.readline().strip()
                 if not i:
                     break
+                if not ":" in i:
+                    # one more extra line is appended (empty or containing "0")
+                    # most probably due to race condition in kernel while
+                    # updating IO stats
+                    break
                 i = i.split(": ")
                 iostats[i[0]] = i[1]
     resources = resource.getrusage(resource.RUSAGE_SELF)
-- 
2.15.1


