Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198DDEDEC7A
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 15:47:10 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.148.1694620019853441734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 08:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fjji5P1V;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a7e68f4214so5129463b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694620018; x=1695224818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMn+/aTC6/JGTvptmKf4TIqj2fsQseAHEwXiyXfP/ZM=;
        b=fjji5P1VnybTJ+Pcb8zvoncbXaHhpMd7TBx2rDXv3ke7kMUVXWaD5sSnuFLc2EdTqF
         O1z7dnCjvrg21+FIqvIgbbf0GnzOspVh+dDL7ECFlEVpRFKqc9HkpzymW2g6eGFEm+eJ
         JH+iqBwgUamNEKTePmHv1PrpRiNvNwixX8RFq8hbSBbbo4o2EEMa/ugxa1kKlY+3Cito
         3JvidtT/o1EpW2sbraVPfqVFwpb6EjVCEnGUA2eAhSugoBX+czx+apLfq7hbZBuSTbm7
         IQeX2dYg1NYjeK1okaYWp1Y/hzAY8efPRutOLN8GHMYncNbZFJckouhSME9IX9J3Q9tW
         XKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694620018; x=1695224818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMn+/aTC6/JGTvptmKf4TIqj2fsQseAHEwXiyXfP/ZM=;
        b=VOYyShMCPYSeJ3rrKUw0sIZ8UVLkuiqHMRBigqkQjKbYaDVs8iPrAIqaXMKjIufIlG
         x+6ZD/mg8AgktwuruV2LeAQcjW4IX0t4hLaPB6VWvag1JCrE23XevJZ1dB/400F/EFQI
         2MVOckdPnUEU1jjr1vwBpWR9Jo5KQZs4YIyXTBvuGVWaVrZkK16XHpkKBWFaDHROf6gT
         6PTtAIw/7+ktB7q7Y6ldSe11xDmdD+/eITd0Qukq+h0jlkex0fgaVXjUXmBjDTY86Xxu
         tPmjs+hj3fiAWXp9RJrfU98qP8ZZTgu+qD/cZEbFBvjewqN/mNNwq74YODUIsAWJmiUa
         iJNw==
X-Gm-Message-State: AOJu0Yxk0TWB0KD1vo4CVC4mPW5W6LetGNG6vdkeAGqEivYswlCWJEXN
	11WNqcFwXxDphG+VPCc8U1sGB/koOrQ=
X-Google-Smtp-Source: AGHT+IHXoXpSfs9WNuoIpxZNYcswfa3E5nk9l21+qdH82BQ0FKvqlVNRhj/gk//YAThUrdUuv8kK3A==
X-Received: by 2002:a05:6808:638b:b0:3a9:9bcb:8760 with SMTP id ec11-20020a056808638b00b003a99bcb8760mr2913425oib.39.1694620018524;
        Wed, 13 Sep 2023 08:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::88cf])
        by smtp.gmail.com with ESMTPSA id c19-20020a544e93000000b003a79a5cc3bfsm5277515oiy.41.2023.09.13.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 08:46:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	martin.jansa@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] fetch2: git: Use samestat() instead of path for repo check
Date: Wed, 13 Sep 2023 09:46:45 -0600
Message-Id: <20230913154645.3699632-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 15:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187608

Using path prefixes to check if the git directory is a descendant of the
clone directory can be easily confused with symlinkes and bind mounts,
causing directories to be deleted unnecessarily. Instead, use
os.path.samestat() which is immune to the these sorts of problems. The
code needs manually check all parent directories until it has recursed
up to the root to make sure, but in the common case where the
directories do actually contain the correct git repository, this will
only run a single iteration.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index e11271b757a..5703ba335e0 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -374,19 +374,25 @@ class Git(FetchMethod):
                 # Since clones can be bare, use --absolute-git-dir instead of --show-toplevel
                 output = runfetchcmd("LANG=C %s rev-parse --absolute-git-dir" % ud.basecmd, d, workdir=ud.clonedir)
 
-                toplevel = os.path.abspath(output.rstrip())
-                abs_clonedir = os.path.abspath(ud.clonedir).rstrip('/')
-                # The top level Git directory must either be the clone directory
-                # or a child of the clone directory. Any ancestor directory of
-                # the clone directory is not valid as the Git directory (and
-                # probably belongs to some other unrelated repository), so a
-                # clone is required
-                if os.path.commonprefix([abs_clonedir, toplevel]) != abs_clonedir:
-                    logger.warning("Top level directory '%s' doesn't match expected '%s'. Re-cloning", toplevel, ud.clonedir)
+                clonedir_stat = os.stat(ud.clonedir)
+                toplevel = os.path.abspath(output.rstrip()).rstrip("/")
+                check_dir = toplevel
+
+                while check_dir:
+                    check_stat = os.stat(check_dir)
+                    if os.path.samestat(check_stat, clonedir_stat):
+                        break
+                    check_dir = os.path.dirname(check_dir).rstrip("/")
+
+                if not check_dir:
+                    logger.warning("Top level directory '%s' is not a descendant of '%s'. Re-cloning", toplevel, ud.clonedir)
                     needs_clone = True
             except bb.fetch2.FetchError as e:
                 logger.warning("Unable to get top level for %s (not a git directory?): %s", ud.clonedir, e)
                 needs_clone = True
+            except FileNotFoundError as e:
+                logger.warning("%s", e)
+                needs_clone = True
 
             if needs_clone:
                 shutil.rmtree(ud.clonedir)
-- 
2.34.1


