Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7963C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 18:55:03 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.157878.1698692093364829304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 11:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HugucNq1;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507b9408c61so6730194e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698692091; x=1699296891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2Kq+HQOstmxmUndhqJ2Th4Jb2lTG3BOZvLav+c4b18=;
        b=HugucNq1WBEn+eyBPvN6vD/agWF4X5vKfaV4tsJsbsIVSa/g5FaYO5gjUrgD0iEEAZ
         I3zFIQDRFYwzV9vAwWp5D3SR81iXjf2MYSTKjWAXMwpW5x41nUC3cJHxNeEFTzyvbZsn
         sqs8OSolo8vwh/Xj3i31E+lR8NWW0BG26ex2H6uh1h01uFNJlR6GIui0aEoQO7joLtT7
         1Mc/0U47UAKIpG8KY2qt+vl7PFaiuPZw1aKNiGVjEqvHEgexjfjm32XO0HkcNJPNpQUO
         aUwKhVtZxt73ad88c1JDlMsEaLgQjmnmFFvbG8z9U+iLNZRFUsNyiKezyz2Lbu1E9cFa
         7cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698692091; x=1699296891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2Kq+HQOstmxmUndhqJ2Th4Jb2lTG3BOZvLav+c4b18=;
        b=Z56lQGSo1Fk0kY2LrznL7+DlEOvzgDi5sG3+SGzc2ovG8dV4+QbiIXp7zT1LtkxSk+
         4EXIV6FncmUK/YHqKpsYeE4+KJaV4vzC0kJF8Ci2q78ylbdiNYgYuirtccFGlpqt0wwK
         PvLKeX32UnPgmITRJvUyolkKGC8NuIg1HYmqDiF/Df/HD6orFvLYx4xLL8OPVU4jMcjV
         Dq+aNXuB+zpSYaizXRyR+29++vPaZ8mh6U/nGWtdkqBt6H1UMa6Fyl1XHolbB2BZBGHN
         W7UXcH1GjOqH2c+rUiejNZKfvoX4okoMGrupXDHNcZNXIAHEJpfBSxF1J0dryq/hKBzb
         KP2w==
X-Gm-Message-State: AOJu0YyqbfRrGDXg7dNW1rnwKsdFGKgA0ZZ6GoODHqBLDrw+EoOs3Xsd
	D5IZrrvejj+WZuAeLHgbIuqjnpE/lAk=
X-Google-Smtp-Source: AGHT+IE4heJra5/gskle4C5KhoT7UIOwlgY1c6cGLJAaHYC0qL+jNCFIf0FKQXppU7Gxx5JdFUaIdA==
X-Received: by 2002:ac2:5216:0:b0:505:79f2:5c6c with SMTP id a22-20020ac25216000000b0050579f25c6cmr7005404lfl.6.1698692091032;
        Mon, 30 Oct 2023 11:54:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id dq4-20020a0560000cc400b0032326908972sm5384304wrb.17.2023.10.30.11.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 11:54:50 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2] license.bbclass: prefere plus singnal over append on IMAGE_CLASSES
Date: Mon, 30 Oct 2023 18:54:22 +0000
Message-ID: <20231030185421.1950019-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 18:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189807

The append override is much harder to remove so change that.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

 v2: fix typo in 'change'

 meta/classes-global/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index b2e0d3faba..b915d39acd 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -418,7 +418,7 @@ SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
-IMAGE_CLASSES:append = " license_image"
+IMAGE_CLASSES += "license_image"
 
 python do_populate_lic_setscene () {
     sstate_setscene(d)
-- 
2.42.0


