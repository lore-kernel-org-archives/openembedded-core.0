Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.21433.1630932811906280001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 05:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WMqyXxqG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso4937174wmb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4kvAm0KFtIlyRvi7NIUbw+O1i8oVFCZPlq3gx2XQP8g=;
        b=WMqyXxqGb9iZLm0lVY4XOzgoME4DTQ+nwj5bD6pKzlpxSWnn8Z2iru9A7ooBaobhq9
         ZlzjAnMctbzcHiiQrouDc+AXVl8dyVimaG/I4DCiGW6H4lGa4sW94iRW9oMpy0h9c2r0
         ZjbGPQ7vsMHBHs+VmgbzgMcMSOFjhyl0mRmG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4kvAm0KFtIlyRvi7NIUbw+O1i8oVFCZPlq3gx2XQP8g=;
        b=brb+3SuJoGmn4SsYxyFx6IKUD0ue6iDLq6rjI16WHERXrsTVKFGrs38mBQI8QgO77v
         7ZoRGC3675ZFRmNbZUc1s8w2AYF2IOpnm6qcuDktXPNMfGJjpzviMNlKjZomgZSxq5wf
         UJu4B5rS2jiVxfzI97t0Em+YAPL0yDL5UCyAVQEm60kewqokj41Nx1OnsF1atYJxcKbw
         t41HTUNZ3Uzy/uprfSSpOZoaKaUn+9m6NHlTwlZrkIeVvZd44MmTzoAgQHW0KRJIFlv7
         HiIz+SLyo1cRXKEN3ihXDNi6QvZB2hQgw/VAlkv0q9E948Mt0r3iL34d0vsKzrv4ZETj
         VLtg==
X-Gm-Message-State: AOAM531h8LdeixUv/bUCZKXoA4v2KwBcZHRhodNwSFZhkKVYTpu7ANiL
	k2lED5xoGnlv/mbGiZk5//7m79Mf5ckDwA==
X-Google-Smtp-Source: ABdhPJxO0Hwd0+pPICpG0M5aP08tAamqmxZiqDZOE+wcn7kDRcatWuA5V14+P5lCZhBInw0YA2GnWA==
X-Received: by 2002:a05:600c:294:: with SMTP id 20mr11533188wmk.180.1630932810311;
        Mon, 06 Sep 2021 05:53:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:612e:ab48:3553:3f2])
        by smtp.gmail.com with ESMTPSA id w9sm7056951wmc.19.2021.09.06.05.53.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 05:53:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] flex: Add CVE-2019-6293 to exclusions for checks
Date: Mon,  6 Sep 2021 13:53:29 +0100
Message-Id: <20210906125329.1082384-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CVE is effectively disputed - yes there is stack exhaustion but no bug and it
is building the parser, not running it, effectively similar to a compiler ICE.
Upstream no plans to address and there is no security issue.

https://github.com/westes/flex/issues/414

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 4 ----
 meta/recipes-devtools/flex/flex_2.6.4.bb          | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index cf07acce1db..a6f52b5de7e 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -61,10 +61,6 @@ CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
 # There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
 # however qemu maintainers are sure the patch is incorrect and should not be applied.
 
-# flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293
-# Upstream bug, still open: https://github.com/westes/flex/issues/414
-# Causes memory exhaustion so potential DoS but no buffer overflow, low priority
-
 # wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879
 # https://mail.gnu.org/archive/html/bug-wget/2021-02/msg00002.html
 # No response upstream as of 2021/5/12
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 56f5b742e29..6a47ef1bd86 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -28,6 +28,11 @@ SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c4
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
 UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# Disputed - yes there is stack exhaustion but no bug and it is building the
+# parser, not running it, effectively similar to a compiler ICE. Upstream no plans to address
+# https://github.com/westes/flex/issues/414
+CVE_CHECK_WHITELIST += "CVE-2019-6293"
+
 inherit autotools gettext texinfo ptest
 
 M4 = "${bindir}/m4"
-- 
2.32.0

