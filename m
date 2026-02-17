Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99192E68165
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:50:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9379.1771325438052044800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dwPhLnNQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43767807da6so2876949f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 02:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771325436; x=1771930236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/lY+liHbguY+/U/qjFfw0KHAXicK7dKAD8Ytt3OQHo=;
        b=dwPhLnNQRunwa7V/0pJWUhAVk41j6qZ4nFFTSWtdy2tS5JZ3DNDMw73oRpYhr32EYH
         qvV7Avb7Zlb/igCdBe0QgRqOniSXiaVI0qSyiqV9oLZoTU0kQXEAbVOzT0NoPyhF6ZX6
         BsMFZ3pocMYSwvS/tSs9gbSrpgTa/4EUYgRx4W+yrygmsBEWwgoFbzbKN8r+72C8X3tZ
         aWgEbwjCvA1A+/KWnDU7rHsgfv/NhTspFJUAdvuLnpp1+mwwJBvyJT6f9l37BMg8Yqau
         II5lxq8nnbXckTkh6DQOUnZPIiux2V2aTqk03wl27H3RVTihyji7Jm7IpU22ymp6l+by
         Ryfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325436; x=1771930236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/lY+liHbguY+/U/qjFfw0KHAXicK7dKAD8Ytt3OQHo=;
        b=alsBZ37kvSj4sexl26zLKcHk+Rwt2wkRRF0z8nsQWxcNasQivT19RDaEwqoRCwPR2x
         U6UX/CY1eR0D6MpIh19MDnihncdhkW7UDEgSDh6N9Yvil0C7SoWyMHbmrShWQdF53Rjw
         Tn8ZA52bFHACbWRgEsOo/P7vR+8O/N1hlrMFWEa4CEXv19d9XdtnzrEuML+tlIvx29KO
         CqXgoh4lXx4EHNW6nXyiDNWUZf5YFSXni4LLBu8QNubxIC2rOWQz9s7ItxPBVMVqio0U
         DY8K9tQyFjqJ1dDl91HVwOXm1x0biSB5vLw9kTQ1fmgVaAE+/OFUCf5iHCIgyO1mKdE6
         80mQ==
X-Gm-Message-State: AOJu0YxvaD84jzOG0x/JEJJkE/1DkkgVo7NErT3L1aPpZwOwfKUses4B
	zW8Cug6FdZmFgIE1Sfvr3OurDVtA7ta/CyzoquiExen/WliZkJTuhjSx03x0TA==
X-Gm-Gg: AZuq6aI4axHuxw1YSidKCjY+pTxntqYDuS3YtkaDbc7+0icu4PC2VfmQA03k6kQcOUM
	/5B7BNcgwToVmBPT1B75tFuGCrek7xzzdIaK9KUlZ/uh6K7Mex11FQzdXRsd2Jle20mD+6wx6Ub
	lWnaPDZco4de7JMMq0+Fye7cz4XKKb/E6C6rvRGShSUTu2xLDkeA6uMf3jI80GBf1Z5PE2Tpnyw
	z52OGclxE2Nz/KUgDUmqwDH5cfr0wjiBNCq15t6NEUS3GKYM/80LzqFoMW1PPj/ovii30RKdB5B
	AgdF4DStVdCT1ZxCelq+RMEqGtVlAqdtF4QA2qSjOsRESH+F4EJJjOi8063f4dadpSOq3/FBT5+
	duj9A9kEzVyJiaLvbiI9PcdHS4wapz2x/yLZ9aPcQ+hBnUc2z8FrsT+G/WHfEA9Zy0o68mU31kL
	wUZ6j3yt8yihTpo0bu42G0+FEHNTnCnrXH2Wfo2MDfZsuadgR1fEss1Pz2+64=
X-Received: by 2002:a05:6000:2888:b0:436:14d2:5414 with SMTP id ffacd0b85a97d-4379792732emr24329582f8f.55.1771325436138;
        Tue, 17 Feb 2026 02:50:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm30878989f8f.37.2026.02.17.02.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:50:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] ifupdown: correct upstream version check
Date: Tue, 17 Feb 2026 11:50:31 +0100
Message-ID: <20260217105031.3385098-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217105031.3385098-1-alex.kanavin@gmail.com>
References: <20260217105031.3385098-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 10:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231242

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.45.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.45.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.45.bb
index c78fb73398..4afd4f1095 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.45.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.45.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://tweak-ptest-script.patch \
            "
 SRCREV = "9ec193ec5a36f94ac8c647cdb6fe9b49c1a26fed"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit ptest update-alternatives
 
-- 
2.47.3


