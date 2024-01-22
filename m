Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E04C48260
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.74258.1705931964159893909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjTcY6dT;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so345295566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931962; x=1706536762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R52fLyrsmSD3iAQqdDTFrY+4XPuWr/xbBfQ6SmMMg+o=;
        b=LjTcY6dTjjpd/1Yx5UYhNTWi/F0TurN1PfdcHKIur389KZFkDYPHimyHKvx6NHlW1f
         zQvXu0q4YWvRQAi6tyASGdIPUYPfxVyYGHdOWHIcRYed/3cWxyJf6rpGDN8mEr1R8F68
         WErC2f4wE5F3OvT+/ciUI6YSG4Id9N+V7ZxfN3K+eT72z6/VVA50vzksSX4sXelbQx+V
         fmxYcs7vtck7woBmAyLFHJl7EzCxRcDjl5jYt8M34wZBYY9IUcKoXLmeDAW/C+16iilG
         innTsggM/Yop0JrvWGqavOzLe1UrhgiVvVXqXYbahXVYXfwxTkeyVBsowiaKU5+ullJ7
         h9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931962; x=1706536762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R52fLyrsmSD3iAQqdDTFrY+4XPuWr/xbBfQ6SmMMg+o=;
        b=owa5YKL3+WfZBvUMhkPf01lgO4SX+Y4v9lIAXzeufd7YxyRRHFSzHWv6QknDu5Fy9y
         qjQMXUJyYfEf4u46sNy7pkF6Ob3xMU3WpnpU8xTm+g2shVDU6HTfzeWAFXE/GMw+Oj/w
         OiT8WMGasTPVEcXL6zP3gkKCeHz3sd9MqnAw7WVzsWX/akCqAX6KTtD9OgbB8CPJcKxu
         jEfnI4yKGgqHbMpaOGQcJ5nVT0760caejwFk9vCkC3D8GMVzA2DTAz/+U4jAFn/MXNXg
         9RmNMDH9grNlIlFKCmksSB+Jidqi+tYQjfR+OlSnQL5GfEkXl/BPKcU+4hn3nzaTCxZ+
         y1oA==
X-Gm-Message-State: AOJu0YxGhc0EyBtK5n5E18v6YKUGS0PjQ/3jCIustfxXY3rRg9/t80Ga
	OQIsxMxepZfcvGTRd3qo/rbufAlQoW7JjMHAkKrzPayLlvH5wHQ6oSHaGibP
X-Google-Smtp-Source: AGHT+IHYJLWu0a4xERQe979U56uVjgC2tl2C2OVGW+Caexamv92hX6/ldHYuWCN5AtsCWqrfOeuzVw==
X-Received: by 2002:a17:906:3b44:b0:a2c:29ee:fb7d with SMTP id h4-20020a1709063b4400b00a2c29eefb7dmr1355844ejf.58.1705931962017;
        Mon, 22 Jan 2024 05:59:22 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:21 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 2/9] devtool: support plugins with plugins
Date: Mon, 22 Jan 2024 14:58:20 +0100
Message-ID: <20240122135901.171596-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194151

Pass the plugins search path to plugins via context. This allows plugins
to search for their own plugins at the same paths.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/devtool | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 3aae7b93b4b..60ea3e82985 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -299,8 +299,9 @@ def main():
             return 2
 
     # Search BBPATH first to allow layers to override plugins in scripts_path
-    for path in global_args.bbpath.split(':') + [scripts_path]:
-        pluginpath = os.path.join(path, 'lib', 'devtool')
+    pluginpaths = [os.path.join(path, 'lib', 'devtool') for path in global_args.bbpath.split(':') + [scripts_path]]
+    context.pluginpaths = pluginpaths
+    for pluginpath in pluginpaths:
         scriptutils.load_plugins(logger, plugins, pluginpath)
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
-- 
2.43.0


