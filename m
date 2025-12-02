Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDA9CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:11:21 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9762.1764688281229457548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4QC7qMF;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63f97c4eccaso5070293d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764688280; x=1765293080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21gYNNaS5rj+CBmagtIDOj2YbH0UVUX+bKjeoNiB0og=;
        b=H4QC7qMFVsrZ27GojreIF1rL+HYU3GrYoSz0TaSwH/lllOUm7QAZD6YwC0sdDE6cJl
         k5dTBYZlUkbHFNrf9eDYc4YeTAqd/+eFNd4KvZOf5disq8C3dp+n120ze+dLBrO5WqFx
         ywr0VA1SP1zWfcaxbGJ0MUbA/vmOu6emW3uZrQuQ7XlWacvie/NUreYVoBbqAIEOFmyI
         I3LGkO8bQbhdJE7QljZ8tomJAxnT2BJN4jY3iUDCfNFAQIBncmpeqgBS3fA5LL9vvQwD
         6Vb711VPyVfw1BGh+G50mQDTOZYpY+vGp/aSZDkc3VbjgoCzuUEAiLOWvrTiIZMCbtAO
         uWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688280; x=1765293080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21gYNNaS5rj+CBmagtIDOj2YbH0UVUX+bKjeoNiB0og=;
        b=sWk+pCW46hTNVMZvExyg1Y1wMJVAlEJZkyLnGGHwmLR9roNC2jTktJMjvb6G1iyRCP
         VWspdq98vgp9VRay4OJ3mxcQx/86UjuON2vQclYnceP26hSUjRq7LFiClszUOzOZPqbk
         J843hCQF1DSKMKmrjeG6GOjo0HJ/fS7b0hRuTzTKClIV4hIApimnQt/fAhpry4TFGv3y
         YFKgYQFd1iytijJ5fveBFWmyXdCMiFgmBx6u6HbWGFl3CV3GLu0tuJuEQ9+7ciccz1y7
         ZyaaYN0iM60t5PSjajMFag+qGeoihacSlxIJ1ssRf+7B3seHw6xLp8/krd1kGLLjl2UX
         aHvQ==
X-Gm-Message-State: AOJu0YzowQfgVy59yMJVXlap6TuYTAoxth87iW8bOHuqlmArcXyOOywd
	t9T2wKLUwnPx1XzgY2g+U5GSz5ZeBbU8zLVDF2zVkiVJdZIn9uvIfbk+3a8zlNUE
X-Gm-Gg: ASbGncvHPVBbDcvAS6J2LlS1XHIWrDzn9Be5CogKpBOFK9JRvObiq3dMIotlWXq121Q
	fAoroKLIhPhajPJol1Z/5N1OLjWUAHCwFXrKhSEoCtDNSLPzll+pIO+iok+sLTKLTRzU7H8g3Rp
	hue8sDLgl1ZPcRR2Tovd8uKwJ30Z6hvaqZ1PbCfpwyXdLeODh0xhatANe+RmLeUOayKfEGVbRmv
	3geDf/Qi9eta4y49aqK+KhOL1AFAViMsmvxJf6IMPXqo0dxp7WxEScbA4d/27OfO6O50JD4IgC9
	GrOOV0A3muGW61rWnJzX+vfXEVgUoG6bzUk75l7tpm843BjrXgcn7XSgsCgsxtqJiQNAC4tx1V1
	ycisEiyXZknbTG/v7f0tVj/WC1yXBzUOOU5QoamFD4kvn+V6vnIRnqoGWjftUqoQ0zcw2Y9NgK1
	vvRVOnIjelKyoFGKu78REq3Ccmcck/gUALeYul8/Qf8i3m
X-Google-Smtp-Source: AGHT+IEv6BbGWhP+pf5goOcr1iXf0uy5ohtZniNENT23qxjf/pkuRLXKChtNdyjtSJUgk9JGbut5Mw==
X-Received: by 2002:a05:690e:144a:b0:63f:aef7:d009 with SMTP id 956f58d0204a3-64302a6060fmr30991168d50.5.1764688279865;
        Tue, 02 Dec 2025 07:11:19 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d5fe26sm63459527b3.18.2025.12.02.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:11:19 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH 2/2] perl: upgrade 5.40.2 -> 5.42.0
Date: Tue,  2 Dec 2025 10:10:31 -0500
Message-ID: <20251202151032.15053-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202151032.15053-1-schonm@gmail.com>
References: <20251202151032.15053-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227171

License-Update: Checksum changed because in the license, the physical address
  of the Free Software Foundation has been exchanged for a web address.

Changes in perl 5.42.0: https://perldoc.perl.org/5.42.0/perldelta

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-devtools/perl/{perl_5.40.2.bb => perl_5.42.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.40.2.bb => perl_5.42.0.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.2.bb
rename to meta/recipes-devtools/perl/perl_5.42.0.bb
index a78d2ed0be..faab33163a 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
+LIC_FILES_CHKSUM = "file://Copying;md5=8f7dd0873e59530abbb36503972afcdb \
                     file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
                     "
 
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
+SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.43.0


