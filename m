Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D904C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 07:27:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.3388.1678778850711231642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 00:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NhiFxk0k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id m2so581324wrh.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678778849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4NdjAZE5aZ+PCzl9NIa8kB/1mThhMPTt7IOKAiao8w=;
        b=NhiFxk0kZKi2mG3YV7W0pnT4ZGbUyiaPWyIpHcMz28/iCXG8e3EAPaO2HOh2VxJs1o
         dCyAFtrGM+M5eJE3WTokT0mxuBt9EyPYJ4PSTB+uV4CRgl+GL1Ux0YVF64Y7UAbpk6sj
         3nA3f6yPLYMmn8AaOD5GVC3JNzZdMqBDWEbuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678778849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4NdjAZE5aZ+PCzl9NIa8kB/1mThhMPTt7IOKAiao8w=;
        b=zUDZznBCSH7jDF5zU+9QxTc3qsKubkxn96eR81P0864iZocAVI4elLsXUXx7SzK1mn
         nvo0GNMAELtU97Wus4pN9Jg075VyfIG58hbawBq3HnAVPN++L8FrNTjtZXNeKg15Ggqy
         tl0Irw2usoFgzdQ7OT/ePijpUGUQvk+w0ynsNYABYnKYF/qNzkfhr4xjbtFaR5VdGsyI
         fhzPohjOb5jzv8luP6U229uv8pfuwktpCnVwgUn6dRjvR9MzcoKfCnK86QhnaQh6LehJ
         eoMe/WjAaqvanvrXV7NXKg4iHo9Z6pgfs+sa/KEuWifrDWZn+89qv1TKf4dBfV5knA9g
         wzJg==
X-Gm-Message-State: AO0yUKXDTW75ra2QideMehn9q/pMf1ZQ3YWphHK9z81HEX2Y/2gAPKvh
	a8lnJnh1dxEFQGmow5mkZlmSIVPMjsG1YC0Z8gI=
X-Google-Smtp-Source: AK7set+MMDGAYg0dEIIyTZz3MEF/KxfCvlTxBSWqLjt6A8dv0H9QviVi7dkhrtTxEFfXODx40/Ii+A==
X-Received: by 2002:a5d:604c:0:b0:2ce:aed5:7dc with SMTP id j12-20020a5d604c000000b002ceaed507dcmr4294254wrt.68.1678778848577;
        Tue, 14 Mar 2023 00:27:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:eb9f:715b:2c4f:17ba])
        by smtp.gmail.com with ESMTPSA id a9-20020adfeec9000000b002cde626cd96sm1291340wrp.65.2023.03.14.00.27.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 00:27:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/combo-layer: Fix python deprecation warning
Date: Tue, 14 Mar 2023 07:27:27 +0000
Message-Id: <20230314072727.3884144-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 07:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178474

Address:
DeprecationWarning: 'pipes' is deprecated and slated for removal in Python 3.13

pipes.quote is an alias for shlex.quote so switch to that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/combo-layer | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 7f2020fca71..2312cef9ac1 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -19,7 +19,7 @@ import tempfile
 import configparser
 import re
 import copy
-import pipes
+import shlex
 import shutil
 from string import Template
 from functools import reduce
@@ -1275,7 +1275,7 @@ def apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=None):
         target = os.path.join(wargs["destdir"], dest_dir)
         if not os.path.isdir(target):
             os.makedirs(target)
-        quoted_target = pipes.quote(target)
+        quoted_target = shlex.quote(target)
         # os.sysconf('SC_ARG_MAX') is lying: running a command with
         # string length 629343 already failed with "Argument list too
         # long" although SC_ARG_MAX = 2097152. "man execve" explains
@@ -1287,7 +1287,7 @@ def apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=None):
             unquoted_args = []
             cmdsize = 100 + len(quoted_target)
             while update:
-                quoted_next = pipes.quote(update[0])
+                quoted_next = shlex.quote(update[0])
                 size_next = len(quoted_next) + len(dest_dir) + 1
                 logger.debug('cmdline length %d + %d < %d?' % (cmdsize, size_next, os.sysconf('SC_ARG_MAX')))
                 if cmdsize + size_next < max_cmdsize:
-- 
2.38.1


