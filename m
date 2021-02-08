Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web08.35508.1612792470231087845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Se9ilOL9;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id y199so13624409oia.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gqwG7tinZvvsr85mX/8XxX+/WZ+X9Tb1eNCNQhf4HlE=;
        b=Se9ilOL9wBhhnE8wD4blwKJk5wIt9wJzqpkh5+vt5MvNTQI9VH8c78iGfs20vIA8t7
         8vP+h8uGK7iRj+MwFDvLfXokUD3ryXnZ7IF9Nn7voPZn/j4K67KUElim6AWzig7U5tXK
         i/N9EkTkaDvXz40qGi42TlRjX15Y2QzBODNMiq+V9lSUkQG/WKe3U0QJmeKvC0OxLb38
         XW1MfJQmuuav1jTQ4PwElryJjQYqURqb2Nrlfc9bLyu8yJ9Cupj8+gwmT/+Yv2ULyqXE
         uBm51NyuW9B8+vbnWA+ryMwfJ7/O4X4rWqR9/voicZ/HXcM0CvZkUQW8L6JMDnLTrhhz
         d2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gqwG7tinZvvsr85mX/8XxX+/WZ+X9Tb1eNCNQhf4HlE=;
        b=OsRZpKAonmowM4aXzP7dXuzeL1zDhJKBzpKgKsBoqDVC8GPLdrQufxJjpAaN3CY6hH
         a0IBeC0hfj+4yc7fWd09AHPxZyWr+X5udZdI/5q5V5QBQR7ppsjDT5ikQFzURpg2Iidf
         NEZlu2AopqTZrd/q5rky2NBE68pWuITte0CHhkDXK6v0JRC/GoCVZsiqqYc8TDrzlLCO
         eXBu+ABClCt98DCRpsaA0/Wgzqt0NGHGg7LrZL+umMg15UL/uIo9nV/Nm7DDoMesmbAN
         Cc6nzCnuvUcs/Bb6vhIogwc2wZXldpR9xuotkj95uppTCPgfxH2PnynQBS5f2tE85NO5
         43mg==
X-Gm-Message-State: AOAM5301w+PX/38k/j+j3gXNvrfQQEib3llxq9NGrqyNhEhclIuG/681
	vVmQacgntEKup2DfNHzNhge5R7XsycFNoRt/KzA=
X-Google-Smtp-Source: ABdhPJw3VzFh994FiEyeyyOb59gUq6O3CB0F3pq9K1bEQENHwSxN+5/z9tgTlkUTLTD6noeJGqiI2w==
X-Received: by 2002:aca:43d6:: with SMTP id q205mr9546000oia.18.1612792469114;
        Mon, 08 Feb 2021 05:54:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.54.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:54:28 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/28] buildhistory.bbclass: avoid exception for empty BUILDHISTORY_FEATURES variable
Date: Mon,  8 Feb 2021 03:52:07 -1000
Message-Id: <6b5ff13fcbcfe980b50893a8bfe86ebf7a4ef3bf.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Bergin <peter@berginkonsult.se>

An exception is fired when a BuildStarted event is sent to buildhistory bbclass
and the variable BUILDHISTORY_FEATURES is not set.

    ERROR: Execution of event handler 'buildhistory_eventhandler' failed
    Traceback (most recent call last):
      File "<...>/meta/classes/buildhistory.bbclass", line 862, in buildhistory_eventhandler(e=<bb.event.BuildStarted object at 0x7f94c3810250>):
         python buildhistory_eventhandler() {
        >    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
                 reset = e.data.getVar("BUILDHISTORY_RESET")
    AttributeError: 'NoneType' object has no attribute 'strip'

This can happen in a multiconfig build where the default configuration use the
buildhistory class but not the configuration in mc. It should be a rare case that
this happens and it was found in a missconfigured build.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a74e30a4de02c8efd3e7102ba7a4fe06df53cc34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 156324d339..8a1359acbe 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -852,7 +852,7 @@ END
 }
 
 python buildhistory_eventhandler() {
-    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
+    if (e.data.getVar('BUILDHISTORY_FEATURES') or "").strip():
         reset = e.data.getVar("BUILDHISTORY_RESET")
         olddir = e.data.getVar("BUILDHISTORY_OLD_DIR")
         if isinstance(e, bb.event.BuildStarted):
-- 
2.25.1

