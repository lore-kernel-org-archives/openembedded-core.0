Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3349D6C60B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 10:24:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b11so3989059wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Uo/2wOsH4+725yObSoq5CsYt8v102zxY9pn2P33tLDo=;
	b=bhWM8gWTIjsufa+NJu/CZ00thQ9+tvwKrEe5Zii2u1PDmh8nza98787HqKaQOjFOMq
	piGKN6VzSm04hd/wzILGhorlmnmuTZz7CTMzkAfyx+5bexvUP2iMvGDkB1vN1G+Jdzdn
	cJjA+5ngjDcj6fQ81sa4MEFUMKqkyZ9xUQNC+EQpIXDDgurgrVIwcf/j6wXWgEnzi4lr
	+B+Wl6TPs4jSZykbI4Sw0/dUIUBg3bkLpO1cGaOtjLmS+tkm8t/vP5+Aj/6FMYHesCdl
	mS9N1KtuTIJuDy5Yxx/84aooVKx9RRGpymqBnD2jLLAyNtbgmA+EJ0+fGG7xfAszL6b4
	rxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Uo/2wOsH4+725yObSoq5CsYt8v102zxY9pn2P33tLDo=;
	b=EeECywLKl7jiuyWv1c446M/nh3ueVHrWf87xt6rfSgiXl1X1b78UCtnXrL8BnfNxN8
	x3ea6tsNTPAyDtGilokDBKvMdSC7JcdIMM9EchPgWvIZtNiGVUklzVqMEMBGa29GP1Q8
	vO2Mca5Li4wxKQS8zvZZjZESBVHF/mSt7w1mW8WK3RW7n69oI+maFCl0Ghddlg16WN/r
	l/f6alwEKfonPsyvitbUk25ZbkDTx8HHT9xa9OmWN8BR/gLpwf+ki5HVvf8MhmWEvxgD
	ECS4ZgiDwStMVgblbG7jv73jolI5Fjjwr1nuZKqLz6Dweuzh+ykwdpvo9GppMXZ7UiLl
	knQQ==
X-Gm-Message-State: AJcUukeVWR0J925YCRvhaAhx03MJvXbriE05eaJLuB+oaSy8L4Say7gc
	AcQts7kKrdXVF4rZq5dKC0bRvcU+
X-Google-Smtp-Source: ALg8bN6E0oSnYHqmofXyEwbfx8P9yJxlWXu3gt8yKINmFi5eZfJ4uCz4jAUa/oHQdjk7pP6bm9ZUNw==
X-Received: by 2002:a1c:2d42:: with SMTP id t63mr15775980wmt.9.1547807056637; 
	Fri, 18 Jan 2019 02:24:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t199sm26245894wmt.1.2019.01.18.02.24.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 02:24:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 11:24:03 +0100
Message-Id: <20190118102403.109744-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sstate.bbclass: make sure changes to SSTATE_SCAN_FILES are not ignored
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
X-List-Received-Date: Fri, 18 Jan 2019 10:24:16 -0000

When changing the SSTATE_SCAN_FILES variable in a recipe it doesn't cause a rebuild,
so if there's a sstate-cache available with "bad" sstate data in it that will still
be used even though the recipe is updated to address this.

[YOCTO #13144]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 763fce07f95..571a9d0dc5d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -62,6 +62,7 @@ SSTATE_ARCHS = " \
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATECREATEFUNCS = "sstate_hardcode_path"
+SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS = ""
 SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
-- 
2.17.1


