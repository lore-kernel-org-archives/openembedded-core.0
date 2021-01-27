Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.11123.1611768476857985797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eWIDLQDc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f48.google.com with SMTP id z22so3396296edb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WKJ9Cx2ayHk/4yr0SX639up6cyAHUsdbN7D98MdBJKg=;
        b=eWIDLQDcTrTnRc3ypecm1fJbl3ab9DAwLsYgc1Bp0jK/t3cYbC65ZJuslMQD7R4xSI
         GEnbz8G9aTE9wGjeQfjb4nCzeqC4Ma6fpxIRYGhzIX9ILUdE9QwCn+lsktMY5rhCYYyI
         4iA9il/3KJ4DSxqe0fbxsLybHN4fPggHK/e9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WKJ9Cx2ayHk/4yr0SX639up6cyAHUsdbN7D98MdBJKg=;
        b=bxA+zySPu8NGcxL0m2RuMPN2409/irpreN/AsZENPcuxce9ioExGG5bb9r3eo4c0fw
         coEquC+6pFM0isRm2mNJ/24dhdrFYd3ZvBUCmTclZ4V19iD2GnbH5vgf9WpZZ6VNOUk9
         sZIpqJjgtd0LNn0QAv9ibhkWlDWnGDgT4VBmDcdcHvVE9zatpceTuYrrgAmYXauCOlrv
         YtHNSHW8kInzbfrH4wzO4v7dZ3BqLxP16RAJvl0RWiYqtsKeG0e/pAkW9+Y1l3rtmSpe
         qwJhffKzE57EaO+QFhjj5/3bgUNL7YhEAG3fkSQQWkywCgWthe64kKmiHRuY4Kh9P34i
         dFzg==
X-Gm-Message-State: AOAM531gO1bghLSi7+cH438YzIMkqLc/Io0u6cdGHE6lIjvadRQe7V+e
	zg8oONYolVMRG7zdL329fAVfS53eTg5fxQ==
X-Google-Smtp-Source: ABdhPJzO9purN6lJAKB9Q7ImFNZAyWPiXPK36QrXga5RVxZjWf0K1Z6Yob8NrobkrS7lz2qxQVGBDQ==
X-Received: by 2002:a05:6402:1f4:: with SMTP id i20mr9754872edy.180.1611768475215;
        Wed, 27 Jan 2021 09:27:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id k27sm1115581eje.67.2021.01.27.09.27.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:27:54 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] staging: Clean up files installed into the sysroot
Date: Wed, 27 Jan 2021 17:27:49 +0000
Message-Id: <20210127172753.1286275-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a variety of files being installed into $datadir which we
don't need. Pick the top "offenders" which amount of thousands of files
and simply don't install them. These include things like test data,
terminfo data, locale data for native tools and so on. This saves
copying these files into native and target sysroots and should improve
performance (smaller sstate, fewer files to copy around).

With this and the python recipe change, alsa-tools went from:

recipe-sysroot: 18357
recipe-sysroot-native: 14129

to

recipe-sysroot: 10809
recipe-sysroot-native: 8079

which is a decent improvement.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 12e0eab4f0f..bbe8cff9b1a 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -28,11 +28,15 @@ SYSROOT_DIRS_BLACKLIST = " \
     ${mandir} \
     ${docdir} \
     ${infodir} \
+    ${datadir}/X11/locale \
     ${datadir}/applications \
+    ${datadir}/bash-completion \
     ${datadir}/fonts \
     ${datadir}/gtk-doc/html \
+    ${datadir}/installed-tests \
     ${datadir}/locale \
     ${datadir}/pixmaps \
+    ${datadir}/terminfo \
     ${libdir}/${BPN}/ptest \
 "
 
-- 
2.27.0

