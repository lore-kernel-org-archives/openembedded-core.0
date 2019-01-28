Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1887C5B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 20:58:52 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id q2-v6so15521289lji.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AtliUhCX55BBDU96oy0X746xUjPsxgrIDviOrnIWeCY=;
	b=BsuWval2EPy601gbM8/9ddLYj6zQpX8ZFXuKm4HsMAK4a8gKB7On1eje7ZAXA1C2Nx
	E+bRMYLF8sWOTK5fAgHMVqw3ZIuApCQ/q6nnsQll+E9Nr5SSpG9V3rFDKDqLXl++xkHa
	FcuKmB+U8l4wZywzmgT4dihuSle2+mc7rMhG1ujcLgu4K5mKZ8Bn5hfCNGVKOPkb27Iv
	5yJ7qqNviuIKlDBXRGwPw5eYwncrsKRlK43kI0J26v3ce4PVfZt342zCQMoyFYfGanSi
	td0k3WFuCzmkCf5bc9nlCnJMdfl+xgwybhwRh9OuvuoHzfjrzcHI18PQqZme6YGzJX+K
	lpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AtliUhCX55BBDU96oy0X746xUjPsxgrIDviOrnIWeCY=;
	b=GfmbY8FI1OokcGKSJZ98V9U3CELkprpT4/Fp6vlZV6l1YtwTEM5o3KZEG9eU7S+vRk
	AFEEjie/Cl9Cz5adL6qYSll5YtwYuqEOmYepPAUSNyczppYRqEy3k2msVf0TatFPOykr
	zf+OQFoX9na2riw4RwQ8fEDzWTxab/HtMnIZvZFe3CpHIPl/Nqs08yRdGplxYL9ixZPL
	k6yLL8wuM62zCdLUQhgoRCZd7zxqKFsp/27wAdMySMAwPqnhQBKSI+IjTRgg+YbUnBp1
	jYafLJFZN4AIPhZYC/I9YIlz33iwSjL3lEW/smh10mHb1Jer9WE2S5t+ub92uZ79lKh6
	uxvg==
X-Gm-Message-State: AJcUukdYAOB5Kc9gWcDUUcvT+Z8yUr4xp/Yuh2wQwz4PBDnOxY7KlRUA
	Ja4ERajzISFHSI7OBIPUk+oqF5wcVdo=
X-Google-Smtp-Source: ALg8bN5hK+gxz9aK03ahLFjirNdKhKX3uduPIvRnuwRfvqtQCq58+DmKaM6NbEp53DSgYe65qfOLMg==
X-Received: by 2002:a2e:7d15:: with SMTP id
	y21-v6mr17860250ljc.77.1548709132746; 
	Mon, 28 Jan 2019 12:58:52 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id w9sm3142340lfc.66.2019.01.28.12.58.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 12:58:52 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 21:58:43 +0100
Message-Id: <20190128205848.12834-2-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128205848.12834-1-jonas@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v4 1/6] systemd: don't build firstboot by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 20:58:53 -0000
Content-Transfer-Encoding: 8bit

The firstboot service prompts the user for information about the host at
first boot.  Systemd determines whether or not a boot is a "first boot"
by the existence of the file /etc/machine-id.  Since oe-core always
includes this file (it is part of the systemd package), the firstboot
service never runs so this service is being built but never run.

A follow-up patch to this one will remove the machine-id from the
systemd build and allow it to be created automatically by systemd at
"first boot".  With that patch, we don't want the firstboot service to
suddenly start being invoked and presenting a prompt to the user.

With this patch, the firstboot service becomes a PACKAGECONFIG option
that the user must actively select.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/recipes-core/systemd/systemd_239.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 7efc1e5828..5a8d6ec2b5 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -87,7 +87,6 @@ PACKAGECONFIG ??= " \
     acl \
     backlight \
     binfmt \
-    firstboot \
     gshadow \
     hibernate \
     hostnamed \
-- 
2.19.1


