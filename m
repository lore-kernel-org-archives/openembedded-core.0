Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35D4C282E7
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.22616.1659940991297304524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZJdx9iKp;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id s11so10017325edd.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TOjWdDVNKy8Gi6n8GZEqZqUu6YdnHLCbp4F+rLVQyxA=;
        b=ZJdx9iKp535BgN6/0nhUJlDKumKDBjvuO2rm8OGl5o69P8FiwPIxhiMN51SHcPT5OT
         tVOSoUBj9PBttnb1tg/GDhA87gfEPzqUsBEEhkabp3st4+D0z+ZfPjRm6juqdCEX+bbC
         0yoJ4rSmtKsy3pwkmfMJ44cLcXPqmMMF4BysKFViW1dFFhoFnYCqk7c9qeuYubOtihWT
         SnPJKB9g1gr6lRu3lZMtEayDgGY++RCsoxIDIZSYMnGnVuEUfyl8PER31n1EZ88zVOM7
         QhUXAgzptjk7S1tOmP9DgzV3oa9/3gTyQuAnmJpfO3s199knLVdxB9RpY5YkYzx5BaZW
         GLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TOjWdDVNKy8Gi6n8GZEqZqUu6YdnHLCbp4F+rLVQyxA=;
        b=eSU9MJTxY5XPZhTKCtMCCJCz3dcF0QWycDwdF7i0Gw0ymUR08WrPXf1OmAJDU6wnCl
         1BAPB1hm9qxB/FrytScEjwvJ99rLi2iklBoRG6M9tg79ptppRWVnNKmVFzbO5x4GORgA
         rzZSe3U5vVigG+zOyd5BE5tA6EpBh/fr8fspF6zPk0L9yhl9UE2ONlFWPRpP/KX4WVat
         EVLLUdarFcyPHaDsOzkzT2RKrQjK4gjvlo8l8aCZRuTQLEq3gdMvf9FeW/9aOWXqWkd4
         P1m7sOe0F6o2sf0MM1I/i1xSIOIqfz/q2cW6nyRtNYShBCJG1lyYFiWOYYbHYGiIAFEw
         gtiA==
X-Gm-Message-State: ACgBeo0ibDrByy1qZCdy2UpNlzX/pCry6KsO9pjMhcMVcAx6fk5uE6ou
	hXr0qf0/mrbcFCniAbbg4ec3RDY+eOA=
X-Google-Smtp-Source: 
 AA6agR4zKvf+0EbFvPV85UYJvw9ORPStbOMiezEK/ytGu448pwz1fyK9nXoUSZTtgmo5LtkOLofybA==
X-Received: by 2002:a05:6402:4148:b0:440:cb9f:d10f with SMTP id
 x8-20020a056402414800b00440cb9fd10fmr1506938eda.77.1659940989915;
        Sun, 07 Aug 2022 23:43:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 33/44] python3-dtschema: upgrade 2022.7 -> 2022.8
Date: Mon,  8 Aug 2022 08:42:26 +0200
Message-Id: <20220808064237.3975347-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169057

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dtschema_2022.7.bb => python3-dtschema_2022.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.7.bb => python3-dtschema_2022.8.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.7.bb b/meta/recipes-devtools/python/python3-dtschema_2022.8.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.7.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.8.bb
index dd9092f449..e8c8ac6f92 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.7.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.8.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "2238753fa16bee7b26841cced75d745af777b896190f40aff5802992335201bb"
+SRC_URI[sha256sum] = "1befe7c9f74cea248a8b524cf6185ac48912a5b2aae96854d77cb94584433ca4"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.30.2


