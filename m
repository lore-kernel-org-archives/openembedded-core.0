Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2C4C2BD09
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:17 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.95802.1719057489927922750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pSTQvu1g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70665289275so295932b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057489; x=1719662289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt2CnEw/jhOtezDwRE7UNBRYsYwls2bbNgXEWcmXr9w=;
        b=pSTQvu1g3rAHbYc7MYjTLNGI9hTeNb5gnNFF9S5pqklogHX4yerwMF2UOvj4aU30p8
         jVQJ9nyrc8f8A/aoytD++2WJZ5viRHpjEUIrsCXKfAJOXlR+c5DHWjcLoz/G3CtfFvmL
         kcKJN9tLc/xAoal1JANP+P5iNqh2iBVyqkjkFcyWFWO7uqIFKikRv6DAOHvOzgrXglQT
         HlMwCIU2oUm6NgjBo3+hFyQGJ6iH7wYJ+xChAsi0812c4RWjIHvT5u33qRHrDjpQC/Mz
         5Ga0G0pem/R4xt+oAavgWEFVbxneAjrWb+2RpTJSoynA30N2HKyyscbd2GpBWlxDyH8h
         xVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057489; x=1719662289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt2CnEw/jhOtezDwRE7UNBRYsYwls2bbNgXEWcmXr9w=;
        b=RVuNumprIjqLOfPPcumKDI7tmSv//bcVz2B+my3t1umnUuZptjAKK/1OnLZ2cTyxJ1
         LvUBGe306UxvNmv/RkS86NFB1JOAq9WsMKvHfcob8lf97KltwoPqYtPEpvNYB6ibl2Gp
         4ES9dGRzFLn5GHnTFTCHBdTsTADe4sSSH+RKSt5yC90O361MM9uimVCQp0tqIYnDaEA0
         zFiKwOkfleB9LZVTtdk8UBbvOWdUnf7Y0Zo23ahGm+zRdOyx1YGWrNq4ZTJY87uB8fUR
         mZ/Do7xhrRDtf0NUGpgh+ehiujO+pdeN283mcuLTVrwVNEkubCJT8eWyqev7QVPjScOF
         FG/A==
X-Gm-Message-State: AOJu0YzVv9hAxKW6iAgHVsUJ9XN4nudrfEIJE9KC4CbsVXIRztnR1Llh
	g2HYfjdDLIxUBtJcTchP2pZfGZrpnyE5KMI3FC4xt8RlJD5tf6FFiU0wRuIAqSfb4ltDemHESZ0
	T
X-Google-Smtp-Source: AGHT+IHtY1wX0JdyB/2x/kyc+FxEq6PQjAnZjurukR/IvX1bQVM4bshKBjZ/uy1E9v24haQcZ62Nbg==
X-Received: by 2002:a05:6a20:918c:b0:1b8:27dc:10c7 with SMTP id adf61e73a8af0-1bcec92c0b0mr1900142637.12.1719057489092;
        Sat, 22 Jun 2024 04:58:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] gobject-introspection: Do not hardcode objdump name
Date: Sat, 22 Jun 2024 04:57:34 -0700
Message-Id: <bbbb515f7df240b8679567cd3e04d6b4ccc65f6d.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201045

From: Khem Raj <raj.khem@gmail.com>

Use OBJDUMP variable in the script, this helps in using the lddwrapper
with recipes which maybe using different objdump tools e.g.l
llvm-objdump or vice-versa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c04b3e0e371859c159b76bff87a5b1299b51d0c8)
Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gobject-introspection/gobject-introspection_1.72.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
index 9a47e908b7..d935cbd905 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
@@ -103,7 +103,7 @@ EOF
         # for a different architecture
         cat > ${B}/g-ir-scanner-lddwrapper << EOF
 #!/bin/sh
-$OBJDUMP -p "\$@"
+\$OBJDUMP -p "\$@"
 EOF
         chmod +x ${B}/g-ir-scanner-lddwrapper
 
-- 
2.34.1


