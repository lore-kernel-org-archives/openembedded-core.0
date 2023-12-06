Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B9AC46CA7
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.32052.1701870971472187547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WxTVZSR+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d04d286bc0so33395155ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870970; x=1702475770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me1g5Q/VtzltC9oLbtijUJYuWxe4FRQ/YYIuZpKjJl8=;
        b=WxTVZSR+ywzW9l6sklg7lGRScLlMEacrhAfE4kb8DkHSJ2/7mCseIyskGDthlBAc1/
         abRzUlEZUx04A81QtgTnWcxdAdEGR4+niT72BDJ5c6xSQaUgoq2VKe2wRtfU8+0Gcr/d
         qQRn4a+9JBkUCRHnzSn4m1pO+Jv+PGKzRltShVQKr/UKARpZm/Bih3+cifVs4VGPJcK0
         8pE01ga+zXCAoh3krIe5yPhmM4xKTDI8c7sX8UFq+fyO57avDtQdzemC37g6evs3Npbm
         6buxAYO0k2/R0NBC99hm+dFZII1cbNzu0TCzrZK6m3TPocu0zuh6hG9mWxHoCQAjb79D
         LPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870970; x=1702475770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=me1g5Q/VtzltC9oLbtijUJYuWxe4FRQ/YYIuZpKjJl8=;
        b=sregd+vBK7ZGHk0ykLiTnRCsvKY1wEkaRkchq/x0rYOb5blE6MZnQNZxSspjFTo7YN
         TWILhHKAcoh23EM3TCBEkphDmkyLCMWrf7h20D0s3dyVCC9NGs1CNNn7gBBVSUcNQEIA
         hP+ZQLA3e7hinJArBrefbSCqnS+pf4GN6xu/P7F3yJ2dvMQHHb2q4ADBgMR9pcxpPUpB
         p3B2/ihQXS3N8x9DP0OaSMJ30H8T6zGWccfb928VWYV4cb7cs9Cnhcff5+W95nnl8/Kc
         vWHXF07uK7g9xdmWugGbTwa63w/8Ge8sALpc9qcghyhLo3kdlUVn8RJ5G8LWEybjInSf
         05AA==
X-Gm-Message-State: AOJu0YwxHi2uoBzYIhL0krE7talNSRABiHZcmtrkQ+Zjl7lRSCdo4SW5
	/MaJ1bUcm5s/4bOwRr1zVXWnNbPB+8ykKA+ZBMk=
X-Google-Smtp-Source: AGHT+IHzh2SKfXfOCzNhSScwEMboITGbwSEGa8wBKKBj0ygjeOHvm/38619pUb2e4ijGvQ22JQaRKg==
X-Received: by 2002:a17:902:7c13:b0:1d0:ab0e:9140 with SMTP id x19-20020a1709027c1300b001d0ab0e9140mr555238pll.139.1701870970603;
        Wed, 06 Dec 2023 05:56:10 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] qemu: ignore CVE-2021-20295 CVE-2023-2680
Date: Wed,  6 Dec 2023 03:55:49 -1000
Message-Id: <fe85b098c6819072731b05a913fb50b830941db5.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191892

From: Lee Chee Yang <chee.yang.lee@intel.com>

Ignore RHEL specific CVE-2021-20295 CVE-2023-2680.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a24915c35c..9dd90e8789 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -166,6 +166,13 @@ CVE_CHECK_WHITELIST += "CVE-2020-27661"
 # this bug related to windows specific.
 CVE_CHECK_WHITELIST += "CVE-2023-0664"
 
+# As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
+# RHEL specific issue
+CVE_CHECK_WHITELIST += "CVE-2023-2680"
+
+# Affected only `qemu-kvm` shipped with Red Hat Enterprise Linux 8.3 release.
+CVE_CHECK_WHITELIST += "CVE-2021-20295"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.34.1


