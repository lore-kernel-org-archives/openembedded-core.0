Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A7BC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:49:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.8553.1710366540666953448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IFTdbCWl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6b75211ceso375555b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366540; x=1710971340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUXTfFlI5OGYQmFbu4opdr6VwEchpZhbKknQJNqgwnw=;
        b=IFTdbCWlF7yRwzT12tzNitI6Ynsl5XdmnzQzYRHeQA6LTbETpf2x679PXV4vX/Dm2X
         0x8YvHggkp0FmuUeG9EYYM+lZoil/lp2rZ0B0FOuDYrYMwh2EmBN9VpE7g1Hc4sGRtry
         saMl8bel+hTU3VvzmtmE0OxifpTOQhd16i5fQ56R86N5We7FasxGSIJ6h25kF6rC5HJ/
         IOmLBuGM58H7F09DR3eU0shCjdqt+eZbnTGxQcAFKryuC9RwwZzsu2CgcFlmDtV3Qa0g
         2jrTovnpq9okBMDy0gFBNXHHxvn0wMT5Y3eT18XTUx+aqOJn+tH1hliixyM2tGAAXKFT
         AQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366540; x=1710971340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUXTfFlI5OGYQmFbu4opdr6VwEchpZhbKknQJNqgwnw=;
        b=fqrx9YG4Q98mrbBdWxwGOrERDpDz3KsN9ja0SXGYK6eXAKeKBACmVFS/b9tbBDk3UA
         dmg3WMEUiBs/OtqfZqpClITxLuGCrgdXwdlvBecne0XNsoI1sjY8ctj1zDTFdZ5jQ1mg
         uIQfY9JAvUdf1XTA13wPP8ghaiWcS6ES7l4QicSdi8R3uJlHUhCFDR9cQT6PZdqv7Pgq
         4UTC2/DtAVZ3bodSE1QZ/RzHDcQ35XWIOHN8Lw+4OyReqDbLz7fSvXMIpXLNUU9+0eEY
         x8NBVa6h5mSxSTQ6GtCHkmD5nwswonZWp0BQ+6hroILx2Jn+wWuLAuGuGkiMtdiSlhm5
         UFNA==
X-Gm-Message-State: AOJu0Yx9LRdvK+ZyLGAx09e6g6TeZXYk1sJvsVEZu6xXuAkXNWATd6tg
	X5lytugcLKh8H0xq1OSnlgK2HB0zQKRMd/NM7V3Vmi1ajrOREoWUKJT1P/++CbFX8F11pGexK42
	ApMg=
X-Google-Smtp-Source: AGHT+IGXAMCSXh/rmGBROB4U4sshm9Ke9gBtnSAM9YCoLRTaU1BPg0ZJw25OpjpkpPUyG5Xa5oWozw==
X-Received: by 2002:a05:6a21:99a1:b0:1a3:15e8:7e93 with SMTP id ve33-20020a056a2199a100b001a315e87e93mr258083pzb.56.1710366539893;
        Wed, 13 Mar 2024 14:48:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.48.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:48:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 5/7] bind: Upgrade 9.18.21 -> 9.18.24
Date: Wed, 13 Mar 2024 11:48:43 -1000
Message-Id: <61fa2f52045b7a1553249c33263b5fd32444a305.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710366394.git.steve@sakoman.com>
References: <cover.1710366394.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197089

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
=========
9.18.24:
	- Fix case insensitive setting for isc_ht hashtable.
	[GL #4568]

9.18.23:
	- Specific DNS answers could cause a denial-of-service
	condition due to DNS validation taking a long time.
	(CVE-2023-50387) [GL #4424]
	- Change 6315 inadvertently introduced regressions that
	could cause named to crash. [GL #4234]
	- Under some circumstances, the DoT code in client
	mode could process more than one message at a time when
	that was not expected. That has been fixed. [GL #4487]

9.18.22:
	- Limit isc_task_send() overhead for RBTDB tree pruning.
	[GL #4383]
	- Restore DNS64 state when handling a serve-stale timeout.
	(CVE-2023-5679) [GL #4334]
	- Specific queries could trigger an assertion check with
	nxdomain-redirect enabled. (CVE-2023-5517) [GL #4281]
	- Speed up parsing of DNS messages with many different
	names. (CVE-2023-4408) [GL #4234]
	- Address race conditions in dns_tsigkey_find().
	[GL #4182]
	- Conversion from NSEC3 signed to NSEC signed could
	temporarily put the zone into a state where it was
	treated as unsigned until the NSEC chain was built.
	Additionally conversion from one set of NSEC3 parameters
	to another could also temporarily put the zone into a
	state where it was treated as unsigned until the new
	NSEC3 chain was built. [GL #1794] [GL #4495]
	- Memory leak in zone.c:sign_zone. When named signed a
	zone it could leak dst_keys due to a misplaced
	'continue'. [GL #4488]
	- Log more details about the cause of "not exact" errors.
	[GL #4500]
	- The wrong time was being used to determine what RRSIGs
	where to be generated when dnssec-policy was in use.
	[GL #4494]
	- The "trust-anchor-telemetry" statement is no longer
	marked as experimental. This silences a relevant log
	message that was emitted even when the feature was
	explicitly disabled. [GL #4497]
	- Fix statistics export to use full 64 bit signed numbers
	instead of truncating values to unsigned 32 bits.
	[GL #4467]
	- NetBSD has added 'hmac' to libc which collides with our
	use of 'hmac'. [GL #4478]

(cherry-pick from Oe-Core rev d7f31aba343948dbaadafc8c0c66f78e6ffb46e3)

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.21.bb => bind_9.18.24.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.21.bb => bind_9.18.24.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.21.bb b/meta/recipes-connectivity/bind/bind_9.18.24.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.21.bb
rename to meta/recipes-connectivity/bind/bind_9.18.24.bb
index f5fb4bd1e5..2874990320 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
+SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


