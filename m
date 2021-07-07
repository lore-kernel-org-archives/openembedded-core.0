Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.19166.1625653070297595265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 03:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NWw2LbTN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id q18-20020a1ce9120000b02901f259f3a250so1319499wmc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kNO+pq5XOby4+e3+wYKOb4xV10bBQftiFwS9v1pT1dU=;
        b=NWw2LbTNMTVSTmzu7qIkGIq0aoUK9x63tv2aA723JVAQtREw5Sy1m9fBQO6OldZ52s
         /R+OpoGzTV+kSH6NVdhLDBsbhOR9sjN14cxF+0z+aifJ6uqF8fhJJsOsKDWdN87TaKf4
         Ik8n0vgjsYDVApZ5IdVa4i1KYpxMHArpqh+hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kNO+pq5XOby4+e3+wYKOb4xV10bBQftiFwS9v1pT1dU=;
        b=ApjrnPIjBjHjfnoAnqhBH20X0qQMIjehhwzEQ4QD9wm9q95c/E4TPIKyeCWWLhhH07
         kW/MJ6F7xkA0k78qmvxzScNoHHcYIUqtCIOisdC4w9AXR+AZENRRqURW0fzuOJG+S2gi
         A3BbdCPuXwHp1RV+HH3SQ2lSqnLV9VLVC/juyiC6ve4H/NiucpTZ8pdDHyMnyMBIwsV8
         W3yGTPi92ObED6bICYIQOI9+xyM8jZGN2H062AVppKavFYTM9W+8OXpSQZ3VRNZhXvJY
         D0RAi4k1J/kinJKKtcYndK5wYxuH+F8O0IOrgm+qrcnDaENtHnIjEUMvm7npGFlXT8VX
         6VZg==
X-Gm-Message-State: AOAM532yp4/xqEOY4jLXVjBBdhHJ9tVE/p+z/0b85X9q2Q1BQ8tJMDpL
	XM8L44JHl5XaP/kMHGxOVASJsEh6rE+jug==
X-Google-Smtp-Source: ABdhPJwax5pW90++PVT2HekAw/qNfHjvLDFcWWmGPug6PIrpLY56kaOlxpKDKxqTX6YsD+rEOFSnvQ==
X-Received: by 2002:a05:600c:3205:: with SMTP id r5mr5746976wmp.75.1625653068870;
        Wed, 07 Jul 2021 03:17:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id q1sm15828170wma.27.2021.07.07.03.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 03:17:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] glibc-testsuite: Fix build failures when directly running recipe
Date: Wed,  7 Jul 2021 11:17:47 +0100
Message-Id: <20210707101747.2689765-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210707101747.2689765-1-richard.purdie@linuxfoundation.org>
References: <20210707101747.2689765-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you try and run the glibc-testsuite's build task, you see failures
as do_populate_sysroot can't work. We don't have a do_install, get
rid of do_populate_sysroot as well.

The recipe is not included in world builds by default which is why
we don't see the issue more widely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-testsuite_2.33.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.33.bb b/meta/recipes-core/glibc/glibc-testsuite_2.33.bb
index d887aeff79a..659d3132fa6 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.33.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.33.bb
@@ -61,3 +61,4 @@ addtask do_check after do_compile
 inherit nopackages
 deltask do_stash_locale
 deltask do_install
+deltask do_populate_sysroot
-- 
2.30.2

