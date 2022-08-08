Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E37C25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.22609.1659940976814088192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=abDGLnmC;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id y13so14734587ejp.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ibHbnRUpnwKq3w7x5uGzD5nu2ITWkf/Ddd7Gvs1PzWY=;
        b=abDGLnmC5SiKfy51tgnf60IZXpdhGrrQOCc1ZSX5lbmxQmgfUYdutBFeGXNeDIL7aw
         OV0a/QAXoo0323b4wYp439io0DgzX35e8ItaGFLQXUc8ClJv+RgYFjcRGN71Ozbk59jZ
         iXlEFvtLloTmje8B2oVge+iAAm12Uvq0Tbbtj4WdK9xhe1XOodILg//e78JjtbJ+p5vd
         2ubi2yB3HUeH8lpBl+b5wl0J6ElEwy+flxeTpGLG4WCKqp2oWw7VT9N/zSRcUMlcpYwB
         5/RKJq19VHBL0GBheJdmi6J6G96BQx4yzC3cBjJhgM5FzrRSoRUVnt04rvpU6R1U12WV
         R/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ibHbnRUpnwKq3w7x5uGzD5nu2ITWkf/Ddd7Gvs1PzWY=;
        b=SGw+JwjwihZN9X63CjIJPAZ92nwJlmA2SmXCXYp1lsjZE7ghlP6zapQVjEBajxndml
         ifOiIrnAr+r5VqIb0uWFziW5nmPItVo83moi9VitKZucACgsJse6mfFeGTF+aa2hM+l2
         cTuIVdHziNQh4DR0n0aCpFdBjTJQDN1bnYpafU3g8By0aWT6kxbOxwyQQbpDoaJBfq6c
         CLEPiYemauJGAU7eT3FZ+/p81yCTTO3f1A6JPFTadBSoTN/ywMOWSl//gNFkj0zxsMPK
         6B6vSNgOU5lpOhzngqUgH+uFs2tR55CsDYsb4km5lEiJJiWOF/N5G0Vglf/3l5fADUPy
         1fIw==
X-Gm-Message-State: ACgBeo16VSou8BkXtmc5UA/PZuLeIzAV4wSod9y3vVgL1BljJUyB8s3E
	SjUCdSkqGS3jl9ouvxFEA3PWnP9TAXc=
X-Google-Smtp-Source: 
 AA6agR6B1XeKKfDBQPNexhGyUvSG75Qu8ATPKw6ccJUEIbd0Q0jogQR5jmqJ38WTk1VxVPPKsZdXEw==
X-Received: by 2002:a17:906:4fd5:b0:72e:ce13:2438 with SMTP id
 i21-20020a1709064fd500b0072ece132438mr13205262ejw.175.1659940975250;
        Sun, 07 Aug 2022 23:42:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 16/44] diffoscope: upgrade 218 -> 220
Date: Mon,  8 Aug 2022 08:42:09 +0200
Message-Id: <20220808064237.3975347-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169040

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_218.bb => diffoscope_220.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_218.bb => diffoscope_220.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_218.bb b/meta/recipes-support/diffoscope/diffoscope_220.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_218.bb
rename to meta/recipes-support/diffoscope/diffoscope_220.bb
index eceba47186..dc556477fa 100644
--- a/meta/recipes-support/diffoscope/diffoscope_218.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_220.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "68056e6d5382bfe16662c60d47bf710aa7b0ef43bfde1172fad694bc487279e3"
+SRC_URI[sha256sum] = "7873e13ac8b11b634ee3490b70b056c6a6bae9cfb794d6ba7cb43e7797b2a829"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


