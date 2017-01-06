Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4A860107
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 09:55:15 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id f103so31220628ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fDj5WrcEoelEO6xzPai2/xDV4zhBU9Wny70yt6VAhLU=;
	b=1g0lZd3uzGoj6U4kQFAIdS99QmZ7mIwjAkyWNGeaL6I2L+kVJPZMc3eJWUr2MBgV3A
	ijFVyRD8p+vsMAF9Lk+DQeTBeysmcwWqUtAntv002CIq2ZXEeyGADzIHvSMunpjYqgFR
	AHtWteDD9U7jhUTlDWQbN+weOeHeCPIwojLG3iK6zKYBFXALf2iefGKCouw6FNh/xToe
	CRbxNeb60IjYerszB1NKeTM3kWgQEwHLpSnIEMA5+6xN7COkAm3NIlFRgdbHukcH6VeO
	zhk2atWdvbC1zuPNSUFQ6BajDIi6GR304oJfmMAbXV/IBrFoTvg6sdngCnVzyCIHUERw
	2G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fDj5WrcEoelEO6xzPai2/xDV4zhBU9Wny70yt6VAhLU=;
	b=pYXjkXenXvQl+bF2mRRBDA0wFMmH5zF6T/JLnEDZ8jRDIKqOAkSEMHPDU60IvOPqdU
	DavyjXHnGgfmXtadFCXxI8tm5qh3MHGA9kPNbj1sjz7G5pPKTr8uSj812UmgVIkLUFqW
	xxarX8q0WxEitYdgd52hfKHaRMqAsNHIhe0cZY9vV0yZ7gQRs+VZfaK1GSd52Kp7Djvw
	O+2skV+Z67xGBI+UTLjulseHxJp9Mk2JGQVJ2JB02d8r7AuAWzeUMDnMWBu7ctk6c0yR
	1fyfmsOGKUoHj3xKwwZfsdlWtEBNNHtJ5/Tqe0ArR0IifK9qFRptBqqxIVb9VRfA34sy
	JqRw==
X-Gm-Message-State: AIkVDXKCs8XSGwSxG3SmEzgszDayTLEXBuyLz3j70ZsFLZ0XA0QTb+gsq7OCpPuf2MMkTBd5
X-Received: by 10.107.147.10 with SMTP id v10mr56689226iod.63.1483696515292;
	Fri, 06 Jan 2017 01:55:15 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F5BD.dip0.t-ipconnect.de.
	[93.232.245.189]) by smtp.gmail.com with ESMTPSA id
	m128sm1157680itm.16.2017.01.06.01.55.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jan 2017 01:55:14 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2017 10:55:01 +0100
Message-Id: <8494f0f17ad63777d29ddec1eb1c553dd83da01d.1483696378.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1483696378.git.patrick.ohly@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
Subject: [PATCH 1/3] gcc-source.inc: cleanly disable do_rm_work
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
X-List-Received-Date: Fri, 06 Jan 2017 09:55:15 -0000

Using "deltask" assumes that do_rm_work has been added already, which
won't be the case anymore in the upcoming improved rm_work.bbclass,
because then an anonymous python method will add do_rm_work.

Setting RM_WORK_EXCLUDE works with the current and upcoming
rm_work.bbclass and is the API that is meant to be used for excluding
recipes from cleaning, so use that.
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
2.1.4


