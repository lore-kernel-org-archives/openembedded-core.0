Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF608C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:10:06 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.12421.1707487802484043111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0o1cLOx;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so1485065a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 06:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707487801; x=1708092601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zm/m/mtH0YFc0+Y5GB5DSaOXeX9UDDmSvfVe8pFKf0=;
        b=l0o1cLOxkPNpWiXNi6Ai+owy56OWd+nYEWfk6fgUcLeBN9EvLmL9+NcFEw4sANuscK
         DeeShKC7N8K8pIfrQpYL1NyP0zRLUs1YKkY8AZfP2zYPFjxb0hrpPWlVAqM7EVn3f+cp
         tya3pdYm3OdUPeQBByQpNdLpvk9k2gOpQ/g5IzYjyfbNkQyxq3krCUlz9HGOAUZsDNaI
         Y7WcmllhQqPAeRAv2hxNY9R9i6wqsC8SvOM9v3pnenRkf6bjd87dX6hfu8axG7IXdVLe
         Vm4hANkP7cMnyjd5v2VAuHcpMz1/CHWWzgDSt2FYjabXQq0OqVLC3qpXouEOcp5s9qA6
         rpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707487801; x=1708092601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Zm/m/mtH0YFc0+Y5GB5DSaOXeX9UDDmSvfVe8pFKf0=;
        b=stoAN3cUXJSwr0yLiS4kHH1GAlYurXXXpK8Dqf6/DwaqcYIhr8cDCBGWEWuCQnw+Pp
         cKUewvc6nkmInQxfvqjUpwc0IjrgE+iLLiW/0kmtncS30v11uN9QiuNZO7qS6dLje9s/
         eFl7y4T2UA3itn4w2TPOtRYrJvGqZ2K36lRZSwGJqM2r+CW4YXV8IUUi8fbyWPcGl0pi
         FgnSaNYNLY0KlE9uIbErKBh6pPbg1b4YGHu/xpdOBC/x5yYP0eGJKUT5pbnpDHDDBYjF
         EH6xuPeeadg6ysC+MQBSIRhmrh9PTef97S3MAq+253D3AkY34tSksfkzIbdSrPmhjM2C
         OKqw==
X-Gm-Message-State: AOJu0YxQbH3AmfFOIq6xpdMm0vx6IiovoWSrH+EogzRxLgkECw4eranO
	UcO7P1ELHDVOgUTkM/69lOZURJvULZ+G/vM2dAWfF/tmFvKMej8oPrX8QKNc
X-Google-Smtp-Source: AGHT+IHbJsLjYzDLlWpU7j0vQ/nwiKNsDT32MU/oUmod+W2pI0q0762mplA9mvyvtD6u7TIWEe/9XQ==
X-Received: by 2002:a17:906:46cb:b0:a3c:660:6a52 with SMTP id k11-20020a17090646cb00b00a3c06606a52mr546418ejs.51.1707487800736;
        Fri, 09 Feb 2024 06:10:00 -0800 (PST)
Received: from elitebook.emea.nsn-net.net (178-36-244-127.dynamic.inetia.pl. [178.36.244.127])
        by smtp.gmail.com with ESMTPSA id st11-20020a170907c08b00b00a3843b13729sm794039ejc.35.2024.02.09.06.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 06:10:00 -0800 (PST)
From: Michal Sieron <michalwsieron@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH] sanity.bbclass: raise_sanity_error if /tmp is noexec
Date: Fri,  9 Feb 2024 15:09:39 +0100
Message-ID: <20240209140939.186588-1-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195215

meson saves its temporary scripts in /tmp.
Similarly some recipies also do that (e.g. ccan in sbsigntool).

As this can lead to unexpected build failures with no simple way
to workaround, make such setup a fatal error.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/classes-global/sanity.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1bd74e1935..205516bf6a 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -840,6 +840,21 @@ def check_sanity_everybuild(status, d):
         status.addresult("Please use a umask which allows a+rx and u+rwx\n")
     os.umask(omask)
 
+    # Ensure /tmp is NOT mounted with noexec
+    with open("/proc/mounts", "r") as f:
+        for line in f:
+            # format is described in fstab(5)
+            _, fs_file, _, fs_mntops, *_ = line.split()
+
+            # we only want to check /tmp
+            if fs_file != "/tmp":
+                continue
+
+            # iterate through the options from the end
+            for opt in reversed(fs_mntops.split(",")):
+                if opt == "noexec":
+                    raise_sanity_error("/tmp shouldn't be mounted with noexec.", d)
+
     if d.getVar('TARGET_ARCH') == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
-- 
2.43.0


