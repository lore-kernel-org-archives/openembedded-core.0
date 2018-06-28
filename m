Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C98C748F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 14:44:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b188-v6so3888434wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=d3Gogv4wCSrVBqt+GTZROACXudNpjxLFb+WW9i7qiek=;
	b=yDXfo2fG7DdfxQQb45MFa/G2G+ZBJonlATDunYKUO45bersUHC0vnLUKqOwNqNbQPH
	X59GakKT36fmU5RVca4gpz0whIsR9HPNJOSd6d2EICFm0gQvVp1BdNsc+7cqkIhWsNJv
	5tsZHOHBmKU8U6GDz3oX29dI7uZ9wCVc42NrdqD0aaEPvJiIgcT+NKRrNlAcGRSQIYy9
	o/iYx70lgRHlEDfQ+y5Juwx7YmsbI8ZJCDvBhY5Ik9Cvi/sSbdYCKgURnYjp1sDeMopz
	/OXQYr92ar+5LYOtD2ZtRhb+KQAvZXO0rcf+9q3m56pxsBuh/BGEkinfRVcO+Spg23r8
	0VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d3Gogv4wCSrVBqt+GTZROACXudNpjxLFb+WW9i7qiek=;
	b=g/2YCew1jdrwvA02cqN+XKb256fsYaxwPuOQId5npSo7WAD0DnBOMgZf4ZdxZL6Nty
	rFd4N7MWMC6t2lpwPh6HcV8NKAfSls6IH4ARP+kSYhKUGsM+7Qs56sKdd/+GVBfZ2KUs
	uPLU9NZC+6B1PzJor1KknDDXAnAMntQwtooxh+vcwr04AqGbAK67XpNsdNLR3tPclMbz
	WEC7pO61u8yGYckSTZwG32xe0VFeO+vHow9a9mTcP0F+x1eZiNGUunk83dKJEFfW/sQT
	hs5FXkn2XJYttZJyNoWv5C9Imq7JslNGuYIFGwUuydwignsf2daebOhDrL14aag9bVrY
	1jow==
X-Gm-Message-State: APt69E33hRgiQJ/lMa7d7l7YFGwHT6TdLmenivG4f1DSrkEw2/daX71N
	wFLq5SpVwkbwwwnDG1NaPeWQyuqN
X-Google-Smtp-Source: AAOMgpeyW82MRJXptt2wCKh73mvsbaQLxWsaeTrv+J/nLTiuia/uRW5gxBxuI9Vi3Du3ShocMDYgwg==
X-Received: by 2002:a1c:9106:: with SMTP id t6-v6mr8813483wmd.2.1530197054401; 
	Thu, 28 Jun 2018 07:44:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i6-v6sm8657595wrr.2.2018.06.28.07.44.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 07:44:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 15:44:09 +0100
Message-Id: <20180628144409.5874-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] openssl: disable ccache usage
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
X-List-Received-Date: Thu, 28 Jun 2018 14:44:14 -0000

ccache and openssl don't get on:

| make[1]: Entering directory '/home/prj/yocto/build/tmp/work/core2-64-poky-linux/openssl/1.0.2o-r0/openssl-1.0.2o/crypto'
| ccache: invalid option -- 'D'

Disable the use of ccache in the openssl recipe until someone root-causes this.

[ YOCTO #12810 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl10.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index f7a8de823a5..995177d3209 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -33,6 +33,9 @@ export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
+# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
+CCACHE = ""
+
 inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
-- 
2.11.0


