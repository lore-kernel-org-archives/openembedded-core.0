Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A810C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:06:09 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.32203.1641823568678856954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=kwABT0cG;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 0357D320024A;
	Mon, 10 Jan 2022 09:06:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 10 Jan 2022 09:06:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=iL1bbp71Ul5sZFMvoDGorsCHv5
	F/ZllNsdQaXgs2WB0=; b=kwABT0cGrHe1ops3Q6ty315h19E9YkVwCEEGNsbcXY
	ow6rKNf/jWj+a18Xgppnc7POIlB4aj8YfOAixizBo5d+as0DwMRbxBt2W+S9ZpL9
	YGILaBInGfEE7HOX34jdKLU08j49sVR7imCyvzfHy3WTUPMXliXAcOwccTUMtsME
	pm8hD4cTMLuvwzVgkc9N4k91DB4gI74Ylm026k1yEc/LnzxM8TYsH0+wqw/nEzpX
	OsYgNeTzwzXBWUtjsYhU5OKk6aESRFDKgsRNCLNlSzbV7yOmDYweI72iiF+q6SzS
	KdKPD3cFTb+5uZZfZFKsKrcTmjmakYs07U1DkNC1glfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iL1bbp71Ul5sZFMvo
	DGorsCHv5F/ZllNsdQaXgs2WB0=; b=UcGKw35yxvtWnaWQr79QvyX33Zr+4v1xq
	d3ZEU14BPluT59Fxgd6GfrqzrJwJiEKZzyUyb+39tvFRxomiK8FwtPsg/19ziS/T
	lmOF8kpKa8W+ielnbfbV7aRu6iBrQjk+pvwPHHbQgeSYoJhKSXEHopuZUlgigXqx
	kp/7vyuUS/zlJTfEprMcf9LvtdMnLzXpdSeVezB4I45Vh+36Gh/pbtaFFWJ1itFK
	MhjYOA+kvbFgRFk+p/Vw0mCGUOcvSufChd7nvYxr4DKpPcW6ZOEHt2VRm+U103i5
	JJXM6ddKtPhaosvJLmcLH+QA/TRLw+ctixK1SQWDWok3t5p1f4bNQ==
X-ME-Sender: <xms:Tz3cYdQaLFfoLUjlDuaAHGmQgCvbkaURiDTvZuVHHk8_tCquvIA3Tw>
    <xme:Tz3cYWwASJmS068r4yyGbzOwNWDJUSHLDvl-G2Y0Ifro4q90oTIgrlWM-yl9idIdF
    K3QqDndqs1E7D6Er6A>
X-ME-Received: 
 <xmr:Tz3cYS2O-fa2g71g5AfqeK0mPafNQ0nV2KwtuYD7ZzMAXgSljgrIxNB2ikoPUL9CM9a5vnQjSkF4g7nPNV-KCk3lQI3dE1dwC0Qho5lVGbsTU0yJHJ2H_3QC>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedvteeutdeutdfhvefggfeifeehve
    ethfeuffekgeeiiefgkefhheehjeeijeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:Tz3cYVBjXbr4XEI2FNx8jRIfzcaL_wnBbZ_MJK7etOYBB-n2-Pe3tw>
    <xmx:Tz3cYWjtAGtMkbZQRNogw35Iwz4uA0xGrg3E1PMdjv96lpr9QHFTqg>
    <xmx:Tz3cYZohd_HqwF1nGzxwEICgqE0d0WE3pD6Aw8nK_v7iCQbGsj2j_Q>
    <xmx:Tz3cYaaInyzaonpqqpG4DsSs07RYaECSbKjsZygSsAjmehT-t9yQig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 09:06:06 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: bernhard.rosenkraenzer.ext@huawei.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 1/1] gcc: Fix typo in linux64.h install patch
Date: Mon, 10 Jan 2022 15:05:56 +0100
Message-Id: <20220110140556.2185250-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:06:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160362

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The "gcc: Fix compile of gcc plugins" patch had a typo making it a noop.
This was due to a rework to make it specific to the linux64.h header.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../gcc/gcc/0001-Fix-install-path-of-linux64.h.patch            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
index 9201538f0e..5bf895d6e7 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
@@ -23,7 +23,7 @@ index 9b17d120a..d175ec4e3 100644
  	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
  	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
  	    base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
-+	  ./linux64.h ) \
++	  */linux64.h ) \
 +	    base=`dirname $$path`;;\
  	  *) base=`basename $$path` ;; \
  	  esac; \
-- 
2.25.1


