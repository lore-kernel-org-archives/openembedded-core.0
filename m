Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A0AC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 11:59:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19270.1782820796634610374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 04:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qoYws0Ln;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kKd6IrEx/HZvXg1ctdUuWdsEQeBcKwEbsvCyNvqcGqc=; b=qoYws0LnsNm+HZrGTNrPDKKtvB
	U8RNxojC3CEFW+O3dPD20CfyghPiu/OvJryimoxi/evrksrj7IKLDlagSVa4GYizTS3UP/F3QNWUF
	0WXe5Xxl5j5ZneB0hzWd2q2kq8JaOblZdmmWjxnXLis9L3WyzC6UwL40GqqvBSWa+FH16RpZozxUl
	TneCwRY8S6yO+WHWrcJN8vdstnc14VuvSkncEMV2TnRgQTxOJUGD3ibS9by+TBH6V7pVJMVUZMGK5
	ra4wOkrEZ7c8YzOiq+ca9mDi9R2R2Mtzlr3tz7RFS8OgKmU7IyQ/NrmQMwk2G7GzufIC4754WCjRo
	rMqCP4DQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:41740 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1weX86-0000000DkiF-0ipI
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Jun 2026 07:59:54 -0400
Date: Tue, 30 Jun 2026 07:59:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should non-task functions have names starting with "do_"?
Message-ID: <26919453-4bbe-e6c4-f12c-a09eee3ad58e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 11:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239884


  was perusing the tasks defined in oe-core, and ran across this
snippet in insane.bbclass which confused me:


  # Check for patch fuzz
  do_patch[postfuncs] += "do_qa_patch "

  # Check broken config.log files, for packages requiring Gettext which
  # don't have it in DEPENDS.
  #addtask qa_configure after do_configure before do_compile
  do_configure[postfuncs] += "do_qa_configure "

  # Check does S exist.
  do_unpack[postfuncs] += "do_qa_unpack"


i typically expect any functions whose names start with "do_" to
represent tasks that should have an associated "addtask" directive, so
i wasn't sure what to make of:

  do_patch[postfuncs] += "do_qa_patch "

i read further to see:

  #addtask qa_configure after do_configure before do_compile
  do_configure[postfuncs] += "do_qa_configure "

and concluded that, once upon a time, qa_configure *used* to be a
task, then it was downgraded to just a non-task function but it wasn't
worth the churn to rename.

  that change goes *way* back to 2011 (if anyone cares):

  $ git show 1efeeecc338

i just wanted to clarify that there wasn't something subtle going on
here, and standard OE coding style normally reserves "do_"-prefixed
functions strictly for tasks.

rday

