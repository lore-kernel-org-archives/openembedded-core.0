Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 536D07F8A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 15:47:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i12so20084039wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 07:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bQMbA9bpsu5aSERewaCNKkaWavv5GrcEUs8oT0PUrp4=;
	b=Krm0GnxWew2LI3/f+MmqZwbcG9o3/GHW5iF4fV6QfK6M4XZPHFuTa0fVdbgJiru/BJ
	PVngUiE9BHaKrac5nYRHkSjCcKa3r/ADp8qbgAc1Hoev6L8rHQFZCh/cG+AcykjEaWhQ
	e/iUcXjA9g3jy680vxIj/K+aXMrrz+MOZMuNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bQMbA9bpsu5aSERewaCNKkaWavv5GrcEUs8oT0PUrp4=;
	b=R4+0edisjbZPQvI4rlyefoSHcIBPng3qtsw7fZhT5qvF0Vpe7N//Eg0nLoJMLSYE/3
	MlDZNjPuNYAczgDm7EvVnJqFRJqx4aZd8QzHB0qtRXNUCIGdzhojsc2rL9ONFVPLseEX
	i7TUqW1KCcGBwqKrBUq3cWB8OfKXlfC/ihxAd5VvYSv+r+Vy2FunB8nBheLbqeCu4LvM
	LtxBgoOkoJoFe5pFu10g3F7wBMC3tDKbmxN8FEoUMTLWg+s4ZAP9cFSV47Rv0Fyca70y
	hs4AvcRqZJ60Y1ZnDblSJEC1BK8Tw/Jp0V3FWAJAlilIiT4HNPS9n+HlsOBcfiKRXPdt
	obhQ==
X-Gm-Message-State: APjAAAWeMtxT+M/G9EKQFfFuuHsfjD+asBlWbjTvp0A46Ubgfv2CgHuT
	MPK6OPUEnIXm6nrdnzFBc4TUIzwFR7I=
X-Google-Smtp-Source: APXvYqytO+RJbA6p0XKUFUHCJIL6NGX8S+cLPLZbvjvfG3xi4VF/CKRS1Jn4l68k7MuMmmSzlCAi3Q==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr677767wrn.225.1574092073668;
	Mon, 18 Nov 2019 07:47:53 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w13sm22893031wrm.8.2019.11.18.07.47.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 07:47:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:47:50 +0000
Message-Id: <20191118154750.5282-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118154750.5282-1-richard.purdie@linuxfoundation.org>
References: <20191118154750.5282-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] recipetool/create: Fix to work with reproducible_builds
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
X-List-Received-Date: Mon, 18 Nov 2019 15:47:53 -0000
Content-Transfer-Encoding: 8bit

The extra diretory created by reproducibile_builds was confusing recipetool
and hence devtool. Ignore this directory to restore the correct behaviour and
allow it to work with the class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1fb6b555301..b5c9f788433 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -496,7 +496,7 @@ def create_recipe(args):
             logger.info('Fetch temp directory is %s' % ftmpdir)
 
         dirlist = os.listdir(srctree)
-        filterout = ['git.indirectionsymlink']
+        filterout = ['git.indirectionsymlink', 'source-date-epoch']
         dirlist = [x for x in dirlist if x not in filterout]
         logger.debug('Directory listing (excluding filtered out):\n  %s' % '\n  '.join(dirlist))
         if len(dirlist) == 1:
-- 
2.20.1


