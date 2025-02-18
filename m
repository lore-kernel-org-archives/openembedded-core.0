Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1B1C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 10:47:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.16648.1739875638552035753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 02:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HkvzEChI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f3913569fso1508397f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 02:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739875636; x=1740480436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oLFIlihGsEfAXqofKtNLe1HYcgF1MoeZeWSfjZ7klY=;
        b=HkvzEChIj1UWNv6ejUls6uSu+PfG7ALciw9HKXoh0dURozjwKAvOdYhkqQqNQ1ddbf
         q8HNcInvHn51Hvt9sm+rk2EYdOdyYgeAPegnxKMLkDgGU0KFBID2VtIZuSBxqsQEMkrz
         GkOscuNGCHKkfBJBg0Gm5nF7ilPRAcU+FQ1iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739875636; x=1740480436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oLFIlihGsEfAXqofKtNLe1HYcgF1MoeZeWSfjZ7klY=;
        b=KG7g2+fHAhQfbY+scMVGHreq6UtkSaMB9qy+k+4Mk1dtBdwi7rqPZ3MjlVCSZPTaBA
         p/o/ge2QzmEewHfF6CNSN4DsbEhLonJxXzIWeq1R+VYXfVn2iDMbiO98fPnuvXLK1N0D
         bP8YjXnGNjNc/9Xr+mUVrF4Lj4U7yUmTBBTvhhpe5KdKEL/Rw/WRc95iEb3vPh0ZHHwL
         odAvltjoHbl/exVLUJxfQ20kv56Aj/BNj9+upGDpefufFNcKZ2cTy/mqfT0iKO++Ad1P
         fNyLXbRNOi7jJWDh9a/6wjzebn2q4Gjf8wegsPsfqeQuXfmbf13ElWCNxCbU6HxjANT0
         PWEA==
X-Gm-Message-State: AOJu0Yy1l459Xd9X1HpXDEayA2N/YwU4DwUREhNLyIkBOU11+3Vthpll
	CEV3qFJLyNTNjNU4pvijLJ0hetjkLDv3U9R+9pgabahj3CyW/YzSlBuCxfnTHTIqXbp8wvA5iTy
	X
X-Gm-Gg: ASbGncuFEvvpXwq+cnokObzUH1tKEyzmF8ViEE5+nI+1sZlKiM1wbLxzMNl4jSguqp+
	I88Uk3NJyL7egTDzVrv6xrMy07pGjRUSjB+qI7GpAW5Xhz1ebTNqjWwSdPeRrC0ZRMGL3NVsrvJ
	dNujwNttUmRDe/Nxy3N8wUE4Ss4B+vZvRNiaO/yml6AT9pdg0XxZtb44bT7EowRDMe4TKrddGd0
	dXxOUtrT0u/XohBnlu1TrG6VnpeH3bPWhdhx6f+LukQ5/KEWKQWCE/vCLWBRY3me6OEdlkVj63a
	PXy/mrJR0HrdKmoIrPX9CIUPyYrq+P/2MaSOoZpwLA==
X-Google-Smtp-Source: AGHT+IFDg6lNyD4KfkOxMDdFYBqXiyJ1zn2l9nifo1A4W9SOFKjYGUDSsugCMjGIRe8jtFmPGncpFw==
X-Received: by 2002:a05:6000:4024:b0:38d:afc8:954e with SMTP id ffacd0b85a97d-38f24cfa3dbmr24274178f8f.11.1739875636236;
        Tue, 18 Feb 2025 02:47:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b432asm14364490f8f.6.2025.02.18.02.47.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:47:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oeqa/qemurunner: Convert from ifconfig to use ip
Date: Tue, 18 Feb 2025 10:47:11 +0000
Message-ID: <20250218104712.1362661-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218104712.1362661-1-richard.purdie@linuxfoundation.org>
References: <20250218104712.1362661-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 10:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211602

ifconfig is obsolete and being removed, convert to use ip instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6cab9aa6b20..04e03349140 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -534,7 +534,7 @@ class QemuRunner:
                 self.logger.debug("Logged in as %s in serial console" % self.boot_patterns['send_login_user'].replace("\n", ""))
                 if netconf:
                     # configure guest networking
-                    cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
+                    cmd = "ip addr add %s/%s dev eth0\nip link set dev eth0 up\n" % (self.ip, self.netmask)
                     output = self.run_serial(cmd, raw=True)[1]
                     if re.search(r"root@[a-zA-Z0-9\-]+:~#", output):
                         self.logger.debug("configured ip address %s", self.ip)

