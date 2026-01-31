Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34250D79751
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5003.1769846217773259409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g0yejJM0;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso25100295e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846216; x=1770451016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vH6BK87+e/mwaObVUH+CZXj4Q/sC6OfiwDoCePdFOkc=;
        b=g0yejJM0Q6zZtcQe2Ho4WjQaV4cV4rVKuw6CNIqiEAR/HP1hhRHY8+cNe94pmTIsdz
         hB3Mn9Y6ZMI+MVrDOWkhUITyyVkaxqBYba054HGvaoIliuEmPza6JiB4xXkr+MfQuwOh
         BryX16b6lNOb6V1a9b4a2hVqKp9fr9+8CsgLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846216; x=1770451016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vH6BK87+e/mwaObVUH+CZXj4Q/sC6OfiwDoCePdFOkc=;
        b=f+Ih3AHS0RQDhoXIQnWm/E8NyG1UkQexA5wArnFa8dITV/dYCMj0DZz2+cy5zj2vHV
         KTik4hitJf4CGDtPEj6kkzy8dlYpVqdWENIJoLfE9duy9rF8FZ4M/e3vXnqSx+HUaYpM
         +bgyBd59q1Joni2XqR5pbfbGwTbu4H2+Qlq7ZcXB3beU0vq9+5Dhu7J9ZIP73SiP0i5N
         p8MvXkzJIQdFKOsgTcVkMz+2uB7meihJwzkp5/Z7TB34glrQEygaZaaAMji/fcUxq3Qe
         0gwrb0isylWM5YrsfaXrfEGNErwnNYToS8bdFiJPfAUzsqtrNdj7BY6pf0qBYQQQR7Yy
         u20Q==
X-Gm-Message-State: AOJu0YyhHsWpm/LiP8IJZtqx7AbOlI8Vx54Z8iVaCPhaiVmbLJZbTEe/
	r9+yLJLbnYSV0VoGsjoeBDcUSI4n5H6NbrRpdd2ZcvtA6LQYNwqc2mX+lRKdiGD+qRYKf5xkvRb
	f1HvFUqc=
X-Gm-Gg: AZuq6aItzqebxnR0rLYZ5l13QRcXZe9M1x92jBhDcBLOqoraQd6n0Ge+nEibuMzXoJ6
	b7p3DSOgzsC76UR5N3z25ULnyf6F6gAtOjm5fPqoKvQkVVpya5WATuCZ7Pevee7RX2BsR8/HHWm
	/NNOPQKMYZwZE474lBlr5im4Dqg8TwDwTsQFKo2fmbog40Mn72T9lWD72yhmMI9kqJM5Bc4Fs++
	d8O+fhvJoTv63YK6qDPiyj4zrnjEbPGcA/mIbCJ1NlAYorWeXGeh6k55h14zRVzNh4Ps9d7efZ1
	EyWvuj3SqJQL2Q7y2uCF+pM92WVkN+ozTly8+236Iv3SyfSn+xQsxRQcgP/O2Xzgbq1n4p3Wed7
	M3G6v8NZYdu9S8OG90E79UGYiBgJ6p6VzjLVaQWu6r75AOCAS4BEQsfTYMbzQH+asVJRCH2e4g4
	xmg0HRcj4IWUfH0iFoLfstfIDsyqyc8/A0+TVAc9z07FOntJcvUgYOIHXV9ps/CM8TsJOG/ak8C
	2D35iQ5vRoLMRvWb5hq1BXz1h4=
X-Received: by 2002:a05:600c:19c7:b0:47e:e981:78b4 with SMTP id 5b1f17b1804b1-482db477009mr71928225e9.12.1769846215761;
        Fri, 30 Jan 2026 23:56:55 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:55 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 02/22] oeqa/gitarchive: Push tag before copying log files
Date: Sat, 31 Jan 2026 08:56:13 +0100
Message-ID: <c35be1a5b2b07569d00a1b49665d8d238dd773b6.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230207

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

