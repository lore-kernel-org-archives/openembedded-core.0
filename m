Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4C504606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 23:17:56 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id u9so5205830pgo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6thNylEWeC0003nUc0TtRd1nMSfDtELr345ovdhe6JY=;
	b=a0p7+MWoH8kDdQ44t40Hv/Dn8ze0VHAi7yy7TNwsY0XIr977PoNlJ0C/7fNU6rtkh8
	NTVwlihd/gdkJHlz8Okgh7nwubOtFi5UWMp+po0BGR1lvIyCx2kZQDd373/ywWbo7J+Z
	/bs+H6226ZFVl8oIEW2FwmFYNp/tYndEov/uQAg6Xz4NoV3uEMl9Uw/zkLlXzgFMgCy3
	SBUpYl9CLE8mnK551vhGQCqiWwDlDYXXknprwHF5DhUljwyybjrHBuL7ImFEZ4FppR5Y
	IQvgG8AAi2lRmoyrSn5S3jZhksxMbigWSbQ/gBc6lejdYBA6NH/epJTdlW0VPQDqR0E+
	9mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6thNylEWeC0003nUc0TtRd1nMSfDtELr345ovdhe6JY=;
	b=GAzk8J6KxQYHFSIMK3kNf9lyGD9ZGzrtsCLBGa7gIDz90WWu+0VGtD5iUS4TLJnsSj
	AkusgXQv/Rr5J08XPKVONy4z9TglxyyKJJKN79qJS6XxbYQ1Bwa3JEPMMLgrxKrxn/5n
	QIPoj/A8c9GZOfApBiBddlx6oj/sQwN5FsoD5M9Rja9rPFa0J0Cm9RAV1uFYs7WTFOSO
	nWczRNaJC3KBgXpjww910pA9oJEEYBtAIjcZStjTXFvxqnNmTGviqISjDjtbrXa9lsjh
	Pi+SvMMZYFdgPAfpg0HWy0sjU7h7qHG8cmuQ+hmNZJUc/ETSbcMXh7a9PaiXGxOvsj4C
	M9cg==
X-Gm-Message-State: AHQUAub3QMNv8WwhavxBdA2bTW/j2R42GI3ravK0S9bLLAtNiZeEqCyn
	C3xRvUFsSlGpjPaxiEV4WSpC5xNd
X-Google-Smtp-Source: AHgI3IYH5QDxPyMraDi/cjvTno7zlRMCpEjH/B8eggE5KWHZyCPP4Xc192dw+4xiy47Dq/3Tv+Owtw==
X-Received: by 2002:aa7:8d42:: with SMTP id s2mr4103853pfe.116.1551136676930; 
	Mon, 25 Feb 2019 15:17:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1cf2])
	by smtp.gmail.com with ESMTPSA id 23sm14148599pfn.2.2019.02.25.15.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 15:17:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 15:17:42 -0800
Message-Id: <20190225231742.13855-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190225231742.13855-1-raj.khem@gmail.com>
References: <20190225231742.13855-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mesa-gl: Set PACKAGECONFIG for target
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
X-List-Received-Date: Mon, 25 Feb 2019 23:17:56 -0000
Content-Transfer-Encoding: 8bit

mesa.inc uses PACKAGECONFIG_class-target override to setup default
packageconfigs, which means that when we build mesa-gl for target then
it does no honor the ??= setting we have in mesa-gl recipe, and ends up
compiling egl, gles2 as well, which is not intended.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
index 73267eb4f0..d4b1c1c454 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
@@ -7,3 +7,4 @@ PROVIDES = "virtual/libgl virtual/mesa"
 S = "${WORKDIR}/mesa-${PV}"
 
 PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-- 
2.20.1


