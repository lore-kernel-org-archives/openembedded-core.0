Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id D4CB665C5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:02:56 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v138so15404814qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0/lr7VwHunyGjb9j0Rj2EsRFeV/6gO2L/nKTgsJEfh4=;
	b=T9Lwt9GQ0kn4xstAiPYTjyxU6+ag7PpDUH9FTav5rZDFsyBoVWSmVWfIvNWKblCeyN
	eWgL3fnwhwYLGEigy0YZPvylauTNun+WSZXk/zcOh5PGNZelw50t05GVBFx/hZWy1u4c
	HJMspb9kSNM3Wr1bPYHGcyme00eKMaRC4Rr+OIwLgzfxGaf0hTFDt3/3hYn4OQ2aCEMn
	s8yTj2/eF6SrQxNaCcYN378plNt32pOhEsOao1RA2uJgpAMGw3rZ+akpD/U4qyQnhp3l
	eIrv1EsMGBcj+YbSAigExZPBf/dUrgojuRxtuEsByce/U4jkht/ZgbsLSsoSpPZU2emI
	EWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0/lr7VwHunyGjb9j0Rj2EsRFeV/6gO2L/nKTgsJEfh4=;
	b=kICP0ETVNkknMksHnC5W2sCVDyZhz2nFlHPgyoFy3q8QidIUdrw+f3VQfEGhc0/gQS
	KNbNo1ibSqQLJoaXwnnM4l6b8CYQtfOW5R7fwFTf+b3dBeKqnHWOYJVBUe7lttU1Of/O
	gWn6KpXWwZhbq2UG/jImicEeLE1FbVngY3YCLSc3lO5PE0kTdPl3T7q/kr7wNR0lfR4C
	maZY4GEB5OtuIbaFv7AHvTrMg2RPGEqHlYt4y+VwEO1IRCmnKSmvOTd33uDUYw7osP6a
	64D3NNrN02K4aBkGFyzCXOFXKn9jZqqFtcrwlLmQ5u9tY1g+RvOA8h9m0UX5w0Pwa8/X
	jpnw==
X-Gm-Message-State: AA6/9RmTTG+pSNYiQ/xoFXOhIJMZJbMVbpf8nR2jfA3gGZ8JKi/CFLf0wZBAy7MAXYvbZw==
X-Received: by 10.55.65.75 with SMTP id o72mr24696578qka.84.1476745377982;
	Mon, 17 Oct 2016 16:02:57 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	l57sm13864806qta.8.2016.10.17.16.02.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:02:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 16:02:53 -0700
Message-Id: <1476745373-6446-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] buildhistory: fix latest_srcrev in the common case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 23:02:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

buildhistory was writing srcrevs.values() as SRCREV when only one
srcrev/branch exists. This returns a view of the dictionary values in python
3, and used to return a list in python 2, neither of which is an appropriate
value for SRCREV. It was resulting in latest_srcrev files like this:

    # SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
    SRCREV = "dict_values(['346584bf6e38232be8773c24fd7dedcbd7b3d9ed'])"

Which in turn would result in invalid output in buildhistory-collect-srcrevs.
Fix by calling `next(iter())` on the `.values()`

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3a5bc2c..d82e9bb 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -833,7 +833,7 @@ python write_srcrev() {
                         f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
                     f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
             else:
-                f.write('SRCREV = "%s"\n' % srcrevs.values())
+                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
             if len(tag_srcrevs) > 0:
                 for name, srcrev in tag_srcrevs.items():
                     f.write('# tag_%s = "%s"\n' % (name, srcrev))
-- 
2.8.0


