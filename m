Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33404C63709
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:11:43 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7702.1670483499579031936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ERyhzm+P;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670483500;
  x=1702019500;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W+s8HwqprP0DrDkf0za8i1y92YGPX+yqb0itUiTBIhs=;
  b=ERyhzm+P9xuDNA64h7lZo9nWaHJQhdlD1v7wqHvp57k9R35pCt5BVkDS
   GwPPEPKJt85lpKuRUaHTqW9A62cAyMEAZ/RUk1NO7fkxdoZFnRcgQv41M
   udeznWdcoJSHAX5Ylf/4m6QmqYqudfCWhBgHHK7tEGCX35U7dZuG9VdH4
   04tgMP1tVmgMf+NzrvIY9saVBh2KDT5LtLMHP2bUCDpNNjY1DKjsVP3td
   VRvZWXMkI28neAAJTF9KQAqXkvF6KSlWTrymttd4qg9nP1PQVjQA+5j88
   YI5wQb4O1V3db0+5RnG79MxIF1skxrt801gIKJBckgXmvwQcXYzhnSSD9
   w==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: Y2038: Sanity checker for non-64-bit time and file functions
Date: Thu, 8 Dec 2022 08:11:33 +0100
Message-ID: <20221208071136.1967696-1-olani@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 07:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174386

Here is my sanity checker that check for glibc symbols that use 32-bit
time_t or file offsets.

I include one glibc patch that fixes a problem where the redirect for
ppoll did not work when fortify_source was enabled.

Also include some distro settings for the -F_TIME_BITS=64 flags that I
have used while testing this.

I tried to make a very clever INSANE_SKIP mechanism that allowed for
suppression of individual symbols in individual ELF files.  That is
probably overkill but can be useful in this phase. 

--
Ola Nilsson




