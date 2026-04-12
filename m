Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3497FF45A1C
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 10:58:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.237978.1775991476342746296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 03:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jg0MQzZ3;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488c21c636dso20045815e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775991474; x=1776596274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzkOzgLadrRfJUIqtIJrNZ9w2IGSm6NcQmNb3WGVWMg=;
        b=Jg0MQzZ3vVrFZ3Qv+h3/M0nQDdNPevV3tDb2CJoWOEun31zLVEB+6sZxkCCntk0eQ/
         uVE6PcBYapPLiePVb5Fvzv2oiqFV0gNpPrEsTbDubAQUPvzRbqpEHylaXrwyFLAKsVjf
         33brhsHr/qk9JqmbdhGLfn4wUzZimb/qpp4Hb6VvTQrqqEvAF2jXef8jVq3zu2PwHVlH
         uEJVpgf6aIKPFp17rp/X2ENx5X1IhBagENmW1zKQdA/5q57oAF5iQUBogIQzPvJV1lTR
         UHBOG3V7uBPoKJtTztub45tmY+SmpnfzYBneIDpzq2pMS67n+7tP4nYMj9BmQc/oyILa
         B7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775991474; x=1776596274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzkOzgLadrRfJUIqtIJrNZ9w2IGSm6NcQmNb3WGVWMg=;
        b=EP50dYxTHXxHK0kJeuQkhe2eEw8XCqehfOPkWqUbn3fzlMKs5pl6aobXoUguwHew0L
         oqNkSgPiz/hon4jR4ByW+isiFYOJuO+8cUoJVZefi3ikhnmpR+oINdlQ5PofUVtuu3hf
         SZLHT/bvDVrmjp46PeAIR5q73hPUIsltR+hoef5JMo2Y5kfKdQ6PsipI4rGYxMETReCg
         sGTnw9Y2R2qNRqNp4+gpuzCPAOJDeKiEMcefq6qGQkdmbdpXBlM9he27MPY+APYoRFzR
         SZ6me//9voi2a5hkKhRnNmAOiZNsnrvrWB3m1v+RdDzmAX1RMaDzfOhuiFFaV13F8zXX
         T6+w==
X-Gm-Message-State: AOJu0YzsRzGsCRZJ/gdTJBJcX7N615kjD/sJzyUiHbtpOy82XNYHF977
	hQ4i2+7R4IucEz6K1jjTbBV27+ZUKC2C/bpZ4jh/xytBGtrdenGL/+zHJq1LDg==
X-Gm-Gg: AeBDieut5Kwlf581bd0S2qG6oHuyVZynwuhCL1NULY7DDYXVWYdKDfBctwXOpUgcGhr
	tToSUiA0cDJgrAURka0zfLz+hZa8QKVhgVWMLicauZEPiNWlFdzuHimQcB1OZ4vxlfU4dHdNWdQ
	8aO7VKCTt2XcyxNKeJ89OzVSn//SiWROVf303sf35m/S/UqdH/LWwDxdvOsTMT1o1upocfUgvgJ
	C9SPwF3lfCesxwKUJsH5O4fzF6S0eZGR1XBuDGgpD/w6QwoxrvhMNM6A+WdexzK5PGmxH2NInEp
	wLZWP7iqPiD75/lxwZBaUUvYqe9Qg5dF6i6FLKEPu00E9XcKIDuk67oQAqIxNMlQgwnIH/mTUys
	qWj8rLQ6/5n0f+YR3rNk5TzDTDexfKYa+o2amjsaXJQC8H1xjE3Lz76V4QMtwgNGsjVhzOzyvav
	8xr0GyfJF9XT/bEXQ/PjsnqVMhXCtpZUSo9DIoSvb0hmwxAcb+OGqRQng4sLbj6OHbphd/5L6yB
	2TQNwXYMR9NfkRXUtys
X-Received: by 2002:a05:600c:35c7:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488d68b27d6mr142048905e9.26.1775991474310;
        Sun, 12 Apr 2026 03:57:54 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d53807d7sm328079105e9.10.2026.04.12.03.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 03:57:53 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] apr: remove -std=gnu23 from apr_rules.mk to fix reproducibility
Date: Sun, 12 Apr 2026 12:57:50 +0200
Message-ID: <20260412105750.3342374-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 10:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235065

From: Martin Jansa <martin.jansa@gmail.com>

With the updated ax_prog_cc_for_build.m4 from
apr: fix build with autoconf-2.73
it now correctly detects -std=gnu23 usability on host gcc and doesn't
try to use it e.g. with gcc-13 which doesn't support it, but that causes
build reproducibility issue between builds on such hosts as
CC_FOR_BUILD is included in installed /usr/share/build-1/apr_rules.mk
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-a5w4mcrk/packages/diff-html/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-support/apr/apr_1.7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support/apr/apr_1.7.6.bb
index 86fac1e4c8..9a7a8ddd74 100644
--- a/meta/recipes-support/apr/apr_1.7.6.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -87,6 +87,8 @@ do_configure:append() {
 do_install:append() {
 	oe_multilib_header apr.h
 	install -d ${D}${datadir}/apr
+	# avoid reproducibility issue, -std=gnu23 is used only on hosts with gcc-14 and newer
+	sed -i '/^CC_FOR_BUILD=/s/-std=gnu23//g' ${D}${datadir}/build-1/apr_rules.mk
 }
 
 do_install:append:class-target() {

