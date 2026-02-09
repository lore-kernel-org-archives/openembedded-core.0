Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E947DE9461E
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 23:04:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7948.1770678244297483057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 15:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=guEMsdAn;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48069a48629so46587435e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678242; x=1771283042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6cPBqEHzubackgt/IxRufw5yRSp+yRM4xqtOE5HmqE=;
        b=guEMsdAnaHIMaVnaEvTw/uSpK2cYGXzVjQFXbdRN9U9/DhaGJabhBX2O0z0t8QSZXt
         9zlCtEtcrdtIowucTEfGcYLFokUJ5nBPwUbVv8PwVIdAgOWsynDG5YtqIHGAINKQC/t2
         9YcUsNBF5zb/luqsfdaqiRgJARrs37AInQyImb0btTcRUNGSsgpuI5pDKMg0PRPdTFxx
         LD0JsLbbB05Rbs7Xf8OxFyV0emoXbAO/CerCYijuJcQDA+KnvSrgJPixaBICpNbJsqiN
         TlZKDfCdfbY3HKdvSb7UnZB/mrqISpTb+/wai3WAFqVzxugs9UrKVcmf3Kw1ZycWLliX
         UmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678242; x=1771283042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6cPBqEHzubackgt/IxRufw5yRSp+yRM4xqtOE5HmqE=;
        b=iLojsraMr3sXcSwlMz+A1hkGrpkUYIE4Z+l9z4ue9W2p8ARG1SHhy0K27q5PzLvP8F
         cWGkJAiopEpk5gObxJtmtLh+H6IUyftnrO6uhIQiWNgAcG06ji0++pegObO8LcZbMObH
         nGtypzIdY1fGehmnDxz2zh0LSzuanFbdFtYf1Wr5UA9cUta341/Ezltf94tJWWD9E7CD
         YL0LG9qAEkAP9TmT/MGu+mW0ah6mbYD767TENUhn4ROg7/6TXYBIbfwE63VnC5g4e746
         upPtQMe2i7xRgyi4iUccUdBvTPlfdEuzirZOIPlqYjOzVF76p7/QiOsaQX0Uk5kbS42C
         0QSw==
X-Gm-Message-State: AOJu0YxFqcS8xclmuqRbH2IBUBXOAB0153IwELC4S6f7Vjiqr6+9Zokm
	KyWVryGkao1pNIlgHsQgDgZrP4f4yfbet3Fc9zrOfZm0bngYuCoG3lxA
X-Gm-Gg: AZuq6aIfj4t2NJO2sIYbc3VklQQehMf6WSFwNl1o6pryUStyctLxhpYweO6Pp/dLDcI
	Q23sHp4FwBDMhbt/VSOaILEepdJD0qkUZShpgnT0pidvyqrm7kX7JYy06eDxkdLIix8vfVJicUD
	cZQ2QN0wf5PjlkYsMFizpZ+WXQESnUoVrKQvtu7ZqhaRDNo/BPoSJ1lRvmXlRQsXgULgJKmIS5W
	u5P59xYa5/vQwMPrYA71FZ8T+fjmWAbpMot2zNbH+dsULgCNXeiGgADZZKd/jFZ3T+EiCr5t1SM
	dB2c43ta9hxZ4hydHRKLfusj2UAjvlejPfApJOuh4ZGBc9gvZ4NZL3AslxDKlaCy4mFt72SUIBU
	MzoAbRJybo01RI/C3aCdjfUTitNVFG1qKyb5M9dSl2XSWFucrXaRw+CYtT8Mu1fDJWUXoITmFlA
	tklZEHFWz3u49ln2qa5SRMRcy7JlJH90kgG8t66r/T3XNWg6sF7Jb1/Edm6Tizau22Kw==
X-Received: by 2002:a05:600c:190f:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-483507cffc7mr3774805e9.6.1770678242204;
        Mon, 09 Feb 2026 15:04:02 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2ed9sm30480254f8f.5.2026.02.09.15.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:04:01 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: logan.gallois@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-Core][whinlatter][PATCH v2] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Tue, 10 Feb 2026 00:03:59 +0100
Message-ID: <20260209230359.2050-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208144031.3519-1-logan.gallois@gmail.com>
References: <20260208144031.3519-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230820

---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..7bcdeee4c32 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


