Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C318C25B7A
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 10:36:44 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.16577.1716287796022681321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 03:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T/YuiEOJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e6792ea67fso61004591fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716287794; x=1716892594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbB36eSATZ5ScAzMcA5xsS63+wvpCCFHxx6h8y6FpqM=;
        b=T/YuiEOJJTMj0Vw7ij5J9zatnTD4ofa090nAxfXrC60os4HCH3qRfdMeLTkMuCnzRr
         6qpv3k0OjjkD41TlF3E5FLj2zyjnNtJSf0ZrqkVpB88XRl+W38AKpMhBHOBZg12zONY4
         btPTpBaMMg6uFT5XAdypiJjL+P4ryewZnr2o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716287794; x=1716892594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbB36eSATZ5ScAzMcA5xsS63+wvpCCFHxx6h8y6FpqM=;
        b=sE/bqp84jEiWtfl7Uie9UwGJRFyQtPA0Wbh9K0OE8JLXCANP+5MkVgw2+ybNXyKPcs
         urxCNqxVpZqx62dpxpnosPsjSLFHHMTmjAsmvmcJhpfugB9lC/16l8dqErvD4H6AoFsa
         TFcajNzJchiHImfTHFp2vSCTYZ7GZekNIfIQZFnXELi7Fy8GdIfTkWXNQKnSrSeaj9kh
         7EXI5fzXSzZJ1pLtU/gFFJkV+0Ge3MREPif6gtEHAizrbRJ78cV7oqqUYBw+kbcbFexT
         XxG5yHlypm8finDJPXq95wvj3Ory6RBa/m6amvr+iFG/Upt9dewkb9CN2KaLr33rd5y4
         fV2g==
X-Gm-Message-State: AOJu0Yx+beWhaHYyN74q0KElURZrGMs/MULs3Y97NvlFnD2pRFs8uuzO
	oEYV9pBUy30Flu1LRdAXs14z95ayl8RM1hE5W1rx/m8UajbFuAa01kT5FzU0tVbLp+e9syrhSxe
	cYuA=
X-Google-Smtp-Source: AGHT+IHXyEvscD08E7KjMp3GKx7NAUl1RrMHs9SN5Sk1fpqxmN2NW9gxTGPXiG2z70h0Y+3z1T8c4Q==
X-Received: by 2002:a05:651c:543:b0:2e0:9646:8512 with SMTP id 38308e7fff4ca-2e52016b443mr227154301fa.31.1716287793712;
        Tue, 21 May 2024 03:36:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88111033sm495465355e9.34.2024.05.21.03.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 03:36:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] go: Drop fork of unpack code, mandate GO_SRCURI_DESTSUFFIX
Date: Tue, 21 May 2024 11:36:30 +0100
Message-Id: <20240521103631.1122991-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521103631.1122991-1-richard.purdie@linuxfoundation.org>
References: <20240521103631.1122991-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199614

The go class has its own fork of the base unpack code. At the time I was
told this was fine, it now isn't as that code is changing.

Rather than have a fork, put the path magic into a variable and then go
recipes can just set SRC_URI appropriately, e.g.:

git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}

This avoids having special case hacks in the class and makes everything
a little more obvious.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/go.bbclass                   | 16 ++--------------
 .../go-examples/go-helloworld_0.1.bb             |  2 +-
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index d32509aa6d1..9146dd611e0 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -80,19 +80,7 @@ export GOPROXY ??= "https://proxy.golang.org,direct"
 export GOTMPDIR ?= "${WORKDIR}/build-tmp"
 GOTMPDIR[vardepvalue] = ""
 
-python go_do_unpack() {
-    src_uri = (d.getVar('SRC_URI') or "").split()
-    if len(src_uri) == 0:
-        return
-
-    fetcher = bb.fetch2.Fetch(src_uri, d)
-    for url in fetcher.urls:
-        if fetcher.ud[url].type == 'git':
-            if fetcher.ud[url].parm.get('destsuffix') is None:
-                s_dirname = os.path.basename(d.getVar('S'))
-                fetcher.ud[url].parm['destsuffix'] = os.path.join(s_dirname, 'src', d.getVar('GO_IMPORT')) + '/'
-    fetcher.unpack(d.getVar('WORKDIR'))
-}
+GO_SRCURI_DESTSUFFIX = "${@os.path.join(os.path.basename(d.getVar('S')), 'src', d.getVar('GO_IMPORT')) + '/'}"
 
 go_list_packages() {
 	${GO} list -f '{{.ImportPath}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
@@ -151,7 +139,7 @@ go_stage_testdata() {
 	cd "$oldwd"
 }
 
-EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
 
 FILES:${PN}-dev = "${libdir}/go/src"
 FILES:${PN}-staticdev = "${libdir}/go/pkg"
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 74f3520eaef..575ee81b50a 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://golang.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
+SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 SRCREV = "32022caedd6a177a7717aa8680cbe179e1045935"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.40.1


