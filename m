Return-Path: <stephensportia@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD748C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 07:35:25 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.7431.1651217724996575276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 00:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ef5eKD0T;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: stephensportia@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 bd19-20020a17090b0b9300b001d98af6dcd1so9800975pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CV6hnm7nUDaVSxGU047Noh33uKLEWU3yUkteGOR0p/0=;
        b=Ef5eKD0Tkzmu70Cj9jYeary2KPTQ+FGiTFJHmhLbS0r3a9r6Coxj+qgnyGfFgXu8eY
         nCIBqF8hdkeohpqh4zmLpGyZOgDFDvAvnAgvnhds5lcR7rz2GCGf6RTFEmUi1sKJgQFF
         DEHj3DQDpRHq+YZ8ucWNFYee14mObeAimnzvZW8KQNehpntRIYJuxo69r4whXhR+uQMs
         IDXKeyYNZxgsUFlP/Rul91qmrDnqXHpXWvdC1CgepYO1eZwDWQNdJpjW0l39ziEVxfqW
         WqJSL5B1SKcoeQ6UvdjOx5jRRnquag2XBzafzbO9Zi8BQVhkDh0FmJXkKNKxQTFEBkYb
         l40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CV6hnm7nUDaVSxGU047Noh33uKLEWU3yUkteGOR0p/0=;
        b=O+9RM+kOe4ejNTznI4K7rRfF/M3/dj4OJ6smgH++/UNMkKundHnBbvUQfkUWXElG2M
         yk7z/ZyLUeQcOBkFV255XQb49SSDaVmQD0QhNZZ/7U2bXVz3JOPH4A/oPiA96GOxTxvx
         BE0H8YaEgcBd7YN2iZGuq17lzL7tA/6SgcoCV4UyTDnltbrOg40JyCnHLdhH7QP05e0o
         ynch035BcQR2P09ulWkza0NhwpgJsZxZBu6wCi5c7KI9fCvC89VUjzS7VPQxkGLNHYe3
         LMB6n7U1vRP+sOozbIJ641KuD6qTHv05zTXr4fZ/4Ch9a5KTU7yFIsi3KlseBGkW7FtA
         UA3Q==
X-Gm-Message-State: AOAM533QEqEAQlzfDRs/gmluRolRnv6ETu7LvMNC4YcuRnSJSKO1JI6D
	pvCc3Q2i0VzoXSCLnM3IfnmX9fQqQjU=
X-Google-Smtp-Source: 
 ABdhPJxo9xxMCnx5WA8MAbgFrCq018k9ZhM32b4aeSW7KJOtX1EyNfgBdW+FcYwop6EVcbzv4f1hgg==
X-Received: by 2002:a17:90b:3650:b0:1ca:a667:b17c with SMTP id
 nh16-20020a17090b365000b001caa667b17cmr2451907pjb.180.1651217724206;
        Fri, 29 Apr 2022 00:35:24 -0700 (PDT)
Received: from fembot.alistair23.me
 (2403-580b-97e8--28bc-2181-11ae-b80.ip6.aussiebb.net.
 [2403:580b:97e8:0:28bc:2181:11ae:b80])
        by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm1940490pfb.184.2022.04.29.00.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 00:35:23 -0700 (PDT)
From: Portia <stephensportia@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Portia <stephensportia@gmail.com>
Subject: [PATCH 2/2] volatile-binds: Remove TimeoutSec and allow
 DefaultTimeoutSec to be used
Date: Fri, 29 Apr 2022 17:34:40 +1000
Message-Id: <20220429073440.136829-2-stephensportia@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429073440.136829-1-stephensportia@gmail.com>
References: <20220429073440.136829-1-stephensportia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 07:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164998

Remove setting TimeoutSec and allow the DefaultTimeSec to be set for the
volatile-binds services.

Signed-off-by: Portia Stephens <stephensportia@gmail.com>
---
 meta/recipes-core/volatile-binds/files/volatile-binds.service.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index 8fe7d8d4f9..52384c8264 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -10,7 +10,6 @@ ConditionPathIsReadWrite=!@where@
 [Service]
 Type=oneshot
 RemainAfterExit=Yes
-TimeoutSec=0
 Environment=MOUNT_COPYBIND_AVOID_OVERLAYFS=@avoid_overlayfs@
 ExecStart=/sbin/mount-copybind @what@ @where@
 ExecStop=/bin/umount @where@
-- 
2.25.1


