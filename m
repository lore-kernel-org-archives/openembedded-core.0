Return-Path: <ross.burton@intel.com>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1822B60E33
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 10:14:58 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id 6so2882835qea.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 02:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f7i3NBYJ0MHWzj+e5zXEMu7jzwGc7FkpzQzyKneqxqc=;
	b=gp/Z5qQbTCN+aiuCeRR4UdYUFpT8J6AZrb5UZa6ummInJWyMw8S57Ld+0YhBGQjmuM
	iQMn3OvRczs5KnCWdwQKqjJU4uUo73AECkqyFgctvn2gNxf8K7LdXHI1HCvMbpqhMMMt
	74aySSIixVGSNmnnclBM6Rv4aCAWbhrRtuerzIrG0axS0UBWZgRI5cBpgm4IEpGt9PiK
	434CaPWJ1npIgnjZsEDqXi0EL7WKg/T3z3FKOOvE1qUp3de4nqvkp4lwNeaKpirVqPpC
	Kof1WG2stfebVTzYi+ICxOBTQls8qv52Cmqakum5A1WIdVYOweteqdBCU2Q8jyRPuZj/
	RNlQ==
X-Gm-Message-State: ALoCoQlyAwcxnawhtDIWBqlNGGZOuGJQ2okgVYndN2sECnofC+o66gXrsuA8m49VgMduY2PmMv0w
X-Received: by 10.229.65.5 with SMTP id g5mr5729800qci.15.1389262498562; Thu,
	09 Jan 2014 02:14:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Thu, 9 Jan 2014 02:14:38 -0800 (PST)
In-Reply-To: <1389255953-8202-1-git-send-email-ting.wang@windriver.com>
References: <1389255953-8202-1-git-send-email-ting.wang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jan 2014 10:14:38 +0000
Message-ID: <CAJTo0LZ6p1nn5PGTbsqKevRKSehbcftqGJ=akrKfWeb44OsYCA@mail.gmail.com>
To: ting.wang@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oeqa][PATCH] lib/oeqa/runtime: add test for gzip
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
X-List-Received-Date: Thu, 09 Jan 2014 10:14:59 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2014 08:25,  <ting.wang@windriver.com> wrote:
> Function tests:
> 1)gzip compress file
> 2)compressed file integrity check
> 3)zcat compress file
> 4)gzip decompress file

Wouldn't this be better implemented as a ptest for gzip?  The qemu
image tests are more concerned with image-wide functionality that
can't be unit tested independently, but verifying that gzip works can
be.

Also, your test simply verifies that the commands execute, not that
the contents is what you expect: a gzip that produced corrupted
archives wouldn't be detected by this test.

Finally, as I learnt yesterday, the skipUnlessPassed decorator isn't
used to enforce ordering, so test_gzip_fun1_compress only runs after
_create_testfile because it sorts that way alphabetically, not because
of your decorators.  As creating a file isn't a test, just do that in
the test itself.

Ross

