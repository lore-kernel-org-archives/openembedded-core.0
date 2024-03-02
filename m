Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFCFC54798
	for <webhook@archiver.kernel.org>; Sat,  2 Mar 2024 23:39:59 +0000 (UTC)
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
 by mx.groups.io with SMTP id smtpd.web11.63510.1709422796349946223
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Mar 2024 15:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=hyA3mTy6;
 spf=pass (domain: amazon.com, ip: 99.78.197.219, mailfrom: prvs=784dd95fc=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1709422796; x=1740958796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hsYOKMmoZaIW2S2be7BKfs0W3KWUwKZ9frSdcQUr9fc=;
  b=hyA3mTy6aK43YbVdvkj9LCKoLZKjb57uJIgBQFRWniz23vq+aSg/wbtc
   hgm8CBtcEgjcTcdkw1zphrTOcp/WmpapSwY0NPl/4UNWIMjQuzIegAGsN
   gSf8JsSZagvK1m0SO9HjezecvnGsdql6W4ljc0YfihJuarJg6YbdUpr6k
   c=;
X-IronPort-AV: E=Sophos;i="6.06,200,1705363200"; 
   d="scan'208";a="70243696"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 23:39:55 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:15466]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.30.72:2525] with esmtp (Farcaster)
 id c7c7eae7-6f23-4646-bc25-b91c21662e3e; Sat, 2 Mar 2024 23:39:55 +0000 (UTC)
X-Farcaster-Flow-ID: c7c7eae7-6f23-4646-bc25-b91c21662e3e
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 23:39:55 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.88.187.181) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 23:39:54 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <richard.purdie@linuxfoundation.org>
CC: <bruce.ashfield@gmail.com>, <kamatam@amazon.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: make pkg-config variables globally exported in the class
Date: Sat, 2 Mar 2024 15:39:44 -0800
Message-ID: <20240302233944.3817780-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <69d08be1c7b875758a4147225e316f76fff3997f.camel@linuxfoundation.org>
References: <69d08be1c7b875758a4147225e316f76fff3997f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.88.187.181]
X-ClientProxiedBy: EX19D043UWC002.ant.amazon.com (10.13.139.222) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 23:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196554

Hi Richard,

On Tue, 2024-02-27 02:38:39 -0800, Richard Purdie wrote:
> 
> I'm really not keen on this. global exports are painful to remove later
> as you can't really tell when they need to be set (e.g during
> do_configure). Given that these reverse our usual usage of pkg-config
> too, I really don't want to be doing this at all.
> 
> Until we have a minimum kernel version which has saner pkg-config usage
> I appreciate we have to retain this but I do want to make it easier to
> remove later.
> 
> I'm therefore leaning against doing this.

That's a fair point. As the original issue has already been solved and I
meant this was a minor improvement, I don't insist on it.


Thanks,
Munehisa
 
> Cheers,
> 
> Richard
> 
> 
> 

