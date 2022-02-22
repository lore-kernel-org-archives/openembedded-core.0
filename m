Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35231C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 04:22:23 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.8866.1645503741686731760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 20:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jjXENewr;
 spf=pass (domain: konsulko.com, ip: 209.85.219.52,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f52.google.com with SMTP id c14so38079595qvl.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 20:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AlQPjZy2GFNoGXOcAhJ62U05z8vJxe6SY1XDmxXCIFk=;
        b=jjXENewrguoSGH8r0roRadhZocfZPicltC0hJib6yPWivA1feasa/f5fTJiamiYtYT
         FhqMpoT7s/t523t9tJc9rpYDwQGhvdX1YglbwP+MfX4fzo4DI46qOo7/IKqH5A4WbozA
         bDHW7ZNA2rTLrFADB09S3EvHxCk71njivIJso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AlQPjZy2GFNoGXOcAhJ62U05z8vJxe6SY1XDmxXCIFk=;
        b=NqoZU0vUg9m8iD3lurzzXOOpDHFgN80wFSqcVkoMH7zENfifU9hDtgauKTsHTR6iaq
         com1MI1nXMosXYcfKD28fc6eSbOStCdO+OqhhTCaNaPfJhrk8sadw4VUV01Q9uK/dTgj
         zPPnxdUcr+IAqkXUzftigv+/RXe3c/1w8CFPgB13DoyWpyhQePVBpyrMp2HUZfBpZDuq
         bIQAzRUPh91Ce1N0OOkKnmhUMtBgTgq4WkbJkdoKAEXjWQVq6qsY0XAkxnRnOBJoI9gi
         +aaFJDyABH49xjYeYBEFRm/Y2zSuOT1sNsWKnErtxG4NpB3WmvfV40GwenGmHrUxhe/g
         BqUw==
X-Gm-Message-State: AOAM532SWjXcG0GWfwOr+xQElvizXrNwEjLuT/lkSDgzhLtILyCipMQf
	wti4rSp4xwrfFL3MAnNPp+d33enVibf9XQ==
X-Google-Smtp-Source: 
 ABdhPJw5/MCCO+CaMVc/hHNt7fkNA8awoGIK91aa0snTQbmVErNs9mUlALMV72nnRPRjzQ0SYwVp0A==
X-Received: by 2002:ac8:5b51:0:b0:2dd:c4e0:788e with SMTP id
 n17-20020ac85b51000000b002ddc4e0788emr15408350qtw.119.1645503740315;
        Mon, 21 Feb 2022 20:22:20 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 y15sm27913833qko.133.2022.02.21.20.22.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 20:22:19 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts: fix file writing in convert-variable-renames
Date: Mon, 21 Feb 2022 23:21:38 -0500
Message-Id: <20220222042138.1294078-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 04:22:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162124

In my test environments (Fedora 35 and Debian 10.10 on AMD 2970WX),
running the convert-variable-renames.py rename script was resulting
in empty files instead of updated ones.  From inspection, the new
files are never flushed/closed before moving them into place, which
seems inherently racy.  Adding an explicit close to flush the modified
contents out before moving into place fixes the issue for me.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 scripts/contrib/convert-variable-renames.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/contrib/convert-variable-renames.py b/scripts/contrib/convert-variable-renames.py
index fca59ca9e1..ed012610db 100755
--- a/scripts/contrib/convert-variable-renames.py
+++ b/scripts/contrib/convert-variable-renames.py
@@ -84,6 +84,7 @@ def processfile(fn):
                         if re.search(check_word, line, re.IGNORECASE):
                             print("%s needs further work at line %s since it contains %s"% (fn, lineno, check_word))
                     new_file.write(line)
+            new_file.close()
             if modified:
                 print("*** Modified file '%s'" % (fn))
                 shutil.copymode(fn, abs_path)
-- 
2.35.1


