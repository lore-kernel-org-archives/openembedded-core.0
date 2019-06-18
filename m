Return-Path: <matt@madison.systems>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 31CFF7E894
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:37:37 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bh12so5605300plb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nfAJ8ymE1z806mQHUKsRAtUEall87dMkLojYZ8omnGQ=;
	b=O+5oUi2ThCC/NiIPjXJFDYlsH79kdSMWv1Buj0yDF9l0RGELTVPdBp+o2p4499UF3E
	euuql2hODrSY1jtd03B9RCybdOR/0kj7MkHe1Mi3+ACGDu8SxXyvwNwIKzVrLibAKVuq
	ojq2k0ad81Cq2kH0uwUKoKPvRKhtlSiJOWCg1q8Pl0g+77SvCJ/8JTnEoyhio7ktoKqF
	BfZv1nT6JArTuelO8ybFRfwKSJkEC3wFMV16NntJNcwaHZ0zYZNwCalH48DVyTY0zBke
	Mqzt602tz6Es7t/9vzlwemrKwouNBq41maSsoaapvr6vFGw64aUPED9W7Ol/Bx7vKTol
	Vg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nfAJ8ymE1z806mQHUKsRAtUEall87dMkLojYZ8omnGQ=;
	b=Z7m9dJDYXV+1A83MBVgmrkDzjMHNOqmwUMD1b8LrIj6nbwJkCYLR9x7TLK9WEYm6+D
	ZmEgDJn75/NxPfCN1Y6OcmgEhrCjoau47yrCcgcHAgc+6FRq+rJg8JbzXoxW/iG1hd6h
	VdxbBeryvogtJ7rPMEhh+iG7v0mSrZTzR9OyojUkIn8FUbUlHoEZatwCko8+YMuAglLx
	Xub6facf6Nr4HpClJkKxI/nk10bm7YED422mBaX4ss3eyNvckq6Kpoddp38kdqUYmUEg
	mjVZjp/0RI5Wr4oOAcUegkFIqbSI0qn7prUdr9a8dqDmW0x+6Ndd+nJ6OKfHOmdjTjIs
	6xlw==
X-Gm-Message-State: APjAAAVAIJdtPNhv46VPlPNa9diSluA4mESlXt3WKoUD2+khwUFq63L8
	Dram8vbtslPAHkP2J7WjS6TWwrqmEOupdQ==
X-Google-Smtp-Source: APXvYqwXfSv5r6Hq+pk5plav2e/rdWz+xIR0UDgTbHyK6M9foflFPxce72dxaOxh3NbJHXFDa/Kj5A==
X-Received: by 2002:a17:902:2862:: with SMTP id
	e89mr114231813plb.258.1560857857941; 
	Tue, 18 Jun 2019 04:37:37 -0700 (PDT)
Received: from legion.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	y14sm2117846pjr.13.2019.06.18.04.37.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 04:37:37 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 04:37:07 -0700
Message-Id: <20190618113707.25101-1-matt@madison.systems>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] apt: fix permissions on apt-daily script for systemd
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
X-List-Received-Date: Tue, 18 Jun 2019 11:37:37 -0000
Content-Transfer-Encoding: 8bit

The script needs to be executable so the service doesn't
fail.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/apt/apt-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 6a01f99c63..da91451d7f 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -83,7 +83,7 @@ do_install () {
 	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
 
 	install -d ${D}${systemd_unitdir}/system/
-	install -m 0644 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
+	install -m 0755 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
 	install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdir}/system/
 	sed -i 's#/usr/lib/apt/#${libdir}/apt/#g' ${D}${systemd_unitdir}/system/apt-daily.service
 	install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}/system/
-- 
2.20.1


