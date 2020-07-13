Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.22355.1594655074992897449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 08:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=gdE0GpTC;
 spf=pass (domain: burtonini.com, ip: 209.85.128.65, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f65.google.com with SMTP id 22so10274wmg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXGXrPwxh+tIDBYt8GgihNcUdSQD9cmmrQ+xs7WcSJ4=;
        b=gdE0GpTCQbt1MiwdA93lf8w9AuVYR6hvFCzMskix2rsaUzdJsW9OaI0XUNxCh4N9BR
         V/o826pXqV8+Ud5tJkecbc/M5SiChUvShAvC30MML578Bnlcq7X2M45fT0I2/5JdV8N3
         ZtyaY/xy4ODS+uq4yo7hQG0yvPuXffsZ49AaJraJde7/LCRd3RzivaaEGlli508NGQk1
         gg0Jyp/XhInzrG8WKD0xpwurIBUxZpDHH2Q9GZZ7W36kpGCYbV/8SR+KkJS2MUNZGF2R
         UZMVvNzNSAq3Z+55hSdofZW5XNZ/HiMzy2XMxDU2VIZaxwnh0pgxbqpQiaax4RBMqpGi
         TGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXGXrPwxh+tIDBYt8GgihNcUdSQD9cmmrQ+xs7WcSJ4=;
        b=Vt7u51FCi000y7j4QnS79QiiUx5iab6+MobF5g4aE0LV7g9Eepk0OCf6LcmDjVLDri
         RB8rAoSVdO4T6CtWoau88BA1u1Tgj00Fp2xfuz+Ww3DMiu59HpiYIuYZzvQw5bOcCz3e
         WHmoMsbxeL9P+nnYSLCtG3y31NwwnIi6rskOLp/Al6j0e092hY/zx5Kwz8ODKF6EX/CZ
         DoC9XuNhkkybdDTgJ8RSzWIR7IORoQMuy2DlWqajcRqbKAw8Pdb4ETHD3QyP6BW+njem
         l3J6gdvFUprUBq/l+mb+Nimey0h/aDlFUz38GlzK68ljj53oeBXq7lPnFqIq9+2FyqaW
         xbqg==
X-Gm-Message-State: AOAM533iM04NDVssluHuIEeRZhmWi0TsQVyfOU/793EOQbOHdVsIWptG
	UFDFjHva8RVwQdkNevV8BjnNkFhaHHc=
X-Google-Smtp-Source: ABdhPJxVdpZE7mvblhi0D0KnRR2Z5UzaLDt59tBSaKx7sMRX7VcRu+RdY/U/qZCxs785IaHjrulYNQ==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr484259wmj.107.1594655073018;
        Mon, 13 Jul 2020 08:44:33 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id z8sm23553354wmg.39.2020.07.13.08.44.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:44:32 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: add PACKAGECONFIG for CoreSight support
Date: Mon, 13 Jul 2020 16:44:28 +0100
Message-Id: <20200713154428.389328-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

meta-arm has a recipe for OpenCSD, the CoreSight Trace Decoder library,
so add a PACKAGECONFIG so that users can enable the use of CoreSight in
perf builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c4b7b77e99..cf95df710f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 PACKAGECONFIG[cap] = ",,libcap"
+# Arm CoreSight
+PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG_remove_arc = "libunwind"
-- 
2.26.2

