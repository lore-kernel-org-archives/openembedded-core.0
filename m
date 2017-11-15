Return-Path: <patrick@advancedtelematic.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id F006B783C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:40:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y42so20372710wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 04:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=i/Vc1qMqtRhDBpkB3yn5r1p/Tj3dT3MIFX7+pOkKpA8=;
	b=eReLoep1dfLnBu4gT94WaBwK7FB2S3T9pxFTo7aRf+VZfZSEX9AEikutyiyF66KSUL
	Pej0Is5k5gpEiffsyo0wv8U8FESPjkc1eEiDcFNRr9cq4uQcdrOzUPzt2o2oiHxTpJh5
	EUu4axfQUkTUU4PxH0PJLbroNeNlDU1s1lAIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i/Vc1qMqtRhDBpkB3yn5r1p/Tj3dT3MIFX7+pOkKpA8=;
	b=iZ2RQBsLobv2yQsZB1Fm35yh0qT9xDnpzM4J+SiQUAhUxz5LOiJxT0hIhpyRMkGeg6
	PTH3QrGBabPQvN6JTgwYR13pEz2sc+5ZO8MIrL/ZCWKEOtX/SE6IIkAvEpTrusfPoKhI
	jm7XsYpJ4SvDBIGnXjwE4q7eO16RgMndXkBArTgD6M3XMKODqhcl9rz4xHBjNaHHMWlw
	SrDFaRTSZ7cZiTZACjzuAG4SMyHLvkwkDpXjsDMbMz9N+mp9LPOykqbZ1FgtXp7WocCh
	U3FKHGU35ygmxc0mZV82tkPN72zM2hWes+2nMhaDpBbEzy3iEYr81XBLSpBeYhrPejYk
	NTxg==
X-Gm-Message-State: AJaThX7iIjbUJRBTP5hNVKRDN54JrqWjYybu3UIFUWIX49naCkFrR6Yn
	GAmcmFmbahHkfqGw9sZCHLrFwNPAy+k=
X-Google-Smtp-Source: AGs4zMY0y0tpSmp1u8VXoaxTy4ws/3/btu/XaLLvWffC4vUCYcuf4ckSqZqBrj7h0L/5oU8JdoMscg==
X-Received: by 10.223.130.225 with SMTP id 88mr13006540wrc.6.1510749655635;
	Wed, 15 Nov 2017 04:40:55 -0800 (PST)
Received: from localhost.localdomain (p57bf9f95.dip0.t-ipconnect.de.
	[87.191.159.149]) by smtp.gmail.com with ESMTPSA id
	x63sm17482002wma.39.2017.11.15.04.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 04:40:55 -0800 (PST)
From: Patrick Vacek <patrick@advancedtelematic.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 13:40:41 +0100
Message-Id: <20171115124041.23289-1-patrick@advancedtelematic.com>
X-Mailer: git-send-email 2.11.0
Cc: Patrick Vacek <patrick@advancedtelematic.com>
Subject: [PATCH v2] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Wed, 15 Nov 2017 12:40:55 -0000

From: Patrick Vacek <patrickvacek@gmail.com>

For recipes that depend on native ca-certificates.crt, /etc should be
added to the list of directories that automatically populate the
sysroot, otherwise the file may not be there.

Signed-off-by: Patrick Vacek <patrick@advancedtelematic.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index 59e7d51437..52a1a07f68 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://sbindir.patch"
 
 S = "${WORKDIR}/git"
+SYSROOT_DIRS_class-native += "${sysconfdir}"
 
 inherit allarch
 
-- 
2.11.0


