Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80343C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 11:24:27 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.8756.1651231457960502857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 04:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ih1X2f9V;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651231458; x=1682767458;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zCS0MqkZQ6Qu6pwQjjsvNo+tljLGNbIztKj57IPpzbg=;
  b=ih1X2f9Vhnjp/8HWaRcXvz4536568BAgZdjVi0K6Z1PIB294bd81K8JZ
   wD8QOtxUSPAWUaMjBuehqxH+iUYHZeupaeycIOrAs2u551UoUExyJpr44
   FLD6+DQtHbQAaUI5eqkxHL8fihqBp15EPERnMyWn3r7zzkvfcNuNlwt1d
   JzCI9ScR+JNBwK+2zbIZYGoAWG5s4Isv1I0adSdoF+rQdVgXzolt6buMf
   f5hg7k8fRezKl31/UDNWLqIzUPdpEGWSsG1obvzq3qZCBuMri65aOJ15a
   prnymBI5DxCN393tUYuj3P7VDDVLOyuPDEZKNKQZ+zMI2SLDeFRcTk/MA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="291785721"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600";
   d="scan'208";a="291785721"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 04:19:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600";
   d="scan'208";a="684639250"
Received: from fsuhimi-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.146.39])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 04:19:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 1/1] bitbake.conf: mark all directories as safe for
 git to read
Date: Fri, 29 Apr 2022 19:19:27 +0800
Message-Id: 
 <7a97531169d662fe0466db5992566bcdbe3a0d5f.1651231002.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651231002.git.anuj.mittal@intel.com>
References: <cover.1651231002.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 11:24:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165005

From: Ross Burton <ross.burton@arm.com>

Recent git releases containing [1] have an ownership check when opening
repositories, and refuse to open a repository if it is owned by a
different user.

This breaks any use of git in do_install, as that is executed by the
(fake) root user. Whilst not common, this does happen.

Setting the git configuration safe.directories=* disables this check, so
that git is usable in fakeroot tasks.  This can be set globally via the
internal environment variable GIT_CONFIG_PARAMETERS, we can't use
GIT_CONFIG_*_KEY/VALUE as that isn't present in all the releases which
have the ownership check.

We already set GIT_CEILING_DIRECTORIES to ensure that git doesn't
recurse up out of the work directory, so this isn't a security issue.

[1] https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bed8e6993e7297bdcd68940aa0d47ef47120117)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/bitbake.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c2cb2f0d9d..51253003fd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -730,10 +730,18 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
+# Git configuration
+
 # Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
 # repository when building a recipe
 export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
 
+# Treat all directories are safe, as during fakeroot tasks git will run as
+# root so recent git releases (eg 2.30.3) will refuse to work on repositories. See
+# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9 for
+# further details.
+export GIT_CONFIG_PARAMETERS="'safe.directory=*'"
+
 ###
 ### Config file processing
 ###
-- 
2.35.1


