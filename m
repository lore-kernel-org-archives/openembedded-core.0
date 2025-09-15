Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C50CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:02:16 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.28089.1757926931978709789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YMPya4wk;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso228341566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 02:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757926930; x=1758531730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=960WtGgVjzqYXRXPYxoNidjwFaaBZA51/MvGPerQyLI=;
        b=YMPya4wkRdWn/eWycF9CNkas2+NfknnKkinkZSWGS5WtexdgI+79u7/wh5M/Xee9O1
         tzKrk7BWL4qm0t5Fcis6Jeam1UctefKY8CLtJzjSrZzOTDgvEgYi2xSPj/j2ONyL9URH
         k+BY92AUNTu+6ih3Ja7BdceekMUior0NzFtUORggGNaP3oCYqcdT3iXByEGrD1zLYOTi
         bDPgkbpTFBcKMKVPgjddMIe2fs6/GBGkcrz8511afn/bKBxjahq7Gu3yyGydxO40CNy4
         KkuCJROgzlJFdmE/YuvzyfxQ+DJFEG/oVhKvB+s+PNLRF0ipMUFs0w/+DLVB7QtPpMlv
         +6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926930; x=1758531730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=960WtGgVjzqYXRXPYxoNidjwFaaBZA51/MvGPerQyLI=;
        b=MbHtvXfukx5EpQp+9nBqKT8pQ1WvSI38M0BzYus5JIzhUc4R64mcmfoDr0wtZsxAX4
         1HKveQ4wggadsTm419AVsn+PuedkedxHkrBZNMXayrLUp6mfpQKBpiNWGLgN1qlIvk8P
         WYsrMSF0EjmLBK58dJ3u5RhLvmA9P0MC2md0WkqvWwDuib0URtF53oqSZ36+vq0zhRqp
         1zjkq/GDA9lpCnobRwtvL6IIU7/wiqaX2LJQBQD1RQOiP1NXFiT1oFa6nzP4KJN4Dc91
         qYvYEpQ71JMQ8ZTi9o4hehWkGeeaPicjM/RiOpnACaXpmk1ULSibiDGGOxuBFPk9+VWq
         GkSQ==
X-Gm-Message-State: AOJu0Yyq+bYwLd8xvoE2KFJn74yg/6X1yjPugaJrIepB7pkCU8Qgufoq
	sxJG6jYszkuAgK4p9+HzMPxLzgCKqzrKK19rrj0x2l/KtVUuuSPPOYXaDSiKVg==
X-Gm-Gg: ASbGnct8TcSssmVEL6hVyp6b/k/qGvVzYNE4DfC5Z6cF0YkrNz+EwxpsIoYFmUufpAf
	4WuvbS8HLc+3LrwuVj+6sm+TwE+zVwLeyMhIUxzvmhn00IxyeUhYh5cVo6vOcJH4HIF/4fgNvfW
	fjIxvVSdA9nYCxG9naTrmWuX1Lug9qbYKDX1lfapsiXpx0v+AYxZTdE7OnnxB1LPPBF0Cmsq/VU
	1bgx8dwYgXgyCDkYW1UymH0PNwOBF7vGS5gmQo7lNRo07T6n5/RiznUBtDXl+5njdj0TwMkMDvp
	70ct5awYCSA36/hAW0MZNBU0Xwx+Pt1KuPa/DXx+j4npwjbSiqko6zCj47KVl23kAv4JaqhRTgG
	ZXU+ZISzr4pXDR2cHyqw0E9hY7lJWbYI=
X-Google-Smtp-Source: AGHT+IGvFTQjhcA4atT9uMmOWnvnRm9qqb2rNOBvN+Jw2ylHd8FsTIudLNkJGX3skz6+W776N87FRA==
X-Received: by 2002:a17:907:3f1f:b0:b0d:d831:6fb8 with SMTP id a640c23a62f3a-b0dd83178famr496257466b.62.1757926930106;
        Mon, 15 Sep 2025 02:02:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f22b1sm914691566b.86.2025.09.15.02.02.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:02:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] patchtest: apply patch in repo root
Date: Mon, 15 Sep 2025 11:02:05 +0200
Message-ID: <20250915090208.2007216-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223391

Patchtest tries to apply the received patch on the repository, without
specifying the directory, which means that the CWD is used. In case the
patch modifies a content in a different folder (e.g. the script is running
in ./meta, but the patch modifies ./meta-selftest), the patch will be skipped,
but git still returns 0, instead of complaining.

To avoid such false positives, specify the working directory for applying the
patch - the top of the repodir.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/lib/patchtest/repo.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 8ec8f68a0b..2cdd6736e4 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -52,7 +52,7 @@ class PatchTestRepo(object):
         self._patchcanbemerged = True
         try:
             # Make sure to get the absolute path of the file
-            self.repo.git.execute(['git', 'apply', '--check', os.path.abspath(self.patch.path)], with_exceptions=True)
+            self.repo.git.execute(['git', '-C', self.repodir, 'apply', '--check', os.path.abspath(self.patch.path)], with_exceptions=True)
         except git.exc.GitCommandError as ce:
             self._patchcanbemerged = False
 
@@ -76,7 +76,7 @@ class PatchTestRepo(object):
 
     def merge(self):
         if self._patchcanbemerged:
-            self.repo.git.execute(['git', 'am', '--keep-cr', os.path.abspath(self.patch.path)])
+            self.repo.git.execute(['git', '-C', self.repodir, 'am', '--keep-cr', os.path.abspath(self.patch.path)])
             self._patchmerged = True
 
     def clean(self):

