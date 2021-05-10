Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.33504.1620660699579989742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 08:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tiub3oAk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id d11so17072150wrw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNQQ4umUqvck9Xh6y5j1RtvcNhjeAJ8aKkUxrs0wz90=;
        b=Tiub3oAk1+yTabnMU3Gx0SwwsxdrrXDmWrHw+EUlYf5eP6E8io4EYAJEiGfglwYxvi
         bJAgLQQ1eI/wQfpOn24dZmcSgLavZes5jaHN8qpDM7RSN8KFrEVfQpJIJReqTm4/92c7
         a80lo6lYpgXWbl4bDdvPHqJU8dYAwWIRMEWD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNQQ4umUqvck9Xh6y5j1RtvcNhjeAJ8aKkUxrs0wz90=;
        b=RRiZpISPJy4iGPkW0rprKqCBOIcZgE8YlFmPp44mxI/JynHopwR/lblGFL9CCkgaNw
         xRoWWY3kW34HJ0QKcQjzF74mtiKvfOs0qaAgR+2Gw2g6sInXfpzZ6Uk0o2+7wDNVsGP+
         GQpYRbQkr0VpAi4db9I/m3rdE7Bxu6E1Lx85wShzV24VdVqQAGTw0mHBpqd9UKQ+qQ8X
         QlKx8VMV1AkwN3ROkiEhTUXDKruYLX8HOFnY4syradhJsSrlPlBEotr9j6xeQCoQbX0G
         0BBKf6MezmF+E3j1XiGBCYhTWb3fzQ6IVzqkkysP0/YfptWYUFxt3QTZbSOWsHVM10OZ
         CxYg==
X-Gm-Message-State: AOAM533opknHTEG6DmwVSFE2FX0mvni4AesbId7TYU0KYXSTS4Gs2iC7
	Z20t+NCPB71HpR2+1M5eWdCws4HmrYP7Jw==
X-Google-Smtp-Source: ABdhPJxlRrEeTHA3mwsf3jsxBG43AgUbUAh7LZaTrSdbNZwUlsprTOVe6V6GIUqLWl668YRH4vp0Vg==
X-Received: by 2002:a5d:4452:: with SMTP id x18mr32321964wrr.286.1620660697726;
        Mon, 10 May 2021 08:31:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id u9sm20666366wmc.38.2021.05.10.08.31.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:31:37 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] jquery: Exclude CVE-2007-2379 from cve-check
Date: Mon, 10 May 2021 16:31:37 +0100
Message-Id: <20210510153137.2168543-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE is non-specific and depends on the users of jquery, doesn't
make sense to have this flagged against jquery as there is nothing we can
do about it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/jquery/jquery_3.6.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/jquery/jquery_3.6.0.bb b/meta/recipes-devtools/jquery/jquery_3.6.0.bb
index 65905966c1c..03792730fd2 100644
--- a/meta/recipes-devtools/jquery/jquery_3.6.0.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.6.0.bb
@@ -19,6 +19,11 @@ SRC_URI[map.sha256sum] = "399548fb0e7b146c12f5ba18099a47d594a970fee96212eee0ab48
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
+# https://github.com/jquery/jquery/issues/3927
+# There are ways jquery can expose security issues but any issues are in the apps exposing them
+# and there is little we can directly do
+CVE_CHECK_WHITELIST += "CVE-2007-2379"
+
 inherit allarch
 
 do_install() {
-- 
2.30.2

