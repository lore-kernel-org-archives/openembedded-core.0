Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39F4C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:50:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.9060.1648461007759820879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TqMzbkvq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461006; i=@fujitsu.com;
	bh=Rtvp/KF/TAAkNhZGrSyPYsJtZu9+eCyv6D6BjXggOPI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TqMzbkvqYKpafmdHPE97K/CT5J2nR2aB7YlM1VsYP/cHryPCBqadMrlMxWiE5qkCY
	 JRYwR0KJzPOHi+AJc76ZTKuBlrWJRWKMaxvlZ0iIx5cPM30XjvGtUaM3jiqYUvJ9cu
	 KKZX3hiX3gNkaOEto1Kkp83pi71pXZhpzL0mV8dogVx/G67FiI6kz8Y+EuCFsUKpMK
	 OZE75SUtAlkKwUbDjYRkesJs1F2ngFLpTaaz0rp5P30ejHOr1LOlqwfvzFQ0uIBO61
	 JX5YzHGvsD04rog/REZPfe5FGRwHjmMrpXy25tJQzMpeboyacnGCiL7nK8doFB2vtf
	 Tl/QC41+MxaQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSfdsi2O
  Swd/NkhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8buLzeYCuZzVGx82M3ewHicvYuRk0NI4DGj
  xJYOjS5GLiD7PJPE2843jBDOHkaJlbuOM4FUsQmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z1gg4QFLCRW7ZjACGKzCKhK/O36BNbKK+Ak0bXwAxuILSGgIDHl4XtmEJtTwFni/NOFUEc4Sb
  zaexOqXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo11SUWZ6RkluYmaOrqGBga6hoamumZmukZGFXmKVbqJeaqlucmpeSVEiUFovsbxYL7W4
  WK+4Mjc5J0UvL7VkEyMwlFOKnZ7sYHzd91PvEKMkB5OSKK9RpmOSEF9SfkplRmJxRnxRaU5q8
  SFGGQ4OJQneW81AOcGi1PTUirTMHGBcwaQlOHiURHhNm4DSvMUFibnFmekQqVOMilLivDdA+g
  RAEhmleXBtsFi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9xTIFJ7MvBK46a+AFjMBLV7
  7zhZkcUkiQkqqgcn788255Ve/rlqxKvesK/eUlI1rtHNuH1b9pDPR64JXiMXJGqlok8u7O5fw
  n1wYLa7nOuPlrwsBF1sd1xWW3/izQ3zWlmevztou7fJbclDU8Nbm7PvdVuv2h2yIeFrW/4aRc
  1FVmvmN4Lw92eadpa4N9pFbN4k29GSr7U+dtug48625v1365to/2CP3K62UM7bjwBuF0LUda1
  56tO1RFTzQHrDzm7x849nDPhn2/eqttu81Hit81g1ctDjqo/KuXyWrn63vWTS5tqr+OofkpIk
  5T47InZZ+9OVpf1PKyY7kZqN7H48K/dO/dILx/w5+oaojlzVEL2hu99ZYVskpc2OD1KkPiZVP
  f3DeS9GXr/FTYinOSDTUYi4qTgQA/FTsGGADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-545.messagelabs.com!1648461005!25381!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17608 invoked from network); 28 Mar 2022 09:50:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:50:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E9B83100456
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DB265100440
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:49:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] atk: upgrade 2.36.0 -> 2.38.0
Date: Mon, 28 Mar 2022 17:49:38 +0800
Message-ID: <1648460981-15712-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
References: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163691

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/atk/{atk_2.36.0.bb => atk_2.38.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.36.0.bb => atk_2.38.0.bb} (84%)

diff --git a/meta/recipes-support/atk/atk_2.36.0.bb b/meta/recipes-support/atk/atk_2.38.0.bb
similarity index 84%
rename from meta/recipes-support/atk/atk_2.36.0.bb
rename to meta/recipes-support/atk/atk_2.38.0.bb
index 59913f4bd0..62fec9abf8 100644
--- a/meta/recipes-support/atk/atk_2.36.0.bb
+++ b/meta/recipes-support/atk/atk_2.38.0.bb
@@ -15,7 +15,6 @@ DEPENDS = "gettext-native glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "01aa5ec5138f5f8c9b3a4e3196ed2900"
-SRC_URI[archive.sha256sum] = "fb76247e369402be23f1f5c65d38a9639c1164d934e40f6a9cf3c9e96b652788"
+SRC_URI[archive.sha256sum] = "ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


