Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id DF47D601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:44:22 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id k12so164931836lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uXygvL/4S2sZb3FXRDQG+G2/tJtIJHcauwnFVYQfRxA=;
	b=KCKbbBLvXwXAUA1EWMOG9+Cishe7tEayaIy52JlyicurCtgZk94xj+sa/gQdQuEQVF
	o+rq2emLaV3q0R2Xuf4DkJVpS6YVmsp8/FFxs/dg8hEAxi0NRLmx3j6UdJ13jMkT0fId
	0DBueLti1ElX6D4csAwX5Rq1yRb9/eA4nnrfj5K2SS8HVyk37zlDQQxOet1QNdl0UuK0
	6UcptOXeIX2iplBErYTw4/Eq50hPzzC9GU82f5G7tsaIVJPyyIbWlrRpHuETMfrbgEib
	moHgjdFJavgifoRGEumRbOS1X0O5hAlKc2oV+qe4U1lnndFx45ThxQLs2BydHgBlll7O
	S62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uXygvL/4S2sZb3FXRDQG+G2/tJtIJHcauwnFVYQfRxA=;
	b=LURms+BHEUEWGX3QFD/VB1agbEuxI4wM7KuXyyrb831iI4IpdzAlFEBSkPwQELDGu/
	tJd6tit4Kt1+VGiNHXmeCWocGI0dFd7T/3dU/cIBLJw8WxYrCx0CqL1ivnqtMQFvdYV/
	HGC8OQ7WUWCc3wUN5s0oRewBQ36zuZ9Qa2hA/KtrA/tJa6Mhp3feUSjbHxv58OAvsoK9
	P23ZvWKEETTT9p2MncNk5L+ut4W68VC41+OWemeo95XRwvJ3KsMdTdqJE4TQ+JPSxAIy
	P2ib/fICeeuCvilbP3dl2DIk0wKSZ5Dkq/VedoH4P5aKLpTauH/fpmX42uldY0/5qZ9+
	GtzA==
X-Gm-Message-State: AD7BkJKrAk2ix5dOsxcWCyLd85NsdR0zgZJu/bLJ4j4M9k4hfkL6FKwCyWrqtwd5LSAS6Q==
X-Received: by 10.112.37.67 with SMTP id w3mr10236329lbj.136.1458657862498;
	Tue, 22 Mar 2016 07:44:22 -0700 (PDT)
Received: from localhost.localdomain (m77-218-244-160.cust.tele2.se.
	[77.218.244.160])
	by smtp.gmail.com with ESMTPSA id m8sm5283773lfe.32.2016.03.22.07.44.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Mar 2016 07:44:21 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 15:44:17 +0100
Message-Id: <1458657857-10527-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	jian.liu@windriver.com
Subject: [PATCH] libmad: avoid using legacy _thumb overrides
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
X-List-Received-Date: Tue, 22 Mar 2016 14:44:23 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

_thumb had been dropped from overrides since commit 351443d7:
[ feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-rides ]

Use bb.utils.contains('TUNE_FEATURES', 'thumb', **, **, d) instead.

[YOCTO #9323]

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 9e08b16..15a9d96 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -27,7 +27,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "-enable-speed --enable-shared"
 # The ASO's don't take any account of thumb...
-EXTRA_OECONF_append_thumb = " --disable-aso --enable-fpm=default"
+EXTRA_OECONF_append = "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' --disable-aso --enable-fpm=default', '', d)}"
 EXTRA_OECONF_append_arm = " --enable-fpm=arm"
 
 do_configure_prepend () {
-- 
1.9.1


