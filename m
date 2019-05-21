Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id DA1867E106
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y3so7609165plp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fr2d/sPQB/XuxpwSFSDFbPtebD0MOa3P/PD14KGrmc8=;
	b=R3238ZGwstm7kaSjv4FoOgxGWTwc4nETjSy8p6mM69SQPwu1bhzxcG45X4yzWgKjB0
	on2upVjpOx4kNaYxPJVpKMV4hCTyjqCKxJmlXpOvgfW9LG0skHeeHwVMluZ3Z5quSIpk
	QoqRmIVQmU8ZaBSgBWd1SkBlRB/aAYvNlwXwigPaOESYc6SLC+QOIxLIU1w+PizqlGL+
	BmGWQjIIgF6wyaECHeEBc1R4FSaGIUlwGlDMrXMzaOgS+GyK2JHQbsCC8+KQMTZYArgK
	4v/z5os4SvPeMykRznGPTdgn0X1hTbhJfIBrg3cTWHsk9mw8bGJLAb5mTnYK6M4obAZB
	TlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fr2d/sPQB/XuxpwSFSDFbPtebD0MOa3P/PD14KGrmc8=;
	b=JdDIEhtR3aBl8l718UXY/GzKzaex3cRsnNch8gukY+4OuDvN+X2tbsHsWPA7LQwqBS
	V5ikneCN1ol0SajaPGJSzQg7Xmn3jWCQ80py5ZeIyR5x9NtBmAgt9jQuiCME0KSLIyns
	xIgb6RrSxdrL+OAA+dyyGE8u4r9vDnMG2aesTSj5jPy0fKKscAyRwR+WSpBXjdiM1fpu
	faGnUaMr5dF/Lfyf6iK8TaIq7mtFoVT4tdJx1wsF5n2cjIrTbUpAJvdp7lE2de2sI0iQ
	vseJAq0MxOJIwOIYpjxJui/mgjH1bqEeUY7OM+jH4nTp/dmj0Z20b9GAobQFsGcZtoka
	UVBw==
X-Gm-Message-State: APjAAAXXx0gHq5uZGJJOlE10kvWycJtG7NO7XUT3pKmOqOz28mD2xyQd
	4+zlFqzXcAJM+PrtLbMuPD0gIzB0
X-Google-Smtp-Source: APXvYqzeRkSi/W0U0EuAr4/ddlYywgFDpGfT/ibTtEvs5vq4tZbVqa2XBQrTKIQqd1N6WP7+d9IoTA==
X-Received: by 2002:a17:902:22:: with SMTP id 31mr79584520pla.15.1558403010030;
	Mon, 20 May 2019 18:43:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:12 -0700
Message-Id: <49ce92883d3e67c2da434666df6d69d3a0943689.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 10/15] oeqa/targetcontrol.py: fix qemuparams not work in runqemu with launch_cmd
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
X-List-Received-Date: Tue, 21 May 2019 01:43:29 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

As runqemu with launch_cmd means directly run the command, don't need set
rootfs or env vars.

Since commit [a847dd7202 runqemu: Let qemuparams override default settings]
applied in oe-core, if launch_cmd contains "qemuparams='***'", it does not
work, which is overridden by latter qemuparams="-serial tcp:127.0.0.1" in
QemuRunner.launch();

So we set qemuparams as a parameter in runqemu, the fix makes it work

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/targetcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1868ad3..b98b183 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -159,7 +159,7 @@ class QemuTarget(BaseTarget):
 
     def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd='', discard_writes=True):
         if launch_cmd:
-            start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd)
+            start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd, qemuparams=params)
         else:
             start = self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams, discard_writes=discard_writes)
 
-- 
2.7.4


