Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E95C4708D
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:29:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.5398.1670207362295609299
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RHmVJriS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207364; i=@fujitsu.com;
	bh=0QSn0ATRaK2R/TGdN+UFB7zpRQDimUHF29ZKJhn9uCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RHmVJriSUG+mZw7fub88RVcV5foh74tbjlRAU44gXrheIBsd9t/fr+keZsbb1qhfx
	 0fo87EEvKPKSazUgaBaMeHoSprEqQN8DMoqgZMf7ZFZwRAwcg+ruHjgO5ivf9faeQv
	 W3+HR/RimPeDXaRXaXiTeqrwZdgb9Jf94t4MbVUS/5auke4mM+paf9TT0s9dJ5loG3
	 72VNokSd6AdFCtuCI/1MH27Xrqs6t+BW6SS/Rhwkguqcr+haHQ+spDN9MtFdSFAhYM
	 +WT9+L/Vn4kacawSB3ArZrLW7ByNaiavotx8/wctOODhEFT6//21a8XeDxdKlgqTWI
	 Y5FBHp+1LfxHA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORqNsc3pt
  s8P6UscWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjH/00O2gl3cFd09j9kbGDu5uhi5OIQEHjNK
  /Ln8hqmLkRPIucYkcei6MERiN6PEvLZVrCAJNgEpiRv3/7N1MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJW48+I7G4jNAhRvOr4ELM4r4Cjx7HYLmC0hoCAx5eF7ZhCbU8BJ4uHlvewQex0l1v
  b9YIKoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRroZdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOi
  l5dasokRGLgpxepbdzAeXvZH7xCjJAeTkiiv0qPuZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  NFhvclCgkWp6akVaZk5wCiCSUtw8CiJ8Ap5A6V5iwsSc4sz0yFSpxgtOabO/refmWM5mJz5te
  0AsxBLXn5eqpQ4rwrIPAGQhozSPLhxsEi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY180
  XaApPZl4J3NZXQAcxAR20kb8L5KCSRISUVAPT7aP9j3WKHQOFat2OrH55ZeuekqXHZB7/K9ZZ
  0jkvSSP3ldqHR7PKHOyqFt7w9OcuusEbOm12SJDZ0b3Mv+Rv3Ty3zrpN2X7755i4Vy+NpW6mz
  UmqdDLb6yXtYiq9tXeHX5VW74OjMkvWR7MUiLFoRa3S3e52bIs667cbFxM2WmROU0uJduN8c8
  DWy3FeabG6hWdL+rkPHobLXbanzPgg/ij6Cusu997vf4w0JjY+Pnhjx5bvgrt0hA7wK/O/mKY
  cXVJUuHPdldi7y0MTSnL2KcW93n/SqLPJZpZxcqfb668vu+6GSj229LH4ULf9V/rlWVplMfNP
  ps7hbqtP2rzx+oIZTau+LSiWFhPZuV5eiaU4I9FQi7moOBEAl8Wj328DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1670207363!168252!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24110 invoked from network); 5 Dec 2022 02:29:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:29:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8BFEF100188
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 808F4100182
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:29:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-2.0: upgrade 2.74.1 -> 2.74.3
Date: Mon, 5 Dec 2022 10:28:51 +0800
Message-ID: <1670207333-6986-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
References: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174262

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix regression in type checking 'g_str_equal()' from C++ projects (#2820)

* Bugs fixed:
  - #2820 g_str_equal: New macro version breaks compilation in C++ projects
  - !3096 Backport !3094 "gstrfuncs: Fix regression in C++ types accepted by
    g_str_equal()" to glib-2-74

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.74.1.bb => glib-2.0_2.74.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.1.bb => glib-2.0_2.74.3.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb
index 8fd785a7fd..8f66fd9581 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb
@@ -21,7 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "0ab981618d1db47845e56417b0d7c123f81a3427b2b9c93f5a46ff5bbb964964"
+SRC_URI[sha256sum] = "e9bc41ecd9690d9bc6a970cc7380119b828e5b6a4b16c393c638b3dc2b87cbcb"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.25.1


