Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 959796C479
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 15:08:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t27so16330211wra.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=jhe7rNKM2LRT/nd0vYSqsYoBzppiNpytugEP7IUdWJE=;
	b=CFoahLXlerej5SnKKu+LepSm6aGolWjxoxHpo4MCY8F/koZeymV/4pf0VrZKm8nhGS
	Y40naHPgWMXBxWemgOTtZLA4PRYvR4FPfUeX5+VIQspxYhvXzZEbsEa5GXhPq9az0AIH
	VHd+cCQUXL8aIEFrZv0y/Bwa4wxDGmMxQfD1zWuxovLf3xCTCmQUAjtJ8Z6PoSfQEotm
	8q4PIbrZCJe4uaj3phvBxGqfwqbcT4ghcSO1gyVKqFmzr4bT2Iqd9zbCNl/LjHFyVLnq
	WQhzzuReBB/6POgBrH76aDfYRE4hzWTBxpSrsuHhb2Fn0kHmDMYJ/wr4X4xQtLMRJ1ng
	3sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jhe7rNKM2LRT/nd0vYSqsYoBzppiNpytugEP7IUdWJE=;
	b=HhKSpyLiC+jtr81UOszV7cZRnnUMf8+s19bd3FgolC7Bd+0pwrw7nbCS0vIphIC6O6
	O6ZH92ahrLxO8y+hfxtK4SPSkPw62Srsdd7oSUNwAmRvHzy440CBibVw8hCjo9nbAcjI
	aHPoNCH6331P8nS7X0tzF/3yIDbvD4SZsATx1g0paHdlk4wWfYIwVowbMH3NamAotyT3
	ppcc2AOWW5ijyxIkubcmnO/I53KV4ls++teUz4+nCS6mvJR0EkAZgLMS218ypf0sWZO3
	wMkX4NADuscKH6fySMw21sYhxlq57zuSt2d0Nyp2rFrbkE9tuQ/OM2fzBwNhkTYwTov0
	+dMA==
X-Gm-Message-State: AA+aEWbMSjICXIG9AhPUdrnPU5tvZuBnNJi+xHmxguWR0qhUS0nASfKc
	wbomjTADrp/oOVF9FYU0PW8bgaUhS6I=
X-Google-Smtp-Source: AFSGD/WmSvk8r/znsTi7herf/r6D6zmyE4j9TUUJ/JcCiic0fHh13t6KfJAx0k5q3azFR8fiKbyHrw==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr17780454wrr.280.1543936131927; 
	Tue, 04 Dec 2018 07:08:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y12sm7393640wmi.7.2018.12.04.07.08.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 07:08:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2018 15:08:47 +0000
Message-Id: <20181204150848.15759-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] python3: don't cripple target distutils
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
X-List-Received-Date: Tue, 04 Dec 2018 15:08:51 -0000

We stop distutils for *native* Python from rewriting hashbangs when installing
(so installed scripts don't have a hashbang that refers to sysroot paths), but
this isn't needed nor desirable for the *target* Python.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 3c7b40c9506..275b7acd652 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -10,7 +10,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://python-config.patch \
 file://030-fixup-include-dirs.patch \
 file://070-dont-clean-ipkg-install.patch \
-file://080-distutils-dont_adjust_files.patch \
 file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-- 
2.11.0


