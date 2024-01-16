Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878BDC47DA7
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.8420.1705393475742225656
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fkQkJrZn;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3368b1e056eso7951347f8f.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393474; x=1705998274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx+scOkQ+k12xUnkVDltv9xeNDJdrwBNjeC7XRqoLIo=;
        b=fkQkJrZnJo5eGvKBvLYNSYigLF7975mCvm6nZi/OLPanGQAGxniw96szHHPXGc24wb
         00v9aOyg0pqUmmD9cYEz9WIQcOISsEjPeMSBh3K0XsKskkR4wgjGxbokVYV05HOrHn1g
         1niV2Pl+cFv4tk1EOnakuz7Ag8gIoKMSeKqaOo7JMDjLiIXvr5WKuFI9aGUf+77ID7eU
         euqnHugycg/0tM3ia+Rf2w/LZ23u2qPJcuPpE9wy5EZZAorW67+7+KSTl3VUDj0jfDvm
         s/gEZnlJm21kSEfWqoPagsy5P7DlU7Q25AT8QEhoc6EMuosQS5QMSS5wug/kFkHbeXGE
         Tbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393474; x=1705998274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lx+scOkQ+k12xUnkVDltv9xeNDJdrwBNjeC7XRqoLIo=;
        b=eG3BhUkWGC7JlYTZa4NnXpghAEOAbOBCAiIV8EgusqwGHDiyaizIStBAlh+hpuxCqP
         Iabvz9RXdKPTSQG3FLryQIUevjnEZOy3e+7AGLOyypKJ4tKrmhJ62maUfZNhC3qgHwD/
         MN60wmqRe864ajzOeZYsC/lKTFK00CiYQZ58unehS9dWm3Yvll4P71zx8avWhxBLs+mG
         HIIekDabO8Hr6LxQJbOMgTc3NhXOLZ88ORZKssOyo+otgAlZX3hygpRB5A38Sd9P/nFW
         UNFGiFLAg23WjfxsVUWgqLqGanLAdb8k22XrcHzIGE+eh96WxXMr++cLKtQOW7L3Bdr0
         +4Ng==
X-Gm-Message-State: AOJu0Yx0yGkpQLG5fHwM3YJoRejq/xbBLZ5vUsausZFlEUuX8nLMLmb7
	094INESDPrTVSEcYX1052WWMnZbJTSkGpw==
X-Google-Smtp-Source: AGHT+IGZdtJUHwElGabHdKXfQKOi+TFdBYjxKtAlir/PHYLtsSyVGWt3VWIQ9BgdI4tjzoySK5AUlw==
X-Received: by 2002:a05:6000:92a:b0:337:a5a4:b741 with SMTP id cx10-20020a056000092a00b00337a5a4b741mr1701452wrb.107.1705393473862;
        Tue, 16 Jan 2024 00:24:33 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:33 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 7/9] oeqa/selftest/recipetool: Move create_go test to a proper class
Date: Tue, 16 Jan 2024 09:23:25 +0100
Message-Id: <20240116082327.128990-7-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193830

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 24 ++++++++++------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index df15c80069..356bb4a746 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -744,19 +744,6 @@ class RecipetoolCreateTests(RecipetoolBase):
     def test_recipetool_create_git_srcbranch(self):
         self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;protocol=https', 'matchbox-keyboard-0-1')
 
-
-class RecipetoolTests(RecipetoolBase):
-
-    @classmethod
-    def setUpClass(cls):
-        import sys
-
-        super(RecipetoolTests, cls).setUpClass()
-        bb_vars = get_bb_vars(['BBPATH'])
-        cls.bbpath = bb_vars['BBPATH']
-        libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'recipetool')
-        sys.path.insert(0, libpath)
-
     def test_recipetool_create_go(self):
         # Basic test to check go recipe generation
         def urifiy(url, version, modulepath = None, pathmajor = None, subdir = None):
@@ -941,6 +928,17 @@ class RecipetoolTests(RecipetoolBase):
         self._test_recipe_contents(deps_require_file, checkvars, [])
 
 
+class RecipetoolTests(RecipetoolBase):
+
+    @classmethod
+    def setUpClass(cls):
+        import sys
+
+        super(RecipetoolTests, cls).setUpClass()
+        bb_vars = get_bb_vars(['BBPATH'])
+        cls.bbpath = bb_vars['BBPATH']
+        libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'recipetool')
+        sys.path.insert(0, libpath)
 
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir = basedstdir
-- 
2.35.1


