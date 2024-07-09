Return-Path: <S.Mueller-Klieser@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD56C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 06:25:58 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.6764.1720506348573405627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 23:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=a4 header.b=dTTTkkvo;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: s.mueller-klieser@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1720506346; x=1723098346;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IZspgTL92bdqMR+lBbe8hf3YuLV9Yo2SIR7WgnGNf7A=;
	b=dTTTkkvoCma/JDXu5ffIMNV0zGK0CJuEt2SgItVW0Bl4L6lWfCTjLpyUvsLcHRr9
	oOnhBw52d0Zg/nAYZV6BzUESWVGNXhPrG666juJ3SaW+q4t9FBw1wfFpSRcK9A7C
	AH3sIJRhnEPEr8dfQzqPoy9EjBjpKi8Ew7lDVDVyB7w=;
X-AuditID: ac14000a-03251700000021bc-85-668cd7ea0438
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 4E.B6.08636.AE7DC866; Tue,  9 Jul 2024 08:25:46 +0200 (CEST)
Received: from station.fritz.box (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 9 Jul 2024
 08:25:45 +0200
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] icu: fix make-icudata package config
Date: Tue, 9 Jul 2024 08:25:39 +0200
Message-ID: <20240709062539.4581-1-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42JZI8nAo/vqek+awbZ3/BZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxp+GT8wFnzgrtnzdytzAOJOji5GDQ0LAROLy8uouRi4OIYEl
	TBIn+i8wQzj3GSWuNq1nASliE/CRWDrTEsQUEdCTuPpPtIuRk0NYwE6if9dpdhCbRUBFYt7R
	DYwgJbwC9hLN22NAwhIC8hIX1zxnA7F5BQQlTs58wgJiMwtoSrRu/80OYctLNG+dzQzSKiSg
	IXF8eQlM67Rzr5kh7FCJrV+2M01g5J+FZNIsJJNmIZm0gJF5FaNQbmZydmpRZrZeQUZlSWqy
	XkrqJkZQcIkwcO1g7JvjcYiRiYPxEKMEB7OSCO/8G91pQrwpiZVVqUX58UWlOanFhxilOViU
	xHlXdwSnCgmkJ5akZqemFqQWwWSZODilGhgZ3IxUSqc9TzT73/9l85M3m/5Kst73sih/90tg
	fo2oYI/z+blOG75w2t/Qk/221j6/mXvaifWfGm6+dtj4c9OSX9PezWfUjflT82nTwi2fff/J
	Tf38SP6pt/AVCb5/p5y8NB3UO+0N1ilLW/7tUrl2rvmvz47DtRvDWWPeLpqwSD+uQfK8sYK5
	EktxRqKhFnNRcSIAb69YWRwCAAA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 06:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201642

The location of files changed during unpackdir transition. Adapt dirs
to fix custom icu data generation.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-support/icu/icu_75-1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
index 14fbf31de5..27fe392e4d 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -126,7 +126,7 @@ do_make_icudata:class-target () {
     ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
     cd ${S}
     rm -rf data
-    cp -a ${WORKDIR}/data .
+    cp -a ${UNPACKDIR}/data .
     AR=3D'${BUILD_AR}' \
     CC=3D'${BUILD_CC}' \
     CPP=3D'${BUILD_CPP}' \
@@ -136,7 +136,7 @@ do_make_icudata:class-target () {
     CPPFLAGS=3D'${BUILD_CPPFLAGS}' \
     CXXFLAGS=3D'${BUILD_CXXFLAGS}' \
     LDFLAGS=3D'${BUILD_LDFLAGS}' \
-    ICU_DATA_FILTER_FILE=3D${WORKDIR}/filter.json \
+    ICU_DATA_FILTER_FILE=3D${UNPACKDIR}/filter.json \
     ./runConfigureICU Linux --with-data-packaging=3Darchive
     oe_runmake
     install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
-- 
2.45.2


