Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.505.1621543752853810712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZIDUBaTY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d11so18938813wrw.8
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KNQQ4umUqvck9Xh6y5j1RtvcNhjeAJ8aKkUxrs0wz90=;
        b=ZIDUBaTY3BoANyKy8V0fwApeyZ9zaMU6OBxI+kf13YqE/sN5tV+txwQJpM+ZJwnEoq
         P3V41VHVzx94npkdi1u2jU9JJ6I84R9l35QfHdLynqrqtVJ2Q6mVhSJ12SEJKYxQKDoS
         zdXDdTjtJccDrCrD190B790EnXkSlPVNbY3cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNQQ4umUqvck9Xh6y5j1RtvcNhjeAJ8aKkUxrs0wz90=;
        b=c+uZCijirlsiXt7pzz+Etwt5FlHg7hILG5xaOM9UxcHXKjZxw/R/qFTWorvlZ3zHFD
         Q5+FDm3CwMh8PfZMAsagF2NCiXSsFUjFujm2Dlh/z83/nJnUxG5ur4FpwWwrhj/nIR+J
         ooAt1tIOGTs+02ubd41waa2ThhpFJBpRFGseGAa4I3uvg1vfoLybaOGOXXfHLhnGtLxU
         fOHao2aXbplbSMUzSkJMwafIWskAJsE9OA3Ko41PwW3yDpFu08/tUZV6o9a9jlo/kNkN
         cMbt9lSCclIPvcahbZ+0rVfEL4YA/JYZ7yW6DaTUy0Y8IX4X60vSR2lXbBjHxI6s72wc
         f0yg==
X-Gm-Message-State: AOAM5312/rnStCSPZGnq/QpDnrXF4DK3QYEbYTZiULpwYIKRsIWS/8c5
	uE11DQwN6AD5QZfNJo9v/tJ9hSaoOFWmAg==
X-Google-Smtp-Source: ABdhPJy8oZNiin3Os5Pi6d21alfcTG/Ns3g2hKhVrc8FdsOln2hLVAZb5fHurZJSsFOrOdu+mYpw5Q==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr6211858wrt.189.1621543751389;
        Thu, 20 May 2021 13:49:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 15/28] jquery: Exclude CVE-2007-2379 from cve-check
Date: Thu, 20 May 2021 21:48:49 +0100
Message-Id: <20210520204902.2527687-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
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

