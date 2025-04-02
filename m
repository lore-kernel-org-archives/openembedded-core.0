Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47800C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:38:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.10244.1743604672998704321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 07:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KlzreumF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so74138975e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743604671; x=1744209471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+i2XZ6zqZ51L96dHYx+BMjxc4aGwDKgpDZTkegU7m4=;
        b=KlzreumFhO7syh2QYzFYq6ONgfz4BBs/mNMjCUGrXgy81oetSW0cPwdT9AU3iBSkq8
         iel+zE/lbxo3IrYyAdOGU08GpZgntGRrq6wQzJB6UaFq/sKGkN5xulGaZQZ++NlFR12m
         zZvRChqjuViWiwWMtyqrHZScdHexeG0QXfMMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604671; x=1744209471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+i2XZ6zqZ51L96dHYx+BMjxc4aGwDKgpDZTkegU7m4=;
        b=xF4WNhTTmB79rfw2mZu3elkOUZqdBcx8w2PykDCqYSjVxBwf2fEISnHRplspL+twc2
         H6Y2+fwzguCRlS3ET08O3Gu7hjlli9sE7rjhd877P6pYRgmMkdAjT/SgxZWuJTjntxva
         dGaUU0wDkUWGhKN3kPCXpdg+zowQBZKMIDhvBxxCWtP5NvS71BG4srvg5KEIv+Yg6cTl
         aQ6yv3x/+hw1W6s3HlHbn/PsYDwXgSd/EzLO94O79g31RBKbeUyYSDsXH6x389yWzz8s
         U26KgAAy0ak+ZtuCMIsXcOIp9aeFjf1M1uSBACx7pRC8dFRJedXeF/syPSdqm/GnEfwN
         4oZw==
X-Gm-Message-State: AOJu0YzKv91YYL0yni6GwwPO+WAUtcOd/w9dLXOI9yMGbLGF3ZruhHri
	jHiYwiLDRd7+YlbnPEqoxPzeJRNa8/hsPnfK8eSvbLwjOBOE2PmObkwAlXOLckUYADnlcAnS4OL
	3
X-Gm-Gg: ASbGncvRorQhP7LRtl0eVF3U495UjOLtwYRyK/uMkH4jgBfKbinhk453HqQQvrLyhkG
	2/Ysnw6Crp2Veo7Nm2GqOWbNhN4NREva7JM48YZyk9rJlZuDXaFfonmHpnHEFEVBYxbUFq0U1a+
	aKmIu/9XNnppPVo1m1FtUW/hsYmJsxDmtsPIsFO8T/aKqGJP+3MJpEQzTRZgYTa8rj9JEf58FCJ
	oPWxdTLIKHxQWOIAjhbMkAKGzQzZXQIwR0XMPdAP2+RMJ2jqVD8OzCyxYSmZGaq9SBp6qxKXA7q
	A/6kF+MwSGxVjh0kjYrjSPUN0n+MyMwbxtnej7X9SDVQzQVjLWTNw3SnOgxYixyhVvaZ9wFYww=
	=
X-Google-Smtp-Source: AGHT+IHCFHZiPbwBuD/izJNJ1P1GihM+Nl6ou2NP3LI7oP3106v1A7I3TeDvMFyvFkpw2TSTI5leuw==
X-Received: by 2002:a05:600c:4e8e:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-43e9531c154mr108027765e9.23.1743604669778;
        Wed, 02 Apr 2025 07:37:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6313sm22226285e9.35.2025.04.02.07.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:37:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-iniconfig: upgrade 2.0.0 -> 2.1.0
Date: Wed,  2 Apr 2025 15:37:46 +0100
Message-ID: <20250402143746.2414953-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 14:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214266

License-Update: Whitespace/indentation changes only

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-iniconfig_2.0.0.bb => python3-iniconfig_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-iniconfig_2.0.0.bb => python3-iniconfig_2.1.0.bb} (58%)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb b/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
similarity index 58%
rename from meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
rename to meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
index 2abeec62f4c..d9b31aea4a7 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A small and simple INI-file parser module"
 HOMEPAGE = "https://pypi.org/project/iniconfig/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a73af4b5f1f3a8731e5def70e8c1254"
 
-SRC_URI[sha256sum] = "2d91e135bf72d31a410b17c16da610a82cb55f6b0477d1a902134b24a455b8b3"
+SRC_URI[sha256sum] = "3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7"
 
 DEPENDS += "python3-hatch-vcs-native"
 

