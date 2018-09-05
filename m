Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A982D74AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w11-v6so8409547wrc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=8W5pzQGkBBhYCpfg542UJ+FnH/KeEeofipRv7mm1LXA=;
	b=RYrSUKSINQs4uXQIEVey9PL9hv3oRyVSBJkWQsrkYnzw6bVPu2S6+CTtzpB/RT+RnE
	D9nNJXjC4P36LpAP2t5Bxq5gHi00eWIR9PI7NZKTpow8rXANrO0XEECxfdg/SS1xcwvd
	fO6p88rttmlIqTeknJ7YQ0Mv+1DzuQjMzlPbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8W5pzQGkBBhYCpfg542UJ+FnH/KeEeofipRv7mm1LXA=;
	b=dxqsMvVNuFpnrHBz/7WVGApAKdo9QqiD0+N7O7Ao/P9eTFzbNogrI/iM/yWTenE/l4
	8jWXv/DjmI4BFV4m9EY5IQxIv311bsezQdFM2maWsALmf5CYVA3sxBRCnSW4OPX3gNTl
	adWTYfEP21dcuTYVtDe+5zSm1OJQfONUJO5uXVWbgRMWbkLBgucljiDxwRSDpXglpTF5
	aBs6cntpWnPkeini82YAN7YvHcYzzOf10bYQC1Hy669fbvOXfP22u+xxLsPGlLMCa5Q9
	+DqztPUOIvCej3uXJY2YgsUYYk0OhIzUNKnqngS7MQvWBtVjJ9TpDZlna3J0C3Sz7RKW
	U1lA==
X-Gm-Message-State: APzg51Ay3qeUc+pKoFSV9+aanbrqzQINmhyq41lR9n3FPWFsKXqsj0rC
	BDnE9UmiYCI+EG1rdTdp+vQAzLkX8ew=
X-Google-Smtp-Source: ANB0VdYF1YBjfqzvtiz+xd7OS1P0mx/ZldPojjIVHxpZaaCN3XIAX2o/BdnI0sD/O6L8kb8TqUJT7A==
X-Received: by 2002:a5d:484f:: with SMTP id
	n15-v6mr25676940wrs.234.1536166350120; 
	Wed, 05 Sep 2018 09:52:30 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:20 +0100
Message-Id: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/8] python: Run pybench once for optimisation task in pgo
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
X-List-Received-Date: Wed, 05 Sep 2018 16:52:30 -0000

From: Ross Burton <ross.burton@intel.com>

There is no good reason to loop 10 times on the test since the profile
optimisation won't change between runs, we don't need/want a statistical
average. This is just burning cpu cycles, just make 1 run.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index bfe91fb1c71..8afe15eee6a 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -74,7 +74,7 @@ TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip --enable-optimizations"
-PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 10"
+PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 1"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 export _PYTHON_PROJECT_BASE = "${B}"
-- 
2.17.1


