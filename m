Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DFAC41513
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:47:20 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.28286.1697723233060666174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 06:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Jc603jgW;
 spf=pass (domain: baylibre.com, ip: 209.85.222.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7b6eda04180so496650241.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697723232; x=1698328032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=coJOK7T8Pk5xPdUpXp5s7E6lSr/iyLyMAiqN6iU0XGI=;
        b=Jc603jgWuRyJ9xsO9fvgkVutr5hsrHHZPHjRgHKF+KWNZ4CQL+u7xwXhWoOwso9yvK
         OPe4NIUAJZsljLA8OzpKpzCTRzV+pdOHLyhBdhRhnf6CWHQVzBcBWli01LkuKGuHSp8S
         0CMf+MmByKMOR0KQ4aUZOCDBixbM6QVfNFbyHPQtD/yJBMj6i686hQivNHXCjfOn5/Jv
         1o5u1yWrykq2E5hL1vyFUzC18Ru4EeBIct9JtDa4PkTrLvfgg4PTi6aP49Q9hhbDfTUS
         5+Bsb1yLG2Vk+auUyf1JRy1xViV1St7fDEe7izFu1dNPv8icoFZOiWbISNHf5tyA7Yq4
         tUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697723232; x=1698328032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=coJOK7T8Pk5xPdUpXp5s7E6lSr/iyLyMAiqN6iU0XGI=;
        b=q2lTXL1cVJz+wbKZZYOBYbV8ElFhn4oXTTRPaYq3VOFtbWQSFFMiMCiuD+79Tyk6fA
         eJoOPCkvOcI7i6djKal5bAvq8h3JxCW+BavvHPX3+VGQfxfrxO7sREONP+qJPcosNAoc
         fj6fB9VMBkl7C4nDtnqEPJu66u0RNP2WeFU831gwdd2+er2VnF87VFVmSanKqZmRDvnZ
         3la+ZR4DTrm23uB3prrFlnwH25tugXNFqD0wfuYch3IcgLvcQLJ4iG0Igm5ZOArngOZn
         VUmZfKt99FFBXVKY3K/iHCj6Qn1S/ToTUvoOf3KgmYEDeIxC2/b5WjeWE5Sso9h0tBkf
         Ymcg==
X-Gm-Message-State: AOJu0YyNcGln3kLDZwj0wAQZ4Y2WH5ZbHvmu8pKIVrmEBcPuY/zOFJTU
	0JQiw0yndBwZkowEX1Qp/dGfVpEs7RkppcR/t4TSkw==
X-Google-Smtp-Source: AGHT+IF0C/TiELkLX0WmjwdhaBdyZ6ik2fMDB440nLwnWtAkkL8Yn2mY5VxN6b1yvKYE1giMQ3oP8w==
X-Received: by 2002:a05:6102:2047:b0:457:c9d2:4624 with SMTP id q7-20020a056102204700b00457c9d24624mr2040466vsr.31.1697723231537;
        Thu, 19 Oct 2023 06:47:11 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i13-20020ac8764d000000b00419714dd0b9sm737708qtr.62.2023.10.19.06.47.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:47:11 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: check for untracked changes
Date: Thu, 19 Oct 2023 09:47:10 -0400
Message-ID: <20231019134710.2281676-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 13:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189461

[YOCTO #15243]

Avoid overwriting local changes when running patchtest by checking for
anything unstaged or uncommitted in the target repo, and logging an
error if something is found. This will provide the user helpful feedback
if (for example) they forgot to commit a change for their patch under
test, and will leave the target repository in a reasonable state (rather
than a temporary branch created by patchtest).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/patchtest b/scripts/patchtest
index 642486b8c7f..be40e4b2a47 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -171,6 +171,12 @@ def main():
     log_path = None
     patch_list = None
 
+    git_status = os.popen("(cd %s && git status)" % PatchTestInput.repodir).read()
+    status_matches = ["Changes not staged for commit", "Changes to be committed"]
+    if any([match in git_status for match in status_matches]):
+        logger.error("patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest")
+        return 1
+
     if os.path.isdir(patch_path):
         patch_list = [os.path.join(patch_path, filename) for filename in os.listdir(patch_path)]
     else:
-- 
2.41.0


