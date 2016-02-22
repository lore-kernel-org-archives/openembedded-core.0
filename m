Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 207207719D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:23:56 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b205so162954986wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7vEMpWK9r5Bp89/B0DEYjfMtoeV2SWcrz5XyDdMa+JQ=;
	b=QBpIzCiN+LQ8qixwyBUJbxSd/o9C1Kzv6jtXf/ce92j4dCxP8G7aqrRCvOwg3KPpsD
	C/+ceo5R7fSaBwa43P6FneaK6MreLdBC3SIBEQCQvCmbgJXezz/XBt72WA6DRm9Hzrtx
	hv34a8qxNGUnBFfVWe/SBK1zRQX1nyLsn99YFn5y98cthRjUErGc2g8NuaocNq+It/fH
	8/VDr6PNI6zd753/h0GVfvVAeil5UlvO2CE/nmOHMNWQOmOg0ET8BAAZX66RISDQZut1
	mALq17lf4OxgsdxwTqJfsvY32CqzHy6Zfx6eUc5ur9V3d5JYpaoKpaJc/cD2jYfi6PwS
	JnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7vEMpWK9r5Bp89/B0DEYjfMtoeV2SWcrz5XyDdMa+JQ=;
	b=Ab0wDN3vEYD3EMZZR3vb08GKxc8n3H+iCLMDGkA0zeoSr8hhZh9W/RuAQ9jDPy7WrA
	twH5xgxIsVw+AR68a9u4clNNOxJTD8OqWs2epR2Ss4iC4yuoNYhW5KRBtiscWzfWOBWJ
	G2QMifTh0Yp5k1ACQoYpC/SqtBkn2WU4r1/EDH+jbjt6KoA29obsEri6r53hpPkSc2WI
	sF2WrlJnzcT1Z6Bo0posswlNVtVKztwK+C0K7osdo51neBsCgLXsTILYBDAo9ZfEtV6Z
	YGFk9RD1/kvbSWk/kFXENG1rKm5U7eWY8+ZO+tTDKJlxR5xokPkddYCrH/T3QspeeMKL
	0RwQ==
X-Gm-Message-State: AG10YOTwWkvWZMWvaxtq0Og2xmhSmfwftdVNakdNRg5Aga5g4b7fvahjnWcgq0F6z+IbK5N1
X-Received: by 10.28.238.144 with SMTP id j16mr12698399wmi.43.1456158236737;
	Mon, 22 Feb 2016 08:23:56 -0800 (PST)
Received: from flashheart.burtonini.com (94.197.121.248.threembb.co.uk.
	[94.197.121.248]) by smtp.gmail.com with ESMTPSA id
	i10sm21799039wmf.14.2016.02.22.08.23.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 08:23:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 16:23:49 +0000
Message-Id: <1456158229-13886-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] bitbake.conf: add findutils-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 22 Feb 2016 16:23:58 -0000

It's possible for findutils-native to get built.  There's no point in this as
this is part of the expected host platform but this can introduce races or even
bugs (4.5.19 appears to have a leaking fd bug, resulting in asserts) so add it
to ASSUME_PROVIDED so it definitely won't get built.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ac93702..9a4cbdc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -170,6 +170,7 @@ ASSUME_PROVIDED = "\
     bzip2-native \
     chrpath-native \
     file-native \
+    findutils-native \
     git-native \
     grep-native \
     diffstat-native \
-- 
2.7.0


