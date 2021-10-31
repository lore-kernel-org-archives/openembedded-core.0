Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7A0C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.32820.1635699492405823482
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OFhmpAgK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id i5so10091941pla.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JZKKOtrcZL3c/5Gh1PjJFY6uVLUScioLSwSmOj3n+UQ=;
        b=OFhmpAgKSARCOjKZHzpJ3JUR1kFNsBhoSTVUcrWg4NQOe78Y/elyaacE4aaXplxitZ
         4V+IjrD50NJa3h0X9j13ybovsMKgGxRGopk4I5khMyzewY6MJTutVVNVwEic1p08Zxu/
         stzsOeoWOVScoB3y6u/N5C+dtX3YRjgklS2jxaqtw4SRYkl8svnajbhVKchkbXDuZImM
         klFDvXBBASoWb3VSvYcfajR4c/PJ4sgRTOrtsc2FyDc6UHiSHkn8Dw+vOcDD1zFSOy/t
         LlLDG3zPrEZ82aGWHo1gOQ5IbRJYRNZ6F+6IC9R4iXeo0N5B66t5MUtW6OdNAnfe27Pt
         AuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZKKOtrcZL3c/5Gh1PjJFY6uVLUScioLSwSmOj3n+UQ=;
        b=yG7/wioyns3QJXZpdjwZX7UZCOfJz608oKVcznPUTIKRGuI0hwza/jsK/XqLASOh9j
         bevnv4/AVSvX83747tjRGJY4Opb2fQ0FhtsWUhOYkYc4TOTJsFaDuOQLSz6qt/Cou+1m
         DagEUjANRKJCCZ7tZeg4+srasOdDP/J4wR44+fjjEH4/6OZO2k6DXo0IARK245AkcQ16
         +XLsYCDHWjLK2PJoxud3hEiHjnz/Ak+fdXDZ/Gf0Mx6tg6wbbQ+9J8FyfsD6tgNM8o4J
         O+1PjOCUQPJoQAp6EsuVtaHd7+W6AKq86e/x3U5CFwJpZAKopUDEgGU3yRF5Pz2U2/YU
         JLQA==
X-Gm-Message-State: AOAM530gc5jM5WiRuAa2tkVfs7aOHXQtZYE0iTYIUIiQfQqGoA8G7LxK
	nBvNnJmxqO32S1sVLo6eMvtTfyLbUFuTvP69wDY=
X-Google-Smtp-Source: 
 ABdhPJzsJaaoJjt4NUr5sHS7bofq+F+e/KLmmRkF+cK708CMAd4C/Hp528TKi0tyx+hEAWaoIGz8Ag==
X-Received: by 2002:a17:902:7201:b0:140:2591:f638 with SMTP id
 ba1-20020a170902720100b001402591f638mr20837933plb.31.1635699491422;
        Sun, 31 Oct 2021 09:58:11 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/29] sstate: don't silently handle all exceptions
 in sstate_checkhashes
Date: Sun, 31 Oct 2021 06:57:24 -1000
Message-Id: 
 <f16803718a19ace7b582c5b73924fe3112502927.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157663

From: Ross Burton <ross@burtonini.com>

If checkstatus returns an exception we should silently handle
FetchError, as this means the fetch failed for 'normal' reasons such as
file not found.  However, other exceptions may be raised, and these
should be made visible.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50d99faf88a1d82cbd939b9bd6e33ebed2b1ffd8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a2496dce2b..38dc3bff30 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -950,10 +950,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 found.add(tid)
                 if tid in missed:
                     missed.remove(tid)
-            except:
+            except bb.fetch2.FetchError as e:
                 missed.add(tid)
-                bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
-                pass
+                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, e))
+            except Exception as e:
+                bb.error("SState: cannot test %s: %s" % (srcuri, e))
             if len(tasklist) >= min_tasks:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
-- 
2.25.1


