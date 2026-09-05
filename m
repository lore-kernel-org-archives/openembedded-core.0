Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5BBC79FA6
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2478.1788641117337472967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MZRVlCGq;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4858595f997so1316206f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641115; x=1789245915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JuGOWq1MTVGP1p0+5pl/wpq+KY5FNGxnNYoIY4Nl7LU=;
        b=MZRVlCGqHZA/3w1ZE+3QL/Jv/W1zSP5kQPJa1ZP1W59IZdgQnfU5Nn1a7ZrIvSxk2a
         pnduevGPXlgi63ZHf5GRD23FWRZvGC2KXDVCGC8oLTa6IOV9s1YfWw1vU8zyRLQMen3s
         oJ1Xr3ra8SWnt2B/9mGd1gDvBK2T7uVqncgOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641115; x=1789245915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JuGOWq1MTVGP1p0+5pl/wpq+KY5FNGxnNYoIY4Nl7LU=;
        b=bkEF+FkpfG936dR6kjE5RCvzT5J3m06ciE+LqHDvMacHhc5SDjIqaLkz2eEhvmkY1u
         ATsEuw/w0EctRLtJJHc7mgf2fOXbmURqsoeAwSllyD9A2xpbWHTxg4VSfx6OO6y2QZsm
         lFo49hZBXsaEG7qIvo2dGhamzKBinQ4XIyS5njtNTtrs1p6VhQQqc4HHGP5DG1OJhGVe
         ocq9T9GNt77DCJcpk5X5V1IqTI1roehyaTl+RdQA97DdWcvGT3T9250wU9D1tq9MJgK5
         zJx0jJddncNqFz970BA8OxgrAwGEarBb7vCgKPVYCSZa3BmHbHeVPEqCbnQCXtPWyzd4
         fbzw==
X-Gm-Message-State: AFuF++kH7QLD51wH3JtJMkYzPBj9xZaC2/QGV2IOZ8NF1reqA5Zf3Vtc
	q0NDVTVcF6bI552IuuWjYP7/OD7HiwQi8bp2pK3cDn2bTSf8W8NHYbc1cfLFUAaDo1nK7D13k4r
	vlA0RJ6I=
X-Gm-Gg: AYBFou2A5UkJxW+fnU0Jj8VceQFBT0JiaGOzDSMXrsguCq0T0V/Xi372fZG4qg9Yy6d
	CHHm1szXmrdv4eB2rxQE7sfTakiMdt7JYvtGWmggdFg7uqTpa05wj0dmXxvP1yX3WXRNAWQ0fV2
	WuMcbvPvAKol4CBT+tp+6BVA7tswExTiFMNcrp18G43UfrdC53GTueSNskt7n0oqJjXPcn9+4aP
	G8+vzrqOslqGuzjKgfhmAvcHmz900e+0cu0O/QcIw9/7V1mXUOZIIoeRK1kvJTP0mJfovAg9QcJ
	3QydIGo3q+F6DEO/9zm5HwqIB34FXr5luK037PYGeHwToxvNCgOcorduINWUj96JJXkVg966fuY
	cKd5apuirIhnYOUfHOur3TGft+VPCUvC/tt9kjImr5CABIcIqjD/1Mb9QAqX/J/lTtowA2+yayn
	1eCfxZA11rdVeaGVFDbN2K8XleghhIwmH0qyzcSqTsK6zAPAngrxEOrmM4RU3MY0RSqf3Bv7GfY
	lxVsR9eMYwQ97oyU6LviXguK8UrVEXynZu6jbdQ1mI4Ebzw02pHX/brSmgX32whNQ==
X-Received: by 2002:a05:6000:2999:10b0:482:ea08:8c97 with SMTP id ffacd0b85a97d-48587046b35mr21857689f8f.2.1788641115565;
        Sat, 05 Sep 2026 13:45:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/40] python3-dbusmock: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:10 +0200
Message-ID: <111182af459620f1d76705d7c511111ee9eeae66.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245161

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-dbusmock (0.38.1)
Before -> After: python:python_dbusmock -> python-dbusmock_project:python-dbusmock
Newly caught CVEs: CVE-2015-1326 (.pyc code exec via AddTemplate)
Status: patched (fixed 0.15.1)

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0405d7d4e476964239e1c27c987ec9c12372e95f)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index cbd74b4059e..ecec075f6f2 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -11,6 +11,8 @@ PYPI_PACKAGE = "python_dbusmock"
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
 
+CVE_PRODUCT = "python-dbusmock_project:python-dbusmock"
+
 RDEPENDS:${PN} += "\
     python3-dbus \
     python3-unittest \

