Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95AAC77B62
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.18078.1678709754883925084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=htJOTAmM;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id ek18so16708638edb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXMfidt6WhQuahWGl6Bo/kclS+ZWpxVKXApQuEAzJzw=;
        b=htJOTAmM+fHt1/kKA44rGwLFm4YBGTb5pUkF00BDsa4VO3Xm5hr7S4fsCfqXH6otHC
         Gk2J2QghaxCoMDXeTCKEEDyjquw8SiEQFqFZjqSmhdtgfPpxNkfga5tP9OQ6cvlpzOB2
         iCczPnoD92V2tXEJ0yOLKxpPhpTxzlm9f/sMbgnbYdINka0mVv/cm5gFqlBR/uSRJY9M
         cvOEeu0VHjdV6CHW2DpNnxq2JiMikb9SD74cdsxr+JDquPQDBlcDKVtfIhgc/3Krzo25
         SBAQC60u18BTqbSfPUeFlFVdOkCV8+hjpHAowo+dKgsn/nVDA+uB1EtdR88tUQN2XAvu
         dPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXMfidt6WhQuahWGl6Bo/kclS+ZWpxVKXApQuEAzJzw=;
        b=x4jUiI0G4WzXr62k6Uz7i81+nLWsdheSHIPRozkHOYbZhZUq+Nt7LlqwDmf81vBNzQ
         kVsY3VXsR1vuAv+vP3zZuH/CjArSmUqVNJFl//q4ykmg6U51e3+oQSkR9d51+mQPZBAv
         p6a9y5RVf7sy93Qul3Egbnkl7a87CtL3QNsl59CyYuAjaX5rlXI0IndEdlaCAyhNDrt5
         7bMsTVMAA/3FhJeemks36d+mkvi2UEsS8yP76RELFiOfNM8yNjrVv09SWBRg7oPU+xZ2
         MI0IrFz3sGnAMODgPQnYSLfgMpgrR71y9qBE6YVwO5CQNgP8iGG3A9jkNn8QgRgqO/2+
         NELA==
X-Gm-Message-State: AO0yUKULqy99QZb2CoA5l105zOeRhvPOT7KDZpUo6cd379d+pTmO5vFV
	/L7wu4XlQiQTE3j8u6gR6r8l6JTajDg=
X-Google-Smtp-Source: AK7set/rbpTvZhhhgxlXugQtvJsm3AInpNgc+f+T/KnQ2pWMh8yvr714+KvzGXHVFQXScngZqSnB+w==
X-Received: by 2002:a05:6402:1605:b0:4fa:aee8:235f with SMTP id f5-20020a056402160500b004faaee8235fmr6237165edv.9.1678709753354;
        Mon, 13 Mar 2023 05:15:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m2-20020a509302000000b004f1e91c9f87sm3172805eda.3.2023.03.13.05.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/14] git-submodule-test: disable upstream version check
Date: Mon, 13 Mar 2023 13:15:28 +0100
Message-Id: <c9b17cb2b5bc66d5592ba46564fdb6cbdde1aec6.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178433

* this is one of the failures from distrodata.Distrodata.test_checkpkg:

  2023-03-11 14:26:21,482 - oe-selftest - INFO - ======================================================================
  2023-03-11 14:26:21,482 - oe-selftest - INFO - FAIL: test_checkpkg (distrodata.Distrodata.test_checkpkg)
  2023-03-11 14:26:21,482 - oe-selftest - INFO - ----------------------------------------------------------------------
  2023-03-11 14:26:21,482 - oe-selftest - INFO - Traceback (most recent call last):
    File "/OE/build/poky/meta/lib/oeqa/selftest/cases/distrodata.py", line 40, in test_checkpkg
      self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
  AssertionError: False is not true :
  The following packages failed upstream version checks. Please fix them using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
  (when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git). If an upstream version check cannot be performed
  (for example, if upstream does not use git tags), you can set UPSTREAM_VERSION_UNKNOWN to '1' in the recipe to acknowledge
  that the check cannot be performed.
  git-submodule-test
  binutils

  Stdout:
  Loading cache...done.
  Loaded 0 entries from dependency cache.
  Parsing recipes...done.
  Parsing of 947 .bb files complete (0 cached, 947 parsed). 1764 targets, 46 skipped, 0 masked, 0 errors.
  ----------------------------------------------------------------------
  2023-03-11 14:26:21,482 - oe-selftest - INFO - Ran 1 test in 193.764s
  2023-03-11 14:26:21,482 - oe-selftest - INFO - FAILED
  2023-03-11 14:26:21,483 - oe-selftest - INFO -  (failures=1)
  2023-03-11 14:26:26,258 - oe-selftest - INFO - RESULTS:

  martin@jama /OE/build/poky/build $ devtool check-upgrade-status git-submodule-test
  NOTE: Could not list remote: Fetcher failure for URL: 'gitsm://git.yoctoproject.org/git-submodule-test;branch=master'.
    The command git -c gc.autoDetach=false -c core.pager=cat ls-remote git://git.yoctoproject.org/git-submodule-test refs/tags/* gave empty output unexpectedly
  INFO: git-submodule-test        1.0             UNKNOWN_BROKEN  None

  and there are no tags in this test repo:
  $ git ls-remote git://git.yoctoproject.org/git-submodule-test
  a2885dd7d25380d23627e7544b7bbb55014b16ee        HEAD
  d199bbf9ed2216bd1f38aec000d865ae08279119        refs/heads/changed-url
  a2885dd7d25380d23627e7544b7bbb55014b16ee        refs/heads/master
  049da4a6cb198d7c0302e9e8b243a1443cb809a7        refs/heads/ssh-gitsm-tests
  bbe99a1465c5cc52720936d075ddbc5ebe2ed731        refs/meta/cgit

* the binutils failure is strange, when I've added some debug output
  to see why it's listed the issue disappeared, maybe some temporary
  network glitch or something

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-test/git-submodule-test/git-submodule-test.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index fa3041b7d8..90d9b66b2c 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
 
-- 
2.39.2


