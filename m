Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09166C001B1
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:59 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.291.1686926278100367569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LnDVcejx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b50394a7f2so5447405ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926277; x=1689518277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAb+yaDyA7Tqpwhho5ibVdnnx3CKoxfeXA11J768gY4=;
        b=LnDVcejxz3hdCz5xo6JHrgA4K0NszYo9WkVODy+EESSFrzsr2DXRY1EUoKvelnUy8H
         1cifFkObgaLvLWq+JkpPvYP+oDJWLw7O51ahAdAcpkjRaGUcgvdxJ6dDGrIg0AMnnR/A
         TrBZFH0gAhMYgTR84vvMI4RNtvB+Vb8UbAfVdLvpre+ucmtXvQiNgwAgbPHlnmL9D2Z7
         n1zR6QVGpJWGpihcrEI6p6YjfHSq7g7w9Od/c0NAnuRC0udNl1D6IUYfaWDH60EuwydD
         N9lPcX04iadzRIkAfdIe/PaYdUB9MiyRYe5Xu45hGugpoiqzjHyc1Uw1BjYLvz/VD0Kt
         xTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926277; x=1689518277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAb+yaDyA7Tqpwhho5ibVdnnx3CKoxfeXA11J768gY4=;
        b=I63hvA5SUYfzoaxDKSAc+Xs6qHWLr8U3CP3leuvMr0KX71VKXgnuub6kp2tgg2pk+c
         6SpDcBC4rwXgxDqelNnros3qDiIAntbWxLJfVx08n3oaGQUYU6lLP44+E0KCbtEqZiOp
         k1rnkIE26uryIWRiCmabWIKS1uJf0DlGjllAm+9Kv6o7YCS7ZIX2Q4MdkIITLDTImcBo
         8uiluerh5gEiZx36S7kwF+NY7nRcFWHF+qA2i/fzzGATyezeo06VOpS6WYPC+SkoZwxo
         EReArjrqHfNR8QM36/aDO0I6B+iFXpSN8fvFFu+sgTCgkxCts5hInAwESwi+o4XCK+7I
         /oTQ==
X-Gm-Message-State: AC+VfDzMaiLJn828KWi1Da2KfCBStdgJ3FlrOTTBsdpIntrcG9yYangA
	FXmaR6Y0Kv8WPaJ94KVV6FSLbppPbu0vWJQ3Pzo=
X-Google-Smtp-Source: ACHHUZ4rdMYkB9u41ffbuDCQ6I/4ym8Al+HIG7PRnPs1tz+jLBWGSEUYE/xDIi3cd9g5prf6jxlpvw==
X-Received: by 2002:a17:902:8647:b0:1b3:97a7:c106 with SMTP id y7-20020a170902864700b001b397a7c106mr1613099plt.52.1686926277067;
        Fri, 16 Jun 2023 07:37:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/24] connman: fix warning by specifying runstatedir at configure time
Date: Fri, 16 Jun 2023 04:37:12 -1000
Message-Id: <8ea652072f78cce76996ceefe3559a9c0fbc35c8.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183042

From: Marc Ferland <ferlandm@amotus.ca>

Without this patch, systemd complains on startup with messages similar
to:

systemd-tmpfiles[128]: /etc/tmpfiles.d/connman_resolvconf.conf:1: Line references path below legacy directory /var/run/, updating /var/run/connman → /run/connman; please update the tmpfiles.d/ drop-in file accordingly.
systemd-tmpfiles[172]: /etc/tmpfiles.d/connman_resolvconf.conf:1: Line references path below legacy directory /var/run/, updating /var/run/connman → /run/connman; please update the tmpfiles.d/ drop-in file accordingly.

By default, connman will use "/var/run/connman" for runstatedir
instead of the now recommended "/run/connman".

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d17776765a99a4ae327797206ef2a8a735ce87b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/connman/connman.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d7af94f792..7487ca0d0c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     --enable-tools \
     --disable-polkit \
+    --runstatedir=/run \
 "
 # For smooth operation it would be best to start only one wireless daemon at a time.
 # If wpa-supplicant is running, connman will use it preferentially.
-- 
2.34.1


