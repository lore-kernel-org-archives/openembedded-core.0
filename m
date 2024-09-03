Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38831CD3447
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:42:31 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.26665.1725378148880717782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 08:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lOYhtx8e;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-277fdd7d468so943618fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725378147; x=1725982947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JycBj3YRAIr2Nk5u35h+LvnP+HGMEOx4rxNm7VoI2o4=;
        b=lOYhtx8epH6ncl7SGzVcbpe9ydMyn408WiNG2zI2o1JycDSEM7VA+46T+Pk2iv16at
         6M4T9hUsLNPkuJ4Gurybsu2DQoQFBlw0NBwdKd73E7xaOAnitfEXhTlvi2gPXmkpGK+Y
         oUycV43QoMXIx9uOeP7T7Wifx93w8CmkS+VeFSIzO5vXzs0+wpR4nUSxnRk5fcMouOHE
         ddfkgiX6sOt3Jf8w9OFg9S+TtXCtO7GQFLQZd8IrnVZ78H0z647Ne6PwaBPbBka6t/Uz
         f2Q/DhWMj0nH/+0vEUOyxtCMCy1OHkztmvi84mL/wrqawtBF8A901jBA2yvdKx5sXeXm
         RBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378147; x=1725982947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JycBj3YRAIr2Nk5u35h+LvnP+HGMEOx4rxNm7VoI2o4=;
        b=YnLI1v0xrsqQzvptKbUCc493d9pe+UwQSN/nH+P3bA+oIsL2B/5sZgAHCn5DvMD79A
         BB8DWho1XoQ8epyWLjsqCVS/fUKGWrenJhcv5P0dXDWsvTNuHfBMu+rWo4GOrW42z+pq
         M7c5+5uXPZkQjVS0uiDL3q+AbCdlKY4kCgMpj8RhiTed/eE0vuW2QPesthWiET5xTPoc
         jeAH868GvZUGU9vfL4OwOcWdqxCP5bjG8lnJswAJqPJCLtrLqZPEflhk8algoAWROWgF
         x64gOdv84UiFU7/YHQS0z+/v4VDFkUsPNhvKhF88i6yCb5Ei6kB5+Ncoh64Nn81bhJtr
         dTTw==
X-Gm-Message-State: AOJu0YwBl9a0h2znK5hJOrBfAL7QbpDpnpZlZIrsGeNOUwzuPqLexw3M
	vHyvEC0JygPPp3zCjg7Ll2JoA/YvPj4SBdfz6SJp2vI5iwT26FuS+9c+WA==
X-Google-Smtp-Source: AGHT+IHSp9R/HhjHcFmNPhnhHYhoXjtccjIVv9qstqFCXPUiOa+DvLH3Zz6lezHceC8Zatjk3iXDDQ==
X-Received: by 2002:a05:6871:4095:b0:260:f883:95f9 with SMTP id 586e51a60fabf-2780054de35mr6488626fac.42.1725378147500;
        Tue, 03 Sep 2024 08:42:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::9ea])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-277c86b5edesm2338412fac.42.2024.09.03.08.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:42:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib/oe/sbom30.py: Fix build parameters
Date: Tue,  3 Sep 2024 09:42:24 -0600
Message-ID: <20240903154224.1697616-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204172

The property to specify the build parameters is `build_parameters` not
just `parameters`

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 2cea56ac3e6..76bfb752ef1 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -782,7 +782,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 if not isinstance(value, str):
                     continue
 
-                build.parameters.append(
+                build.build_parameters.append(
                     oe.spdx30.DictionaryEntry(key=varname, value=value)
                 )
 
-- 
2.46.0


