Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FC4C61D9A
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.10874.1700620290150308183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HU8EQsdK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6cb7951d713so297668b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620289; x=1701225089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOeLmRyCeb1rC2JyrcEp/dp089/WafZNyh9IN0sPjZs=;
        b=HU8EQsdKakDbimuwBNc6EHNaYOoxyi/HjUzdRCp5peJj9E8M3m+FWLS8nX4BxHJxmc
         Fl1zY5lg4t2fKRcPYMCkqvDKucTVSO0BLazQeLqKFPYePjE06T7xFK07obRJnqifH4To
         Bj9Mp3MFjlxinQ97gMGfKv1WdpjPhwrKU+xqtpl8rvSSeRGev8QHf+mUD96JI+YFbWkV
         SBnd74NJxPfAJQZBvsWPWQKYSxTJTVuKA5HnbCUCAtNAtf+QXhGYFzuysBJ5RoKRTEdP
         5Sfflmb+/FwTgza/SHZbnKWrzHy1IeHGdeWtdVhyy02kdP+oO+7DN0/Gr8TZCUfGUYjv
         I6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620289; x=1701225089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOeLmRyCeb1rC2JyrcEp/dp089/WafZNyh9IN0sPjZs=;
        b=G+J2uuswQGdbnBaU5MwIgjeN/FZBesSlXKfK6NPCjIj5i9qxgdyrY2JkZ9z76tWPl/
         yBD4LpTT2iULTVacibK7AL2P5DlM90tHDKJSHgpjFeXSyJfAxnHWMVK20yyiuAoB1C5Z
         kxAG8k13GWxLrCcsWpp+ggGt1oN/8Hd4ijXLmu9MA0piNw7tMLX7mEbKZVGM/JunbaGb
         ke4Iyll8uj21DPhdNMylJkd87v2nKvoe85JpTe/4u/Mezfbdg+sWn+9DKksSslNmUXM1
         lyI7aeRPEeMRPHs8ORAiruree+vsnfBqnDQMzMRwTAHCUGVmU91Fnp2y5rQyvGz5/MaO
         bcqQ==
X-Gm-Message-State: AOJu0YytXNl0qHEe8JsseUQ5vvlvMLT4E3n/YGVWKGWlJgd3Ysvr0yQM
	8+nMhltqzqDAAHcHSTWYoGavjgzrdeYHhuQT3vAXKg==
X-Google-Smtp-Source: AGHT+IF5mfwWOnsBbbNcl+O/gMz6y77kk5NGqrlO122qQDestVdub0D5BEL0XJvLkXD6+KFKK4yEmw==
X-Received: by 2002:a05:6a00:2d17:b0:6cb:536b:1b3 with SMTP id fa23-20020a056a002d1700b006cb536b01b3mr7222893pfb.8.1700620288761;
        Tue, 21 Nov 2023 18:31:28 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] avahi: fix CVE-2023-38469
Date: Tue, 21 Nov 2023 16:31:03 -1000
Message-Id: <8bd1980fd4175be3dd68987f8c5653409b76f544.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191005

From: Meenali Gupta <meenali.gupta@windriver.com>

A vulnerability was found in Avahi, where a reachable assertion
exists in avahi_dns_packet_append_record.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2023-38469.patch          | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a2ad9058d6..c733f94e42 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://local-ping.patch \
            file://CVE-2023-38471.patch \
            file://CVE-2023-38470.patch \
+           file://CVE-2023-38469.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch
new file mode 100644
index 0000000000..f0f6c4bf7b
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch
@@ -0,0 +1,47 @@
+From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Mon, 23 Oct 2023 20:29:31 +0000
+Subject: [PATCH]core: reject overly long TXT resource records
+Closes https://github.com/lathiat/avahi/issues/455
+
+Upstream-Status: Backport [https://github.com/lathiat/avahi/pull/500/commits/a337a1ba7d15853fb56deef1f464529af6e3a1cf]
+CVE: CVE-2023-38469
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ avahi-core/rr.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/rr.c b/avahi-core/rr.c
+index 7fa0bee..b03a24c 100644
+--- a/avahi-core/rr.c
++++ b/avahi-core/rr.c
+@@ -32,6 +32,7 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/defs.h>
+
++#include "dns.h"
+ #include "rr.h"
+ #include "log.h"
+ #include "util.h"
+@@ -688,11 +689,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
+         case AVAHI_DNS_TYPE_TXT: {
+
+             AvahiStringList *strlst;
++            size_t used = 0;
+
+-            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next)
++            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next) {
+                 if (strlst->size > 255 || strlst->size <= 0)
+                     return 0;
+
++                used += 1+strlst->size;
++                if (used > AVAHI_DNS_RDATA_MAX)
++                    return 0;
++            }
++
+             return 1;
+         }
+     }
+--
+2.40.0
-- 
2.34.1


