Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A418C4450A
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140037.1783291391664983901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d4nPnn6g;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47122683cf3so1435523f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291390; x=1783896190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAVuc1pru9JEyhueqHGwN/dnkG/WMtwG80w3BrcRsz0=;
        b=d4nPnn6glWxq/ac0jEY8jQPpgtGUaTmXdvEOLo+nQRupespsCtOXP0ooCghc5hMEFE
         KvRLf5+h3jwkS+o2uDjQlzhrh7z2moqvUxszMcTVn1y1ShbzVXc5WS2D3+1gyiQPOfAu
         VYZCMrRVWupKeeZkHRQfTlB+GnBS0AGtPEwlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291390; x=1783896190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MAVuc1pru9JEyhueqHGwN/dnkG/WMtwG80w3BrcRsz0=;
        b=NT31b4YMwLc2sF1lMLPU5yhs/BdyNCS4u4QW5glcEfLdJHMzq3xZvDlbPJZbTlUW2x
         A2Ia5ve3fPYcYDgX/SKNiOwr7Ybwc8AOCVe3D16D+f3nTWaF4VMcwPM+kgcZeO3YC52C
         LQV7n0A9GGW7eKxAEw2bZlQLc4ehrF8esuPh4qpigEqypXVbdP0ssBgORehCtZ1uVwbV
         5lACdeEEfyrMZmq8Og2ZDBKi/b5JcuNi+aAL7EvmNj5OeEiGPgFB3q6/ZZcFSHA/hYD4
         WAWiVCcMPFerBmZ4wPdNwXrJ1pccEIUna6d6Ip/zKuyoZkTLs9+Ai5azrb+GYEGr3R2Q
         RRAA==
X-Gm-Message-State: AOJu0Yyw4BYLJ2oCpGoT+NhdKXjsMbxkQ2gUjZDuC+G647UBVqNZmpp7
	j3HkT+p65R/bzWh0Amwl4UyGfjZuODnrKxxmsUBw7ExMOJaLEgWeJnzE1k71BMyd0OfWqXL9l2f
	l4Yr46i0=
X-Gm-Gg: AfdE7ckH+6Jvv06A6P4VAp/DYNQy6HkT4tQZQ2HtPj9eA+lL5Ums0/Sjidq5u8/qdqb
	3ckk1a8XEYpC6puWvP3XQKBWLGarUkIdriQGITHmS+P+3JUfhcDl0UyfTWl34WT25eTTcHGOk0q
	Xk2ejrcW2c2/c4z2DYs+dqNh9S+ogpngiFQOSdOkF1AUfHlC7lHNipwfZUaNh2q4+QaJfOIJ7Ut
	4ma6uI+mfq38Zf+TkUD/zPWwDDckzQZUkodUIZe71xNyT31np15rBi7LwMCdLhBbp0ln1YN5555
	LRigAGDP4EPkoCWnVAc48boCTHLUySD9571J/WbWqhzYMVP0KfIwGzzPGxQ+3Aq74LJ0jshj88X
	J/CgnwLT0gHreXeh/eYfnaHV9oBCZz/4DRR8b3YZxA2F8yHb2UFf1E3ZvnC1604BsEKBxM+UXTw
	DOK+6MQefODUG5Laz+55uipO1bug==
X-Received: by 2002:a05:6000:2c05:b0:47d:df96:c9f4 with SMTP id ffacd0b85a97d-47ddf96cc37mr3385397f8f.10.1783291389877;
        Sun, 05 Jul 2026 15:43:09 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 45/55] tcl: disable the timer tests in run-ptest
Date: Mon,  6 Jul 2026 00:41:35 +0200
Message-ID: <0c4b512c104a798a6978e2701fb4e2546f26ca9f.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240199

From: Ross Burton <ross.burton@arm.com>

We've seen the timer tests fail on the autobuilder, presumably because
any tests that are exercising the timers will be unstable on a loaded
system.

[ YOCTO #16324 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73bdad5ed6906edb92f96baa70adc772f9dc18de)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest   | 2 ++
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 46f6cdca333..c01a7a1da28 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -34,6 +34,8 @@ SKIP="$SKIP http11-\*"
 SKIP="$SKIP httpProxy-\*"
 # These tests appear to be load-sensitive (16214)
 SKIP="$SKIP mutex-condition-\*"
+# Timer-related tests are going to be fragile (16324)
+SKIP="$SKIP timer-\*"
 
 # Run all tests in tests/*.test unless tests are specified as arguments
 TESTS=${*:-tests/*.test}
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
index 86b74a4177d..f4d0e90c0f0 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -32,6 +32,8 @@ SKIP="$SKIP socket-\* socket_inet\* socket_inet6\*"
 SKIP="$SKIP http11-\*"
 # tries to access google.com
 SKIP="$SKIP httpProxy-\*"
+# Timer-related tests are going to be fragile (16324)
+SKIP="$SKIP timer-\*"
 
 # Run all tests in tests/*.test unless tests are specified as arguments
 TESTS=${*:-tests/*.test}

