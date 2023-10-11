Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBE0CD98E0
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:17 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.5129.1696982533861301655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bGSNrZ1n;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3af608eb367so4550876b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982533; x=1697587333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l45FllrHOs2ubLJNLB93qEbYTMYiyJANMAToegzS1+s=;
        b=bGSNrZ1nKvok0gmpD1kgHuUH1LlVfCWCqwpgVThQmfDBg5hNqerk0XMci5QVOAvFmC
         JZNWa0QHLfFJ7aG+H6rHVggOMWCE5kwWIGRmjRcVYtmYbT2camcOqlpxsQJgK5Z1WE2p
         blOAB38OY5cFFYMzX+n57859b0RkvQV7QlMhWZSAlAVmn3BL1wc2Rw/Pe7UtFGVnTA5/
         tcO1hJoP8hfGy7X/jcfIikdgNeGLD4dwSem0h9KZx63s7UBfIJD8niI1WLtSlXYKZkh7
         63YutNyB/TTOAYhywTUrYBkFezKSD9lzvHjtA4SZHiG5Hr4enEZlT2ulPmAiE5aeWUi3
         LBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982533; x=1697587333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l45FllrHOs2ubLJNLB93qEbYTMYiyJANMAToegzS1+s=;
        b=jW1kYALX5bm7f3G8+ImnkWMqkp4Lt/Z1vkpNT7rKVk6iXLHjlZB/EwG9X0BSCUfLwH
         guS246cqGnpEnl9rXhrsuq4B4bnmHkVdmU5i/MootDAkHps8FB4J0kMhPHg/bG7snKJX
         Pvass7SH2C+AcR20x6wXG89iPR9Gh0X6xtNGL0ukMzEswzpfQasUpfLJctVg7ojBvKiA
         J0Hgo9H9caJoaVUd8WyUjCPyCe++fCkZkBbTO1BqzCcRjF5SkbQLom6DhEUQXjG+oo8p
         RysHYI05o0GJHInIsyRa6urfOpWSP+31Wpga2WLv4z/PKi34y+695CC96wSYDL6EuQay
         v3xw==
X-Gm-Message-State: AOJu0YwbzB44ZMdFpb6YpJ2dSX1IN2nDb1F/NHWnh5BD8GLyP1QzBF8x
	/n6NYWN0np7SIGB1fNfFhdDxnL1rwekseiZ+dJ0=
X-Google-Smtp-Source: AGHT+IHPlgkpPMbA1Xfyvk/gtD0APMHrwBMjE85J+ubN3oxR3sqZLB4sJWX2u7sH+RFgAqraf/Q9hQ==
X-Received: by 2002:a05:6358:880e:b0:143:8e40:917b with SMTP id hv14-20020a056358880e00b001438e40917bmr21329586rwb.9.1696982532809;
        Tue, 10 Oct 2023 17:02:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/20] libxkbcommon: add CVE_PRODUCT
Date: Tue, 10 Oct 2023 14:01:28 -1000
Message-Id: <7d395b97e864bb081866eb029168aee7335ed98e.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188933

From: Emil Kronborg Andersen <emkan@prevas.dk>

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
(cherry picked from commit a23a4a3f156f5758dc4d9dcf1ab27c74302eb2a8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
index 01966c8973..62e9b158e4 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
@@ -36,3 +36,5 @@ python populate_packages:prepend () {
 RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data', d)}"
 
 BBCLASSEXTEND += "native"
+
+CVE_PRODUCT += "xkbcommon:libxkbcommon"
-- 
2.34.1


