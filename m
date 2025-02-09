Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54666C02199
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 16:52:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.32052.1739119922696996786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 08:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YgfvUgnd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dc73cc5acso1458323f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 08:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739119920; x=1739724720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=leE9Nb41cT5PjfUaHPBJQtDCAPJBYzotmE3IYp1lIO4=;
        b=YgfvUgndWp92jGIjyRyO+WXG8LPuP/KyYZnwbkdZJgEXLwWeO+79COXxCqwxPLbM1P
         caJFKRDAtTByJiPgYv9d+ynBrluMB1ilsxBIVHewLoSoYPdzBdqz8L4iOL1P792wL938
         nchfXFt6qpxK3gGruItQP7hbmQMni+q+uoZQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739119920; x=1739724720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=leE9Nb41cT5PjfUaHPBJQtDCAPJBYzotmE3IYp1lIO4=;
        b=v3VIkc2PnkGpjfBF5oPi1iG1yFqotYdpb6dYjpsIPtk9byV4xMdGy4WUlB8MQICeag
         hGzPny7WcVyYHUdpyvov+TluhW1PsBtDowRc+gPIFRmxWmGwXv7a2cdIU6WEwsPuSE+b
         3n3pB3SDQUBhzoOPJRn9as3CIjT+cwaJ5tCAbdv/H3CARhbyYgIz9Lc4AywGNbhaJtHx
         QSisZNE0EdSywAFhV21E8eBRF/9HyL/vYoCkzwI9kRHeFdDKJzOGaEgrc0ytHb9X6p28
         4L8IhdBgddxHx6gFKUlrKDNdPP87z1jFk3GZGwXAQFc3A03x9lJLh5Pvzht0mp4L1pHO
         0xNA==
X-Gm-Message-State: AOJu0Yz7PrJamcpJMDWzYqgjXniwE2PjRNTQ7dL2bW0Yhz/ad4W0BV4N
	T5OuBQjEmdo6VPmdAwzrfOvOPOu8b+lL/OFNR6tWgGBSXHvc8PKNErm5786hlDk1pqJDoSrqy+M
	o
X-Gm-Gg: ASbGncsasMfn63tYdG6CpFs8Dpdt3WasRaIqkJPe+GtDZxe4+fZ2i87YbyaeDhA8kMV
	hsCl4HbtlBIDJNBFQKDYln11CXa0fn3FUPjDbOUmB3YidQ2NOiY0+JZ1zdqld/0IbVfatyofIOv
	h3VxLvpUZnTWDAdK8kSVpvL1sLoEBovLhW3fZa+8hrIVIzaz532rgp8Y4lqrV6+Xq+vPvCYQq1k
	l2Gs7oOyHwCXiltHoJXWeohLdhaf8rSa6Cjk9ypC1kalZnVjCLG/u/2w+K/YrkFTAwbxr1PXkrI
	rvmu9u9Pvud0B8kVW+zTkTpDxT+c6GkKnCD51TTyHbM=
X-Google-Smtp-Source: AGHT+IHgdp1cNVjP/YUq0S+jAsLT31zeDPbgamUAZ4pmJOgH/Du6jI2Dm1w/vp0BcRaQfoHQn+Kmsw==
X-Received: by 2002:a5d:64ac:0:b0:386:374b:e8bc with SMTP id ffacd0b85a97d-38dbb270a4cmr10785243f8f.15.1739119920216;
        Sun, 09 Feb 2025 08:52:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0ae:79a:89eb:2d8e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc31b9394sm9261849f8f.11.2025.02.09.08.51.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 08:51:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oeqa/metadata: Add commit_time to branch metadata being saved
Date: Sun,  9 Feb 2025 16:51:57 +0000
Message-ID: <20250209165157.174251-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 16:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211051

As well as commit counts, it is helpful to know when metadata dates from. Store
the unix timestamp for commits in a commit_time field alongside the commit count.

This is useful for performance graph analysis and saves having to recompute the
data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/metadata.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 15ec190c4ab..b320df67e0b 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -76,6 +76,10 @@ def git_rev_info(path):
             info['commit_count'] = int(subprocess.check_output(["git", "rev-list", "--count", "HEAD"], cwd=path).decode('utf-8').strip())
         except subprocess.CalledProcessError:
             pass
+        try:
+            info['commit_time'] = int(subprocess.check_output(["git", "show", "--no-patch", "--format=%ct", "HEAD"], cwd=path).decode('utf-8').strip())
+        except subprocess.CalledProcessError:
+            pass
         return info
     try:
         repo = Repo(path, search_parent_directories=True)
@@ -83,6 +87,7 @@ def git_rev_info(path):
         return info
     info['commit'] = repo.head.commit.hexsha
     info['commit_count'] = repo.head.commit.count()
+    info['commit_time'] = repo.head.commit.committed_date
     try:
         info['branch'] = repo.active_branch.name
     except TypeError:

