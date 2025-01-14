Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3E7C02188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.43514.1736858065987714045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TE8HSubU;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30613037309so27530851fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858063; x=1737462863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v82dtYRjhLq6Di2/jE4R5M6bZi8i8cHZBw658/dNwQY=;
        b=TE8HSubUG4DFTg5ZZrD4rhDjsTPz08ug+n6BbSzOc5F9rr5cSBUVoun/RXqm9th8VW
         xji+AlYb+5XfIfFfPv2d7DrlftlcRvTmLmJekDtwzlHV1dcfXHJOpTNDEKWuqSwRsjBR
         unnfJtvDtdPABb5vQhAuNRpUpSarbP1DjxIexP+YK+lxE5sAGdtW8afX4zDzLYk7nzYS
         MYnBTLp9kK/sGoWxAMrfsp/hoUdFZYHfcZTjMdaQjJQUXmXxsz1YJeJy1BSgBLJp56Cn
         rfUo5+kv8CLY22F7KyJ6wvBj8Rbd3vj9r5gw/kOCvISlj4DysSz/gcdUTkzdKcx03zCl
         b/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858063; x=1737462863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v82dtYRjhLq6Di2/jE4R5M6bZi8i8cHZBw658/dNwQY=;
        b=GaR8EY6YCAJmHuvmq1C7oWfCPsEiIQ9F9PIiakiVhPV3ajkOccpTAKZC2yTnQCh9M7
         lbYHr8sKZuuWhV5QhGXuP1Pv80zkeoDlTduudybWExvIYe3YtPqk+mxBw6Kq/qWxdM7L
         KEUbdkX9Q1YloqSsb1BzM5x9Ybk9lSa7GERPwc/I6sl8eX37M+FmZ5BOSHaMX6joCWh/
         SkZievb3j5QAIspOyxpW1fFVaBB8IjTZZHKqaUMo8VurEzXG0kUqTGC8k0HuIoMCo5Gn
         V5LMhSwmGKVpbcxgN6gAmxa908IgOl+DrXb16qQvmFw58uwARegyGzruBxepnGXLEX/n
         kRFw==
X-Gm-Message-State: AOJu0YzEmSSDR2/X+Gcb391yN8BXcXkR09cBWjoL22tl3onWB7c65aX/
	B5mwaNwQj/3rri+js5RHjkjuXFj4BVgOscQ6SrKSyQCPOY4w/CLJtBKhmw==
X-Gm-Gg: ASbGncvBaVbxMzqJ6rCZNHQn6h9zyXQAPJ1OIRAaHTuLow2GzFrqqeDzeQ5o757TTo0
	9TUHHOKDp4PnLw7Xa3vlyST2v7SMLkvcnLHHTu7LaE6ymW0EOCa3yzqNWZdFWQhwM0B7+XyIHzw
	fY+DkjC2xmQPcjmr3g9US6dQijgcbutuzMpGNiOsmQjyGYzfu/I8OzvbfekSGGpypFO1XSTUJpb
	Nffk9b9FbHOKubug4MUPYV4nXONGUaXmMWdM6p+kvMpfQ3uQV5sYDIouNzpWbkB
X-Google-Smtp-Source: AGHT+IGMcUNUViuhIVkRo572dkB/kQw8GwM/Yi/vqBrf5kV+kZlPMaDCeS1zdG02AI4ByCnMfTRMOQ==
X-Received: by 2002:a2e:a583:0:b0:302:26ae:7bcd with SMTP id 38308e7fff4ca-305f45e4104mr87659881fa.23.1736858063414;
        Tue, 14 Jan 2025 04:34:23 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:22 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 6/8] systemd.bbclass: update postinst and prerm hooks
Date: Tue, 14 Jan 2025 13:26:14 +0100
Message-ID: <20250114122613.3046925-10-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209798

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
2.47.0


