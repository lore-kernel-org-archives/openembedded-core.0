Return-Path: <jason.m.bills@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9B5C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:21:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.28211.1647274892317041337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=QF5jDTZ7;
 spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.43,
 mailfrom: jason.m.bills@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647274892; x=1678810892;
  h=message-id:date:mime-version:subject:references:to:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=QY/dXrcbT+AKN2uDar9+T0YVOUD4Z8mQj9d+UPxFyts=;
  b=QF5jDTZ7gG9xJZvBBiVLo0dTTsIMVbPXz8UuYk82veA65mcmPi5lnoqw
   euQ3cQU0+Ncdd0oCVWz0VSdn25eN2dLRpLXQAswmXXatGVh9qSnU1Kr/v
   vM81TMnJQiG06o6CngPdDAUNHCpH07rxEdXu8AX8JvvNvaL3DzzbBlsWN
   wjsuutYaAExsU5fJJP04/5ZVuSTakObIiQfaOr/KDzdr5HZMMqZUfs8DA
   UhA3KIbHobJVaZYSAj2VLnOrBAOSbGYTErn17I3XdZuHes0SB0Uv52bYS
   QpntahgO49jJ4YzIVDuuDa9ACk81tcvKFTttxC7JKMX5c4HhRXDC9lfia
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="342502876"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400";
   d="scan'208";a="342502876"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 09:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400";
   d="scan'208";a="612948617"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 14 Mar 2022 09:21:31 -0700
Received: from [10.255.228.36] (jmbills-MOBL.amr.corp.intel.com
 [10.255.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id B2D1C58097C;
	Mon, 14 Mar 2022 09:21:31 -0700 (PDT)
Message-ID: <f3dd9984-eae8-61f6-f4bd-812cc13417c5@linux.intel.com>
Date: Mon, 14 Mar 2022 10:21:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH] kernel-yocto: configcheck: create cfg folder if it doesn't
 exist
References: <20220311171050.30748-1-jason.m.bills@linux.intel.com>
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: jason.m.bills@linux.intel.com
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <20220311171050.30748-1-jason.m.bills@linux.intel.com>
X-Forwarded-Message-Id: <20220311171050.30748-1-jason.m.bills@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 16:21:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163158

In some situations, the cfg folder doesn't exist when a config
check returns data, which results in a python exception:

File: '/.../meta/classes/kernel-yocto.bbclass', lineno: 590, function: 
do_kernel_configcheck
      0586:    if analysis:
      0587:        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
      0588:        if os.path.isfile(outfile):
      0589:           os.remove(outfile)
  *** 0590:        with open(outfile, 'w+') as f:
      0591:            f.write( analysis )
      0592:
      0593:        if bsp_check_visibility and os.stat(outfile).st_size > 0:
      0594:            with open (outfile, "r") as myfile:
Exception: FileNotFoundError: [Errno 2] No such file or directory:
 
'/.../openbmc-openbmc/build/tmp/work-shared/.../kernel-source/.kernel-meta/cfg/invalid.txt'

This adds a check to create the cfg folder if it doesn't exist to
avoid the python exception.

I have only seen this error with invalid.txt, but it looks like
mismatch.txt and redefinition.txt could hit the same issue, so
adding the fix for those, too.

Signed-off-by: Jason M. Bills <jason.m.bills@linux.intel.com>
---
  meta/classes/kernel-yocto.bbclass | 15 ++++++++++++---
  1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass 
b/meta/classes/kernel-yocto.bbclass
index 1d5a8cdf29..d35f4629cb 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -562,7 +562,10 @@ python do_kernel_configcheck() {
          bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
       if analysis:
-        outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
+        outpath = "{}/{}/cfg".format( s, kmeta )
+        if not os.path.exists(outpath):
+            os.makedirs(outpath)
+        outfile = "{}/mismatch.txt".format(outpath)
          if os.path.isfile(outfile):
             os.remove(outfile)
          with open(outfile, 'w+') as f:
@@ -584,7 +587,10 @@ python do_kernel_configcheck() {
          bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
       if analysis:
-        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
+        outpath = "{}/{}/cfg".format(s,kmeta)
+        if not os.path.exists(outpath):
+            os.makedirs(outpath)
+        outfile = "{}/invalid.txt".format(outpath)
          if os.path.isfile(outfile):
             os.remove(outfile)
          with open(outfile, 'w+') as f:
@@ -603,7 +609,10 @@ python do_kernel_configcheck() {
          bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
       if analysis:
-        outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
+        outpath = "{}/{}/cfg".format(s,kmeta)
+        if not os.path.exists(outpath):
+            os.makedirs(outpath)
+        outfile = "{}/redefinition.txt".format(outpath)
          if os.path.isfile(outfile):
             os.remove(outfile)
          with open(outfile, 'w+') as f:
-- 
2.17.1


