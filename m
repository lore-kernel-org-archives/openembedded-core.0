Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73409C54E71
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:21 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.34193.1710728537398723145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ESdKApHt;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.42, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a485724ddaso1558961eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728536; x=1711333336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2CTucwdYy3ZRzqJuspiXjYOPeHlZVQkgWBUaptdRxs=;
        b=ESdKApHtFYAqdiIGqxEd+Eha6BrOSVaOYJZEpLzLl5Y0dLC7xzbWM7Bn3HsWGnJSl9
         yYA64+Ge2t92gcxnb2HEW4pt9ny9r5XDIhzc5ZjG9RLKjjrpiTKastNS7OfStr9kMVoX
         MnZKZxlvVdTaB1dAikfpU6uiGW49CWO0xygUCeQYI4VrG8H8puW1OxIc3pqUZjXm4eJp
         RbJaLgvIN1/+BCDQ8vt2lpq/GhY8mm2w7Ag4wtYrfejlOK5bQTIJUO1+w2jRgXEvgjDu
         hH2ZBogTxArZDxVgeRhsnPvxzVUIg2F8EjPgs4/kmps3OHYT1enfZuH24Ol0NH+0td8n
         NBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728536; x=1711333336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2CTucwdYy3ZRzqJuspiXjYOPeHlZVQkgWBUaptdRxs=;
        b=B6cjCSNE35I9wnQ0K/nhqwggExFbZ8PdB0A4i9QySIjE4KBDwCBQhW3Ey/Yk+7LLGY
         rSakPqvWXBBfqfvx1d/NzbVQu8sXJ7V2iyHJtns94NDNK0svONI3o0yQBdkivrvSPmkc
         +zfn0OTbjR4Zno4EVIBztHuJv043kZEbO881OpryBaGItAPRsMwGyml9denMZ8aOvbhR
         RhvhqN1ADK3ArROJ/iFWwgw4pJKx448cGmLXJODdmKo/F4ZOr1IBQXjQLGycOmUtxvY4
         TPk3FWsNOf5zlKozEpRG4FFISjihmmvlUpkbvRrcVfliQBCQWdqG1F8+zZPvEiDAiokq
         srpQ==
X-Gm-Message-State: AOJu0Yxyuoxbm9sO8qsjZw1eIZoSO5lBe9QR5+QeeMS+7JXK0R2QI+0N
	Y7Z7nlYL272Vg3qYSjCvH0Y8h7g9cM3oPAGNqXvdFlPVAU8fuINilhfaDJ5ugaJMo4tnTJhv+wX
	neBeRDw==
X-Google-Smtp-Source: AGHT+IHf7UUS2yAeLH9qnowT0GdS+Due/+JemYpT5EyhVXhJMscVsxywlaV1F/ENW2YtMrCZK5xkFQ==
X-Received: by 2002:a05:6358:720f:b0:178:f895:5978 with SMTP id h15-20020a056358720f00b00178f8955978mr13261781rwa.10.1710728536558;
        Sun, 17 Mar 2024 19:22:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/14] cve-update-nvd2-native: Remove rejected CVE from database
Date: Sun, 17 Mar 2024 16:21:52 -1000
Message-Id: <5b17b563908206667a7d14f390bd9b2de897774c.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197283

From: Yoann Congal <yoann.congal@smile.fr>

When a CVE is updated to be rejected, matching database entries must be
removed. Otherwise:
* an incremental update is not equivalent the to an initial download.
* rejected CVEs might still appear as Unpatched in cve-check.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f276a980b8930b98e6c8f0e1a865d77dfcfe5085)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 4b8d01fe84..1901641965 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -324,6 +324,10 @@ def update_db(conn, elt):
     vectorString = None
     cveId = elt['cve']['id']
     if elt['cve']['vulnStatus'] ==  "Rejected":
+        c = conn.cursor()
+        c.execute("delete from PRODUCTS where ID = ?;", [cveId])
+        c.execute("delete from NVD where ID = ?;", [cveId])
+        c.close()
         return
     cveDesc = ""
     for desc in elt['cve']['descriptions']:
-- 
2.34.1


