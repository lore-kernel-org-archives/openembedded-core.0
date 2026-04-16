Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374DEF88091
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:43 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7729.1776322121774225247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gx08OOzJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso7626117f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322120; x=1776926920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2otvjNxhfg/FKlFkmYbnyjoFjWiNsNv0c4SQ18zkQc=;
        b=gx08OOzJqqebLj9ueWLO05X8MKwA0fhxtxaL/lKgtWQdzB3MVn0JC7Sy9W/9O+QyE8
         9M21f/3qg8rdvI2GYHcPgLWFicNiv0CTXo6YVZM+zP6VPc5foJcxEsmczU6C15+EMwkO
         Ftas3XDoOztmHqlFvEsijZRDvi7qCVdIcV/90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322120; x=1776926920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U2otvjNxhfg/FKlFkmYbnyjoFjWiNsNv0c4SQ18zkQc=;
        b=KRb8qX/5czsxdanOWIL027sH1vgfmMOKfAjR/R5V2PsqRA0clVHZWKAuskOx6mesFW
         MiJ6d9WMpYJuBYkLOgILy1jRa5pav+tvV+Znghisqa1R5SiRXIdNCTKQRlYL/t+YORoh
         7EdVh7OcxwVvs0qJGj9rggeGNvpm7E1RAE6frbPOuJCwzydpA1ZRXSQlnDGJxigUoAhX
         jg8f4jgAevf/XAPXZizxRa0PExWmrva8fVrhNj8ORYdyV3T99KgsZAIbgq6eIk6KjIek
         9smcp+1Si1YNuXKAn0Nt23tgQTvCnRLSu2oSXSEjx3eSQlg9YT4LJNve9Lr9WVS2OA8Q
         CC3Q==
X-Gm-Message-State: AOJu0Yx6WVE1bAVJ6X+tWakZLOc1Wf6fyXEuk7I3doC9rYy3tDxbHUMl
	99+m8X6KqqZ8QqaLg5HHmjw3sk4ivd/Wi2vcEFeqGPksaCA7xUqwGkYpjFWqVHZLKdP44ii791o
	EpN3Ib4eTRV0J
X-Gm-Gg: AeBDieuBCLsmSXkxiQdaXCB0QxzMjFNpVGRzBzzI2e4Q2IFyfRYS7poftC6xRNZ2NL3
	U1P6FabC7DfN359xk03ZrUNV64tXqTV95wRSeiY6F+271dn+9ZpBaGvttScJ9hvKRDnOP40PBwd
	Di+1qekLMrWbayrLykoNzVIwEaWHtWo914yVMpTD7Y7+X05gQ1WUIU0gdYF4LeMn78wXnAhlg1L
	rd6ZnIn+udsGH7J2EEIssMyVkQgLq3xnfUB2mmZPQ7ts2bxvVkINLzTip0pPu+CLRdwCUV5Noeb
	6z+t//BZYrqS3eetSSHaBgTIPXI05T4wwTEBLz+XT47rWa+28FWFFxUo0CT75RRzfnUvLDwCpYL
	yKPyLowQVWx9cftEIyfwhgl5iDq2QN6Sv/DEFW+uHza9mRhKK4fMuImd81r6g3sX73b87gHK4BE
	41z/3Cv74XooU/3UmEJ6520WG1ofPr77ZWZSZRgk5oZCs0ofa9bwE7UQDVvhHHmMAMgnF6hBoif
	N/XjA8JftrEIAyhurbqdoQEfBpMZKpmXm8AZw==
X-Received: by 2002:a5d:5d02:0:b0:43d:1df7:ed24 with SMTP id ffacd0b85a97d-43d642a64b1mr36060783f8f.21.1776322119872;
        Wed, 15 Apr 2026 23:48:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 33/47] recipetool: Recognise https://git. as git urls
Date: Thu, 16 Apr 2026 08:47:34 +0200
Message-ID: <272e0ce9cb776f14166aaddeeac9d570089e298c.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235375

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If a url has git. in it, assume it is likely to be a git cloneable url
and should be treated as such.

This allows us to switch from https://git.yoctoproject.org/git/XXX urls to
the preferred https://git.yoctoproject.org/XXX form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cedc9209e3bae0da8d61423b16c74c49a132aa63)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ef0ba974a99..adafaba47e5 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -368,7 +368,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri) or re.match(r'https?://git\..*', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri

