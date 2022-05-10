Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA29C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.10823.1652193610731584334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IvTw0cGs;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id fv2so16053481pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dTndquuCrH4ol1IlnHK2Uglfj0SGBwVkWPPrKLJpoag=;
        b=IvTw0cGs1KyCSkCY8ig7+oakt8SUJkYPtBTB2xbXYVjxedFXLdwtKnjvs6VAA2JpOp
         iMyLdsCCcuGVKnPUriTjjeW97w3falvdX2jn9kmwZoG9rx7qU/0AI5wSqSjffaULqYUV
         CyDmTg8ThYN05/czGHMGe0VF+z4Fy+q+xWpO2LQX7TNRzHd78TQujN4xoQuFen8vYKcl
         MgN58VRp4m4/psxcZRo2YaMPzlz4xPTeZvLiv0bczfLPNFc2xoZr5WLhCWaLVqeJO/Uf
         CqWHURbv/lro3Xf1hzwfZ81aiknYVjpgyL1Olabtn50qj3ySRASmhmJDOIlnKKJZNQCM
         7vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTndquuCrH4ol1IlnHK2Uglfj0SGBwVkWPPrKLJpoag=;
        b=vF2PkB28XY8uIKmcLVFIzYD+VGE5EowImRakZO8zbHtfnolHe1u2WZBhajftqWZ3IG
         dQzl9PM+lztdHBMP3RkB4W3gPFItPPO1ohNBL3iuqMb59TS5qA/X4YD3JyJFgpvl6vcJ
         ZBmli7Cu+khXUX4EAFXxa2i3x3okf5e/liQWUxuSny8lhJBD9NjK1L4X5jXiwzry0kjV
         m1XLhTMfYUY1ny30O58YEUsUzfY4MYOa3obOwbl3A6ox1MJ6aAp3NYvCPIDO2xt9KTAJ
         l3bHfFbrcoFgrkyhoNPrvyoxV5LDKm9cs3c7kBF2Nn26VgbHXRVtCa5brTg5kLO1Kgh5
         1LIA==
X-Gm-Message-State: AOAM533tk0MaO82jSUjOsV/Oq547dpizyTaYosVF7DkXsHD4o/kIYwtL
	no6mfNgyzPVta0hIsvYPwL+vSXWraZ2xfpBy
X-Google-Smtp-Source: 
 ABdhPJyk6cwl1vjkB6s+nwKEynjMf9YDjthAvRzD/0p/pGJ3oHRvMWyVOG//4/dg98aQpTm5OOST5w==
X-Received: by 2002:a17:90a:f48e:b0:1dc:8ed1:f5ae with SMTP id
 bx14-20020a17090af48e00b001dc8ed1f5aemr324545pjb.182.1652193609550;
        Tue, 10 May 2022 07:40:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.40.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:40:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 37/40] scripts/git: Ensure we don't have circular
 references
Date: Tue, 10 May 2022 04:37:16 -1000
Message-Id: 
 <b9dcaa76b3274ced1e4b9e2ca33f778e8cd50032.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165454

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is horrible but I'm running out of better ideas. We hit circular reference
issues which we were trying to avoid in the core HOSTTOOLS code. When building
the eSDK, there can be two copies of the script.

Therefore assume git will never be in a directory called scripts. This
fixes eSDK build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27de610ac30d4c81352efc794df7e9b1060f7a68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/git | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/git b/scripts/git
index 8adf5c9ecb..644055e540 100755
--- a/scripts/git
+++ b/scripts/git
@@ -10,7 +10,14 @@ os.environ['PSEUDO_UNLOAD'] = '1'
 
 # calculate path to the real 'git'
 path = os.environ['PATH']
-path = path.replace(os.path.dirname(sys.argv[0]), '')
+# we need to remove our path but also any other copy of this script which
+# may be present, e.g. eSDK.
+replacements = [os.path.dirname(sys.argv[0])]
+for p in path.split(":"):
+    if p.endswith("/scripts"):
+        replacements.append(p)
+for r in replacements:
+    path = path.replace(r, '/ignoreme')
 real_git = shutil.which('git', path=path)
 
 if len(sys.argv) == 1:
-- 
2.25.1


