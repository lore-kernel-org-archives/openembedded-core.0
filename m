Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A85C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 11:03:21 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.9341.1648119799758096130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 04:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=avjb2aOV;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648119799; x=1679655799;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HwPpd1pcVFywWXnc0swFbp85ibHWSsWxGEFF1UaTECc=;
  b=avjb2aOVoHPt8ZKqXwPZLkOh97urL36SPM+S2e4u3jGqCvvvRqm+t3Vw
   q6DyWl7w0k3xVKGBpvgcW3fCeTqSMMLIV5tMdPayUBoKKue4L8xTy1HAL
   dggU5KQfHVV4tp/+XWyxEP32MKJPLIsW8C13OhBQ3IR/WgLZGq3Eahhus
   avHskPXWBoG/38uPlvV3GmEIANSA5lY0tnJuYxTzzJ0UUBeffffQyZTur
   m4hGQUiFWivjwRB8CmIskXM/XHIiq4pJz0or9zA+sFvyv5ddEtGUS4Y+W
   6VaYYV52HDKDSoJDR/lp6UMV38+arnE0XS1HS3CyvmNgUjPC8FDK5WKqE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238950586"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400";
   d="scan'208";a="238950586"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 04:03:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400";
   d="scan'208";a="601652501"
Received: from yeeweita-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.139.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 04:03:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH] crate-fetch: fix setscene failures
Date: Thu, 24 Mar 2022 19:02:56 +0800
Message-Id: <20220324110256.6989-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 11:03:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163603

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In sstate.bbclass, when fetching an sstate object we have:

pstaging_fetch(sstatefetch, d):
[...]
    localdata.setVar('SRCPV', d.getVar('SRCPV'))

i.e. some code which expands SRCPV before it changes SRC_URI for the sstate
tarball fetching. In crate-fetch.bbclass we have:

def import_crate(d):
    import crate
    if not getattr(crate, 'imported', False):
        bb.fetch2.methods.append(crate.Crate())
        crate.imported = True

def crate_get_srcrev(d):
    import_crate(d)
    return bb.fetch2.get_srcrev(d)

SRCPV = "${@crate_get_srcrev(d)}"

and so an "import crate" occurs when pstating_fetch() is called. That succeeds
and all is well but the bb.fetch2.get_srcrev(d) call fails since there is no url
in SRC_URI which supports srcrev() resulting in:

| WARNING: rust-cross-core2-32-musl-1.54.0-r0 do_deploy_source_date_epoch_setscene: ExpansionError('SRCPV', '${@crate_get_srcrev(d)}', FetchError('SRCREV was used yet no valid SCM was found in SRC_URI', None))
| WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/rust-cross-core2-32-musl/1.54.0-r0/temp/log.do_deploy_source_date_epoch_setscene.3133099
| WARNING: Setscene task (/home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_deploy_source_date_epoch_setscene) failed with exit code '1' - real task will be run instead

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/crate-fetch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/crate-fetch.bbclass b/meta/classes/crate-fetch.bbclass
index a7fa22b2a0..04d76c0de8 100644
--- a/meta/classes/crate-fetch.bbclass
+++ b/meta/classes/crate-fetch.bbclass
@@ -22,6 +22,9 @@ crate_import_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 def crate_get_srcrev(d):
     import_crate(d)
+    srcuri = d.getVar("SRC_URI")
+    if "crate://" not in srcuri and "git://" not in srcuri:
+        return "Invalid"
     return bb.fetch2.get_srcrev(d)
 
 # Override SRCPV to make sure it imports the fetcher first
-- 
2.35.1


