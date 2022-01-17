Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F69CC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:10:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=U01mgxkt;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385442; x=1673921442;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lYiqsk7sBbUp5/ItuUFmLFk8y/8hh39+WeRlo+Szpfw=;
  b=U01mgxktJ6LdeSx1BvYKdBYbtWOpB0f9ywmwimy2VwNeC+IosX0pXQtz
   NntQEIQdcWEMg/hW20fmape/iSh4iRftg3CLzrS4wzKRlOjGSnIGjYTCs
   yKGwJZBS917yMTmPBHoJkvJGsIf/ONQyYVX2FUeNBAwUq3JL8DY7vcnXJ
   SdU7VlgP6A1YFJ5uus8O5FxX84oGu6KpmCv/9zM5kagVd0UmqgOTTuxHF
   NSlq5FSISCLPz12SFDkcbvuh2iXVob+qD44adrUyhRj1GlNjLdt749ftT
   WQuzIqmwOAuRr5aOIAdTFixgyirNRHsa0QfAacJHj0c+g8HtQQ/QyUOL3
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094197"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094197"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220691"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/12] cve-check: add lockfile to task
Date: Mon, 17 Jan 2022 10:10:23 +0800
Message-Id: 
 <53dc9b10eb5f064c68120337126f1542c1e0c832.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:10:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160622

From: Konrad Weihmann <kweihmann@outlook.com>

this should prevent running into the very rare error
sqlite3.OperationalError: attempt to write a readonly database

As highlighted by https://www.sqlite.org/faq.html#q5
it is likely that the adapter won't allow use multiple exec calls
at the same time.

So it's best to prevent multiple accesses at a time, by reusing
the already in place CVE_CHECK_DB_FILE_LOCK

YOCTO #14110

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 677f5741bd265be49d4a5bb933b3e8d8c4eec653)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 70d1988a70..6c04ff9f09 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -111,6 +111,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build after do_fetch
+do_cve_check[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-- 
2.34.1


