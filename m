Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD490C0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:19 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.57878.1697817131116604728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w0w5P3AE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68fb85afef4so946300b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817130; x=1698421930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/z5+OgZ3iUsVSkhPymwfe4GN/vrkQBdNnWv/bDpKKs=;
        b=w0w5P3AEVYegEaFqOMczQkmZ5pVzw8sOK1K7rPAaY84FDX8LS6U2XSUBqtJDQOQonE
         8DZAHtM2tIybvwGzNsJadoPpTnGgoLzoLOt245tPLx38NiqIsb12EgrCadXv5OVZTR5t
         nKbxt3uXy+yWrnGjbkG0Cn5OljIjQe+1CFN+XHSK0JKE/Vlq6ZyAEbmiZeK/YlGeVrcP
         3ZE/TYY1DumlAzXijXe/DvwL7quCVHYssAgsuyoYrmvPcWMTlbLZAI1JQ0fdRBhdfA7s
         PAmIPHVegQtzgJsXXETw+Wo6NgK4wj/ki1bDqikao6GwN8seni9hJ4nzmncVZ5Vp15Fg
         nUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817130; x=1698421930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/z5+OgZ3iUsVSkhPymwfe4GN/vrkQBdNnWv/bDpKKs=;
        b=dZ6y4NPlwbFG4gx4ff7Bqex13J3AM6qEO0z/45DgsDx+4cuFxBpGfGFlY2DG9d6TP7
         39UmpE8ZcUeOrdH5XcL1hgZOLbE+ZHLvvBW9n87HyvwqF66ty9V3Wy0sG3Va+wYgcMRh
         yDgMsGg1k249x1EdP75sgn69lMoYGlV/YPINf8JEc/JmYRcCVBI8kWiOiZQ/2HMl9dbT
         KlGJoyoenuXsVHj0W1Nu1gOZnYBx2JF2E86v6W06uVOBcTZezIV7BL/TYgHED13L/TmO
         XOtWgbwLbhy+DOw65AEnoour2KjQx4G1oqY0YDy5dIlfQpIiGi/aj6v/4SNZOjBD/8mH
         PvvQ==
X-Gm-Message-State: AOJu0Yx0izxQ1+UKyB7jnKQ8kU1igm2brWdQcLsC8XEDUFrqhWu0Yqd7
	fb/OD90HdEpl6uVVJWzLw6oaZ96g8mhbBrjejcE=
X-Google-Smtp-Source: AGHT+IFGjbzdAA0xWNpBUXfDl95svzznC9zrp0Scb4HP6M8ayRK9o62y8BmvFLHKBSgzRYW+2K+VzA==
X-Received: by 2002:a05:6a21:3d88:b0:14e:a1f0:a8ea with SMTP id bj8-20020a056a213d8800b0014ea1f0a8eamr2159534pzc.3.1697817130247;
        Fri, 20 Oct 2023 08:52:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/24] oeqa/utils/gitarchive: Handle broken commit counts in results repo
Date: Fri, 20 Oct 2023 05:51:22 -1000
Message-Id: <27c1ad02b9479f30ad8eacdee1cdad79cab5269d.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189565

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The test results repository contains tags like:

master/64501-g65c94ca3196e5ef3344a469fea8e30444f2e967a/0
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/3
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/2
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/1
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/0

where the commit count is correct in one case and not in the others. This causes
assertion errors in the current code.

Add in some code to work around these historical issues where the commit counts are low.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d51fc5c8c469730885af7bbde7122032de411d89)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 73beafecb5..6046f183d5 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -221,7 +221,15 @@ def get_test_revs(log, repo, tag_name, **kwargs):
         if not commit in revs:
             revs[commit] = TestedRev(commit, commit_num, [tag])
         else:
-            assert commit_num == revs[commit].commit_number, "Commit numbers do not match"
+            if commit_num != revs[commit].commit_number:
+                # Historically we have incorrect commit counts of '1' in the repo so fix these up
+                if int(revs[commit].commit_number) < 5:
+                    tags = revs[commit].tags
+                    revs[commit] = TestedRev(commit, commit_num, [tags])
+                elif int(commit_num) < 5:
+                    pass
+                else:
+                    sys.exit("Commit numbers for commit %s don't match (%s vs %s)" % (commit, commit_num, revs[commit].commit_number))
             revs[commit].tags.append(tag)
 
     # Return in sorted table
-- 
2.34.1


