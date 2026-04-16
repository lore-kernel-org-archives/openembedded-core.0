Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00482F88073
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:32 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7716.1776322105221795252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CPvURoRA;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso2681923f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322103; x=1776926903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwTVIoATG0nuEQawV94F0xmwLgenCLpp9msphq4MknQ=;
        b=CPvURoRAb26oPvtoR5FSCs/n8Ngo8chk/eFDXmgiWIOC6EjAIjVDYVPRai2L1sJCt0
         LcbGaoyhOGA+rCJronCBfAOOdR4Kcgl5NpM2Pu37j9vxrSSHPhOfeX1jZZQgkiLdhwHp
         IHdjXwnBhEd+cJX524YbWAXDfdWj0hPGPC6Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322103; x=1776926903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zwTVIoATG0nuEQawV94F0xmwLgenCLpp9msphq4MknQ=;
        b=J1aNHcXKmEyad5HGGuNvJteKbZiBgEqDqEQDX4jNCewhP94KfVCO7HwGsTxJjS7qS6
         P5128fbFCKELROqBM4wG77w3YlLAn7BQDXNjv8s+x6M4+OnFrKlOVw1VcSsRx6zfuEpv
         /fycwPJgkORzakstwsRfsNuev+gKJKtjNvmfcYJXGQZsXb6Kg4Re7WZZNIXLjiiazwrQ
         khdQtg8P3pvofEtXIklx6QWKqC3d9xpEUGUDZ9bw/L/QxXr6XL8FsAxUpvuFjiXROODJ
         PX7UUqkn9oDTM1QVZj++EkGPHxgSm+cgPn/zEvmxAvbPieHdtaVr6sFdcsLLd+Blt2q3
         couw==
X-Gm-Message-State: AOJu0YyR3niWlDtTrM3ANvdp7NW+O2F4oCbiHpsA7l335wAiNNPHEeL7
	J0aMBaE0Z8ACOm6GRTUsSB0zx5uhzOD42kk/kh9ByNdfXjl6GUPqWVwMRNwskyaas0CiXL7HK4U
	AdpEoVELNkiFR
X-Gm-Gg: AeBDies22MSp/K9TmERqJ5cOChP7ObKJTNGWOWtRRiPK1BmK2wFpaZeya999yiCN8dz
	q1XMLKH8e5UkFtgxBwMUfdJiOJQ9PAISyUPh9ZUeblU+gTkUrOshzvEJTNENny9Osyl1ZfMFm/j
	bZYjcNkeuIBgawMu8lAKL7SaQYkPMzAF68vSMZvilB2DKmYHv4j7IdCL3BGQzp1C/czzQNeTx6u
	hIv6wmNwiTNxZpzwrQXJ3fP0Nn/BySqwfxCUuV/Qt0lu6S52yhOyfA/n6AKPFaJBnIqXhb7OAak
	V8cT72sCK7oSnIrImpxkf0G6/wS8sPbWp3xt4KZa4KS2q9a3GPCm38wu7WmXKnEwTKsEU7CbS6j
	ZV8Aef2zNq24omOhH9Wo6d6dZLvbmL+1OwYWU6ANfgctBic9MkkQlxOMCmaYEP8EaNlQS1JEszj
	ghan3CNuUtuS/o2dHlMwFefsSQzBrV8tMHxfWuFl4NBTrbC2eQ/wsjRorppLCC7ddJHmE5q8IIE
	7RN+0S1hqmVdFWwwVXmQpCA7LkR+kEqDHC5Lg==
X-Received: by 2002:a05:6000:2301:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-43d6428e2damr36970576f8f.21.1776322103246;
        Wed, 15 Apr 2026 23:48:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/47] libarchive: upgrade 3.8.5 -> 3.8.6
Date: Thu, 16 Apr 2026 08:47:10 +0200
Message-ID: <4f873ad9abb1c10d0dc41f219f4a8ae5b8b1d53c.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235351

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

Libarchive 3.8.6 is a security and bugfix release.

Notable fixes:
* libarchive: fix incompatibility with Nettle 4.x (#2858)
* libarchive: fix NULL pointer dereference in archive_acl_from_text_w() (#2859)
* bsdunzip: fix ISO week year and Gregorian year confusion (#2860)
* 7zip: ix SEGV in check_7zip_header_in_sfx via ELF offset validation (#2864)
* 7zip: fix out-of-bounds access on ELF 64-bit header (#2875)
* RAR5 reader: fix infinite loop in rar5 decompression (#2877)
* RAR5 reader: fix potential memory leak (#2892)
* RAR5: fix SIGSEGV when archive_read_support_format_rar5 is called twice (#2893)
* CAB reader: fix memory leak on repeated calls to archive_read_support_format_cab (#2895)
* mtree reader: Fix file descriptor leak in mtree parser cleanup (CWE-775, #2878)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e5d18040b0999dbfaea09b8a8a9f8a4bcac6349)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.5.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.6.bb
index fcfaf5d2313..c984eb78401 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
+SRC_URI[sha256sum] = "213269b05aac957c98f6e944774bb438d0bd168a2ec60b9e4f8d92035925821c"
 
 inherit autotools update-alternatives pkgconfig
 

