Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AE1E6E7EB
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13354.1770113965111681079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ni3WKt6Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43596062728so363173f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113963; x=1770718763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vH6BK87+e/mwaObVUH+CZXj4Q/sC6OfiwDoCePdFOkc=;
        b=ni3WKt6ZTU7pGlE4mlGqoPSOAaCpljvq9wLuMBe40qN5seRwUAu86kgKeGfuZoFG3A
         gIVJOsnPZhixp4IML0nCM2EZ8YceMZ/oIGBVgHpXUrUJmWRKL+HLg5swBJ8NZQ7y961W
         FUku2IOA4GLxZLMniulfQASd/JaIaJOqzvoU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113963; x=1770718763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vH6BK87+e/mwaObVUH+CZXj4Q/sC6OfiwDoCePdFOkc=;
        b=cxeYGlKtQO3TXDn0WbMnuIZnCDb/RuvWtw5S9SqxiPzqPp20ystm5NFJzPUJOnfzlB
         fVMcrDbH/4tsNT3/+jvXNvSASoh4uJHer3F4jMe7NLN6tr561MPzN55lcDLTOqVNPbT7
         8NGhYsR6olIQjLYybQZy/TLk6iI5UasE53AZIKGSRDNKZICKIueGmz8Fj0SAUh7YgBZ7
         kuroJwGSyn8APJsC10YPQNIKRjIa+u0Fzt/obcFWTA/B1xXKo3ZxADQ+CIjaj4nubdGL
         HJuNZRJsJqyqATz+DEUMprEbXuBpdRiZErakauzRl7/ur8S9NWSylbtt+7p+hnyqN2DF
         EjNg==
X-Gm-Message-State: AOJu0YwSI1UJZwvasn5rb0/AjYRpKt2GvIdDIr1LIb2KtRBCD1C+Rb4u
	gWfHHnMb3K3hfrtvN6Rs8vl8o9H2c6H8k3/+IRYOkicR/26nJX6s5qljZMrdjYpgs3wyhtOw98E
	lOd1UZKs=
X-Gm-Gg: AZuq6aLUwXjGxufZL2205kzMvjRA241DddaE9lEf5pTCJWSV72mESjSSj1bo4Sz9WiA
	M7MpzhAtK8VJ9+JUeQUpyWjHVWOhRzmetVAoXdCoA2twz7p37sMFIlYc65zKvIRbckq3lshf5YR
	hROpB5aFo3sjnC7pkgE7I3bFCpjlYRTb1FTqrYw1lIQkmgFuyCNDxEuuNTlQO/RXyjpZC1xoGF9
	dqmXXfS8CYPROJvo1W4b6OuHIkgDiX2gPQ62aTzVI15NXzyIbWcyJ2Q4EPe9o0k0rS6CshSTWeM
	0REnwqo6YVXSc2jYDsQE2Nee0l4GAVSYNq/bvdDqNBPYqgr8LIgBbfGMj9vzNP5z6jYrSbscYY8
	tloN0t7Lkw0RiV5hsyqMUp3bqj/QhrKCSgabghQDXTjopnJrVnPMSpRFG4/RI/dmp8objl93Re7
	qnt1Odd8UWPNNRi+YH+Tnvx7/3L0dnPvoC8cT8C1JzvUQ2csKeJ2rq5TeqF7jvQ8ZltPR4ZMqNQ
	X0t4sE9ov0Z+eo=
X-Received: by 2002:a5d:6408:0:b0:436:251:b574 with SMTP id ffacd0b85a97d-4361130b3eemr2812747f8f.5.1770113963204;
        Tue, 03 Feb 2026 02:19:23 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 02/22] oeqa/gitarchive: Push tag before copying log files
Date: Tue,  3 Feb 2026 11:16:31 +0100
Message-ID: <c35be1a5b2b07569d00a1b49665d8d238dd773b6.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230430

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Resulttool creates a git tag in the yocto-testresults git and then
copies log files to a newly created folder on the NFS share, whose name
is controlled by the name of this git tag. As tags are unique, the
folder name is also unique, preventing any clash between different
builds.

Today, the tag is pushed from the calling script, so after the folder is
copied. This can lead to some issues if for any reason the tag is not
pushed. This might also lead to some race condition. Allow to push the
tag before coying data, in order to prevent these issues, and add a
warning if the calling script choose to not push the tag but still copy
the log files on the NFS share.

Fixes [YOCTO #15696]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d869c9c5aaeeda9fa476bfe6b05ded6e225379d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/resulttool/store.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index f3caafaff82..dc2c259331b 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -82,9 +82,14 @@ def store(args, logger):
                                   "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                                   False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                                   'Test run #{tag_number} of {branch}:{commit}', '',
-                                  excludes, [], False, None, keywords, logger)
+                                  excludes, [], args.push_tags, None, keywords, logger)
 
             if args.logfile_archive:
+                if not args.push_tags:
+                    # As no tag was pushed, we can't guarantee there "tagname"
+                    # is uniq and so we might have several builds trying to use
+                    # the same "logdir" target.
+                    logger.warning("Archiving log files but the %s tag was not pushed: this may result in target folder conflicts")
                 logdir = args.logfile_archive + "/" + tagname
                 shutil.copytree(tempdir, logdir)
                 os.chmod(logdir, 0o755)
@@ -123,3 +128,5 @@ def register_commands(subparsers):
                               help='only store data for the specified revision')
     parser_build.add_argument('-l', '--logfile-archive', default='',
                               help='directory to separately archive log files along with a copy of the results')
+    parser_build.add_argument('-p', '--push-tags', action='store_true',
+                              help='push created tags to remote git')

