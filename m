Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 892007828D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 12:38:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v71so22620307wmv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 04:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q62S9Skor6mFowuqIjdFwwsQyj2C4PDhbW2IblswgoU=;
	b=oUxFgYaL8d25LSo07xggbxUvMGJcOwXJX8XBNBKtbkCxyP0uimpvj3ES4QN1TBULlV
	sa+x9s/gKRhWFp5nx16RHvJPcvp6WszkQFWV9IT8TcTp9Dlw2qTwarTbcL+Fv5sb/Bid
	w6fPe/WEi4s2jxHu/NYCyWERGO8jOdFac6OW6Rc/yfd4rdAoZyKnyrjN1YuoO+seMGxu
	QDTu6zq/boqG87LCGomsGiNOj/TbAp7DsdY96/aaOaHNzYxyfghGSUj9Nsr6mblRrMWI
	MU67ZiDBBIhJTxBfriJWxBIbgQ+sS9NpwCAyMVci1XmU/gyUuo7xFdhF78ni70WrH9F6
	1WOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q62S9Skor6mFowuqIjdFwwsQyj2C4PDhbW2IblswgoU=;
	b=s3BLGpcA3XT+83wT1qQYk5/urWoLgm2jvDEE4LpcSVoyP+u/jhb0WEkdA9S0KREJuy
	iK4vLzwrCKVOjb8LbTyvMLUW2QBpcpqzXIHB4lsqK8ZS+Nj+ktqnWJN11NIM6jcrx7gL
	6zNx1j5Nn5KUmftX5lQUZL2c7ODf7dakzagYsQZhYsPRe9tIkuuLHcUpw4JjKlVWlMhF
	gvM1/rnZskz48CvUyiV+Eevi6o8BWln1d+pXKicJlz3W5c4upUVPkbMYohI3BaoiyvN+
	nkIPBmQ7mKg3EaKbsUVdYmjPKK6EYowfagVsEcPgnDLPHwYbCnb25QCV0Z33y9+x7Snr
	a+oA==
X-Gm-Message-State: AKwxyteGg+Zcow4ikx2iT8l5/h4jZ/xFjyhveqPml4MjIbrT1O6El8ih
	9PnVz1Vpn26xEYEsDpabAXxzQdzf
X-Google-Smtp-Source: ACJfBovmk/tf0mZTrbWDLywRbOv4LZjoWDq/CfSDRPaXFtvW/RxF3OETFNeISOBa//SuhGloEJW7ZA==
X-Received: by 10.28.7.68 with SMTP id 65mr3947035wmh.9.1516279091078;
	Thu, 18 Jan 2018 04:38:11 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f48sm4464635wra.72.2018.01.18.04.38.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 04:38:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 12:38:04 +0000
Message-Id: <20180118123804.2465-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180118123804.2465-1-ross.burton@intel.com>
References: <20180118123804.2465-1-ross.burton@intel.com>
Subject: [PATCH 2/2] cmake: use Ninja by default
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
X-List-Received-Date: Thu, 18 Jan 2018 12:38:10 -0000

This changes the cmake class to use Ninja instead of Make by default.

If a recipe is broken with Ninja then the recipe can set OECMAKE_GENERATOR="Unix
Makefiles" to change back to Make.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 74a952142ff..d60dad8d66b 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -9,7 +9,7 @@ CCACHE = ""
 
 # What CMake generator to use.
 # The supported options are "Unix Makefiles" or "Ninja".
-OECMAKE_GENERATOR ?= "Unix Makefiles"
+OECMAKE_GENERATOR ?= "Ninja"
 
 python() {
     generator = d.getVar("OECMAKE_GENERATOR")
-- 
2.11.0


