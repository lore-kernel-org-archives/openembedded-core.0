Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815A7CD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 06:33:22 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9139.1777876392852117383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2026 23:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Vp4AS2/o;
 spf=pass (domain: mvista.com, ip: 74.125.82.53, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c1a170a50so4687060c88.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2026 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777876392; x=1778481192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/EvFTiTgqa5LB2eGDaSIHn1ucYPoIt1aZdj4nCH2Sg=;
        b=Vp4AS2/o4pOVh4wtaUwujlhbE0vxxbAeB5gcrMeQHRt9Qoc6uIUAwbVLAAad9BWiT6
         B/9LRPZKCHbvzBQpDigFPg0eWjJ+uMrTZM4r7T7YUKECkkUtqfB1fvAz1k/hoRG+/NI8
         g7dQEbTRDwOZleMQUcHOCv8Cnc8+3Y0Ge19cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777876392; x=1778481192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/EvFTiTgqa5LB2eGDaSIHn1ucYPoIt1aZdj4nCH2Sg=;
        b=maz3b7JhKiiaZJjIi8llwg86ucdidmUdrBvEbHhHJFdWk8Jd2wbCnOOz1p1vGq6BDe
         1iZiMYWob3UqbCbWdLXAFqvvI2hZgvPCbakJGGd4Et5T+vX8wyUn70R0xeyvr70MEpf7
         K8vFOujbjlTIYuLUmjGc87dCZLMhJHnx8p74FS2LLHLSCRz4wxUYNDKoL6GahZLDbhMW
         plmfsnPdSxCgKzAf0KNnIUUWZOUWwyZMgoTskfFrbZqeamvltMqOIZvJOlmZ3vBz53sJ
         KVd5aBm347ozBINwuA4FEAw5W6zBqtZmt/6mdZSiUV6uEvXqA9YmQozvh3Ei3YSls+DO
         egnA==
X-Gm-Message-State: AOJu0YyhAIiqWUtdwfxIDuSa9CErQSYI8+9PxVRWS0nZpGhg3/178kyR
	JyY2gL+/mdKrqLQw7FeosBXdhwEeip3XjdUwm4IAyJlBIBp9f9wHYi2wzhzY7Y96XqcycFjdc3F
	8PMsvH4A=
X-Gm-Gg: AeBDiesfhgBhhyh/Jtwv06pYu7O5h4zsIfhmlzlJTuzzYFkuR9jD1PA1lJ8FvsFGeGb
	lvUXFwKXcVXU/fiFD/Q9JCA75tsxO5pc6gXS3Y0Mq4DPRd/WUhueUziJWkWzlKS5hBfLYHznVx7
	4QUrzKUL9QgmuOu+hn1x9C8emVZIuoqCQ5yUQmBGeqF/zp/E0OkOTsAYCQqcBBdimFx41qUUxi2
	OEP1pnXM04rmODIKDMQFQqh8z+1HTiYQH06GJTycV7uuJOuM9mCYBsblshDptP9+W7qBFbfUgsG
	VIn/CFjEl1Ql0P3PprsKywx9wgA816+lsq2TQeE4e6+Ey+ySABATNoB2Z1sJ3qubozKL0HJ4l09
	FFKoY3ioIT0yQds3yx04sdqYpHu4FoMR0qm35jqkYso6HWmc3Ajak3GqHbvz2eAyHv2esYKkfZ0
	4NGetWvCJNs1FO7+JRPzZ+mbUumn8/NM6NHft8NbTNV0lqCTQ=
X-Received: by 2002:a05:7022:43a6:b0:123:2ee9:d1b3 with SMTP id a92af1059eb24-12dfd7d1a26mr3484724c88.2.1777876391991;
        Sun, 03 May 2026 23:33:11 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df81ec067sm14995802c88.0.2026.05.03.23.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:33:11 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 3/3] libexif: upgrade 0.6.25 -> 0.6.26
Date: Mon,  4 May 2026 12:01:59 +0530
Message-ID: <20260504063159.30681-3-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260504063159.30681-1-hprajapati@mvista.com>
References: <20260504063159.30681-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 06:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236433

Release notes [1]:

libexif-0.6.26 (2026-04-14):

* Security issues fixed:
  * CVE-2026-40386: An unsigned integer underflow in Fuji and Olympus makernote handling
  * CVE-2026-40385: An unsigned integer overflow on 32bit systems in Nikon makernote handling
  * CVE-2026-32775: A buffer overwrite via integer underflow in makernote handling

* handle JPEG APP3 marker

* added EXIF_TAG_IMAGE_DEPTH tag

* translations updated: Arabic, German, Spanish, Polish, Romanian,
* Serbian, Swedish, Ukrainian, Chinese

[1] https://github.com/libexif/libexif/releases/tag/v0.6.26

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libexif/{libexif_0.6.25.bb => libexif_0.6.26.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libexif/{libexif_0.6.25.bb => libexif_0.6.26.bb} (93%)

diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipes-support/libexif/libexif_0.6.26.bb
similarity index 93%
rename from meta/recipes-support/libexif/libexif_0.6.25.bb
rename to meta/recipes-support/libexif/libexif_0.6.26.bb
index c57855303f..56b2e1e168 100644
--- a/meta/recipes-support/libexif/libexif_0.6.25.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307"
+SRC_URI[sha256sum] = "0830ed253fceeb60444fb309598bc8a9491d3007dc054aad3a50a347c5597c57"
 
 inherit autotools gettext github-releases ptest
 
-- 
2.50.1


