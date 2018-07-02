Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id CDD07789E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:27:24 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id f18-v6so2440644wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MQGX706qeLyQO5hFbcEATy9nZvvt3vTwtwNtfFhw6+I=;
	b=DDjHyicEibznXV4S26ZpWv9i1qQLZ2IU4U+asder4o+DW1aI8vX3DpXaFYO8r8sB2h
	gmzs3t4kiujCE2avelNLSTFyNeJmU/azdrjkDKNL5CEZRfoQ09R3+QE8Woss53HHTguk
	yEiJIXpPquGAEqSEfgb0UcKBaBOHfNinRAk1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MQGX706qeLyQO5hFbcEATy9nZvvt3vTwtwNtfFhw6+I=;
	b=FvyrwVDA+uuOtbr7nIDk8k+VQ/Or3QVISrSYR2Q7/mu8dNV3oID7nr38/r9yTsfHdK
	0ltXMZ/dfGYnUrwz41os1qGs2dGwUOvlnq5KRR87LO/CTmeixoVfirrr1qh1jPkLIePd
	HSKuZLv82Sv8uBYTadqSDAD2enlNxUQUvaRhJ/PJGrNPxKW/dV97IgStHSh2ySmle02N
	NS2ZoUl5fItrdWszIjlkRJ1f3yTPJvLSDgrog0Xq6rmw4xo7ThkN+x8VvYdI1uB/0p9E
	XJEfqkldU/i6AFFp72ZdssIfDnEq7NlXuxFWlj+NMfRcIWpE8CKNt3lLtuyjjSSRUYFd
	GyLQ==
X-Gm-Message-State: APt69E3TwpgV7rAR4VtTn5LWlS1m+8mL8uII8flh1nUJE9mUAdGil+XH
	mIYjztqMgoRnS2PvcnSfE98A43c3mXo=
X-Google-Smtp-Source: AAOMgpeGhegOGVnLy9q9Kqpbih4/Vrkd5r8ZUWPfIb/URngA71clOJ6SefzeGYebF/+KpcBIlNlPuA==
X-Received: by 2002:adf:a18f:: with SMTP id
	u15-v6mr19813919wru.194.1530548845331; 
	Mon, 02 Jul 2018 09:27:25 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	17-v6sm12148012wmm.21.2018.07.02.09.27.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 09:27:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:27:16 +0100
Message-Id: <20180702162718.27038-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
References: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/6] lib/oe/sstatesig: Fix task mappings from multilib<->non-multilib contexts
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
X-List-Received-Date: Mon, 02 Jul 2018 16:27:25 -0000

If we're in a multilib context already and want a non-multilib context
this function returned incorrect values.

Try and retain optimisations for the common case not needing to request
a datastore but allow the different multilib/non-multilib combinations
to work too.

This fixes bugs where rootfs generation of a multilib image would
write into incorrect locations, or be unable to find sstate manifest
files due to incorrect data stores being used to expand data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b82e0f422ee..0aa577d44d2 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -372,8 +372,14 @@ def sstate_get_manifest_filename(task, d):
 def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     d2 = d
     variant = ''
+    curr_variant = ''
+    if d.getVar("BBEXTENDCURR") == "multilib":
+        curr_variant = d.getVar("BBEXTENDVARIANT")
+        if "virtclass-multilib" not in d.getVar("OVERRIDES"):
+            curr_variant = "invalid"
     if taskdata2.startswith("virtual:multilib"):
         variant = taskdata2.split(":")[2]
+    if curr_variant != variant:
         if variant not in multilibcache:
             multilibcache[variant] = oe.utils.get_multilib_datastore(variant, d)
         d2 = multilibcache[variant]
-- 
2.17.1


