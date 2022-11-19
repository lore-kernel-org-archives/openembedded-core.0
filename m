Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DA5C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.30647.1668892535406019082
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eQiKn3yJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 140so8038419pfz.6
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdAYdcm1xXwxBI2IovZnRqK+r9MiTu+AcaBTEQg9pd4=;
        b=eQiKn3yJljG7jJABKQXfYhARY2GR3sfBGdTqR1aKowRA/lM08XHomHWgTWnOYCvmXx
         7qCd8+6V0YxQAV6/a/dNeTHMCk4bp095QwXF9UQUK9CjMOY4rryfwqOW4p9biDV7YUYD
         OVHUPdJgmqcbag8g5GRAJhBGgBiR3v9GRABvW+O7xjd9B+OKAOd2VOpfxN3cZwKO0QnB
         BXwaR180+uxo6w8J3BzCF+zjqx0GTmc4ZLRg2tkex9oboCXjrCVHS98uY1sDS8AB4X5N
         vd8ZClX4fiRnshmT2VOhMITL6qnS6Anym5h/xNDurJFvH/mw7T6Hpu2RQWHn8HjGz5hb
         jtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdAYdcm1xXwxBI2IovZnRqK+r9MiTu+AcaBTEQg9pd4=;
        b=GIJuw9OeItYCX1NSrZHYDQJHOWfVKuluoo3EGVR+ZlzoZC1Gz+8sshalQYgc3+Gl26
         Ds3jtNx7NOvOE+i2YYCFQeDFRBHCnu4nA740EPqhDPoKSlTJw3GTM8j0fxFvKRKRcnH6
         qJwOyJ9InsNf/hxqNaHhR3oW8xMpYepjNSGQOsU55wq5hf03TOTI5LsLryN6KWffwGia
         qxVlWrpG0Bw0oU2vg1p7btJRqnJVA+8ny7pTg+lpp3vV0pF1frfNU5LuyvYUgQqwtkgw
         KaYCF6KBG5qifgWF5kMAKm7Qs9CwcJE7DN702JyOTbuBxrHR7hIhJKF4+M1bn/v/61PY
         0mjQ==
X-Gm-Message-State: ANoB5plCWQGLVzl8vhlSkp6Mz3X5P6PdM2ioJ4SU0HmZ6uskUdOvg7d8
	T/WC46Mxdk3YsRNqsDQUNexJ2ANtJXS7cKzejq0=
X-Google-Smtp-Source: AA0mqf4idw8LA5Zs915S17bWZni+yeB3zT3cm+Krv8BH2YjnapFZa8UCZvbsnn+GWg3vtZ4kDsHEhQ==
X-Received: by 2002:a62:ee05:0:b0:56b:b253:36da with SMTP id e5-20020a62ee05000000b0056bb25336damr2383701pfi.59.1668892534149;
        Sat, 19 Nov 2022 13:15:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/35] lttng-modules: upgrade 2.13.5 -> 2.13.7
Date: Sat, 19 Nov 2022 11:14:45 -1000
Message-Id: <9d80f9260da5b16e157d9aa8dc181a12785cb28e.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173546

From: Richard Purdie <richard.purdie@linuxfoundation.org>

2022-09-30 (National Day for Truth and Reconciliation) LTTng modules 2.13.7
	* Fix: handle integer capture page faults as skip field

2022-09-30 (National Day for Truth and Reconciliation) LTTng modules 2.13.6
	* Fix: bytecode validator: reject specialized load field/context ref instructions
	* Fix: bytecode validator: reject specialized load instructions
	* Fix: honor "user" attribute for array/sequence of user integers
	* wrapper: powerpc64: fix kernel crash caused by do_get_kallsyms
	* Fix: event notification: Remove duplicate event enabled check
	* Fix: event notification capture: validate buffer length
	* Fix: handle capture page faults as skip field
	* Fix: event notification capture error handling
	* Fix: capture_sequence_element_{un,}signed: handle user-space input
	* Fix: notification capture: handle userspace strings
	* Implement lttng_msgpack_write_user_str
	* Fix: bytecode interpreter: LOAD_FIELD: handle user fields
	* Fix: move "user" attribute from field to type
	* Introduce lttng_copy_from_user_check_nofault
	* fix: adjust range v5.10.137 in block probe

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1243d6afc075e3c89ca69af214e70c0d159cb832)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
index 00095d6ab7..49c584dff4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "eceb3428d80e85a9f008425beb9526195c9f7f02b302f28add56df53aef3e708"
+SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


