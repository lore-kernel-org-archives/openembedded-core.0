Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7CEC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:42:03 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35091.1789116116605119660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 01:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=uYWfQl9Q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-664519-202609110841536f8a23f8a200020776-3mfjvj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202609110841536f8a23f8a200020776
        for <openembedded-core@lists.openembedded.org>;
        Fri, 11 Sep 2026 10:41:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9IjqpVPeStanmJUTm/2DSrKTHUTaz1e47s3Es2mkuXI=;
 b=uYWfQl9QxgcG4JS26cEYErxAwN2HZz8H7Kfjx/vCrPzjNPqBiyWFEkSOmdwnFakNNxvfRV
 iAKJyT1Vuodp5geV40Kc0T+fQ8FfFWK9mxH+1OmRUO5gyxZeb1t3Nl+ApBIGgXtyJo/ESFfm
 2dtpuy/ORagZDpoYSL9L2aeg//Kaw4lzfdMJlI9hke88UY7/Lc0blzlLkRj0SCWZC5zlzHM5
 zAKFlV6orEWv3Q4tBj0mr30Udx5c2bzo6ORaeDD64YSkoLfiIkFZLrY6H5mkY+dnTIXtG/AO
 klRAWBEBPAoK1p6z42DOG5b2HLU1sHJQfeSOhRaniq3LhmSMFIfHyhVQ==;
From: Michael Haener <michael.haener@siemens.com>
To: zhanxusheng@xiaomi.com
Cc: openembedded-core@lists.openembedded.org,
	adrian.freihofer@siemens.com,
	peter.marko@siemens.com
Subject: Re: [PATCH v2] sstate: fix access to a cached object rewriting its modification time
Date: Fri, 11 Sep 2026 10:41:01 +0200
Message-Id: <20260911084101.61298-1-michael.haener@siemens.com>
In-Reply-To: <20260911022857.3138249-1-zhanxusheng@xiaomi.com>
References: <20260911022857.3138249-1-zhanxusheng@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245620

Hi Zhan Xusheng,

On Fri, Sep 11, 2026 at 10:28:56AM +0800, Zhan Xusheng wrote:
> sstate_touch_atime() catches OSError unconditionally, so ENOSPC, EIO
> and ESTALE are silent at those three now.  Deliberate?

No, that was an oversight when the three call sites were merged into one
helper. v3 restores the original filter: PermissionError and EROFS are
ignored, everything else propagates.

> scripts/sstate-cache-management.py is the consumer, and the patch helps it.

Thanks, that is a much better motivation than what I had. I replaced the
vague sentence with the effect on --remove-duplicated.

> st_mtime is a float; writing it back moves the modification time by
> -112 ns on ext4 here, once.

Confirmed here as well, I measured -73 ns. v3 uses the ns
form.

Thanks for the careful review.

Best regards
Michael

