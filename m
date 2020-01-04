Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCB47F881
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:15 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id p9so20171237plk.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Tr12qhqvTwQPnbCjJgfZx6Tacie7gSEkdxuS3/dTXrQ=;
	b=RAKpyUVp6DI4Zg7mSi6rpkE3xwpNFql2oU5H2RcaSDMLNvZlioOu38Xr5z6pl+JFRF
	xapzxTMMwCDGK9S7g832wVe5KH6ipC0EH/VSipteNw/xaO3Q+WTZOytwbgprSBBGe5rW
	cRITBs681a6ghBPxN+xmbbl8Ec+CerjUYaqiJhmrHVXFe/8lmdXpk739txGlMjaeSSPD
	SPZKk6KkWE1s6mfv4M6WchAjYEl0M+DNzR72lnDbpuIdQSvWMtjbOWHpyy3DEK2QGRVC
	sJKkM+adHUq4WSiTr7HiiYWR1S+JqIpAB5SKTXTBZ7+REAjNb43KnwMqbE7uOQLZJIuo
	6wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Tr12qhqvTwQPnbCjJgfZx6Tacie7gSEkdxuS3/dTXrQ=;
	b=NAMZhoHXL5/0GGbMqAYSePzEd+s4kMDPH5bjca2Px69cKIs87zJZHwdqC9BvRRRSyN
	DrJXkdcfs85P9tWxobfhL8vfHwj5UITwVxhDirMWW8l+dbdubYKllnfs3zYuaGbE3/3H
	5ZzXsqIFVNP2uX4l5m2nrLJAqHrD13NdaqzNgcSR8I3MGRWLu/2aveJRCrXMCDLjT5TX
	EQPpnKOcZYsFQI+oYGs2GOgiQ0Pc1RWdoqlko4C7rP7RUcYpPtb6+He7SXKevSGZlQNh
	btKTO8yDKLBVplXrmHgFN6X94XP67ZNYdYraVJJlnzg0cUHl6pLV+ROIyrBu6HXh8POr
	QOWw==
X-Gm-Message-State: APjAAAWdKLFbiuTvit0XWSpERD3AdufDXvZBxhrP0/2SIR3ej9j7ngj0
	vU+9tN2V8tzrBqXlEHpLj933kDhUi2g=
X-Google-Smtp-Source: APXvYqwr4jFcsK1TJFVo0VOrSHTIJWvjgPRbyKaSgoITerxMTx/8fGNYZLk1kTos0j+wo58yhQdy0w==
X-Received: by 2002:a17:90a:8043:: with SMTP id
	e3mr32738508pjw.24.1578155176287; 
	Sat, 04 Jan 2020 08:26:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:44 -0800
Message-Id: <bfed8be91525478ecdf6b64e6308958b3271c8cc.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 03/29] sstate: Ensure SSTATE_PKG is reloaded when handling siginfo
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

STATE_PKG may have been changed by sstate_report_unihash so don't
cache the variable's value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be29a25400c4ea285ab3f588c5831f00ba5d4f63)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index eb1ecd6822..a46dd2e210 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -664,7 +664,8 @@ def sstate_package(ss, d):
         # All hooks should run in SSTATE_BUILDDIR.
         bb.build.exec_func(f, d, (sstatebuild,))
 
-    bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
+    # SSTATE_PKG may have been changed by sstate_report_unihash
+    bb.siggen.dump_this_task(d.getVar('SSTATE_PKG') + ".siginfo", d)
 
     return
 
-- 
2.17.1


