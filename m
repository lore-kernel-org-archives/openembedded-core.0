Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 581D6606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:37:31 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f93so638830lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=W5+IbqXXkGh1mJ//bbzPA0MPU8BGTszTgwqyxCl2bYM=;
	b=zEUrjeL3i+Ovr0zIsiF8Ays9gDTmM6onr0a7rg/6OExTEeL3+9yltvR8elKQ90vqdP
	IiINaxaX/SeSrxMEFa7EqMMF8Hr5o5micmgS8wmWW67AwMQ5nmclWLKwN/MvNiR/DYRr
	6xGhrxrMFhfAIhfllhL9x+KvX6Mg9jCnlr9bUMq8GR99wl9geFsdri/PVfYHwUP0DPmP
	9qQwmj3qFMR4V9DZSLZV34YKT86QPNPTZLmvsaGjr7QakPFLsnZJrmttp6fKMVfluQJq
	740BcBGWvDrSEK3VGoqApxF6ZxFOp0Ini0aXA/hWEx2E4c/4DOXbEDjZLUklcTNVVmZq
	RkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W5+IbqXXkGh1mJ//bbzPA0MPU8BGTszTgwqyxCl2bYM=;
	b=P7/QwBUq5MrX0htrKQHH9vXD6VFlBE84KqfV8zdLOL4wBmEtyL+fgxPHGbhhUVPUWp
	jNXdEFwIhhzf/jgnbaDUTuZ5cjysuDwkmuiA5xSzs6ZEwDUkSRomZUyKyGQTqS+ccj8W
	qPwOkRWelEVmvQT7oghO9JEzRJH2sdWn/GOLp8tMXTosYQxPiPiyS08wMCuGKdTLFAsg
	8JvtUZxP7MF44hL78PpLUVTiT5G+W7NBVaSz8DC/Pn6D4Huq8QJ+aVKXSgQ/IAyZlpW9
	hEX3T3GD1N2lvVsD4mazJZoEKmxUlbWr/P5m+EXQ4ruM4uFjyH3WIxwnvqFbjjP8cokZ
	XYNA==
X-Gm-Message-State: ALyK8tLbierKjgnj4enWzCNanvCxIQgzF4/YxrA3eVbjBn0zrhQKDargEdBfRmbjOTCpkQ==
X-Received: by 10.46.71.18 with SMTP id u18mr810785lja.20.1468323451860;
	Tue, 12 Jul 2016 04:37:31 -0700 (PDT)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	q123sm5797501lfq.42.2016.07.12.04.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 04:37:31 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 13:37:25 +0200
Message-Id: <f797bf73d4af0da787c3bb8dd296fe03bdd16afb.1468322776.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] wic: mountpoint is an optional argument
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
X-List-Received-Date: Tue, 12 Jul 2016 11:37:33 -0000

According to wic documentation partition mount point is an optional
argument. Skipping mount point also makes sense in certain
configurations when one needs to specify a partition that is not mounted
by the running system, such as a recovery or a mirror partition (in dual
rootfs setups).

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/ksparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 6887a7d02441165d7696318ddd132c739c8121b3..0894e2b199a299fbbed272f2e1c95e9d692e3ab1 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -124,7 +124,7 @@ class KickStart():
         subparsers = parser.add_subparsers()
 
         part = subparsers.add_parser('part')
-        part.add_argument('mountpoint')
+        part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
         part.add_argument("--extra-space", type=sizetype, default=10*1024)
-- 
2.5.0


