Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C905C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:14 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.39301.1683653038726499986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=swgFbxX5;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9659e9bbff5so1113632966b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653047; x=1686245047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/lDEYQMIujW8pQI/yDx5oJPpmXU+AsKNC1kPrci2aE=;
        b=swgFbxX5TcIPQxXMMAV2v9v6PrzDJv5VBfzIzEGW64W/HyDerIKeBqxMj6hmwK668U
         MhJhXXLf+AunsjCR5VSWKo6RyB5ZqgyJhu0dNhwZYqmkdouWIkctUSXllifM/8yS0RIM
         uIXTB+mV+dkKEcDWheag+PFB6KysG0R1kKsppOytpRrfWFD/c9lrJU05S+NLPpJSgtsn
         R0idD9fBHAwPbfSLcjR8Z1xmHBUIua7xavlTu1DENKNq2xKcmbz/OG6jC2s2cE8obqMn
         IM/fQxOF0HO2CPIl1+PiSCna1GXT5GZ+nPwbLyHlnzaQ6sUMHteUVfjaISSPgetij2eq
         nJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653047; x=1686245047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/lDEYQMIujW8pQI/yDx5oJPpmXU+AsKNC1kPrci2aE=;
        b=XpDXgZrxZajsv+EySz48bRCpFsHWghDWVf3ZPe8yLHVW5pvrFBErxpxp/ixiDAi+w0
         ab9i8BE4UeaI6zgkN6rFQAuJJlDmfrd9K4Yz6ImNF7XulfkjcKvEvuowvXJ4+RORgvP2
         uws7mTFMqbEViV4TqzMNBrcX85Ekwbz1vrMOhyVnau3vem/8kt0mR7/zbqWD1gZuusCP
         jA8AZ8KNlvOyhnmBOFLcIzj9MM2xhU2ZTTE0mKJgv+BAJqkxY0m18MpTz8pn1NpZRTfA
         hFzbl2C7xxYL8aka9gxsv01pOp/TLJZ4tYgo9TyrhEL2Tg7WRmPmGBwSjZxNM9TPHWIL
         rahw==
X-Gm-Message-State: AC+VfDwE6XAHcQhKRs3/dQcOBG3a9JpjtUasoOST5WoLDjcY6nrqVc0v
	SDqd18UBMTKV1gvNl9+N0OEiAz9V7D0=
X-Google-Smtp-Source: ACHHUZ5vUsJE96Xqyafv5eBfH2KmM58T8NQdIsGZWq+UfjjOu2fFWpQnCH2v0vU4oEeq1WeCxlWpAw==
X-Received: by 2002:a17:906:4787:b0:94a:658e:1180 with SMTP id cw7-20020a170906478700b0094a658e1180mr14419677ejc.26.1683653047568;
        Tue, 09 May 2023 10:24:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/27] gcr: consider all versions, not only x.even.y
Date: Tue,  9 May 2023 19:23:44 +0200
Message-Id: <20230509172344.1516743-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181081

For example 4.1 is stable:
https://gitlab.gnome.org/GNOME/gcr/-/tags

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gcr/gcr_4.1.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.1.0.bb b/meta/recipes-gnome/gcr/gcr_4.1.0.bb
index 0cc466b6146..239d9806cce 100644
--- a/meta/recipes-gnome/gcr/gcr_4.1.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.1.0.bb
@@ -17,8 +17,7 @@ CFLAGS += "-D_GNU_SOURCE"
 
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
-inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
-UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
+inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspection gettext mime mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-- 
2.30.2


