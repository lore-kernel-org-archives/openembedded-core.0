Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9A9C54E76
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.16186.1672594994249943284
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YTSJyHm0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b2so27155106pld.7
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtnGPcVYhIO9uYRNt+v5ERWgfWauqP1bIpwpjYHifOY=;
        b=YTSJyHm0OBD9oS3yXu7FQKiL8hUMjxG920g9isMcr1p/bikbdt+yC4rC4YXAqvT3rM
         zcTIdYFldZ1+/MoHGxpdGBv/ymDrUk211im08kORwkRiich9hlx33NztcfiQdYycW5zZ
         VoEf1ip7DILVw7O/ab9a3nj7crZMZLs23uiPySnWqWRpl9lgbEjOOlTa4fg/znqRFWpl
         jRTRiwGcAizvwKDaqtbTJI+7RS4oE1D/p+W0mXWmcP23r1YMGLSLGnmGBE6C5acpVW4e
         yB5KIBn9VJW50hpc5JiQcNxeiUmbtlyArbmzzKaixyk6BfgPTFV0fR9S5EYo7ysWCmMZ
         1LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtnGPcVYhIO9uYRNt+v5ERWgfWauqP1bIpwpjYHifOY=;
        b=FdXlwZMCAVFLqXzG8FVBes/61UNHgRmyPoiszASNliuFJaoqVOPUp7LEJr1VPsqmxg
         Im7gSbI4OywgK92oqAP3lvWS4AN4RQ7jDh4CBG031GuLRhuN2VJKig6HSRi+UFCGYGgE
         +VI55MC+0S1AoezrR/3esoMUKPWqe+aJsQ5g6Ia92fgGp+ttn6HLjea2KQy1ANe3mtFb
         5rcuGRL+ycTBj/w8QUhM9dNNCXUQ1/ttk5rw41f3Qvk8YLPHZxaTuN2yN5RPRV14sbWJ
         yBRTJMSo0fWYdZa1thfrU0At1TPrlJK79rInm/9zfZZe6JlP9S2aPzXkZWIw3aT2kWc7
         pcJw==
X-Gm-Message-State: AFqh2kpq3kfchLQ6+dOER3B27v9sAcbpc+3oAUeQH4u4O8kO3kMprOpi
	knbG0Knn9LczmnaaFRY6d32h9DAQPx81/6OddUQ=
X-Google-Smtp-Source: AMrXdXtHUd6FGtzM9499M2HjloDwqyKea91m1bQvYfOAWS+VE1jQfHb/4VpPrDJAaZtveyZiX8fUWg==
X-Received: by 2002:a17:903:2341:b0:192:5e53:15f3 with SMTP id c1-20020a170903234100b001925e5315f3mr50400748plh.48.1672594998705;
        Sun, 01 Jan 2023 09:43:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.43.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:43:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/18] externalsrc: fix lookup for .gitmodules
Date: Sun,  1 Jan 2023 07:42:32 -1000
Message-Id: <60b087af541d95a866ce38d050b355298a8e1da9.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175234

From: Peter Marko <peter.marko@siemens.com>

Commit 0533edac277080e1bd130c14df0cbac61ba01a0c broke
bitbake parsing when bitbake is executed from directory with existing .gitmodules
and the recipe in externalsrc does not have .gitmodules

The check needs to search for .gitmodules in sources path, not cwd.

iParsing recipes...ERROR: ExpansionError during parsing <path to recipe>
...
bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-checksums], expression was ${@srctree_hash_files(d)} which triggered exception CalledProcessError: Command '['git', 'config', '--file', '.gitmodules', '--get-regexp', 'path']' returned non-zero exit status 1.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 66ff3d1f65cd2e7f5319e98fa41f47a59b714c72)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 3f7f533cc6..ed118afada 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -225,7 +225,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(".gitmodules"):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.25.1


