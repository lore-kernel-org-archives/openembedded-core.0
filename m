Return-Path: <sebastian.suesens@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538DBC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 06:27:23 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.2974.1655188033179838394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JxfQjwBR;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: sebastian.suesens@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id v1so15104993ejg.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Olfq3QZ7n9TPKRc76m+PSFJOYxhraoHmKuWL26uA7tw=;
        b=JxfQjwBR6BDsQbjplEUAXQsOIqFG5MQQcsgOkVD4Vsgw82N8KPHIzMmRJanGpUolZZ
         A0s1XBCyYm0QpYVSkZf3xOa0XEK13L10WdlaxDwoX5KjI6VOqqX0/F6DZTauN+L2Zn4x
         jfCPNwZacp2MEFVHo4tifWLIWH5nUbH82eMIk2Mii1nBedDDHneggsv0N6usCv/+wQy8
         L5cOyX7NALxC7YpqODq+Wbg7rpejNr/IYURxBDiRKk6Tw5PzrZbbme30F2AyRhy3Xomm
         yujNGrRTy+yUdaEQxu9PYQ5KhcJXL2d9Odjwcd95/kk9OB1Y1V6ODJaP9ettUYQJ3X/4
         gKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Olfq3QZ7n9TPKRc76m+PSFJOYxhraoHmKuWL26uA7tw=;
        b=E4zqlUo+FS/o+4+DxWSITCTIdwldzCGdl/C2A6QbNnmXHaP7CbmwuR6TuPqFEj3Okv
         zfkvRgLX1X/3x4kL+ThxHjdb1OgOlEsHXTYtSficzWp0Tk9s1Rf3aGZyJd9PEVTL8CuY
         +LnuOATlsr5wQYuPb/PHSAN4KI0AkFIHcIkvsGySnAazvAibxObnG+aXbtD/symTId/K
         8be9Y+C07T/MBNWeMFtAZ5q6WmRcAhJdy4xArSAVIVpR+3plglVMr6jxabIcX4Ul6RGv
         Qxx0Cbc8sQBtdrG6bmUe+nT5XkrpnNfm/o+0cCSYAAIxmjo18SY4jWbmxGRiTu1SPNVC
         kFnQ==
X-Gm-Message-State: AOAM530Utt5Cwo4CI5PoME3D3ubqFciG+ho2oe8ZcFbwQFppod+98zCA
	88Z28mQY2c13QG1dJZP6aTWSroL5+l1o5QaU5O0=
X-Google-Smtp-Source: 
 ABdhPJwbsELlhfel7WJuGtMbfCSr988cp7lHNmF+EG080wklus0Ms+oK/ov1QXp0RoJII7jHUercYw==
X-Received: by 2002:a17:906:748a:b0:712:2427:3a8 with SMTP id
 e10-20020a170906748a00b00712242703a8mr2974264ejl.220.1655188031823;
        Mon, 13 Jun 2022 23:27:11 -0700 (PDT)
Received: from ssuesens-qemu.fritz.box
 (p200300d98f3c7d00bcbc9443c92a3bee.dip0.t-ipconnect.de.
 [2003:d9:8f3c:7d00:bcbc:9443:c92a:3bee])
        by smtp.gmail.com with ESMTPSA id
 t10-20020a170906178a00b00711d5baae0esm4684374eje.145.2022.06.13.23.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 23:27:11 -0700 (PDT)
From: Sebastian Suesens <sebastian.suesens@gmail.com>
X-Google-Original-From: Sebastian Suesens <Sebastian.Suesens@baslerweb.com>
To: openembedded-core@lists.openembedded.org
Cc: ssuesens <sebastian.suesens@baslerweb.com>
Subject: [master][PATCH v2 3/3] xwayland.weston-start: adaption of X11-unix
 folder
Date: Tue, 14 Jun 2022 08:27:07 +0200
Message-Id: <20220614062707.2946041-3-Sebastian.Suesens@baslerweb.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614062707.2946041-1-Sebastian.Suesens@baslerweb.com>
References: <20220614062707.2946041-1-Sebastian.Suesens@baslerweb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 06:27:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166878

From: ssuesens <sebastian.suesens@baslerweb.com>

changed permission of X11-unix to 775
changed owner of X11-unix to root:video

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
---
 meta/recipes-graphics/wayland/weston/xwayland.weston-start | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
index db384b1a53..342ac8d129 100644
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -1,5 +1,6 @@
 #!/bin/sh
 
 if type Xwayland  >/dev/null 2>/dev/null; then
-	mkdir -p /tmp/.X11-unix
+	mkdir -m 775 -p /tmp/.X11-unix
+	chown root:video /tmp/.X11-unix
 fi
-- 
2.25.1


