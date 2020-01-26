Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id DA8E07FF48
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:51 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g6so2952841plp.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EwOzi+yD4E18zHuGTa7FxQqC/X+n29tAaJGLy3hq5os=;
	b=NszcRCgI3+XtjWoW3v6ruCtbdybdY20uVfX9s/XLHnXBTGfapyyk1zxxjgb1wk6Q/f
	aQGweaBJstp0UFco4NAH4HSoWvk9pUiMijsOo/AmeFlvcSZc4wbks8OiqVGUeAAHmcHs
	m019sgS/odthijSBVv5LqfU1LX3xreiWXWkRKbdXXREOlu1luMYrXfLrPdD0DXc2lEby
	iJnGS0qH4+MnNfvJEOyGcnG7UVmmjPpteH966OKMzMvXLLwO+1JE475SXnmojlHTajBb
	cTCEZ4DXb7mQBSL9F3PeH7T1FOmJF5tLL5SRmMlj1mLIyKTc47+6V1SxoXMtIK5J1E88
	xAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EwOzi+yD4E18zHuGTa7FxQqC/X+n29tAaJGLy3hq5os=;
	b=fxz4X6R/zbNZCD8nR4KMiJFOdhzIVp3KZL3NzA/8QgqUTnsfd+L/BRu+hS+RbiRK02
	mvjwFBay8vjuErpqCXyBopsS/mMzXZD+jiJf67ehUDYdcoHBX44qF6gGFoBPuOYsLGun
	ukQ6RARzpwIf3lSNBVhy8J/jbp0Y72M0URTEdPdN6m2gN2siebofpNk27mA6752vyLXn
	2bnhbTEBJrRNmBrML4+66BVAsCXx9PQLpUUAvseG/uYzqKYyDPleKzEraxQ2FRDR4Rnm
	uz23vJGWWEqbHClEnDwsN5Udo6S2QsyP3o3J60N+/PLiuxzktW5t7iPEouR94l76G/c7
	iwuw==
X-Gm-Message-State: APjAAAXZqAdNk94vCPTEY9YZ/fK8igYN3a9RQxLyQ60c2vClKPwj2WHZ
	efcWExCBkGB/3CLyR3Vta6c/JouMVJU=
X-Google-Smtp-Source: APXvYqxN8GOCJ/NkazPGHQeXE1X61ZY7v5oIviN2lYOwJyUdSaJ520hpZpGTGGXtoWtaKYPU1l62vg==
X-Received: by 2002:a17:902:d68f:: with SMTP id
	v15mr12954527ply.37.1580066872405; 
	Sun, 26 Jan 2020 11:27:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:41 -0800
Message-Id: <f6fff9316613c79939e5a7495ebd8bd3a48c6d00.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/13] perf: Pass LDSHARED and CCLD via EXTRA_OEMAKE
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:52 -0000
Content-Transfer-Encoding: 8bit

python code underneath is smart and pokes at python installation in
sysroot for compile environment, the overrides from EXTRA_OEMAKE are
ofcourse preferred but it falls back to python3's distutils/sysconfig
for rest of them, and it does use CCLD and LDSHARED for linking, when we
use clang to compile python3 then it encodes these variables to be clang
however, when building perf we inherit kernel which forces gcc to be
used for compiling perf, which then mixes both compilers due to CCLD and
LDSHARED demands. Therefore override CCLD and LDSHARED in make
environment helps python/distutils to use right linker

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 840f3008b5..6d1b06693d 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -73,6 +73,8 @@ EXTRA_OEMAKE = '\
     CROSS_COMPILE=${TARGET_PREFIX} \
     ARCH=${ARCH} \
     CC="${CC}" \
+    CCLD="${CC}" \
+    LDSHARED="${CC} -shared" \
     AR="${AR}" \
     LD="${LD}" \
     EXTRA_CFLAGS="-ldw" \
-- 
2.25.0


