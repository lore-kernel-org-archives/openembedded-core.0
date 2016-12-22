Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8913F774F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 03:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 87D8331C317E;
	Thu, 22 Dec 2016 04:09:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lpuHbBwz2w0i; Thu, 22 Dec 2016 04:09:47 +0100 (CET)
Received: from [172.22.22.61] (55d404f0.access.ecotel.net [85.212.4.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 322AE31C347A;
	Thu, 22 Dec 2016 04:09:47 +0100 (CET)
To: Robert Yang <liezhi.yang@windriver.com>,
	Andre McCurdy <armccurdy@gmail.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
	<6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
	<CAJ86T=X_cPiiTWb_mdrcWre=XmAkB=kk7QE0kJ-SKu9Z1B1Fxw@mail.gmail.com>
	<67916363-806f-7f9e-e9e8-941bb2614cfb@windriver.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <02079360-2340-5cdb-b23c-db371383d408@opendreambox.org>
Date: Thu, 22 Dec 2016 04:09:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <67916363-806f-7f9e-e9e8-941bb2614cfb@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] hdparm: 9.48 -> 9.50
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
X-List-Received-Date: Thu, 22 Dec 2016 03:09:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 22.12.2016 03:47, Robert Yang wrote:
> On 12/21/2016 09:27 PM, Andre McCurdy wrote:
>> Passing LDFLAGS on the make command line might be a cleaner solution
>> than patching the Makefile.
> 
> We can't do that since there is a "-e MAKEFLAGS=" in EXTRA_OEMAKE, and its
> Makefile is:
> 
> all:
>     make -j2 hdparm
> 
> hdparm: hdparm.h sgio.h $(OBJS)
>     $(CC) $(LDFLAGS) -o hdparm $(OBJS)
>     $(STRIP) hdparm
> 
> The "make -j2 hdparm" doesn't pass any env vars to sub make since
> MAKEFLAGS=,
> so that need use weak assignment "?=" here.

You don't need to use target 'all'. Try this:

do_compile() {
    oe_runmake hdparm
}

Regards,
Andreas

