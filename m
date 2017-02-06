Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 011256093C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:46:29 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v184so9982140pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kEXt1awbFLooQJIQ+rdu4vO9utt7aQuvJxDmOkzIpJw=;
	b=iMg70SMLOOfPX9x509luH6c0sEJYtXuufHUG2hoaJ/k1N5BK6ZiDIC0PFQT21C8H4K
	T7qxN59QRjKNwqfAOAe7bwkRQR7oT5Qt5aXJC2Chzc9xa970ACnzktVvUCa1+HjY05gN
	+wRrZiqsOE9K4W7YU/kYqpLUwBJjQMuW0g/RZwgrI4eIA5ylXxBr1M8K4DY95MXzHEqh
	8OiD0ZpHK2Z4w7wzao0aH0jotPXRvFo5o16REEmUMlfGH+n/wIoX03+j1Z9aiRTW8hrx
	Fnlymr6FsBc3yfZ6T65FOLZF6njnBNPz/HUUHqbvlSmmnQ2H/n71M+UP1Fbaz+PmAJYK
	zKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kEXt1awbFLooQJIQ+rdu4vO9utt7aQuvJxDmOkzIpJw=;
	b=YwmzvqfH0P96miibBX/wMoFrbD82u7OxaHTB8xS06EOcezyQKHfTs9V+IpNSEfeABE
	3+jld8DthgxIf+cgKj4ZYq3yLixza8kwrBLACDBikBDBID0BseU01D1jivziVIg8aSoY
	RkdyaFc56tPycYGcR96ei97q1Ks/Dfvi0no10O4KvlQwqiGQ0X2fu8TgT3eSGmXD1WMh
	AVSqStX1fCHL9ejqz7LaT1sUMSt2+QSokKKmMcJWhIZTcHw1/JO5ZtUQnVEzdwf40z45
	hZVWc4985T9jgDgTn66ncEtm90xTyf/ykpjjwg3StSaG3UVKk8b+l77saWoWWNQ4nYTB
	BK/A==
X-Gm-Message-State: AIkVDXIOKmIJFtkgvTX7VJz5RkmIiK7tyF+Lh61E+dQdjo+Aq/FpMxdVmyUsYm6Ii6YEAw==
X-Received: by 10.99.193.17 with SMTP id w17mr15739506pgf.124.1486413990092;
	Mon, 06 Feb 2017 12:46:30 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l12sm4868386pfj.37.2017.02.06.12.46.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 12:46:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 12:46:14 -0800
Message-Id: <20170206204616.26245-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170206204616.26245-1-raj.khem@gmail.com>
References: <20170206204616.26245-1-raj.khem@gmail.com>
Subject: [PATCH 3/5] pcmciautils: Inherit pkgconfig
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
X-List-Received-Date: Mon, 06 Feb 2017 20:46:30 -0000

Fixes
ERROR: pcmciautils-018-r1 do_package: QA Issue: pcmciautils: Files/directories were installed but not shipped in any package:
  /pcmcia-socket-startup
  /pcmcia-check-broken-cis
  /rules.d
  /rules.d/60-pcmcia.rules

Since we do not have pkg-config in native sysroot it is not
computing paths correctly and causes above error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/pcmciautils/pcmciautils.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 581bff417b..0524980509 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -12,6 +12,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz"
 
 S = "${WORKDIR}/pcmciautils-${PV}"
 
+inherit pkgconfig
+
 export HOSTCC = "${BUILD_CC}"
 export etcdir = "${sysconfdir}"
 export sbindir = "${base_sbindir}"
-- 
2.11.1


