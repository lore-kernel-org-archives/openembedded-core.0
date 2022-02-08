Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC29C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 03:50:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.6847.1644292207282931831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 19:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BugCl3mj;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bkylerussell@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id k4so13091744qvt.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 19:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HDa/cnoKjIHkSbrW2yIyl6cggatzlv00eka7y76Wyc=;
        b=BugCl3mjHZWkYsvABxpnxx5/h+1nlZKJqXIpSy3kOV4kqpunkz2AIDbXyiIMh31ggA
         RqFQFL3FFezWmFwKNEvo+0AvqUmR/X38f96WCa7PqG0rOAD99i51oPly95pXRXiySFzQ
         iAmsARM5g5kULBJyXYMLWOa+59fTDzJXx1jdfZEIiO5Ql4/D3F9+tas8KNnpt5KxAFya
         FVZq+7KlebyZ4Uz7cYjjwLPpHwuAHslTnyUpoTpdfxgim4LiSAuw7eby0xa4THlkjQ+/
         4nT78gPKe7/liO+BDkx8vxt+CWBVLQNDbJmhL0sKRuiocvWYpwjAnVrJr/ibFPCQ6MBZ
         /9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HDa/cnoKjIHkSbrW2yIyl6cggatzlv00eka7y76Wyc=;
        b=B+OJVyZrI/UTkaa31O8kgNgTQMHoV8vS6n8lHc95oh7/qYSSCAHKWaQRyP7fTr6N/p
         St/4Cy40sBE8+7pXpDUJ/egSih/CW0ShG4MoSTBQasJpnSlDY2V39Psb23Q6MQZHvvJl
         TIFu7IotG/WGz/m9pEUleT+5G4FnNs0SEARgdAI5A0EHaMX6EMsdfHzv5N/0qjJB/O8W
         sJ06TXDNqkwFIdIwq1wOTHZP7opp+V27Sr6vFKqzSycB7Mk+657W5Dih8XZK1WMFRpkT
         ke5rjoAmESdKOKWQPLry4f+tCatBdftnNj4QXs0yQ8kkTYgRm/lR+pbiSyDAyksodAo4
         ko4Q==
X-Gm-Message-State: AOAM5303RKZTjcXuKD2BHPPH4J6U52dVD1D95WmKdLq+1DcQ6WYxW7z1
	6U4a3cFMTIzAw4lOM4MLdWPpt1dVmHzXKA==
X-Google-Smtp-Source: 
 ABdhPJwuNWpa+bKX/ODRUon6CLo9fba6oM/nr3DRsNGYwrlpdHgryDmbQHbI57fzt0FbQ2BQuC1HWw==
X-Received: by 2002:ad4:4ea6:: with SMTP id ed6mr1904472qvb.113.1644292206254;
        Mon, 07 Feb 2022 19:50:06 -0800 (PST)
Received: from hercule.localdomain (cpe-74-138-104-174.kya.res.rr.com.
 [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id
 h9sm6685378qkn.121.2022.02.07.19.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 19:50:05 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH 1/2] devtool: get hooks directory path from git rev-parse
Date: Mon,  7 Feb 2022 22:49:59 -0500
Message-Id: <20220208035000.400632-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 03:50:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161473

Ask git rev-parse to provide the path to the repo's hooks directory.

This allows devtool to support git submodules, where only the
superproject contains a .git directory.

git submodules contain .git files pointing to their parent repo,
which confuses devtool when it tries to modify the commit hooks by
a manually constructed path.
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dc..976a966083 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -510,7 +510,7 @@ class GitApplyTree(PatchTree):
         reporoot = (runcmd("git rev-parse --show-toplevel".split(), self.dir) or '').strip()
         if not reporoot:
             raise Exception("Cannot get repository root for directory %s" % self.dir)
-        hooks_dir = os.path.join(reporoot, '.git', 'hooks')
+        hooks_dir = runcmd("git rev-parse --git-path hooks".split())
         hooks_dir_backup = hooks_dir + '.devtool-orig'
         if os.path.lexists(hooks_dir_backup):
             raise Exception("Git hooks backup directory already exists: %s" % hooks_dir_backup)
-- 
2.25.1


