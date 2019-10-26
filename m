Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id F322C7FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id q130so4147595wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zf3u8I2hCpXJ1TPiAdrlZ45CmpI3lpXP6Yje0ZeprNs=;
	b=cnrwpxtQhEIFuoRjBzFYXdq0xpbkhkJl95VVAtMbgigu8Myk+oA8msUKR9S5R8IeSq
	c9E5cQwDKZ/z1lVWpWaMEZ4g9ot5YASskWpeZ2eqo+efzGsG3LvbwimHc4RzsvnRw8M5
	GNjEyLtXjX9c4eCs/AViMoPYOvIVMz5cdz0A33HpPhUPY650/kWdzIET7TmcN0qywAXK
	gGNDLoV7Bxk8CJJi/g/Z9oWHIR+VM8zKwZ+HnhZY9xNAY5ZBTSmlBxUUgUlHBYTjWcJX
	m36+/spKfVAeak6eXjiplmChLw7XEJGWvvr2IOHR3lRcEWh+39BX9xEGZk6p53xHXTh/
	584Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zf3u8I2hCpXJ1TPiAdrlZ45CmpI3lpXP6Yje0ZeprNs=;
	b=aRC9by70ePfvRa4LsWflmbY7341xLXD+evlIT0xMy6br9NZnkhbCpJplfz8DxJTRCg
	2Q00O2XvlPaJzooDniApINpIZ41iYbUbpFRHh2EnohUAxWls++FrkLTCAET/mCR063yc
	oQTBNk5kBF+6gSk4i2w3OAKJs5wAg7IKEqEAzzwz+E82xXqDMmehnByr2+rJFhvC2Zua
	HpKdcgbgrxzrJDUZUT74Qf/uaYnXzLXI/gmbY4cF9+n1OP9M45jm8rODfT08+nsbxMq+
	qqpV9Ko7jH/pj5c/gOetmjOETdaJMkon8ih/fKRT2bDQqbnVQ02SBf//mRbvAPq/Jqsf
	FHhA==
X-Gm-Message-State: APjAAAVxW4P+GJXLqZDvIWvZFYGmfFUEueTQNhRn9zKeM92PS9iFVlKB
	HVV+guU33gf2qusirNn8bh3b0AJ1E3U=
X-Google-Smtp-Source: APXvYqxHLTTuk7HQp9HCfEMkKjVj9E3zYZup7Z6pka69ow0bfJPJtcsMXMPpa80o/ohlFRsp1X6FPw==
X-Received: by 2002:a1c:5609:: with SMTP id k9mr6532999wmb.103.1572072613532; 
	Fri, 25 Oct 2019 23:50:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:43 -0700
Message-Id: <956ae2c2a72914c7e9a1d59e5906c7fc75670a39.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 11/28] uninative: check .done file instead of tarball
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:13 -0000

From: Stefan Agner <stefan.agner@toradex.com>

In case multiple builds share UNINATIVE_DLDIR's location, one build
might be in the process of downloading the tarball while another is
just checking whether the tarball exists. Check for the done file
instead and rely on the fetchers lockfile mechanism in case two
builds are running.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1c95580549cb4f77601e62c7f026b19c752d853)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 3326c0d..9f8645a 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -45,7 +45,7 @@ python uninative_event_fetchloader() {
         tarballdir = os.path.join(d.getVar("UNINATIVE_DLDIR"), chksum)
         tarballpath = os.path.join(tarballdir, tarball)
 
-        if not os.path.exists(tarballpath):
+        if not os.path.exists(tarballpath + ".done"):
             bb.utils.mkdirhier(tarballdir)
             if d.getVar("UNINATIVE_URL") == "unset":
                 bb.fatal("Uninative selected but not configured, please set UNINATIVE_URL")
-- 
2.7.4


