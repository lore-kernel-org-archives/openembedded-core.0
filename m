Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A043ECD5BAB
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1013.1779233441268257034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GPJ6gZj4;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso33640635e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233439; x=1779838239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anIYBu1zkZjK1cbWlFzdT2gKSQQvZGvTcy0l8NTP14M=;
        b=GPJ6gZj4HKcYKHomYAl8bnMuvnDsmsbnWT9gH3od4E+X9itHuhLi7/VpOtZou3BkcS
         /UTJVqLtAF5UxQE+yII8K7ejYbf74UyAC060mP74TYXO9qGbn1qkvP28KEg8i4pn7Am7
         aFHvvtWGYCUEF20J7EGsg4NqihCtaEI+NYIew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233439; x=1779838239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=anIYBu1zkZjK1cbWlFzdT2gKSQQvZGvTcy0l8NTP14M=;
        b=m5pJ8zZD2elpIjmdlDtTwKJPyHWVczCy7Y6OnBd3XU5tbPJEGXGdbIkBAN3Dk1xnW2
         MKQjkVC4qvoZti43NUYIgdSKf/avfD5AMSsSPgT9iHJhEuinf2vkPUBeADSK02yHWmZ2
         WVp1ZVkz5T+ZF1Ag/JyP7xannWqSsJiaF7ivd/IaOCCpBah2yDMw0bcUfjGa+NGoA4rB
         VhlV0lzl43P7qgroDSKpx1fjVX3lhEoUkIYKvS3zajhw5G5iWN5FHv5Fs8ETPJ79+jKv
         FxLDADbLQkBjG+/R/JkKfMP2SAFpGX4+1/8AkdKT+vjbveMKml/wLTgOqt5+QE2ouZfB
         xqiA==
X-Gm-Message-State: AOJu0YzUNmj4DiRk7V0JRSVFMxhgRf/mB/jjKSMGqT9jPBR61CYbLHua
	fVa0TPzP45btWXhi7beS4NrXxLK6hPdphDy8RFJHbA89tf85KBEKMokGr/tzMA29CWNfiixjLIy
	WxrAm
X-Gm-Gg: Acq92OFygIpLapBzao9hF37zdQM+LHBCesSspkP7CinInJH1TdG4NI7TLcYroMQDjqY
	L0MgrRIM7NL36qxyUSUAzQ5AEKxVwDkFq5K0UiPgaMJg5V0UvKXbvZOfavNHRda29gB7XW74vdy
	eJy95OpXVY/tqGXk9WUDtshFNeCQ2Xvb1gSa7VoQR0SWCjox6o7AA6f3P0iD/zQY9iiJ78ZbOjo
	7GgPOORhxBsEtPMwTLIUFHnnAVDk7u8pZPJlBCMmm4wtLglxc6DnevNwyr+OxZi7/3tDlGiFpOV
	wNmt8jGOzNuWSTrmlnp0NLOXez41GjYo8VB4Sz3LbHYrxYT/27IRrWPRuBtai0J5WPMxwcYBMTi
	md1t+tyAmd8sVBCI3Q730bnkp+mbcIZMdXOSM5YP3kW9PF6aVXOi9p75w/pIAPAUmsjYmDQu36o
	Yy4yDERxW0HndrgVlNBJRtOI1GOjQd4rLKhjgJWMgTyw/DZR3qjduaFmMadWpj9DN2wXech8fta
	g6qzfeFVUp0HzLTCIj+Wim9UFM=
X-Received: by 2002:a05:600c:6098:b0:48f:d1b8:9ab1 with SMTP id 5b1f17b1804b1-48fe60ecc51mr371262455e9.9.1779233439443;
        Tue, 19 May 2026 16:30:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/28] scripts/makefile-getvar: quote MAKEFILE variable
Date: Wed, 20 May 2026 01:29:59 +0200
Message-ID: <023a9f3126936892f0df6ef236dcc4be2bff36b7.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237369

From: Thomas Perrot <thomas.perrot@bootlin.com>

$MAKEFILE was unquoted in the -f test and the error echo, causing
word-splitting on paths that contain spaces.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c98243b8e2a5f1e538024131ca94991c5befc59f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/makefile-getvar | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/makefile-getvar b/scripts/makefile-getvar
index e8a98327667..238d9567adc 100755
--- a/scripts/makefile-getvar
+++ b/scripts/makefile-getvar
@@ -20,8 +20,8 @@ fi
 MAKEFILE=$1
 shift
 
-if [ ! -f $MAKEFILE ]; then
-	echo $MAKEFILE is not a file
+if [ ! -f "$MAKEFILE" ]; then
+	echo "$MAKEFILE is not a file"
 	exit 1
 fi
 

