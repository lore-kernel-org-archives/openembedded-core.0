Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A1CF47CB4
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:51:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51815.1772736660168985200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 10:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d8/bFC4c;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806bf39419so69369315e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772736658; x=1773341458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XctbdnyZKCKZCiG/4b6SNhK0o2vCPYIS5RmOnIMsHyY=;
        b=d8/bFC4clhMOLBjLYjTLHtW2izBdyqPbYIT0JXjYqQHb/WAaXjC+09RhX4AhAfMLkF
         pDj+nPlvAUPHjThetGuH2rIOPdmiJzCr+SY2ddPzYTn34xuiYPRWu3HTISQYJAqQfWGc
         TEHT/Vhsvp5c62D6KmjRVO1TM6DsVZmSxDbqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736658; x=1773341458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XctbdnyZKCKZCiG/4b6SNhK0o2vCPYIS5RmOnIMsHyY=;
        b=JRy0FmJE8dMcutY3lFrekH8UdhHsD7KbwBJzPrF02jOOutJB1Uav5AS2/RmMcpdF12
         cGUO3Mua6RaN33PScsS9GqNZfETD+hXOsgTchE2J43RUCbJq/g6nmgwWJy0XHLnYqHSw
         PTrqJaLId9pROtgfCpiWoVvFjIJ0hhUPUzXK+VbvVzJGmcOBpIDJWMXx+nHlz7RX0r52
         wGf2L4gI8anfDnXEUqlDGruLyD8FKHhbmkM8HxG/IxwAGvOM0RcW4bfStl/6vEBYt+dn
         ev+C6BVml7EU6IHvOtCQZpZW9myAHC1zk6+bAfULf00nlpKu/BlQZPDlYcYPovPfRdqr
         r1/w==
X-Gm-Message-State: AOJu0Yybp4n/BdowdgmwAX2DCZgpKiIHk/sHunuuJWWsfY0eoEv9u+w9
	jNTszNIMldjHYVCUayC1iGNQ1Qm9fcB01KGI0q4Yxu1mphroV/gUr8hKX7jqo8vZMf6eeEf81WQ
	1PYws
X-Gm-Gg: ATEYQzzMfNWtOPz1qZWW5kuB6R20aseM+Mjq4k5N5M4xL7yag7jbZcaiG1yswhJf1ZB
	t/PW8UiP31GjldUf1s/ymrVxNQ7Mzt675Gb0iX6W/4hA+QbxsURQdLIUISDY+jlY3RhN4pjFpou
	SfD3IJBZtwj4Wf1LixNYujvBhKfJJaAOoawimBI0ZpOYBtopAHfOyPMQbf9cQZmRBjzrGApqZtd
	Odqs8At/z2w4HLBHHs7/QRJYfBY1GaN9QUqEP37gswo8rb5g4Tcp/FwuRdmWxf2rgqRvFjOfdrm
	FHYoQY1jd9EZC2PSiIeC2X9FlCxOdQknyGePGYyFSrjVmATcF4zvpEfjc3h83pDBnYmUp8h9sT5
	gIROfe0EZMibohx3U7/dGHjQtZNGgpBcghbUaXmGEarDPdCsXKMkb3tGtSzguV6DMtd9h3VrtS3
	5E7nxE0kRnUvS60HBPeeeClxG1si1kezJE8ITWKDv6i8WwKrHYXhLL9gwrZFHOkhLkqLR9IwjNx
	QjhNfsqMleI6J0lwlpMS11+jO2k
X-Received: by 2002:a05:600c:8b6c:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-4851ee7b559mr61219065e9.1.1772736658263;
        Thu, 05 Mar 2026 10:50:58 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae473bsm48164595e9.7.2026.03.05.10.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:50:57 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] README: add global note about C locale sorting
Date: Thu,  5 Mar 2026 19:50:19 +0100
Message-ID: <20260305185018.1545386-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305185018.1545386-2-yoann.congal@smile.fr>
References: <20260305185018.1545386-2-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232508

From: Yoann Congal <yoann.congal@smile.fr>

Other locale might have different order for the "-" character and lead
to unstable sorting.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 7187fb94be..4804e43632 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -18,6 +18,10 @@ Contributing
 Please refer to our contributor guide here: <https://docs.yoctoproject.org/dev/contributor-guide/>
 for full details on how to submit changes.
 
+For any files containing sorted lists (such as recipe maintainers), please ensure
+alphabetical order is maintained using the C locale. For example, use:
+`LC_ALL=C sort` to sort the list.
+
 As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
 The git command to do that would be:
 

