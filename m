Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C5ECF5374
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.7911.1729686904581536140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u+mhJOp0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c693b68f5so72382675ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686904; x=1730291704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tM4xgl5Rtt++bvAIzI/Q6LsEKPB/CMHtxkph5vzdCQ0=;
        b=u+mhJOp0VSp+oR5IcQdQUhDbUIDpGnnegMoiciNX+MbmMWNTJ26CRJoa6D+nlJoAY9
         oPPohYA8IMZRqCmkUNvL+JGe7tD1RxdmWQSOMdBPFNUG9G2RWyE2EFPbtULNX71PXSUH
         JY6IDx6qvkChwZ5fA7cCmyxqe7YIdnDEpJDyl8pkN6vHg2qvGibqd/HBJqg6dAiFcxK0
         XK8kL52wChrzXogpAY3Af6ig8bbPdPiIDvvkKLiD1M0sXnebxGWc7+h6TlGiGYA7SshX
         rUNX10/Ok4SaydwZpr/oVfolyC8Td/J81BjzvcUfSqGoKBFNrQYqAycCRX+p21g88I2o
         pcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686904; x=1730291704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tM4xgl5Rtt++bvAIzI/Q6LsEKPB/CMHtxkph5vzdCQ0=;
        b=XHFeyPTVjr7lmxCP1EgdDnROVSRGsCLzuxPujYv+7kqTCf7psBxzaUw/4NXiCs1Vsy
         RUAmsuEPudI58cBf2MWK5mKy3y7zXwYGWo7yQbN5T5aVDRhEc4tsVO0zIu7RTcFpCqUC
         zhAhiI7kDRB12HDs7M1AD8KU5vtMnLPcc5imXilomogKRm4XqytDtfUEn2U53K6EmCH7
         ne6/OI6Dy/SzyDlEV9ZLXrJMR85F6gVMz/3jdtAdk/lFCqohC6ulVYUaJAH/pGToGJdY
         tGd8mjd/mtbm/jLVymc71R+VTQle4GK2Pa9KDMAZ/z34z+Z8ZUj+/QzVtx2lq6f7UheO
         H+8A==
X-Gm-Message-State: AOJu0Yz0fmSAayNqKy2CZ6nws6nOJwZ1O5V5d83GtTZ+dkssMKf/I46y
	txN7imZtfwrpV2PcSjCnf+kXMq4kPElLDNZ9g3siO/Xf8rE71Q2N+/kmDuWBtjV1i2CKWq0u++S
	X
X-Google-Smtp-Source: AGHT+IHEde5x+AUKyOWEKuemuTZ7IyTn1XA5PAchtBgaHGkUEttSkTzsqaPjkva0oiq7jRN/i05VCw==
X-Received: by 2002:a17:902:f547:b0:20c:dc32:b5d0 with SMTP id d9443c01a7336-20fab2fe237mr29224555ad.58.1729686903710;
        Wed, 23 Oct 2024 05:35:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 12/27] git: upgrade 2.46.0 -> 2.46.1
Date: Wed, 23 Oct 2024 05:34:20 -0700
Message-Id: <46298bda0ac17750d5a120be21feaef2407da7ee.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206223

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
 * "git checkout --ours" (no other arguments) complained that the
   option is incompatible with branch switching, which is technically
   correct, but found confusing by some users.  It now says that the
   user needs to give pathspec to specify what paths to checkout.
 * It has been documented that we avoid "VAR=VAL shell_func" and why.
 * "git add -p" by users with diff.suppressBlankEmpty set to true
   failed to parse the patch that represents an unmodified empty line
   with an empty line (not a line with a single space on it), which
   has been corrected.
 * "git rebase --help" referred to "offset" (the difference between
   the location a change was taken from and the change gets replaced)
   incorrectly and called it "fuzz", which has been corrected.
 * "git notes add -m '' --allow-empty" and friends that take prepared
   data to create notes should not invoke an editor, but it started
   doing so since Git 2.42, which has been corrected.
 * An expensive operation to prepare tracing was done in re-encoding
   code path even when the tracing was not requested, which has been
   corrected.
 * Perforce tests have been updated.
 * The credential helper to talk to OSX keychain sometimes sent
   garbage bytes after the username, which has been corrected.
 * A recent update broke "git ls-remote" used outside a repository,
   which has been corrected.
 * "git config --value=foo --fixed-value section.key newvalue" barfed
   when the existing value in the configuration file used the
   valueless true syntax, which has been corrected.
 * "git reflog expire" failed to honor annotated tags when computing
   reachable commits.
 * A flakey test and incorrect calls to strtoX() functions have been
   fixed.

 * Follow-up on 2.45.1 regression fix.
 * "git rev-list ... | git diff-tree -p --remerge-diff --stdin" should
   behave more or less like "git log -p --remerge-diff" but instead it
   crashed, forgetting to prepare a temporary object store needed.
 * The patch parser in "git patch-id" has been tightened to avoid
   getting confused by lines that look like a patch header in the log
   message.
 * "git bundle unbundle" outside a repository triggered a BUG()
   unnecessarily, which has been corrected.
 * The code forgot to discard unnecessary in-core commit buffer data
   for commits that "git log --skip=<number>" traversed but omitted
   from the output, which has been corrected.
 * "git verify-pack" and "git index-pack" started dying outside a
   repository, which has been corrected.
 * A corner case bug in "git stash" was fixed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee7e9866ad942a9682e54878f1e7fb06c68c8cf4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.46.0.bb => git_2.46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.46.0.bb => git_2.46.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.46.0.bb b/meta/recipes-devtools/git/git_2.46.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.46.0.bb
rename to meta/recipes-devtools/git/git_2.46.1.bb
index 7c6beb5b5c..d301c474f2 100644
--- a/meta/recipes-devtools/git/git_2.46.0.bb
+++ b/meta/recipes-devtools/git/git_2.46.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "b138811e16838f669a2516e40f09d50500e1c7fc541b5ab50ce84b98585e5230"
+SRC_URI[tarball.sha256sum] = "b0a4d1ad50e820edd84c0d1b609c29349d4ae2681ed458914ea759aafcd4bf21"
-- 
2.34.1


