Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5369EC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 18:00:16 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.1649.1678816807931383213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 11:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W+Qwd90w;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso15974870pjs.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678816807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uDhPaKnnXqTLBOAFj3DkMGb7J2YWq+K1z/D0MBXTo8=;
        b=W+Qwd90w8oJCbqhojmpS6BQauvcwbwsKxZTrxZMeSXMk7/3NYiI3Kdu9+WIJkStLlr
         F1Sf3swCCu3A63KjsvOj2mQPz3HNwUm/rlYYTPagm8Md+PjwQffaE4Q+LuNmmFena278
         GdXEIApeXhx4bwReJjtbeDT1eAwrIiYeQoWVHdGOTzAKLU82971rh8XG9IONfUOpIGPS
         JXCKiIGjdqfky3Vj/TP2Ul/i58hWkGwy7BBAJrosm6R0yWuwpSo2EseqiLI1bGUUXNyu
         +mg7x6d+OKVAMF38YbtEZi1av+wTJ6K96Hhpx0cvOijywkzubUeR4Efl7L0d5DYT0enZ
         HnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678816807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uDhPaKnnXqTLBOAFj3DkMGb7J2YWq+K1z/D0MBXTo8=;
        b=rzO0hBu1nhW6OZ5g1CLimZUTZgA/oJx3+0pgIzbggiV4inB7pq5I59EgMO0xeKc3rt
         TLhDccq7Cu9wIaX2jlgF0X7tPFZAomYrkeiERUaZahYA0nILNjvQVldhpmUyQYjVj/m5
         I57qdmJnn5Xdi5K4XSTDpjgtdBH7vKIpo6oM4QnuOeWPREaYCuq4oU4BczuTv69hcVQI
         H6Pr0w6ddabxu4jHKBaA/pUOYHrFUPa92HHzjdIerGsSAP0GtTht2+l+v422Ttl/GLsk
         i2wFiYVom8UgstxwWTMOm/McbgaYFih56Do+Wj/sGkJS7CkxabFnxBBqHPi1MqeUZ2Nz
         990A==
X-Gm-Message-State: AO0yUKW1GL70jAzNOlWnqdIig+KSFX5UAuNrGyFCtyRa3ipRkuQSO4Hy
	10fkAiUqDLbPJAxo5HEVT9yZpHxRleCcgw==
X-Google-Smtp-Source: AK7set8T0wwY8Sd5TX2RcqWcR2xznHrFoELE/+WQ4evR8NgxyPZkCI+DDc/kjyBQbbXbayy5PkojLQ==
X-Received: by 2002:a17:90b:380f:b0:239:ea16:5b13 with SMTP id mq15-20020a17090b380f00b00239ea165b13mr39998586pjb.14.1678816806958;
        Tue, 14 Mar 2023 11:00:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::513a])
        by smtp.gmail.com with ESMTPSA id y17-20020a17090abd1100b0023d2fb0c3a2sm1995002pjr.46.2023.03.14.11.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:00:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemtap: Disable dangling-pointer warning
Date: Tue, 14 Mar 2023 11:00:04 -0700
Message-Id: <20230314180004.203287-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178515

This is to fix build in RISCV64

| In constructor 'symresolution_info::symresolution_info(systemtap_session&, bool)',
|     inlined from 'int semantic_pass_symbols(systemtap_session&)' at ../git/elaborate.cxx:1884:28:
| ../git/elaborate.cxx:2601:21: error: storing the address of local variable 'sym' in '*s.systemtap_session::symbol_resolver' [-Werror=dangling-pointer=]
|  2601 |   s.symbol_resolver = this; // save resolver for early PR25841 function resolution
|       |   ~~~~~~~~~~~~~~~~~~^~~~~~
| ../git/elaborate.cxx: In function 'int semantic_pass_symbols(systemtap_session&)':
| ../git/elaborate.cxx:1884:22: note: 'sym' declared here
|  1884 |   symresolution_info sym (s);
|       |                      ^~~
| ../git/elaborate.cxx:1884:22: note: 's' declared here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 072fcb310a..d320a8a5e0 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -34,6 +34,9 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 inherit autotools gettext pkgconfig systemd
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
 
+# | ../git/elaborate.cxx:2601:21: error: storing the address of local variable 'sym' in '*s.systemtap_session::symbol_resolver' [-Werror=dangling-pointer=]
+CXXFLAGS += "-Wno-dangling-pointer"
+
 # exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
 FILES:${PN}-exporter = "${sysconfdir}/stap-exporter/* \
-- 
2.40.0


