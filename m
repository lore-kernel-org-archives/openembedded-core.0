Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED684C0218B
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.35717.1737377276758865286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VIUHBYsy;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53f22fd6887so4476770e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377274; x=1737982074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1ucR1gqPpkWvG+zJIJUrWmc+irEnCKSt3B+CiYAK+o=;
        b=VIUHBYsydhzKz2M6yNrVqvlj/KM+hzE5Ry2+2un2hZUw6fJXdAOUVBIrGReVX8Gr7j
         igz0HuVoulLJS2gfzoN6Mo9le+XjmD88pn6zFmgH7y+JZ48mfT6rNvTVveeTc8BTPNAs
         TUTD6vM8H0pSvF59aMgNo/lrDKPmzvRF1D5+0louOrB7j+jXnpjeSJjH8aIqsOcHTJ7S
         WosVyJFltSiqUBu5/reOejOFYFDOw26aCV3I74hLXYr54o5fHLwpsxhv2S11Jl+vV9Q2
         0oPu74B+YDvfAV1jew5aQ0ecBI907Rs+1Ip2IuM6zAJWKMZMv84jEk9h/54XXlz804vf
         aVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377274; x=1737982074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1ucR1gqPpkWvG+zJIJUrWmc+irEnCKSt3B+CiYAK+o=;
        b=sKbd0ZFn2KG0rc1oRmJnXWloNZVVH8VNgbYTrW6LeB+g/2rGTeqCjSSsTqySS2stGQ
         XQYoCU7FphS5a9OIz1Z7XfqsdlBXogp9ox8jwNtlYDZ7R01k6Hnm/zwqgxlpiJIvZMqU
         ID5IQduoK28jPCEeV7ETyMVWzykXxHyAIFPx9dKC09R9Krj83hb9Rd/gSjI/iIlcQtRU
         Urort5Y1TCQOkK5p4qRp1ng6VmD+h5NNcCQODqQBAs1ils09BALZRPA6nlBn5oca5B07
         Ht/KGcvnCauB7zxi0l+XAnWpneNqZ4l6aXezVy8B5jdydts+79zY0QRaRpFexY91HxiS
         3H+Q==
X-Gm-Message-State: AOJu0YxCuK+XYY5RblibMqdDkIlpKHnaCujVfO9aCDGGLy4vPjrkEBQh
	gBriQxdsxJfy88aArIK2I/YMuty0v1aiGUiCNNicEiN8ZcNuv1PfPZ09Uw==
X-Gm-Gg: ASbGncuwgdHzhD3fQu67eWcgpr0hxsSvoYtmA30Of/i/EAE8PPtrtZLVWxqygSOCYmT
	9WsKYh/aWb/eGMkZaWP64UHyUJMo4zyg8RJIjSP1vZdbtaFeNYzKsNxGKay2BsvzYYbfAxQj15S
	NHG1EPuXOBQUmvaVpgHrpI6+e+paaUpL92asajD30chxpY/WilpE3KxShWEJFjcvLPFPtgkQGfn
	x2H2oPM82dXvTe2UR+STOQ8VZhiuSPufOXklvuUlxR/jNi1ZP8kJelD3S54yyfM0IymR2YEgB5g
	9Q==
X-Google-Smtp-Source: AGHT+IEeZ0+FS5MIVO2f8gr469LCkjnwKF2pcLoVbqfauyGdwPpnQAm4ElnkpviU3DAgkRfqjb2BNg==
X-Received: by 2002:ac2:4e0e:0:b0:53e:2f9d:6a73 with SMTP id 2adb3069b0e04-5439c1c60e7mr4988004e87.0.1737377273859;
        Mon, 20 Jan 2025 04:47:53 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:53 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 6/8] systemd.bbclass: update postinst and prerm hooks
Date: Mon, 20 Jan 2025 13:46:04 +0100
Message-ID: <20250120124605.263817-8-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210037

Since SYSTEMD_SERVICE_ESCAPED may contain both system and user services
we need to filter out user services in call to systemctl. Introduce
helper systemd_filter_services() which takes space-separated list of
services and returns services of requested type.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 592f15a4b7..177ee5d974 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -37,17 +37,19 @@ if systemctl >/dev/null 2>/dev/null; then
 	fi
 
 	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
 	fi
 
 	if [ -z "$D" ]; then
 		systemctl daemon-reload
-		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
+			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 
 		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
+			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
+				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 		fi
 	fi
 fi
@@ -56,9 +58,10 @@ fi
 systemd_prerm() {
 if systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
-
-		systemctl disable ${SYSTEMD_SERVICE_ESCAPED}
+		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ]; then
+			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
+			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
+		fi
 	fi
 fi
 }
-- 
2.47.1


