Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA5EC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 14:50:49 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.15934.1646578247468897522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 06:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:59260 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nQsDd-005g3z-7p
	for openembedded-core@lists.openembedded.org; Sun, 06 Mar 2022 09:50:45 -0500
Date: Sun, 6 Mar 2022 09:50:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: does "do_kernel_metadata()" not generate any output in some cases?
Message-ID: <4d747be-12ae-2bf-a0cc-b5d9e8df8f33@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 14:50:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162787


  colleague is playing with RISC-V, building QEMU images, and wanted
to know how the kernel is fetched and configured and built and so on,
so i decided to list the kernel tasks and write a short summary of
what each does (since i think this will be useful shortly), and what
artifacts it generates for use by subsequent steps, and i was doing
fine until i got to do_kernel_metadata(), where i can see that it is
invoked twice:

  - first time in "patch" mode
  - second time from do_kernel_configme() in "config" mode

  but when i bitbake'd the kernel_metadata task for my generic x86-64
kernel, i couldn't find any generated artifacts from that step.

  certainly, stuff is going to be created later during the
kernel_configme() task when that task is invoked again, and it appears
that a fair bit of code will be re-run, but is it the case that,
because i'm building a really trivial configuration (all i've added is
a single .cfg file to demonstrate how it's processed), that the first
call to kernel_metadata() figures it has nothing to generate?

  i can see all of the output from the tail end of that routine:

  if [ ${KCONF_AUDIT_LEVEL} -gt 0 ]; then
    bbnote "kernel meta data summary for ${KMACHINE} (${LINUX_KERNEL_TYPE}):"
    bbnote "======================================================================"
    if [ -n "${KMETA_EXTERNAL_BSPS}" ]; then
      bbnote "Non kernel-cache (external) bsp"
    fi
    bbnote "BSP entry point / definition: $bsp_definition"
    if [ -n "$in_tree_defconfig" ]; then
      bbnote "KBUILD_DEFCONFIG: ${KBUILD_DEFCONFIG}"
    fi
    bbnote "Fragments from SRC_URI: $sccs_from_src_uri"
    bbnote "KERNEL_FEATURES: $KERNEL_FEATURES_FINAL"
    bbnote "Final scc/cfg list: $sccs_defconfig $bsp_definition $sccs $KERNEL_FEATURES_FINAL"
  fi

but i don't see where in kernel_metadata() any of that is *saved* so
that it doesn't have to be recalculated. again, i'm building a stock
qemux86-64 image, and adding a single .cfg file (no patches), so maybe
this example is so trivial that nothing is generated.

  thoughts?

rday

