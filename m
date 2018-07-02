Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3957789DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 15:03:47 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id f18-v6so2180847wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HOgZ9htmop466ezwjBDwvucGcut1LTP7gvdfYwQPqP0=;
	b=m56lYZPebhr+zDMxY30tM6HdjSEPVkLliFy3t+EgPcY7avVEHBF4xxskcKgpZBHpjo
	+3TMwqAN34TlkRqdEIIZksXhEnnfJKqcPF9FoQvLjRkjou5GphWQw9/RJvUJSmYyeOYA
	AnJiEpw/VFJ4m8RBd9TBO+dKr675Ln9VSVcCw1oGLqEfiDerYqj53J5Q1OexrEvpm1gb
	5vFJWV55h7rw9mcoLlu3HNDVUHyuMMq/mBFZmIcwRxZ3ZM9TbS2mg516SjVlXyPS7fCN
	b2GPrC8SMAqLfi2T4VoMFF8tY/6tJHYDTTD+BFJJuBE0bkp0k3Vhr1bj7HdLScukGHvK
	c+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HOgZ9htmop466ezwjBDwvucGcut1LTP7gvdfYwQPqP0=;
	b=ad2QJhL4aX16z/6F4Is9uEoka9ta4DZta2Oe/grIKoSmUuu+KSP8nOK8Kru8ZuPey6
	VeDFuDbqsJrpno4M9uRoXqebamOwcxheuLZ52tV7JE52ibEgVVhSnsWF/3rphiidDTqB
	K5bwilW88o+frA9hkRJKjQJG+BnHdgwxMisjuVnGhsv6J8HEs9vDj/bLX83AZGxwZMSv
	WI6RS1QqpOypCrmKOs3m0aQ8bM57OZ7CKnvIFhCjx1UYeG8+QkPH6GXV2yHMlQ1vunl3
	a21e/KJHSvacwcT6erAMxx1jU/HL0NkUscaH+u6S8xnHan1oMzHce7y5Pfb4cZ629w8T
	kDWg==
X-Gm-Message-State: APt69E2PE9Wu3sy6nkJEiiP/kakukMn/cXATdaJfkYcUDPkABwRVhlE0
	zza0z+FRRxyiyX7K2aM6SCBijqArBA==
X-Google-Smtp-Source: AAOMgpf1YKTXZeqeNfRhCged46S1alEZ8H4r0+7QmZrvtpAOt7TwKqik+X9MmNfioHQuKVPKR/qx1Q==
X-Received: by 2002:adf:992d:: with SMTP id
	x42-v6mr19588477wrb.81.1530543828433; 
	Mon, 02 Jul 2018 08:03:48 -0700 (PDT)
Received: from pneves.emea.nsn-net.net (59.38.103.87.rev.vodafone.pt.
	[87.103.38.59]) by smtp.gmail.com with ESMTPSA id
	i190-v6sm10113766wmd.33.2018.07.02.08.03.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 08:03:47 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:03:44 +0200
Message-Id: <20180702150344.12852-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] kernel-devicetree: Corrected normalize_dtb
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
X-List-Received-Date: Mon, 02 Jul 2018 15:03:48 -0000

The normalize_dtb function was buggy because
it only converted from .dts suffix to .dtb
suffix if the user passed a full source path to
KERNEL_DEVICETREE containing the /dts/ path.
The problem is that if the user did that there
would be a warning.

On the othet hand if user just set the variable
KERNEL_DEVICETREE="file.dts" the bbclass translation
to the respective .dtb target did not occur and
make would fail saying it has no rule to make target
file.dts

This patch decouples the logic of having /dts/ in the
path from the target translation.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 4f80cc62eb..9866d844ab 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -13,8 +13,8 @@ normalize_dtb () {
 	DTB="$1"
 	if echo ${DTB} | grep -q '/dts/'; then
 		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 	fi
+	DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 	echo "${DTB}"
 }
 
-- 
2.14.1


