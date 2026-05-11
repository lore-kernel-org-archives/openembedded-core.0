Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14754CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:25:25 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60223.1778531120118990810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 13:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qbet21Oz;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51306c9f2a8so49776451cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531119; x=1779135919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmWRxnRz9kpHt3gnhVmXZMkI9fgnRyhzcKAJEqpJn1U=;
        b=Qbet21Ozws/960U8K9rXsme0aFxmFzwRVUs261nHvFs5y2txmEDMdnDvSYA1NU4QU8
         ZaL6VUD9TZGz2zr+IPUEKt6hrqsMVtC4+AxD7D8GIS2OfSkYbsl5NDlyazi4N4zG0Cdj
         UTnsQm5k6XF/YepLAAuv/VXVI6SIu8ORA+W2UCs1c37Fgxbm/z7d93Ly2ZMSo3JMu+mq
         ut0V1HCWLjrllTqoMfkcAX+NS8akfbx1/EfeEy9GyfBdEeX7tg+FpFFuVBctESjRAotR
         JOl03sfj5JbHWul1jxlCYF6JNAbzybXqDSJo6rE84VGJw2uvNS8ZWI9W68+YGKsIKoG5
         DkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531119; x=1779135919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWRxnRz9kpHt3gnhVmXZMkI9fgnRyhzcKAJEqpJn1U=;
        b=W77xcxhFQyehTpNc2pJbYusL5CmHE/NoTZCCwXnw9dOaPJ9RQyXptBBATAXQ2PutSO
         2Rr7AoBgs7mYxf6KtKP7HrNieQT/B/D5spduieq4Kj34af/QkLXDjaliOFRpp0x/Zxny
         wHlyfkdmeYKvlCk7wBcG2+5ICYlRMyFWmAKUhF8UuIFUnY4qUTobGENSsED9J6Z66ybw
         7CmAmp59Li1wlA/iPc0Qi1UG35pDQWoHWSJ7LTPBICMVR/YYbgj/ADw93xNtBUpTLBD/
         Zv4V0Fe5hJoAYC8ZPMiyPEzDgN8uulDg5AQeRo3h3h+X7LpMFcNNvyyviuOYAkgpqdf8
         nXVg==
X-Gm-Message-State: AOJu0YxtBNCexjJTAW1037hR5wC8yp0pRKFCAag8tZcjz5/apduQ0hSd
	/hxlOodpL1HxF2HvntNlmbS13bw+0op09iiN2tLm64XnfFrg/qz57rvC
X-Gm-Gg: Acq92OH9kqx7hLQf85UF2BQqIyEXyn8Af0ET8fxMJrf+wmLeAEwDt30l6N89XG6iN8G
	G1V5UbKQesqRvN5G5l0x4BPbhtmDZu+obQoMm+pKcxSIddq2TU7ekn3Jgk1mslTs1gwr/3LiwOY
	sCy1Tk3lvhXLETMa/HYGRdA5usWmZKhjXeAsNnI4T8QZSw7yq0zv25PY3BpkyZ7mYYaGr9iubGu
	Lc50r60fb5JNI8C6qBG8Z4rVkR4TpyAd0UeWK0e12WGLA8oq9PdPQcfunBriChYeGCMAmdX+JQ5
	4lcGcmna342inwz8tDupD+O94pl96kPSTFeR120+OULeWA6bBK2YSpUEFYVx4AsitP/ZzIyZ3YT
	U6RgOie1rjRlC22cdbgU3gRGGSfNt8LQdXKBEWGuiZqpzf/MTiImP/wTb4GmEkl0FHYuhnr/mb9
	dCKWHt1rQyIGQzcS24tJOzIH42Mo/nNkvp7K5uA/y4x50XymZDaEMwo+yEPGdVn52gb9JVyN2Oh
	QUyLVl3kRms8hOr6PJdAcIRNFeIxYXVU9L2G55kHmxp3/qDNrRet7/lXLA=
X-Received: by 2002:a05:622a:487:b0:509:379b:d4e with SMTP id d75a77b69052e-5148e94d952mr218936661cf.32.1778531119032;
        Mon, 11 May 2026 13:25:19 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm98213401cf.28.2026.05.11.13.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:25:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] linux-yocto / yocto-bsps: -stable updates
Date: Mon, 11 May 2026 16:25:07 -0400
Message-ID: <20260511202517.1648910-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236825

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Here's the latest 6.18 -stable bumps.

I'm about to move -dev to 7.1, 7.0 won't get any more updates
in -dev unless someone wants it (and let me know if you do)

Bruce

openembedded-core (6):
  linux-yocto/6.18: update to v6.18.25
  linux-yocto/6.18: update CVE exclusions (6.18.25)
  linux-yocto/6.18: update to v6.18.26
  linux-yocto/6.18: update CVE exclusions (6.18.26)
  linux-yocto/6.18: update to v6.18.28
  linux-yocto/6.18: update CVE exclusions (6.18.28)

meta-yocto (3):
  yocto-bsps: update to v6.18.25
  yocto-bsps: update to v6.18.26
  yocto-bsps: update to v6.18.28

 openembedded-core:
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 1514 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |   24 ++--
 4 files changed, 1522 insertions(+), 28 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

