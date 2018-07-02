Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 96773789E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:27:20 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id s14-v6so2269336wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=6cJPe7WQ8gQ4OFQi8EDCIfZJRl4JjVG9uFjl1V6WIOY=;
	b=FN2iYTcx5rb+IoQ7QBIfxcWqEKz2CmICpC630npgrSWl80VQ2Yvvq6feNFwMo+Aqma
	433t31VfZ/eK98t+tL9vjXLLy1+b8LnzrYOjXzPYqmn6fht+XHLvfe/8elxGaNSSdLWv
	Ze2e0zzuT70YwE8ausF+W0VN4cKMQFYh7CDJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6cJPe7WQ8gQ4OFQi8EDCIfZJRl4JjVG9uFjl1V6WIOY=;
	b=gJq+BwMxR+/bFJLJrKuztCXCNn+hnr/SyW1M4Ll07lzMxLtenkNgnsvZDlb8Gaj6sx
	TmKXeoemiPql+3IMg5HI+2ITcPaRPz+OKk2A+3UjFoUeubyW4hcLmFoylJtjqmcKA4oR
	V4XxKfwmj5As9Q1aurHBVbSklCQUtU0qM520PvuJgWfDnHpeIy8iK8lUNV1LfGvcvQR/
	idjVIBUgQgCNHmg21SIl6M73PAWlxadYKOTWo/8d5vty9UzSrwEf4tnTROFLJYPVKmWQ
	6Fob7ay/FGyGwFniIAB3Eir3lam/TP6zL69jqDhTl9Dn/63dP8n82QTsbBYTCjqHfoGn
	9K1A==
X-Gm-Message-State: APt69E2rkywM4vAxBQvP7O1+oN43HupJkDL078vj68W9UQ+AstRPc5vD
	Qe8C+R4CY+3HycJW3pGYw3WHAFWs8+s=
X-Google-Smtp-Source: AAOMgpcUFrpyzre0xDwAZ5VjbD9lUanpvs+DFahUEBH0I7AMzlSTd+J3tbGGX6WYh3HADBY0R2quPA==
X-Received: by 2002:a1c:c8:: with SMTP id 191-v6mr8325657wma.115.1530548840960;
	Mon, 02 Jul 2018 09:27:20 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	17-v6sm12148012wmm.21.2018.07.02.09.27.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 09:27:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:27:13 +0100
Message-Id: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] lib/oe/utils: Improve get_multilib_datastore
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
X-List-Received-Date: Mon, 02 Jul 2018 16:27:20 -0000

Currently this function assumes that no multilib is applied and that
we're applying a multilib. This means if we're in multilib context
and want the non-multilib context we can't obtain it (and no other
function exists for this either).

Improve the function to allow this to be requested.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 80f0442d0ae..6aed6dc993b 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -327,9 +327,15 @@ def host_gcc_version(d):
 
 def get_multilib_datastore(variant, d):
     localdata = bb.data.createCopy(d)
-    overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
-    localdata.setVar("OVERRIDES", overrides)
-    localdata.setVar("MLPREFIX", variant + "-")
+    if variant:
+        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
+        localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", variant + "-")
+    else:
+        overrides = localdata.getVar("OVERRIDES", False).split(":")
+        overrides = ":".join([x for x in overrides if not x.startswith("virtclass-multilib-")])
+        localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", "")
     return localdata
 
 #
-- 
2.17.1


