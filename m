Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB1065CB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:20:03 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b71so7246752lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ifbr85h6JXX2rRY/lnMvyGWC4TiY+tq5iQqWc1pkm4s=;
	b=xKxJPwjS6Z9kXAEajgmrSbpcMSTYO3Tl2D/aZ1TsClJ3L/6UEuDiZD9IaGsx5zW8IY
	Yru9HmAHmbWEVngOP/mHKSbCS9rY4KQIjmUIwqxjYukaPEbH6IduKFSeiRbqD6+AxmC/
	z+piULV9xTBeUp1PauTvIS1kDziJTYkdyhezzD2qd5WdboP1c7jdTjjyQ+4y6zwe7MY0
	C5arQem2x/6/fOhmzjRVrxFV0hpqfhAwkH2coD8i9kjBvrxyfjrQyTNoGrvJzp0b1TKS
	akcB3riGyuz15uSAGWijnC3b9Pho2+9gB8YQQO9bhuuFRdsnxdplFne8Hp+nF1QQyFaw
	PGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ifbr85h6JXX2rRY/lnMvyGWC4TiY+tq5iQqWc1pkm4s=;
	b=hi6e2M3BQ5GEkIxSPjf3ptRaXIRu9oi9SCgL0LkdFfcc9fQdhIerE/mKE7Lts6PDWr
	tlW1kgCgbd8UsdR34qjVmpSCdCecI+9elGYm1WlpVhDPE6BA3x+hBxQEj4zW7GsUdK28
	ULjEGdVSH5ihBMDt6CEdHs0CnD2vox+4TcTbtlbTXGxgPOHXy/JGs775syK93GOV/C0H
	EsLuYHwYyyEUvONLmM9ZBphj9XZ1QvdOh5KfjZmd/W+bfUmYFFVX2mV5ou6B5R//sID1
	xQbYYbRpGF/x1WUXArcZCEgDCU0WNDTtOa0UYMRkvceuiKT9/NCW1EUZ3seA88+2kpFm
	Zo1w==
X-Gm-Message-State: AE9vXwPVauIWrZJyto1JfxC/WMFxUdgwaTt0NWIDBLR2+twOyFvAwjT/Sv3txikn6EGcjg==
X-Received: by 10.46.32.28 with SMTP id g28mr12136785ljg.40.1474446004549;
	Wed, 21 Sep 2016 01:20:04 -0700 (PDT)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id s2sm6494252lja.35.2016.09.21.01.20.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 01:20:04 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 10:19:57 +0200
Message-Id: <cover.1474444047.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] systemd: use nss-resolve when systemd-resoveld is enable
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
X-List-Received-Date: Wed, 21 Sep 2016 08:20:06 -0000

A patch series that enables use of nss-resolve (systemd's NSS service module) if
systemd-networkd is enabled via PACKAGECONFIG.

The first patch is a trivial formatting change.

The second patch does the following:

- replace dns with resolve in /etc/nsswitch.conf if systemd-resolved is enabled

- applies a patch fixing the location of libnss_* services provided by systemd
  (the patch has been submitted upstream for inclusion in v232)

- applies a patch that fixes SERVFAIL handling, this restores the ability to
  properly resolve names under qemu (backport from v231)

Maciej Borzecki (2):
  systemd: fix indentation
  systemd: use nss-resolve by default if resolved is enabled

 .../0023-nss-install-nss-modules-into-lib.patch    | 64 ++++++++++++++++++++++
 ...en-processing-auxiliary-DNSSEC-transactio.patch | 49 +++++++++++++++++
 meta/recipes-core/systemd/systemd_230.bb           | 22 ++++++--
 3 files changed, 131 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-nss-install-nss-modules-into-lib.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-resolved-when-processing-auxiliary-DNSSEC-transactio.patch

-- 
2.5.0


