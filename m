Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 318F77736F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 03:14:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBM3EgDo013356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Dec 2016 19:14:43 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Dec 2016 19:14:41 -0800
To: Andreas Oberritter <obi@opendreambox.org>, Andre McCurdy
	<armccurdy@gmail.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
	<6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
	<CAJ86T=X_cPiiTWb_mdrcWre=XmAkB=kk7QE0kJ-SKu9Z1B1Fxw@mail.gmail.com>
	<67916363-806f-7f9e-e9e8-941bb2614cfb@windriver.com>
	<02079360-2340-5cdb-b23c-db371383d408@opendreambox.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ea7ce818-05fa-a41d-c70e-b94260328d09@windriver.com>
Date: Thu, 22 Dec 2016 11:14:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <02079360-2340-5cdb-b23c-db371383d408@opendreambox.org>
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
X-List-Received-Date: Thu, 22 Dec 2016 03:14:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/22/2016 11:09 AM, Andreas Oberritter wrote:
> On 22.12.2016 03:47, Robert Yang wrote:
>> On 12/21/2016 09:27 PM, Andre McCurdy wrote:
>>> Passing LDFLAGS on the make command line might be a cleaner solution
>>> than patching the Makefile.
>>
>> We can't do that since there is a "-e MAKEFLAGS=" in EXTRA_OEMAKE, and its
>> Makefile is:
>>
>> all:
>>     make -j2 hdparm
>>
>> hdparm: hdparm.h sgio.h $(OBJS)
>>     $(CC) $(LDFLAGS) -o hdparm $(OBJS)
>>     $(STRIP) hdparm
>>
>> The "make -j2 hdparm" doesn't pass any env vars to sub make since
>> MAKEFLAGS=,
>> so that need use weak assignment "?=" here.
>
> You don't need to use target 'all'. Try this:
>
> do_compile() {
>     oe_runmake hdparm
> }

I know this will work, but "make hdparm" rather than "all" may cause other
issues in the future when hdparm gets ugpraded, for example, "all" doesn't
only contain "hdmarm". And do we have really have to add a do_compile()
here ?

// Robert

>
> Regards,
> Andreas
>

