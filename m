Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB13C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:15:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.64544.1673241333364493563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IXt6oMrI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241331; i=@fujitsu.com;
	bh=rrk8IZrqlYmPvz+ptoXYabwQVkXOR2Si6VX3BQpM+yo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IXt6oMrIwmpTubBYv8CZdGJ5JVGdsgwf+LwIM9fJ73PpJmtVgAxYDKCILh2ZI+JPz
	 a+UQlT2DD17hBZq/mleBaQNzi+IkL+d3BDHjySVWUcNYTHem19hPwr0Y+5TQZQ7jX7
	 bHKsUBy+iEOcsHULfdDnN3yC4FNkupPY6cpPkPvoeuX7bbsFTAjacZwRzD2Msro3UG
	 esBd4dw2ErZRoQagvKNzt1x//UaFJ0nJu1OrSC+MJbks/sdJuZgrRVA18lk/Kn6ZM7
	 TbDlqTv2nyWunOwDV38KOcPM1rg5XE+qiDfvvV1Y+0gxtBAscrOzdr53g0dwseTDsj
	 iLjWsE5J5Oebg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqPtp0e5
  kg2kfrCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owtRw6xFiwTrLj6+jRzA+M0/i5GLg4hgceM
  Eien/GGGcK4zSTQtuMII4exhlPjXuJqpi5GTg01ASuLG/f9sXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBcwlLhyaxwhSwgIUP92vBBLmFXCS+L7hOBuILSGgIDHl4XtmkBJOAWeJA+2SIGEhoJ
  ILl4+wQZQLSpyc+YQFYrqExMEXL5ghWhUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNTTSSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3JRipeYdjH+X/dE7xCjJwaQkystRtStZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTv7IW7k4UEi1LTUyvSMnOAUQSTluDgURLh5ZoJlOYtLkjMLc5Mh0idYlSUEuetBekTAElklO
  bBtcEi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6JeUBTeDLzSuCmvwJazAS0+MfUnSC
  LSxIRUlINTCGnMrh+X0rX+XBgZbZchNupN5rfDe7sjWJzbt5+3PBZTaClt3DKs2tck9UNtrMl
  TWaVKAipO2k7tURvu3bt+ufeb5uXOJ+RLT5f6JfsodLk5lBsxrN+v0HlH3Xd9KR5IicEfsr4H
  N2fq73qHe+7rWtv3gzZ8+SrjIlQrmBb5uXm3B+nNt81OP5G3KVQePpznWvGLC0XtNRNO23yH5
  QlO6bfC5rzXuzZweiV9/qLNEVlzxqLCEXNvtp3+JwsQ+PrxxUyD2S7rvv1WV9ROS7SXcWxmem
  s1C3XfGGG0qj4gODKadsSpHZ0CEg6v524Q6/01+HOF/bvDNI8ygUi9/EpSUlLqLum8i4t7zY9
  WKDEUpyRaKjFXFScCACs9sGjVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1673241330!138222!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12191 invoked from network); 9 Jan 2023 05:15:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:15:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A6B87100182
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9A6EB100043
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:15:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mpfr: upgrade 4.1.1 -> 4.2.0
Date: Mon, 9 Jan 2023 13:14:57 +0800
Message-ID: <1673241297-28966-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673241297-28966-1-git-send-email-wangmy@fujitsu.com>
References: <1673241297-28966-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175662

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The "fondue savoyarde" release.
- Binary compatible with MPFR 4.0.* and 4.1.*, though some minor changes in
  the behavior of the formatted output functions may be visible, regarded
  as underspecified behavior or bug fixes (see below).
- New functions mpfr_cosu, mpfr_sinu, mpfr_tanu, mpfr_acosu, mpfr_asinu,
  mpfr_atanu and mpfr_atan2u.
- New functions mpfr_cospi, mpfr_sinpi, mpfr_tanpi, mpfr_acospi, mpfr_asinpi,
  mpfr_atanpi and mpfr_atan2pi.
- New functions mpfr_log2p1, mpfr_log10p1, mpfr_exp2m1, mpfr_exp10m1 and
  mpfr_compound_si.
- New functions mpfr_fmod_ui, mpfr_powr, mpfr_pown, mpfr_pow_uj, mpfr_pow_sj
  and mpfr_rootn_si (mpfr_pown is actually a macro defined as an alias for
  mpfr_pow_sj).
- Bug fixes.
  In particular, for the formatted output functions (mpfr_printf, etc.),
  the case where the precision consists only of a period has been fixed
  to be like ".0" as specified in the ISO C standard, and the manual has
  been corrected and clarified.
  The macros of the custom interface have also been fixed: they now behave
  like functions (except a minor limitation for mpfr_custom_init_set).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/mpfr/{mpfr_4.1.1.bb => mpfr_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/mpfr/{mpfr_4.1.1.bb => mpfr_4.2.0.bb} (91%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.1.1.bb b/meta/recipes-support/mpfr/mpfr_4.2.0.bb
similarity index 91%
rename from meta/recipes-support/mpfr/mpfr_4.1.1.bb
rename to meta/recipes-support/mpfr/mpfr_4.2.0.bb
index f531a88961..fead5c3833 100644
--- a/meta/recipes-support/mpfr/mpfr_4.1.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d"
+SRC_URI[sha256sum] = "06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.25.1


