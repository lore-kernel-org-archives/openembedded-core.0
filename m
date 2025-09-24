Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF0FCAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:58:10 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.web10.23815.1758743881841871085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=U5gBKCrg;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=YjeieR2x;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 23B1814000B5;
	Wed, 24 Sep 2025 15:58:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 24 Sep 2025 15:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758743881;
	 x=1758830281; bh=UvaGmn4xep2FSmeBuKX1KHdx3dRs4lRjCPeVftISr74=; b=
	U5gBKCrgZggK9dQlAMUAdVApIwzNEJFYVCql5jyBCVeiY9IRYe28FKEoLZQCkXah
	Bbo8dub7fLW8gx5NReeXY5MO5dIaURaLlyHxcli8TbGE1chIxiZaFsWEfkuCLwRu
	pL/1CVZjLcRrgmk2gov9m1F5iCxqN4Fjgj+tN6jRU9DKgcvgu9d6un4qnx5ubqAR
	nUtIeXKU4f/4dedWBQN7ODvw3YU1Djz+0tK6qsn4vR0g10n3lhdwk/hR99Rq/qxG
	wjTZsjIe6+xtpPnEjocxH6csOJHg2Q7XITQXGsx0SPOuAW+fqLaDwZtHQt5/RUbs
	GS3f0FZRTgpc19HAvCD+2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758743881; x=
	1758830281; bh=UvaGmn4xep2FSmeBuKX1KHdx3dRs4lRjCPeVftISr74=; b=Y
	jeieR2xzfMU3q6PkJtQ3lZJEhJaI64+chgjQMFpl/gR5DzcYcEr2BjU51IhNlwKB
	ToB7dbRB+cmleu7qN+pbQKVH1RdmPQXTXTrtO+h97rzGguFgKcpmig1aZpg3b32F
	VUsHsA1pC/TN8cVYY7XDYP5vQkASE9WgwIIhg6WAdsg+8r+WTQxc4Ygq/syPKxgC
	5fbzm/2vdp3zU3AdN8//NumXZVfvhmgJFAQrVJgy0EXgFdDZFmVGU59pD+KMeP5W
	6qub9oz/Umw2TdRLVny+WBphs0hgUVhBivLd/hatpWKc6qQjN5JGts2vVasRlTq7
	bo45Fj+Kz1xz9AHN6wgvw==
X-ME-Sender: <xms:SE3UaF1qWdY1P8i3R97hUQPTjtTEas_JVuLG38rRaLaHJjDdGliYkQ>
    <xme:SE3UaCF38SV51Dvj2wfadH8SOFqg6KavrXwye3_9uMoQ2GZPS4tegkkc9Ynfk2JXG
    kC3vXDDAxzTHn1MW9MSgFwNkZbaPCOObxfxkh7Cm7KO7dDoZ8CcpgDZ>
X-ME-Received: <xmr:SE3UaDhVjL1jwoJENwW-2rHHrQqoDOyUyzTuTgUh8mJk292gQ40xchvekKCIyx5JObnWGNHEbpbqd3R0jovjkc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigeehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertd
    ertdejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpedtffdvffejvefhleeigedugfeifeelfeeufe
    ffledvheefveeitdeiueekhfelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpth
    htohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpth
    htohepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:SE3UaN_hyhBkUkSTh6KC6pyyyRzcF2f-7x98x7dTw1C8aExTpiagCA>
    <xmx:SU3UaKoDq_IfG8ZneW64xnLqbGdTOmO5-jtWY_CbiRHsT3eplBnuaw>
    <xmx:SU3UaM82a2LOHaHLWFsbopUp0ezXXJ1BBmq6S3fz5-vuY3YJceGB9w>
    <xmx:SU3UaOUCTR-GiulwsHNuveYYzyAN8NY75J8_4e0iD0H0SLD4r_gGVg>
    <xmx:SU3UaPZo7k10WrBsrou1PrUTzhZX-msSgXSnlAvmJaDqVgTzlBWnE9PO>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Sep 2025 15:58:00 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 24 Sep 2025 20:57:46 +0100
Subject: [PATCH 1/2] bitbake-layers/create: Improve help message for
 layerid argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-minor-fixes-v1-1-affc85657a66@pbarker.dev>
References: <20250924-minor-fixes-v1-0-affc85657a66@pbarker.dev>
In-Reply-To: <20250924-minor-fixes-v1-0-affc85657a66@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=gCrDiYAfVXHK9F/9CDqniMgJXoKWfnvDuq7nqZ6qkZ4=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWRc8XW7/e5BUdViLuXmGNc3zkIevkbJP6Ye/ZB/89Xrv
 6npZ11LOkpZGMS4GGTFFFk293y9/7TXkTcj5JYCzBxWJpAhDFycAjARw1ZGho4nrmV5TNx3+GUi
 9m1++jJc/rpdmWsWb/EXr4PTmDwSahkZ9k86EPglemVDo6vxjWj7edN9Tb2D/uisLdjNu53vYxo
 /HwA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 19:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223984

'Layer ID' isn't a commonly used term in our help messages or
documentation, so clarify that this is the identifier used for the new
layer in BBFILE_COLLECTIONS.

Also clarify that the default is the basename of the layerdir argument
if a layer ID is not separately provided.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/bblayers/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 517554c587d76989169c67ec1a2e8bd0713f8b1e..b38c4b5e38a475fe07b40968f168857d565d9722 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -83,7 +83,7 @@ class CreatePlugin(LayerPlugin):
         parser_create_layer = self.add_command(sp, 'create-layer', self.do_create_layer, parserecipes=False)
         parser_create_layer.add_argument('layerdir', help='Layer directory to create')
         parser_create_layer.add_argument('--add-layer', '-a', action='store_true', help='Add the layer to bblayers.conf after creation')
-        parser_create_layer.add_argument('--layerid', '-i', help='Layer id to use if different from layername')
+        parser_create_layer.add_argument('--layerid', '-i', help='Layer ID to use in BBFILE_COLLECTIONS, if different from the layerdir basename')
         parser_create_layer.add_argument('--priority', '-p', default=6, help='Priority of recipes in layer')
         parser_create_layer.add_argument('--example-recipe-name', '-e', dest='examplerecipe', default='example', help='Filename of the example recipe')
         parser_create_layer.add_argument('--example-recipe-version', '-v', dest='version', default='0.1', help='Version number for the example recipe')

-- 
2.51.0


