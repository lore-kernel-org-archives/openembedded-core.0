Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E68CCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 09:17:45 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.38563.1727342257533099506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 02:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7ajnjMB;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so700876a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727342256; x=1727947056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhJxZ9d/qoRucRVeiPiPbY4+sg4LWC4WXfVPTiklE2M=;
        b=Z7ajnjMBlpnbqtzns6vTpScb+fpiDwC9Kg8tA4FReoIi8nz5hPX3XWt7hB6D5alwy9
         eR3Kwx1pWGvxZvlfYAoPNgSRATZI/5j6u7KFTEBNVspzSYcOea+BFrHcvMoI5TJeKZZh
         s1zv96kER5kQbEv5ev9vcr2dtqzHCKxuUg+lgWDx7aEB3uOjQkw0nat8ZpRhDWiQ8xzG
         DIaBSoK2znK/Rk45ECpW465aW10F2xAzaBFHE+jTJEs+f2UkadSj6wylxipc+oTJ+dvY
         HZhf9tg9mVlGZx37KvX4OnnNJDBZEK4w/JjctSY1qkcSKj1zQG4Kdecj/dxnD1GpgorE
         EGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727342256; x=1727947056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhJxZ9d/qoRucRVeiPiPbY4+sg4LWC4WXfVPTiklE2M=;
        b=SlWoxGa4WZtbmkFJIs8HHJm4itKo98K49flI5L+tA2iFSTeGwsTtUfCFrCTVHO46YH
         7wXNHWf30ISAQ/9D+frB8Ho9GhfXr8CvfntzeSMOJ+NdPWq9VyktQiGK6n6Ckv6v45bl
         cjHFi8jpnrTmmD+Rj266gL5GDAnFSonV4oJDuFp8HUq0tP/JBmfpahVQ1Zl6pIATmh7K
         quurq4oqJbwJJHDtyzgN3UQxEFYqOVkvt0E+zra8jAcEom+vYIMQuUSoyI5bUbtJaMxH
         kWYB4XjRP2j7zpuHU072DKe2PyEWG7jEZLocoMxeb43CflbfzuclKIiecfXYD0pn7V5v
         /AVQ==
X-Gm-Message-State: AOJu0Yzd3myEkoimFy1iCp0sYb2sS2odXDqFDkmLk4HyJUT3tU0CPBw0
	XwR1DXBXi5VTLtc8ZYnideS/6yDyga8gUCEEWlZNZioNwTlBaiJsRrVknf2t
X-Google-Smtp-Source: AGHT+IFaHGzc3No4MGix3riNZq1NGAc9kr45jwhuQdT103yxUPH+kXiUz9qWKz4GvwyCm0J7P17oSw==
X-Received: by 2002:a05:6402:2743:b0:5c3:cc44:6c7c with SMTP id 4fb4d7f45d1cf-5c72063092cmr4544058a12.19.1727342255391;
        Thu, 26 Sep 2024 02:17:35 -0700 (PDT)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c87a2059b7sm371920a12.82.2024.09.26.02.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:17:34 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][scarthgap][PATCH] lib/oe/package-manager: optimize install_complementary
Date: Thu, 26 Sep 2024 11:17:31 +0200
Message-ID: <20240926091731.2008047-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 09:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204970

We are rewriting the globs variable, so it can't be None, but rather a
string. E.g. the lines above.

if globs is None:
    globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY')

As globs is now a string, we need to test for empty string instead of
compare with None.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/lib/oe/package_manager/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index d3b2317894..1d923c436e 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -365,7 +365,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 for complementary_linguas in (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
                     globs += (" " + complementary_linguas) % lang
 
-        if globs is None:
+        if not globs:
             return
 
         # we need to write the list of installed packages to a file because the
-- 
2.45.2


