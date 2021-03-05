Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.2008.1614978229863935171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 13:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OYcKse21;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id m9so4513841edd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 13:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuSPoCdqTvL6TckWBxHS8qyZY6TFnTI8VuGSyCWJbb4=;
        b=OYcKse21oBsDkVdoDzMkhOgZHUEadU0PpS/s3QFM7+tGeiuzPz/vsS4I6uWbNAMw5r
         sJAFsbpBYPwTBVp//PH1cNxbhRUswZRl7/LC9Nv/CzVNv4dvMu9ZpcBP/k4OhRVGC6NE
         LHxXARzqi4+dXIyCaqxTZco+F96fiGig2wvxcKsRxfmdDwzCt2MpvWWDWpLXjej/WlQh
         NV8+ei/WpNswcTEVpzgqYvq+w4a4GQxeHWKchKZMwxmdtV0bYiU+5pSePZO3HFA0VmG+
         N7t7c07o1hMkWoM7lJ1CBvxp/5n9tTz1JcMOBtv6SjXCOlyvEdFn+WcAn4RlEyTrh8DG
         PzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuSPoCdqTvL6TckWBxHS8qyZY6TFnTI8VuGSyCWJbb4=;
        b=X52FRv6EJqYJ6K89Cka/uH2rDR9PCWAEdo3TeXIADAiFhc8BKhIM37aZuoET8DR5hp
         hA+9olk74RHAdsF8h55rFtFNm4i7qVtEQJU9SsInq4bvvQUlF4eLoMf1ClAwrD4vu07C
         9/eUjgiSL9pYOmsccCIG0jb2l2yPX9sk+WdLOacBPMvVxRMVQke5SG/U5ki6Xa5d8R56
         DyCTYvHL3TVfxCGB/nb0vHcGaNqQizcOKNmS9vB55dqYTqOIy23wDmrBv9uoihUdN1RO
         UTyPPWEaMMzBBIsQgvX1DU6ZQmTidXv4FbDfAjtKDet+S85tqULDoMdOFC9Nw4PL2JFS
         VArA==
X-Gm-Message-State: AOAM533W16wKBExqFO8D0JgGBXwKcVg8+BX69XZLaO6fc58GPHO1p6H4
	4prf8GSkfh48LDz9vR8TmQ1xClYpvW0=
X-Google-Smtp-Source: ABdhPJwwMa2ewB4BsLnOYjXWJ/OWLsynHqEb/MZD2OFzYl8SzxI7GarbgE+2jpcHk3Ldonh5sPFMXw==
X-Received: by 2002:a05:6402:1d33:: with SMTP id dh19mr10898256edb.362.1614978228255;
        Fri, 05 Mar 2021 13:03:48 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gb4sm1990834ejc.122.2021.03.05.13.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:03:47 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] glib-2.0: show and error about --cross-file only when such file exists
Date: Fri,  5 Mar 2021 22:03:46 +0100
Message-Id: <20210305210346.2137437-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index a2fa5345b4..4176dbd207 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -41,7 +41,8 @@ def find_meson_cross_files(d):
             filename = os.path.normpath(os.path.join(path, "meson.cross.d", element))
             sanitized_path = filename.replace(thisdir, "${THISDIR}")
             if sanitized_path == filename:
-                bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
+                if os.path.exists(filename):
+                    bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
                 continue
             files[filename.replace(thisdir, "${THISDIR}")] = os.path.exists(filename)
 
-- 
2.30.1

