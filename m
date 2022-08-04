Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D155C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:10:05 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.5269.1659622201897309698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=V20k9pfP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso5398502pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uMAClPVSYUuQJe83+YiLapruH1TT1T/IiyD7uDnM/kg=;
        b=V20k9pfPx55mft8w4IVwbvTViAZ7jerx6zfaZluo4SxDIh4tO612fDq7G461rPdXeU
         9jQLgJOVdfHbaigjCr0kAUb/qjwkJ8ADSlKBa9WNmaRTJET26lozxTgZ4agXqWf885hZ
         +qSUZGnNk7o3ofKC2MZbvH0G+8xGH6tmwnQzhdN82eAcf78Pc8s/HZqI9ScrNuY8/joU
         ipbRfKf/nVeA4nx524xYwcpeuorDDD+m+0/SdOTTjdVnke2Vweonnyw/UArTZJN9EIe/
         7BSuRU1wMKqtb21hqhRNWF6PBgGdTljN1d35v9gO1wpDlpn7JpcTVOvl3RDi1ZNeYbiO
         FWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uMAClPVSYUuQJe83+YiLapruH1TT1T/IiyD7uDnM/kg=;
        b=dk3SNCzMpIz/W783VuNMVJJqg5vmSBaiv3bV1JtJGYTIS0/e0QV3QbWWNPNUAbN/js
         JfamGxR9fIfusaFmxjMzgQoZuwcjr3dx/7DNsAK7KhnlL4WswbPy9LKcTXQz4yI2CL84
         k0VBP2qtuZ5WCXMlmg8YpYLmBjnB8InPGjNWsh68Sk7OSXkKvY6MBKlCdhJLfe4M/7tF
         2TLSbwx9Q/d2zisns+Mt/vv4/cwV9yf8ITz9PQ/xeL0pwO33QR5dJdf7jk0ytKPN4DYN
         f6Hy4vfhffbkPhKf+pt6qAtAux01MWlxgO/7TahNr3Hif8p7KSSCDrzqxZJsAy5IEjds
         0h0g==
X-Gm-Message-State: ACgBeo3WYA7pn48jSffqNGDRPJU7CG6ggiV5sw5jkkBye0YtEyHBqLN0
	x7BDLF/jStvLek51cmOjreVoUtLY6n505m9Z
X-Google-Smtp-Source: 
 AA6agR7AQB8/faxEqOdnJvb+JIuTfbTG2ZDx1GunbjMK4ORv1RZW+Mu75ZUdrGtYcru4xgRULqEMKA==
X-Received: by 2002:a17:90b:1bcf:b0:1f5:53cf:c01d with SMTP id
 oa15-20020a17090b1bcf00b001f553cfc01dmr6937769pjb.37.1659622200705;
        Thu, 04 Aug 2022 07:10:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.09.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:09:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] strace: set COMPATIBLE_HOST for riscv32
Date: Thu,  4 Aug 2022 04:06:09 -1000
Message-Id: 
 <4d6b260bd356dab6d74cf771e52649e0a41cb7ce.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659621460.git.steve@sakoman.com>
References: <cover.1659621460.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:10:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168855

From: Mingli Yu <mingli.yu@windriver.com>

Disable the build on riscv32 as it's not supported on riscv32 [1].

[1] https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096db215da

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5276a9a845d0277936e9321ada296818f7bfd84b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/strace/strace_5.16.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.16.bb
index ae19318c20..23ffa25d29 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
@@ -19,6 +19,9 @@ SRC_URI[sha256sum] = "dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a83
 
 inherit autotools ptest
 
+# Not yet ported to rv32
+COMPATIBLE_HOST:riscv32 = "null"
+
 PACKAGECONFIG:class-target ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
-- 
2.25.1


