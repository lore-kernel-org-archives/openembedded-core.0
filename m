Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC403C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 17:13:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59301.1786468392395489192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 10:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qRSKIhCH;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2481f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786468391; x=1787073191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC5fPZOuP4AjMUzp260eo//utgYwnsN3FSR5KRbe1Mg=;
        b=qRSKIhCHBMKhzrRTdt8vp5edFrA/K2BzzTjmmTBJWSFHJjCpopvb+qnOekzGkk/P/5
         4F6XiPlKuurRlHcqRGTQtAcL5VtTWrokKrcQkL4bf/7YtE/U4WP67ehHm+AcysI6uSjV
         5oH2xxBMBAgemscNg+8cnRrDPc39BlZ3Z+MINetLLtb22XJobXHwx7ViH8Kvjvx9TJKi
         prvY7vkleyvgvShR/weKIm1a/KNoicc/7BVLfVoYrS0pxUXqTAEIXzcmisqaHzIjfH1/
         Fp0/eSvfYplq8+RMBeHN1wcLTSRSTvREuquHet60daDWj5y1oN7aROdjNrhdwgvcdxB2
         IFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468391; x=1787073191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC5fPZOuP4AjMUzp260eo//utgYwnsN3FSR5KRbe1Mg=;
        b=fbRyTDtiyP/3xSEyI9z+KR0XGoeOH84Y2hUopjvZ8ySWZb5P4dhIkX7wng0IbQmrbm
         AdBDd8TQWxdGFaorxiUPlHC3Ti/k+woF4poQ1Cv4JPSGW33QPYe47qzXcVsQetPAsG3H
         GPv18gYjQrM9PfHZmjgCapIJUEWbBg66+56KiC6kOn5XbBBoCHLqKvtjJb9zGA7q55dh
         ly8rAw3pGYa0mXAIiAdWFD7d2XxF+BnBiCEAo1ceL5vQ2N2r6tep1lhckiE/T3dOU7xM
         K+UIMPI2rBKzLSvBVVbQb+02xGoL8u8LPSiSuhLmZq/PT/o6HEp/zCl7gLnqjDqfZwXj
         Jt+w==
X-Gm-Message-State: AOJu0YwDeYu29LoEtD7ypsj9bfriZkDnZIt1aHIm3XATH+zdiezkE5Gx
	y5AZWVMf3xudgemau0mHDqyfW4O2/FBOIeQ8gmj11OubnJQmk3MOSsRxp0Wcb1Ee
X-Gm-Gg: AR+sD104lk1mp0lJyEHs9NQllCzh4MKysPJ7OwEg9+98j/4ZFhz9mBx7PKRA5TbsbEc
	uz18UO71Vo/SxT6vBjmqiKYQ7q4dDs/XfwZ8hH7BGXXKvyeKMqeWtDk6ORthrMwPUBGSXFAR2po
	l30ag7xS0g4O3l/UeFMheZ4YI1wOjelzhF6DFt3I/ZM3RDE1qfEZ3+f0WcRPZexZVsPQ3fXtfmV
	pc9cpqq3nfv9vZobsQSQhukezXvlRdtcjAU+Rvs2oLE6UIYLGNfHBA3vmPP7C6Vdl5Vq7Ft+3PZ
	m/ZZLV9hFmja4ZBKVksAvob64PN1+UVHHaBFMHcASP5jcDHt87HVlYwmcj41/mN80UUDFnvbWRi
	4lg6UFlw7l/HAAH7Eig+8D1iz/xtWiEb5J9OJreTtSouA1eQtDGPw2XD3KcAiVal6pdjU/Sokqi
	xO/GabBy9sNwzXOlSXUyXdetwJgQBrSOCFs5v7zYvH9CeqvUCkMXFp5bjBqgPGN/8EgWQfCOvdu
	Kt4C2hbSvp+jLgBB3xAaxAtDFBMJHijpA/Sx5WoLJjHqJ1pUm8J2MU1jdYsCGj4YEQxJMLcTjw6
	VyOmtekjs7MUfcQa/hR4Fr/xaoEzino=
X-Received: by 2002:a5d:5d89:0:b0:47f:fb57:8c7f with SMTP id ffacd0b85a97d-4814ade9d7bmr7188528f8f.29.1786468390465;
        Tue, 11 Aug 2026 10:13:10 -0700 (PDT)
Received: from aniss-macbook-air.home ([2a01:cb15:80cf:2100:91ff:b7a6:5488:6e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a70976csm5658292f8f.19.2026.08.11.10.13.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 10:13:10 -0700 (PDT)
From: anis <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anis <anis.bougrine10@gmail.com>
Subject: [PATCH 0/1] Make do_clean description more explicit
Date: Tue, 11 Aug 2026 19:12:35 +0200
Message-ID: <20260811171236.84403-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 17:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243217

The same proposal has been made for yocto-docs
where the patch is under review.

anis (1):
  conf/documentation.conf: Make do_clean description more explicit

 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.50.1 (Apple Git-155)


