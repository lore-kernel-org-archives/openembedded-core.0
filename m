Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DB2EB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:38 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.94030.1691961570365240132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xTqYB0S4;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-56ca9a337caso2396544eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961569; x=1692566369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xm82rfetiK3CeESt2UM0aIrjwOvhInQifKNcULQ3RS0=;
        b=xTqYB0S4F96PGmdjCUX+Zvqpj/NPTqXKZxEmtPluPAOcuCATLJLgrQzzb5rMNvvOBS
         GsIlkY0e5mhN+hmytX/CS9p1VW6ZSnOynnNCVOFSlgZ9zh7Bty2Sp7aR1H0ow3+Tj7KF
         KIaq5bIgSkmb2QPkVqKsxlescmCHagMXv8u7LKk2EgjZIqQ0xtk0fF4qULp0tiEdej9Z
         ADSimcKfftJf771vXx06TUg964QPi5mylNVfNl1urhZhr0M0iD+3yqpmdtpYMaxe6JmJ
         Pkx/XD6NzWtR0N8fJ54s9c3dA+HMs8lKk6oIMCB/IBlpzGDnDXuFmEp7u71vqcNCfSYM
         siNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961569; x=1692566369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm82rfetiK3CeESt2UM0aIrjwOvhInQifKNcULQ3RS0=;
        b=Ta5Hgoi+Tw5xOpks8tBv2HpwgetRfJ1XvZRKzajmFx9mH/hnkSEDAruwddMaWUw2tv
         tdHJ8rPt+Zlbv9YlC3QaXlvzRoQBzRpXKrAA7FeWjeCriBldRlcVgeWjT8vtsgkSvnmv
         8JKhGgOSdlmCsQAp6QtLbkh2I9/5q3PZecnRShaBJ6j7rZwXudoGQaiMg5MCHhNOhive
         BiG7deXmjmTSEBuFrfPCWiIF8grn+2akxVLzEfDBdHr4bHyf3oxWoqn+qMiRD06im+a+
         RoC0zBh34HVk7zuG92+dQMZjGgJfzK4vrUayPloDosee7djEWDoVHXZgKYtApUEUUaC1
         +fVg==
X-Gm-Message-State: AOJu0YworZrXOAVv+tD2rj5ePa9U/8StVkZgdDxHdA0GyeQFxUwaKqN5
	KN6IRG9shy/SCZXHlxH+6A85RiOZ3QJ1eshN4rlL1A==
X-Google-Smtp-Source: AGHT+IE6AgSan62Iy0GD0pTmb5Nxcu3so5bsrI/3Q+Y3pW8jgINr41D1bizP0dYtOk7CVc1XuPynxA==
X-Received: by 2002:a05:6870:4593:b0:1b0:2ded:bd7 with SMTP id y19-20020a056870459300b001b02ded0bd7mr7424618oao.26.1691961569383;
        Sun, 13 Aug 2023 14:19:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/22] systemd-systemctl: fix errors in instance name expansion
Date: Sun, 13 Aug 2023 11:18:27 -1000
Message-Id: <682e094e6af67e67873f7f08dd8d52b40fcdbded.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185912

From: Yuta Hayama <hayama@lineo.co.jp>

If the instance name indicated by %i begins with a number, the meaning of the
replacement string "\\1{}".format(instance) is ambiguous.

To indicate group number 1 regardless of the instance name, use "\g<1>".

(From OE-Core rev: d18b939fb08b37380ce95934da38e6522392621c)

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index b890bdd6f0..e003c860e3 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -189,7 +189,7 @@ class SystemdUnit():
         try:
             for dependent in config.get('Install', prop):
                 # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
+                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.34.1


