Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5FEBD713E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:24:45 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id i17so12148430qcy.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 08:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e9nP65QiKmt1B1PgVyPmObAq25rTJt5sUhqIk+Ec98U=;
	b=O5KhLeMMGnE4Dd1y21bbt0QNFv8SZduxgRdQI0KlKwzrWywSODd5laWSIF3/k3SobJ
	aqtaw3Yiitvs/42VULPPg8hIP2Jr18EsnXGy6ELNn59axTgmBz4pv+1Ufyl+lIxekux/
	7YGsxHT5LGOoeaI/iveqUygDth8CZRE0/KfKC7LLrpHpyLK7VQ73kJzDh2aF+q5JCgpX
	9fpTVQTCjaKZEdAXT23j5YhQ+hYdaDgBR8h6e/sTPgycBj+83gSGDNU3YWijBptll1ct
	P9mkJiVJCDQoneboJuw6d3cMxPlUUBgJJoI0xTpOXL2ldgJoSblnKBIVOy3V/YeomUOV
	gX8g==
X-Gm-Message-State: ALoCoQmxgvjeWHkah8vHY9G86bzHrGkKRQLJChgEhssxa4Av5NE+JBeusTfXFgn0LVsfG6rwd+qq
X-Received: by 10.224.103.65 with SMTP id j1mr19987922qao.17.1409930686076;
	Fri, 05 Sep 2014 08:24:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 08:24:25 -0700 (PDT)
In-Reply-To: <53E9D3E2.7020101@windriver.com>
References: <1407824758-9261-1-git-send-email-li.wang@windriver.com>
	<1407828058-9939-1-git-send-email-li.wang@windriver.com>
	<CAJTo0LZW2OdpmevQW+5+j9Vau2M2qUpe+XUEL9aO6b=WS_B5fg@mail.gmail.com>
	<53E9D3E2.7020101@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 16:24:25 +0100
Message-ID: <CAJTo0Lbw53Ors3EiVY3Jx2_d-CQ7jf58-_Y1TJK3L4oz8QexaQ@mail.gmail.com>
To: "Li.Wang" <Li.Wang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: add option to fix port number
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Sep 2014 15:24:46 -0000
Content-Type: text/plain; charset=UTF-8

On 12 August 2014 09:44, Li.Wang <Li.Wang@windriver.com> wrote:
>     Opening random ports in privileged port range, among them one port that
>     identifies itself as pop3s, is not a good practice. Both Ericsson and
> our
>     customers run regular vulnerability assessment tools against our
> product,
>     and this will clearly be seen as a potential problem. Furthermore, we
> will
>     not be able to filter the ports, since they are random, and neither will
> we
>     be able to provide decent answers to our customers. To summarize: this
>     should be taken care of, ie fix rpcbind so that it uses a non random
> port
>     and/or to bind to a specific interface.

This has been bothering me so I just did some digging.  rpcbind
opening random ports is rather "misguided" but it appears that passing
-s to rpcbind will cause it to drop it's privs and setuid down to
"daemon", with the side-effect that it can't open the privileged ports
anymore.

(source: http://wiki.metawerx.net/wiki/setrpcrandomport)

Ross

