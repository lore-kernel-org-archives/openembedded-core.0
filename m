Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87FFC44507
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140038.1783291392867432987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Sn9+ou6v;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso304897f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291391; x=1783896191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhMzkF/sSdc6tsbvvDvTyEu1yvXNWU/DxhXnY9uVCZE=;
        b=Sn9+ou6vWJqYJDzo2vaHp17TPtfqJ6OFuiLYnC7F5/WczPEPZl9UKgp5FEvKPlrH/t
         NMc0bs1eKyAzRu+ww1CIVYOlARhlYo/hLjsxSjirJ7A9sKS7f3hDiu8fLCITiFmdEvQI
         sfDkqhFvG62JaJkevJzvYjxU0jxC47luNJSNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291391; x=1783896191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JhMzkF/sSdc6tsbvvDvTyEu1yvXNWU/DxhXnY9uVCZE=;
        b=QexAcaHjrh/JLd4h7IqGpg6qZm2hbikHTBeJVF53bYDBKJ8PdRyCtn+KAaSIy5ean9
         jljErgjGYNAY9czQKrYL9tQLYcYuPcZhzX48HaQsWTAiHroQOAbO8DXnCVZAY2nna8h9
         dtR7lHKruGZyoyPjPXH7YGRA3F33HxkpVaDfDUeeUebXLNOEylLdFHkEovjDQPHWBX2h
         rdcmeb63PhGx+Oujeh4ig8QtImik6CH0JvS77TzaiGQqmk5u4oK3ny7JrNWbGIZAMjUF
         7AXPfn1VaJiplSlLT0g7s6dU1eGjkKNff2UStGr4R4O6vg1mH4s9Mlh9atqEBEeGWYAp
         kQpg==
X-Gm-Message-State: AOJu0YyM5k8l+hoyfvfXb0ioBzyZVmFiFmm9lyq6gmAabyaH1t3xD6D3
	t9yI9mx9zrtMTgqzVe3aiTtmXABjgAacVdo4vTKY5B7/MAzFPd6k+obHpIWQKPjv9stXZY2vAMv
	pU1NxJ18=
X-Gm-Gg: AfdE7cnyMx9eRy1wgPeqpFUqCOosJ/HVTDdJhhKme+tV2HJn7bYu+Wj3AeUMZMCtOPd
	7AcnIUwp7EMjodIyxe6+2mqEsNV2RD6GWHjYlBGS/FaKakKBooWvhDxS6FFZ1z+OALhGECYfJm0
	ervC7LWdmjOKdwgzWOXXKnofyyUqOv6EWkKZQ9UFi6q7YLXRg53+Zy8rZlcXsJgSaNB/HpxlTo/
	bDSpsZeXhJf9S49XrOUVXr/JnNzMdbpqwmHoO5J/YksKwxnQ/cAL+WQvRYX5vx8N5grxr9u7kqZ
	Pq+c5lNdPpoN1oM13GKIw3gVygfLRTKxENH+jZgIU+GEbj7q2VX4SskwAsE7xG+G7jSAX6Rn6o9
	yym8m5JTKYEG78M/VYZ9Jfe8ilNxssAf8tP3W/s8El60DWbgvXMheEJVjCj3MsJZeLOXjBT07ox
	WlgIKBcxDlecmdAqLkYk5rszUNRw==
X-Received: by 2002:a5d:4743:0:b0:476:82f4:4dcc with SMTP id ffacd0b85a97d-47aae2c5ee3mr7225462f8f.33.1783291391105;
        Sun, 05 Jul 2026 15:43:11 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 47/55] ptest-packagelists.inc: disable glib-2.0 for RISCV64
Date: Mon,  6 Jul 2026 00:41:37 +0200
Message-ID: <5f182f1520ac104328cc8181d0efff1e328d2ca2.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240201

From: João Marcos Costa <joaomarcos.costa@bootlin.com>

Timeouts and other intermittent failures have been observed in the
autobuilder, and they are tracked in different entries at Bugzilla:

- https://bugzilla.yoctoproject.org/show_bug.cgi?id=15891
- https://bugzilla.yoctoproject.org/show_bug.cgi?id=16230

They also happen when musl is enabled, but not only.

Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b718f4c044147dfa0742caacbc20133ead53f10)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 11a894accf2..a2c5c0477a4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -154,8 +154,8 @@ PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl"
-PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl"
+PTESTS_SLOW:remove:riscv64 = "tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl glib-2.0"
+PTESTS_PROBLEMS:append:riscv64 = " tcl tcl8 python3-cffi strace lttng-tools python3-numpy perl glib-2.0"
 
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 = "strace perl gnutls glib-2.0"

