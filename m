Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 571E460CC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 19:46:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w12so326153wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 11:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iSqvl7ZiJSMpdMVrp/n3Ex6v3m56qjrvXpmw4yRfLAA=;
	b=ev5Qif0B8nJHE8EsMUHRDTO+rFIGCvqTQhPTw77RDAymTV30gQ8bvYIGrJrLQHMB4o
	lxBbw5P48l1yQ/eS7pdYWpGkr1x6JykCejfgS4yfkkX+IWwqTZNia9f4UR1uNXY132zB
	YZotah3wUFB3abY4oaeqJLP7moUTg2XPWBpHZvrBnYq4wOaCsOPcGDMAlui6NryBs9HZ
	UPKZ/dSY/M4uOq6BsdrVoVI/h0VPOhur2Mix90GFquvRRMkE9gj4jrmmnQVew8kfOGx2
	FOlSB6bSBk/gnKpmYXasZyPSf4mYHR/bz8vxUS5ZW74jJttAe4/R7QrMwM20Ao+ayzWG
	O5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iSqvl7ZiJSMpdMVrp/n3Ex6v3m56qjrvXpmw4yRfLAA=;
	b=ZxzmR/7B5kiOu3VRaYEonk6A9eL4MyfDPeE4j3fKf7uXoJCOAY2bE7giXD6ozAhVfs
	WbFyGbpI3Bc7pxMUA0GBe7Z/TvByz7Wvierzqvhi01dsGtGioC1Co+U5J+llfQR6Ks6t
	3Vt7iT9MbrMH1RSTreUptiDNqk9eatRKp4uHS/lByxHKIWuIdZ7rZL0xbbYBFp7CXJWt
	AnjaTliHy4Wfq0cAg+2zm6+yxZmNOygMZqhy1oSAPVm4lL2f6yyaPc2NnedlnA3LySft
	ZwsTy6YLpkTJQBrM023Ijh06h76MUNLgx2CIQZNicSYAnlGub3V2qoWcBOm+Gc71GLk8
	D2DQ==
X-Gm-Message-State: APjAAAUqNht2p4EvynMYU2yvophAwoLzhTlxdVwXSUAjBS9we86/O5+n
	mE07uoaHdUnZUHe1oh+hJj9ua/9b
X-Google-Smtp-Source: APXvYqz8Phz3qrtwhl79iMXVDdYenRv3Nwt6gWu7nwM16dI1LRaqEMMC22rc26/CHkqJAiI5LVckCw==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr717387wrw.60.1581104807426;
	Fri, 07 Feb 2020 11:46:47 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69])
	by smtp.gmail.com with ESMTPSA id w8sm4667770wmm.0.2020.02.07.11.46.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 11:46:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 20:45:57 +0100
Message-Id: <20200207194559.527-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/3] core-image-sato-sdk-ptest: do not pull in ptest-pkgs
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
X-List-Received-Date: Fri, 07 Feb 2020 19:46:47 -0000
Content-Transfer-Encoding: 8bit

The lists of ptests are defined via PTESTS_FAST and PTESTS_SLOW;
specifying 'ptests-pkgs' also pulls in additional ptests that
are specifically excluded from those lists due to causing issues with
ptesting. (particularly bash-ptest is one such item)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 85b5adbc69..58c257c49f 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -3,8 +3,6 @@ require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
 
-IMAGE_FEATURES += "ptest-pkgs"
-
 PROVIDES += "core-image-sato-ptest"
 
 # Also include ptests which may not otherwise be included in a sato image
-- 
2.25.0


