Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8CCE9E304
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:56:27 +0000 (UTC)
Received: from smarthost01c.sbp.mail.zen.net.uk (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18340.1770814582164072701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=civ+4fAy;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.5, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <mac@mcrowe.com>)
	id 1vq9lU-00000001vPI-26uG;
	Wed, 11 Feb 2026 12:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=ITpqpkbmCXbdHaykU/NUh6SDOlmUQNr1R1H3LQ9WprI=; b=civ+4
	fAytpWFRyuK0itqrMrtTt0PVeETeP9F5la0UYzyAeV9FpXe2kKFZZ7Jzu3KNo+zQa5rr7WFQHr1ud
	CNyJOTdegvrH6fJ7WSENhe00WfZaiP3ZaeamdpvMYwNLWghciTmwXvqS8kbURF2B+uOeHbCso+Dfw
	42WnzUSAO4JYEecAI5u31AjYavlWV5/rG4E0rn2iMhTCO+ORHq3/XbsnjHiv+6qWFOPgYsq49Rr41
	2/fFCofaRYnrclFTG1C35yXlQHBIKJ/GNqakzGV2eK/wMo8sV7OJi2443D7wLiawYWXnFkQgZpvuO
	fGCO/ks6aYXt4CrjqgXiW6AwHsPeg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.98.2)
	(envelope-from <mac@mcrowe.com>)
	id 1vq9lT-00000004REN-2yF3;
	Wed, 11 Feb 2026 12:56:19 +0000
Date: Wed, 11 Feb 2026 12:56:19 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] XZ_THREADS changing do_image_cpio task hash
Message-ID: <aYx8c9SIXh9q0LXF@mcrowe.com>
References: <aYtcrTmpsYQl1na9@mcrowe.com>
 <CANNYZj_-3ZRL1-TTJKENbrkSE74951i5TxN=uJ1D-k3sL7mLKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_-3ZRL1-TTJKENbrkSE74951i5TxN=uJ1D-k3sL7mLKQ@mail.gmail.com>
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230987

On Wednesday 11 February 2026 at 12:41:30 +0100, Alexander Kanavin wrote:
> On Tue, 10 Feb 2026 at 17:28, Mike Crowe via lists.openembedded.org
> <mac=mcrowe.com@lists.openembedded.org> wrote:
> 
> > Am I missing an obvious reason why the task hash should change? Our build
> > hosts and developer machines have varying numbers of CPUs and this is
> > causing a lack of sstate sharing. :(
> 
> There might be a real issue in there somewhere but I need to point out
> that none of the image tasks contribute anything to sstate, so if you
> want to improve sstate reuse, images are the wrong place to start
> looking.

It's actually the kernel tasks that include the initramfs image that I'm
interested in getting from sstate.

In my testing, although the image is always rebuilt, the kernel does
successfully come from sstate when XZ_THREADS matches.

(There is also an ugly proliferation of separate siginfo files for the
various hashes in sstate, even if there are no actual artifacts, but these
are small.)

Thanks.

Mike.

