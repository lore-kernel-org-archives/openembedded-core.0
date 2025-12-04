Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455F0D1F9C8
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:31:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41209.1764847879811260735
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=llwjYlP3;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632d9326so5744865e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 03:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764847878; x=1765452678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijzFzvIOTzYNLrrv+D1BO0Ab1J/Zt0A7l7GsSGDJq8I=;
        b=llwjYlP3IhRCle7XfZhMP6vU8qZOLqV1vrK8ilHAt5bSlM5l+Hrz/l6cmMitfcgp6/
         HvHGT2lHJZYSvnQdRBW1X8+YXr2wOi784ZgV94z6G91pPV+RB84DQjhhY11qwpcgkxWw
         umKSPYW7fN4LXGeFDcHIc4wBarUg0ms/XzYvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847878; x=1765452678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijzFzvIOTzYNLrrv+D1BO0Ab1J/Zt0A7l7GsSGDJq8I=;
        b=rB8xbD4Ocfw3TYSjEDSUxL4x+7ghK/LQy75ZEijjJgnR1Q13jMuEgggnQSxchgTxqQ
         lZgtlA1aE0Wf+dBnpR1StXlvUGY390D5dW5dI2Jbbkz+7mUevQq+KrmXdDZ7kATSMqgi
         ZFHS145NFBK0KZFgMFMxS7V9zCx4Uyn1zJmo2Ld+8bz9GNB/KyRpT5FnWnOc/36I7aKS
         W7JIM8Tim7o/fZ6jpti86+tmbIaYdZ7EzXGrShWprCXshywPFk7klRoAfmpFIiuhpHrX
         RT2DPpaKqajHwvED5tuB2a4fR81FdJuAPy5Bt1ocr9TjXzz/cb3Lv4S6GEG/84ozsteF
         A5IQ==
X-Gm-Message-State: AOJu0Yyu1Ax/NQchoY+6AKBljZ0QhLDZuTg15kGHJtlkL/RRQAMT0AbR
	jB6XDAwNbdrdJ87xhAHMTqa24vD+VKKxLpSxjgdSYpc+AuFgv2jKD1yh7Pa0uNLkevpnPXYcflT
	NEQ81
X-Gm-Gg: ASbGncvAtrte8Uc0v1e51zBODgzgnX7a/sUXNAq97GS3Nnquf0Y3KkR2AfpnWMOfjnF
	qz7q6bd0Ht8XN29ugryByfZPnoKAfA9RPnn/2SrLwUZpXF5ievJ6TgkJK00aSxpgGc/qziWWbD2
	Qk233HXMCuLft4oDktbU2tjs5VvQLJkKDO+A7T8MZCi/XuHkf8Ufe9Uo5KPYDDkSFd7tPPSkgmr
	akpFrLVR72L4yMhRYfWgjhoQcwo9ELnGnDI8iJ7xBmxwnk9dJcYUmX20YPh6eAGVNjH3U5h+R21
	JtpBrxo2Jg4iO05qy2y/jmDbHhP6OlYUc3XF+u9Os8Dr3OLC+80QAcLQvPDnj+5n/eGTZiMFGGN
	KaLn5KVi80+rJOsgiqNjShpjDo17+ZPJWYakGOg7cfyoHFwEJYSKI7S01YLGSfLDCm89FpXSzIr
	n6BAik47gb/xEMJfRSNy6qaWwzoIqv+YsR9UskqvHqEo8R70Zs9FmkumF1HLz0TavQP93/YEmVx
	wUUENNbqP0nfGw=
X-Google-Smtp-Source: AGHT+IH7JNkwfhJkav3Pyhm4bkFkkigSEXIDSdw8s4INdO8SXSizdACkUAuusGixQW2qpENcmla+pA==
X-Received: by 2002:a05:600c:4615:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-4792af3d3b7mr32523565e9.28.1764847877909;
        Thu, 04 Dec 2025 03:31:17 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm29385885e9.0.2025.12.04.03.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:31:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH v2 2/5] kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation
Date: Thu,  4 Dec 2025 12:30:55 +0100
Message-ID: <20251204113058.948115-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204113058.948115-1-yoann.congal@smile.fr>
References: <20251204113058.948115-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 11:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227283

From: Yoann Congal <yoann.congal@smile.fr>

Publish artifacts from kernel compilation to allow out-of-tree Rust
compilation:
* scripts/target.json: target definition: architecture, ABI, compiler
  options, ...
* rust/: the crates compiled by the kernel available to
  out-of-tree-modules

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2:
* indentation spaces -> tabs
---
 meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 32d8fc78686..9b12a8b58f1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -632,6 +632,24 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
 
+	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "false", d)}; then
+		# Copy target.json file needed for out-of-tree rust modules
+		if [ -e scripts/target.json ]; then
+			bbnote "Copying scripts/target.json"
+			mkdir -p ${kerneldir}/scripts
+			cp scripts/target.json ${kerneldir}/scripts
+		else
+			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+
+		# Copy rust/ needed by out-of-tree module (firstly for the core rust crate)
+		if [ -e rust/ ]; then
+			bbnote "Copying rust/"
+			cp -r rust ${kerneldir}/
+		else
+			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware

