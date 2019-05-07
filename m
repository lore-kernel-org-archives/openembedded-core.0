Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9B372EB7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 01:19:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p15so64262pll.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 18:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LDc7snlcUGw1SvK0elBgy5v1mzpKw0pbu48WwlhferE=;
	b=boz/OoWApamF638yIVvIy5oXt27r8TCYmDWxGad4gm/IL7+aN4yRA6GlP3Q9Q1t6j/
	HW+t0RPc4gKAg3V3QQUTgrLx+Yo6giLJRDyg9iTh9CuKZHey/1cGrcZjICNSoP4cez2U
	VvK6aEZjC2q2/Rr2o4rs1eQeh0/akkXnmM0ACW5kR32vdtu8+8G9UI9MZyJYIcKOkmvf
	UJr2nYAhBDa5jlkceMZgPOyLoZyjwRtbLt18MhMyFZ/f/ubewm8GhAUqAzitjU1UJueu
	JzuVFKq0aIRvhY5Ttm9JLLQsbdp3VLblBiKxq6G58HinJJH9kQqQs9YzyWFLBeUrc1Rj
	SXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LDc7snlcUGw1SvK0elBgy5v1mzpKw0pbu48WwlhferE=;
	b=aKosd7U+crkTWsJCotbbqYYWhNQDHlv7sjb2v3kKen4UbyetxYk/0W58nCn9Gl8pct
	W3DqNgPk7FKBRkuq5Pf3oP3Be9nEujjLd1lr0ZbyDJRJ+iA3HcyrHnvDWDfe2mYiwxm5
	R0LCKCcR2VHnee/ch/Q+ulV7p1657GB6izPR24LwWhRqTs206YRhjN0peY3nJzpeZi1s
	hXecMYu9tpW/3Pqb7bCcQihSI1O3zex9k9W5yANWi1vOob0hfNC70t/AMkaSy299xFao
	Ba/47tzeAuKwMgvfQcn2T7FijGFUM/03FYbwrSdLqR4MvPVZZfK2/KynTseKATYddf3R
	h7cg==
X-Gm-Message-State: APjAAAV9piWLMby94n2hcW9CysEiGqJ/T8LDd8lI0XnXk1Kqlaz7O16Q
	6O9DmIKSDtrvZJbRZwAXTdkZBfjCDC8=
X-Google-Smtp-Source: APXvYqxmw1A4nKl7ISfMTzrkgOazL1vVKRvLbsYZDz6vwYz9YPlFvWYCAmh0ft55a/jqVbE7FwGhFA==
X-Received: by 2002:a17:902:74cc:: with SMTP id
	f12mr9997413plt.213.1557191940585; 
	Mon, 06 May 2019 18:19:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id
	e193sm23758121pgc.53.2019.05.06.18.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 18:19:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 May 2019 18:18:50 -0700
Message-Id: <20190507011850.28522-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2 1/2] systemd: Add -Wno-error=format-overflow to fix biuld with gcc9
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
X-List-Received-Date: Tue, 07 May 2019 01:19:00 -0000
Content-Transfer-Encoding: 8bit

gcc9 throws additional warnings about format string overflow

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index a6b39d57e8..69b1f7ed0e 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -204,6 +204,8 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dsulogin-path=${base_sbindir}/sulogin \
                   -Dumount-path=${base_bindir}/umount"
 
+CFLAGS += "-Wno-error=format-overflow"
+
 do_install() {
 	meson_do_install
 	install -d ${D}/${base_sbindir}
-- 
2.21.0


