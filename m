Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BB4C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 20:54:02 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.27655.1634504041295488678
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 13:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kd9yr1il;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id b14so77187plg.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 13:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PqYZ7W3O58DppVIsVU9UJyYjMqRLGIF/u3gplF0g1Wc=;
        b=kd9yr1iliPXUpVyCD8ESluiKOwsUM9Ip2v3aV8ECvAljqeescTU+NL0yRIzscMgRUy
         vE7k/Kj2kGWxfncVrs0HKxo6RFUuvkb4bXpT1mOeZ3ER0Jw54NJY5UoBBNHEnvwobrjP
         Yxmk52Q8RJPmjAWNERvdcD5v/Xb78npcHLHG5f5GusM7WIeSlGnvqanmdE/GJwCY4F/5
         05T9mXC+frC7XRGkY+UNa4tPGueGixqvMMHK6rBU+h5fJWYnZ63sRuRpKLEK4XiZ47hX
         Q8lG+/GM/pwW/NuxH/1wXzt8OmNG8zy4U+jg4RZi29GMT5m/D6Jyxyn5fTikJ+W0lWkc
         OVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PqYZ7W3O58DppVIsVU9UJyYjMqRLGIF/u3gplF0g1Wc=;
        b=S/CaesXodFYJeeg6YLJ0N0KVPViIEB3mY7yojtrLf4dy2wubfHu3BZL24hHpRvUreK
         cUDr1RRElj7xRpiqttGOXb9X7st6mfUFvN0EeqqybViXMWjObBhRVIfU4a+aLn5DlD5A
         LMkOBss7PDkwkkZcBgJdBdkQkBCDMgs2ty1+AA2+LnkEzMOvE5AIMwPG4G24G3mCnj2d
         Byj0fO3HWLsnQEZQ8/9OcjaZW0dLfDmEyATmv4AW9dTH0AqnAfNK/r4cVA51m7Zs/Eva
         78vZLAADb7AssZgdqgkqr5wq44yNsr9RvDto7in0p/y+C8zmh/xIJr+GfoxJg948/YvV
         xASA==
X-Gm-Message-State: AOAM532ky1elkuzzZ3EdeA1K0EBMI3EOWADHbD1XJDCCy7vht/wqQ3d5
	k3eeSuy+BmCipOMj/Z0UNf8ljxDnuBw=
X-Google-Smtp-Source: 
 ABdhPJwjsAG0sunSnmxo3ZiGALeR9NnSQ+/xqbejti4DKmGLHQZmdk7+cqfkGqzPIm4x9wzDjSinNQ==
X-Received: by 2002:a17:90b:3687:: with SMTP id
 mj7mr43712430pjb.196.1634504040503;
        Sun, 17 Oct 2021 13:54:00 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 k1sm10593474pjj.54.2021.10.17.13.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 13:54:00 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] python3-packaging: BBCLASSEXTEND nativesdk
Date: Sun, 17 Oct 2021 20:53:50 +0000
Message-Id: <20211017205350.555256-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 20:54:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157045

python3-setuptools-scm RDEPENDS on it for nativesdk

Fixes:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2766/steps/13/logs/warnings

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3-packaging_21.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-packaging_21.0.bb b/meta/recipes-devtools/python/python3-packaging_21.0.bb
index aef3ccae9a..f20f8886a4 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49
 
 inherit pypi setuptools3
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS += "${PYTHON_PN}-setuptools-native"
 RDEPENDS:${PN} += "${PYTHON_PN}-pyparsing"
-- 
2.30.2


