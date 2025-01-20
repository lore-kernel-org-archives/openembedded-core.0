Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40A7C02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.35718.1737377277991160132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JC5X+cZQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4208208e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377276; x=1737982076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7QnPFsnP9g0G5EXoCQogSYW37osmoAxcLXDwzXJkfU=;
        b=JC5X+cZQu+nyvuU1nRag1U5gNRr4JABE6s9qqj/IMR6NGL42yUaDH8jvVWyOUUvzjY
         n/1WAmSs4Zw9Xfgx1mTJ0+v7P045pdEgXmXhj3kE8Gv0fAT6+NMsgdEXuJZC7cU+uaFM
         gq6MpkdGVGaaNvlDNOThI5Dg9RjH8RbbJ7t0MlbYyrRLIPRtniX4o/GyGuUtNW/ox4QB
         Ki8g5wqfksNZE075np8ium9X11AvMlxG9nIjwvHjkFn4B3e8FOJtE+fGvqn0g/cCgmR2
         1rREAKhA6lfaXS8Sv7Q9mnztPAVakMCIZVpbGIOjY6PHgG+tNOi5hrxFSuFKGIBvXHN6
         phRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377276; x=1737982076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7QnPFsnP9g0G5EXoCQogSYW37osmoAxcLXDwzXJkfU=;
        b=gWbnyPD2rW2DhbA1QZcWahTmx6wagVWOjj/eUFbdF9eLCMzKIe6WBca/RM7qtA6GLq
         /SSzGNOGZyHxCCt3viEAHsz9R68L53SfqSVeVpDVbDS66VeAh93tiB5y/XaPCN3JBk1A
         IfxOQB0ARbhjZlxpYRKgZT9KsvdKFOUO2a3QUO9dLwrqyPVHHpqwxd9EP4TaIbugDh0T
         p1aBlXOHi7zxjQnG/y7fNTd8LAAen+lgZ4xbNbsEGzzsE8TKViyndLolRyfdrqhKBLpN
         sqZMp01YIHxxQY3xLIGc6Lj4k+Mb7p03oMf9ud4bpY5emKms4/nn5cz4roEZpxJzgmiD
         eyug==
X-Gm-Message-State: AOJu0Yx0n64EZbfngPR12tccDN4dhFzSvmCKbkHOWh4IZBaFA8qswtUT
	Kc5e2EJJmoLiaUTKiyPhlLzcsS3PokEUFdDUuDLLwVDEFbN6hhR36QoQhw==
X-Gm-Gg: ASbGncsqrRdwYOp777TM5qZr22qc3AYx8BGO8S+eQIjZ2ATA9hOq/wy40pcqMT7+r78
	sLYFFrs3KrrpaUNFZxJhFzbT5RPRFA+b1fUI8qtXkdrckK/efLKxskYT3zzv6OWaHLMm/TtPtsW
	JlGTengNqk7D7nfvi7xwM8cm/0f2jRz0JL6fNqlsmnVdF26HHJZ9Eud+q1QaEZ4KOlaQOINRFNS
	tABOOeX1EOXBQ2wjJ9cQtlTyJHqCIDD9XCNZDQXSLoGKjLkrSKV8agecl4uIXCPDvNLgst+n24+
	mg==
X-Google-Smtp-Source: AGHT+IHyr1bd6U0SG6qg9ryVGBwPIlb7YcWHMx78ZAwmWn84gL4z1xbhtdoi0VofKKJ/VLmwLIkJPg==
X-Received: by 2002:ac2:428d:0:b0:542:297f:663d with SMTP id 2adb3069b0e04-5439bfb752bmr3549053e87.23.1737377275579;
        Mon, 20 Jan 2025 04:47:55 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:54 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 7/8] systemd.bbclass: support user units in postinst and prerm hooks
Date: Mon, 20 Jan 2025 13:46:05 +0100
Message-ID: <20250120124605.263817-9-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210038

Handle user units in a manner similar to system units where possible.
Not everything is supported by systemd, but systemd limitations only
affect runtime package management - during update user services are not
reloaded/restart and each user must re-login or manually restart
services.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 177ee5d974..4c9f51d33d 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -40,14 +40,24 @@ if systemctl >/dev/null 2>/dev/null; then
 		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
+
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}; do
+			systemctl --global ${OPTS} enable "$service"
+		done
 	fi
 
 	if [ -z "$D" ]; then
+		# Reload only system service manager
+		# --global for daemon-reload is not supported: https://github.com/systemd/systemd/issues/19284
 		systemctl daemon-reload
 		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
 			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
+			systemctl --global preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
+
 		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+			# --global flag for restart is not supported by systemd (see above)
 			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
 				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 		fi
@@ -62,6 +72,10 @@ if systemctl >/dev/null 2>/dev/null; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 		fi
+
+		# same as above, --global flag is not supported for stop so do disable only
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
+			systemctl --global disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
 	fi
 fi
 }
@@ -111,6 +125,9 @@ def systemd_service_exists(service, user, d):
 
     return path != ''
 
+def systemd_filter_services(services, user, d):
+    return ' '.join(service for service in services.split() if systemd_service_exists(service, user, d))
+
 python systemd_populate_packages() {
     import re
     import shlex
-- 
2.47.1


