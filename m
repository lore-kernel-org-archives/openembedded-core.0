Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7206FC282EC
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:36:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.37890.1741613801056812747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G9YpUR2q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224191d92e4so70094315ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741613800; x=1742218600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU11L5Bon5V6WxJh0GHOIQjjRzFi0b0t+TzGR1sEcGs=;
        b=G9YpUR2qgtx93pm+xGt7TkCMLPHzs7pdIVJXuPDdYsMYb4mhcwMbyEpX+QeK96m9al
         d+trrCQhFcbngvYj0Mi6DrEgMsR6D/u5NQseBpR0nJgdlTwN3ve43sGV2BkDHgAoc0mr
         fnpmlY9DcOig+rLsuE9Wg2LyH+hbf1lKW3+e2qVWWBBoPvQRQNDCFNRy5pZ+aDM54/JA
         wz9D/ylhMwVpfDjZFZce0kQgGdeAxZbyYFdTZ2DpHV6f8A5xHegPhacrGMpL5gO+KYJm
         291U6qOXvvyMgESk48MDDKrv122rW6+0inQTBILhl5XPC5+aqBtM8pk8H2chGFQ1Ifmn
         kICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613800; x=1742218600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU11L5Bon5V6WxJh0GHOIQjjRzFi0b0t+TzGR1sEcGs=;
        b=EA7+hDlIq/czlGGskSyJfp3BymChlU3n6t5iEvc6eRVx0LKPi13ptWTQp8DJM7BY21
         R0FMQXX1IAHXCpE7RsPdKtU+9nrFESNlaWeeObLuPxZabWlunbOe0TnqqIjSE/E7FTaC
         eO4NqFs82BPWVWmSVQCbcUJxvld9r1gWZaf8fINZ3+miGBU9CT/i7b5isxEQY6NenUXo
         iUkUD1auxHPzkI6t8RpPXzUO+zIHrvSWVMj5+crmkZJqq4a5i3PGU3hvujTZExsFiF8L
         unF3XcYywLUFGSH4rOsD6+OW2HX5lh5pq2CobVtTVy0Od9wdEqwNLDIkYYZwQAc2fxcl
         Rfaw==
X-Gm-Message-State: AOJu0YwUuUyC7FTsxkpiy+NF/2thDAJ0OjI2V4xZISBZ/HesQbNxGzSw
	WNNSfwXNC4aivv5R3bcqNTy2U76vyGYWv/D/KB5XK2RvReVLs+40FVXXm3VWKu9gdB7XDLdjhFz
	D
X-Gm-Gg: ASbGncuJyh7IK1yRuyTb6Rgo4yghF09mM8os2c6AzWXZWp5OAGb0qfInSeJ/UrbY1Y9
	cMPBiCm5ZLZ8LlIpL4ugN3xgT8brFk+9mdVMmfIhROba1o1At0qPOrV8MDKApzwvRratlNHH9N6
	rRLoaUbOyJbMmGRNvDppdETpBn+T/cm3Cex4ytpvHuiyk5l6Ny+scZNqauLDD74LHawBJ3f+Tkp
	y1cdNCVzz1WY4u+1HGerZ6YeTjBXxzXZFl87w/NMofMYqrPkv1OhCqzFhWJ1QBYyb1gh6Sos/u8
	AIvNcQXT0OzfDbPi05dhCqk/cfMh3yxMB2VR
X-Google-Smtp-Source: AGHT+IHzBSzw4ed3tKJeF+T5aDqsHnWqT3iLQPDagvp+3/pwhVVeRiBQqoXW39qMEOf41xgOb1RmXA==
X-Received: by 2002:a17:903:40cb:b0:224:c47:cb7 with SMTP id d9443c01a7336-22428505f24mr234539715ad.0.1741613800380;
        Mon, 10 Mar 2025 06:36:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2ea8:96c2:9f70:5c1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfbcsm77820095ad.21.2025.03.10.06.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:36:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] tzcode-native: Fix compiler setting from 2023d version
Date: Mon, 10 Mar 2025 06:36:24 -0700
Message-ID: <0216c229d5c60d0023b0a7d6e8ee41bdfa16f8ef.1741613667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741613667.git.steve@sakoman.com>
References: <cover.1741613667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 13:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212526

From: Alessio Cascone <alessio.cascone@vimar.com>

Starting from 2023d version, tzcode makefile does not use anymore "cc"
variable for C compiler, due to Makefile refactoring.
Replacing "cc" with "CC" fixes the issue.

Signed-off-by: Alessio Cascone <alessio.cascone@vimar.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3cdfca5ef84ed2054faef9abddef3aeed930e17)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/tzcode-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index d0b23a9d80..dc9f076377 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -4,7 +4,7 @@ SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
 inherit native
 
-EXTRA_OEMAKE += "cc='${CC}'"
+EXTRA_OEMAKE += "CC='${CC}'"
 
 do_install () {
         install -d ${D}${bindir}/
-- 
2.43.0


