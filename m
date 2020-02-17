Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA7961513
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 18:43:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z7so20951506wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 10:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=CTw4qOCbgEUJyVo4fN6OkOEuXzT4Nc94n+JWmASd+rg=;
	b=u/3mj1zh18q3KGkjV75lAwRKmaTAJR/Kbj9VzEsWrZAqeOonVxtAeVrJs4iGW4ERlF
	kx88/84HTqC5JPMygzC2zMtu+233n/qUVXbgrFFKobAzTuqyxSYQrJ8DJZ+xfFczbjeK
	fIfranlA0IYBl0hfoPYswbWyPb8dPomJiNi/UT8lg56GhyPnDZf7B3VS4GCUeA4nYc2q
	Qq8+lZ6a8w7u5U5tVCTWW2S1Ke6qyMCab7rP736+hc09gOM+8P3jqUTprmE5PqjpVyoe
	fz8h1arp1Lftw/NLg1KQ1D8yMAbg2pQYGkX1WEp2knS/1kTvJYvlGCq9i3C6idwFi38+
	0Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=CTw4qOCbgEUJyVo4fN6OkOEuXzT4Nc94n+JWmASd+rg=;
	b=KhlCSM8lY5zgbdPdi3Pb3do1dPxdMMaGG7FAeNlj9qmr2G0h4EgV6jGMe8c433Evm7
	2C6s/Rf9jC4qFOGRY+q2dAGffKscAJc8kPA5Kdo2J5gtwU87mSK+oYc44YCxnKSwis95
	uTEfH/znL1DETwB864xKXrUrJocWi8U+S4D3XmKdKuN0kIgRlk5q4UMrlSOx+hnNiEFg
	rHMlJ3Ixxnz1GWgIYpdyrLJ072rCmthrjGXNLMcToPY69Q/GIuZ7iOy4memTQpZfKIQK
	Dga8/X9hLVk68B8YrNeKDfIb8g9KjhC85IT5htucn/+UFl12g0vLKedAmUJgBLkR0tEx
	kvdQ==
X-Gm-Message-State: APjAAAXYUO1QMkONg4wpPDnOLaxvn0TfzzNG9rqH4or8Hf5HXmtA0Mgh
	+VD2pCHxoUKpAxRjvxQaIabIkMk4
X-Google-Smtp-Source: APXvYqzw3Yy6YmF/kXbGyjTs729KBl+OlDoE5Fq003wH+61Q8XrV03e68bXAUu1ZPeCfj/Rk6vS3eA==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr23479688wru.52.1581965008464; 
	Mon, 17 Feb 2020 10:43:28 -0800 (PST)
Received: from beaker.muppets.liwing.de (p4FE93807.dip0.t-ipconnect.de.
	[79.233.56.7]) by smtp.gmail.com with ESMTPSA id
	c141sm292392wme.41.2020.02.17.10.43.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 10:43:27 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2020 19:43:08 +0100
Message-Id: <20200217184308.25673-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@NetBSD.org>
Subject: [PATCH] bitbake: fetch2: svn: care for path_spec
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
X-List-Received-Date: Mon, 17 Feb 2020 18:43:28 -0000

From: Jens Rehsack <sno@NetBSD.org>

Documentation says:
    "path_spec": A specific directory in which to checkout the specified
    svn module.
but existing svn fetcher uses "module" always as path of checked out
svn-module, regardless whether path_spec was given or not.

Signed-off-by: Jens Rehsack <sno@NetBSD.org>
---
 bitbake/lib/bb/fetch2/svn.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/svn.py b/bitbake/lib/bb/fetch2/svn.py
index 6c8caf5fb9..385a6b2cf1 100644
--- a/bitbake/lib/bb/fetch2/svn.py
+++ b/bitbake/lib/bb/fetch2/svn.py
@@ -47,7 +47,7 @@ class Svn(FetchMethod):
         svndir = d.getVar("SVNDIR") or (d.getVar("DL_DIR") + "/svn")
         relpath = self._strip_leading_slashes(ud.path)
         ud.pkgdir = os.path.join(svndir, ud.host, relpath)
-        ud.moddir = os.path.join(ud.pkgdir, ud.module)
+        ud.moddir = os.path.join(ud.pkgdir, ud.path_spec)
         # Protects the repository from concurrent updates, e.g. from two
         # recipes fetching different revisions at the same time
         ud.svnlock = os.path.join(ud.pkgdir, "svn.lock")
-- 
2.17.1


