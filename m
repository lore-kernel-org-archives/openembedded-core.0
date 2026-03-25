Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771E3103A9BD
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:40:10 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20441.1774438801360885957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=drS+Wotj;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=gEiF8zAH;
 spf=pass (domain: stwcx.xyz, ip: 202.12.124.153, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 80DBA7A025E;
	Wed, 25 Mar 2026 07:40:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 25 Mar 2026 07:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1774438800; x=1774525200; bh=UtdP3ZdxkyHBi6pyiLpQT
	A/JuPmyf+tPMY9Lp6kzH+4=; b=drS+WotjV9vaw72w9PRPSkBMvv1r3A4E/P6+5
	INqAQNyWJ6LJMsGPS2dzyFXNmfjjSr8JE592DldlI1gXwoPwh0no2kw7ud+ufmFB
	B3JC0uM7rs8TMnWJMwub1aKmC0sd26+G3xyD0JugKXI3g7CD8cShxtG1Oh6nuS9m
	bsOOr0tYKGUSoHgOt8Hx89lDBMS+HpispiL1siHHoB4x1FP3nQNlT2WiVY/dPmCb
	l5Bcmng+gGhrPZEYcCeViu6ThiWkkTXw9539KDyMBJ/RSl00oPV4L0Gg0mV4bXJd
	fMfHqy0CAc8OHVwQV/yvtoHEW+n/vRUn9bYzoT9PpKshVu5gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774438800; x=1774525200; bh=UtdP3ZdxkyHBi6pyiLpQTA/JuPmyf+tPMY9
	Lp6kzH+4=; b=gEiF8zAH8wAMRuRqymLQYgWiUozGLr88or9jKxomZk8+KGq+CDs
	pfgITlrWGcJJeSBe2sd1oRDerH2SskbHjh0FpCGsgo3Y02IWZ4LAKCmlWzEpj1Zb
	90MP0tNfpSqPn3eAPAjy5xqTusKw8gXGB3oyBR5ABZqK1n7+ceJROgbAMkBDs/ox
	7UnH2TvIsBlFMFpF5mKFR2buVpIaw85EvRURoRwWtX+jVBArZsAXzC89/zGG5CUR
	I+V6727Dt059qK2qushmID9njlVk4t2FjvVUsFVoFPeoMIsp9cmviT/yjHbxxP5G
	PMEHZz1N/LuEiMucTJqAAT0WHYMbcUtEyag==
X-ME-Sender: <xms:kMnDadOhPTql93SlNeVmXM9E7KIePeoWkUw6zb04-Rn8dj3AsHCcrg>
    <xme:kMnDaV8YuSyN0G1rAt1fx2IMrTPt7PqtiLu2c4RJ644j0-1d2LQRVPc16l33ndVTS
    AJsXxomtJ5vb8VLYwi4_AOGNbz8lhoMfCpy2jMTvhzA69Rqql5BbBc>
X-ME-Received: <xmr:kMnDaZ6wkWS33VTcdvDHS6_yBzwfr55eC0WCtKytMljmfNdGVx57zQMG3xs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghm
    shcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeuff
    effeeutdevgfevvdfhgfevheegvdevheehgeduveduleejhfeifeehteetheenucffohhm
    rghinhepghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtthho
    pedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvug
    dqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthho
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:kMnDaU1wOLRM-ba9gBoPy9H-3z6jtEMV4PaWBpfGuGTLl8NYf9zT8A>
    <xmx:kMnDaYB8r6fL_auRffMUV2bHqa_5HG_H7rwhaWz3wiQ5thqjVcMzFQ>
    <xmx:kMnDae3tKnOeoGTCt8442J5EnZ3v6e-By4zKmFUhKMkwvjEBXK0s1w>
    <xmx:kMnDaavuGlMtFk8uCdl90ap_-ETdwip9KaAmQnsFZRVcqHUgCzw0hA>
    <xmx:kMnDacwEvpiy3ApH5sr7OPY3Esy9bsq5nz9jXZsgAQMOyrj2fJFAsKvI>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Mar 2026 07:39:59 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] gcc: fix buildpaths QA with LTO
Date: Wed, 25 Mar 2026 07:39:51 -0400
Message-ID: <20260325113951.1278864-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233889

When LTO is enabled, due to a gcc bug[1], the linker needs the same
flags in DEBUG_PREFIX_MAP as the compiler.  Without this the buildpaths
QA failure can occur due to unstripped build directory strings in the
DWARF data.

With GCC 15.2 this can be noticed by setting many meson-built packages,
such as systemd, with:

    EXTRA_OEMESON:append:class-target = " -Db_lto=true"

Add the DEBUG_PREFIX_MAP to the TARGET_LDFLAGS for gcc.

While the lto.inc enables LTO across the whole image, some packages
either manually enable LTO on their own or downstream recipe
maintainers have explicitly set LTO in specific packages, so it is not
sufficient to set this in lto.inc only.

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109805

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes/toolchain/gcc.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
index 0ed49ba892..2df5281ee2 100644
--- a/meta/classes/toolchain/gcc.bbclass
+++ b/meta/classes/toolchain/gcc.bbclass
@@ -32,4 +32,9 @@ PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian = "native
 
 DEBUG_PREFIX_MAP_EXTRA = "-fcanon-prefix-map"
 
+# GCC possibly injects build strings when using LTO unless DEBUG_PREFIX_MAP
+# flags are given:
+#   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109805
+TARGET_LDFLAGS:append:class-target = " ${DEBUG_PREFIX_MAP}"
+
 TCOVERRIDE = "toolchain-gcc"
-- 
2.52.0


