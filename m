Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD4C79564
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:25:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w11-v6so3857823wrc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bNWVbwRrPMmpz5etLNRzgI7GC2+yLFKsAO0cl3wxoFs=;
	b=WxxtoZ/C8LbLbv+TuldhzFRn2Uw45zbiohxeddjwHuLN2rF88qwSfFuNxiCvSOBSBi
	monR5nNVlqeNg7hs2HLqZOCWHakStaoubthP4vJAQzZNkLT48Wt/hTukqfwVuoJRNEK/
	8QrgTaCXIU+WJ3UJM0nlXccHbvn9TaF91Pl1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bNWVbwRrPMmpz5etLNRzgI7GC2+yLFKsAO0cl3wxoFs=;
	b=sXiISQsqStN4IXgKm0Vj6choLvRmr5s4CCRUn7SWpKSzcdothmPPKtQXsvadDfPZco
	5PXsGgkkAaRA0VhYDAs3OXs+PK+tHKZlzOwh1QUnB94XxBkSi4L3YNqKQu/BElxcpoHD
	mUN9Zg6e330JE70gNb43GChOZLLkBhs35yF4c5DLT1R90db3aTCGRkmvOSd/Vje1mjrm
	U2TXZBffWWoDpaVt4A6rzHel/4ExMmMqKBsC2/FLVyzpdOXixnkmI+3QmkSFx0djKvPO
	OPr/gVIFZaa1/5OVkdCkFArwBQYlavNZON80wNb3Sk9oeojLAjR8IPGHuvF52X9pN0DA
	17Xw==
X-Gm-Message-State: APzg51AV4ldSjzLssIXsKeUnolxr0DVhW6grFk3wZNM2BMNTxYguyWwf
	oDx6OtvRV54/3H4JzmgR+Pz63/de848=
X-Google-Smtp-Source: ANB0Vdazii8TeKG5r63ED/GRu29dAp3Foyr6+sggyNE3TvpHnE3HW+Pl1Z8IJv6m+31EVBJsbmvhaw==
X-Received: by 2002:adf:a602:: with SMTP id
	k2-v6mr16564097wrc.181.1535012704998; 
	Thu, 23 Aug 2018 01:25:04 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm1316860wrd.74.2018.08.23.01.25.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 01:25:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 09:24:57 +0100
Message-Id: <20180823082457.32062-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
References: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/5] utils: Rely on get_multilib_datastore() to get the original datastore
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
X-List-Received-Date: Thu, 23 Aug 2018 08:25:05 -0000

get_multilib_datastore() should be able to handle the original datastore
correctly now so rely upon this rather than custom coding.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 7035f9da253..812129fda7b 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -361,21 +361,7 @@ def all_multilib_tune_list(vars, d):
     for v in vars:
         values[v] = []
 
-    localdata = bb.data.createCopy(d)
-    overrides = localdata.getVar("OVERRIDES", False).split(":")
-    newoverrides = []
-    for o in overrides:
-        if not o.startswith("virtclass-multilib-"):
-            newoverrides.append(o)
-    localdata.setVar("OVERRIDES", ":".join(newoverrides))
-    localdata.setVar("MLPREFIX", "")
-    origdefault = localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
-    if origdefault:
-        localdata.setVar("DEFAULTTUNE", origdefault)
-    values['ml'] = ['']
-    for v in vars:
-        values[v].append(localdata.getVar(v))
-    variants = d.getVar("MULTILIB_VARIANTS") or ""
+    variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
     for item in variants.split():
         localdata = get_multilib_datastore(item, d)
         values[v].append(localdata.getVar(v))
-- 
2.17.1


