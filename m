Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DB3C7619A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.5149.1679003149403066362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5GJn1/OL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id z11so1994916pfh.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCGptfzWTJp1bIoIhccF+kuQlxL1sHu+FiZbObUUISE=;
        b=5GJn1/OLNqV8cWiJeQa75hUGcS0xhvUgfa9D3E/qq0EPT0P6kyS5/lxpd4ezOrSxlq
         VZwN/AnJg8L+9T/VNfx9MtrgXvkthc729vG870W+hdaDXxeQWrlaiVrt2kFrfGZGj0F/
         U16q8ZV52K15eRooJUXRmWJUrR/82Tk23K3V+m0bz+2OBI52sWQgWe7xV0c5U1Lrye28
         +aAVriQ65/+rHsKf1stKTduNeEk0Jt40pEU8/EVu0WLaONykMOGIBQxlS8a0rF4eVAjz
         mXQKvY5+YaACu/ZwZkOhN8xiQSgs+1ZgMBGT9jqdwbKDB9OcVSt8ppEOCB+B2wkikaW6
         fFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCGptfzWTJp1bIoIhccF+kuQlxL1sHu+FiZbObUUISE=;
        b=ES2xPbPmy8Ba1QUSaLr6XwfiW5uayx6mPUSuwVshOK2xC0smQYwBOI2lI2dCtWxTvW
         MuNUNxjLUpgI0XaNVzPb4cxlNRnluDmfisbt9L3xGYBlyCpyrTQ7AQlP8tBKpTsi7QxL
         B973AAl8DuVcxaAnzXbrr0N7uYHOaigvulRTIZow4FvuOMyL17TgWlI9WdP1pMegnHmI
         9caVTEj++qDuw06ASa1e4qgzWhlrTmrBhCCVgUjzKP2iy2REb++Iqbvic0nV+Ou5zWFq
         0JCcXrr+lnTQcnZob6EL3V9TYFIy68HyGs2oXLcEymouQiN7JAS87vRrGlmbyTM9nOtX
         DnFQ==
X-Gm-Message-State: AO0yUKVU9H/9zi7CDGu+CJFRo7jOSxNs3Uq6gCwiQ2tsOzuoyTfk0lQI
	PgnQUmYuVl4rWobXO6MB10llzNY8cQ3FZkDT2W4=
X-Google-Smtp-Source: AK7set+qqJH1wx9Sgid+fd0DYKC2LjF3G880exWLOP5/kJHoHVzYbp09NwdQAmo4Sieefp2Bd02ANQ==
X-Received: by 2002:a62:640c:0:b0:625:c55f:a9b1 with SMTP id y12-20020a62640c000000b00625c55fa9b1mr4276171pfb.21.1679003148539;
        Thu, 16 Mar 2023 14:45:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/23] selftest/runtime_test/virgl: Disable for all Rocky Linux
Date: Thu, 16 Mar 2023 11:45:08 -1000
Message-Id: <21220564ab2c6966959d6e97a37f7fe22d48c65b.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178722

From: Michael Halstead <mhalstead@linuxfoundation.org>

RHEL compatible kernels do not support vgem so we disable virgl headless
testing.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78bc1ba2361249ec845d1b9e28d429a37dd83910)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 44f787ef12..533b5d7453 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -254,7 +254,8 @@ class TestImage(OESelftestTestCase):
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinux')):
+        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or
+            distro.startswith('almalinux') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
-- 
2.34.1


