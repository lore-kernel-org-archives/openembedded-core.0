Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id BBEB171DB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:52:41 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id r185so38961188ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nZXMFQI7Y2mNvd25hT9q4ZPCBNUITagSns0UNFxBPak=;
	b=qygdEYDHpCEC60s6yKTUPLAqM08NhAAiOJMwzykUOFuMIaEwzy2DorFHnJEvIAjwhA
	924CGsmTyhOpJgYSPbjIisSsNLOrgFHPsT7EKiz4mvD+WNUL0xNUSpyfjmQnBYN/qjQ4
	zrXw2gEaJf6HoyKBheV1JI3sV2gB5DHKmAAqrpPdhNEacgefgKqvMCbTe+Uq+yT1XT6n
	XRntHeNJEq/ZGqflMWcUPIkIR7Qza4cTdG+Pypx3JxoXCdFsf9Opujs3Q2c/EBMgt31N
	g9AtwbWAdVEtZNTQFiXPEUwtx2l5mztMl81zLmh5ixxD85NAKX+Pcszm+jpH1nfVeEXP
	1RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=nZXMFQI7Y2mNvd25hT9q4ZPCBNUITagSns0UNFxBPak=;
	b=kETbhQ12Hcq3Kj6sSptNNtfw32LkySbjKCTDuyo0UOFl2PZsWhbT+iNpYoGvtE9zS8
	ELzJXnEwLXUnxuq7irBa2kXNcftll97OETSUeSCLZ7d1gbc7SbMtcLQMzKLUsrq766y2
	IR/zA6LkyeY//pJO3wDaL5WowuMoojYhwlZosOYxnU4PmYsE0ymyDs5eqODBcJftGjrU
	Rl/hnDRsXvK9WktvfKRmdcO6YBBh2Gnprk1ufMQJSSQ3mVmYGkFa+QNskqcR0V/fSXum
	DCn8F2eQuWDve2a0b51SBH4fj3nrJmNPMwqR98i9xmWgzlflhrc7E+RraQBzrSxfKRw/
	Uw2Q==
X-Gm-Message-State: AIkVDXIgGZLCr/L1+HQk9FpJvOenimM3FDQVM1on2C+7E63zhfXLAqxLzCBd94yzXwrL7eSi
X-Received: by 10.36.240.11 with SMTP id s11mr2962642ith.16.1484319161988;
	Fri, 13 Jan 2017 06:52:41 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56056.dip0.t-ipconnect.de.
	[87.165.96.86]) by smtp.gmail.com with ESMTPSA id
	o138sm989394itc.18.2017.01.13.06.52.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:52:40 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:52:31 +0100
Message-Id: <e47e11e502fe979867f748f225d052899ae88c17.1484318722.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 1/3] gcc-source.inc: cleanly disable do_rm_work
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
X-List-Received-Date: Fri, 13 Jan 2017 14:52:41 -0000

Using "deltask" assumes that do_rm_work has been added already, which
won't be the case anymore in the upcoming improved rm_work.bbclass,
because then an anonymous python method will add do_rm_work.

Setting RM_WORK_EXCLUDE works with the current and upcoming
rm_work.bbclass and is the API that is meant to be used for excluding
recipes from cleaning, so use that.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 49bde92..0d0edb5 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -3,7 +3,7 @@ deltask do_compile
 deltask do_install 
 deltask do_populate_sysroot
 deltask do_populate_lic 
-deltask do_rm_work
+RM_WORK_EXCLUDE += "${PN}"
 
 inherit nopackages
 
-- 
git-series 0.9.1

