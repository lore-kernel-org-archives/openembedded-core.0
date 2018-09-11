Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 455A77943C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 01:25:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8B1P1CJ004724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2018 18:25:32 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 10 Sep 2018 18:25:15 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1536573689.git.Qi.Chen@windriver.com>
	<d5a1d1701202d4323e15cb31c7f9a3afca88a00f.1536573689.git.Qi.Chen@windriver.com>
	<CAJTo0LZiPj8qNgTVUkvno50LhizJ57VKGCnnQqiTuJUyGNmNRA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2ba2543a-d351-8df2-f946-dff83c8e2c22@windriver.com>
Date: Tue, 11 Sep 2018 09:30:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZiPj8qNgTVUkvno50LhizJ57VKGCnnQqiTuJUyGNmNRA@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autotools: do more cleanup when in do_configure
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
X-List-Received-Date: Tue, 11 Sep 2018 01:25:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2018 06:24 PM, Burton, Ross wrote:
> On 10 September 2018 at 11:02, Chen Qi <Qi.Chen@windriver.com> wrote:
>> I met the following error when compiling some projects.
>>
>> | configure: error: `LDFLAGS' has changed since the previous run:
>> | configure:   former value:  `-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
>> | configure:   current value: `-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now'
>> [snip]
>> | configure: error: changes in the environment can compromise the build
>> | configure: error: run `make distclean' and/or `rm .././config.cache' and start over
>>
>> I think when some recipe inherits autotools-brokensep, it should try to
>> do more cleanups before configure. So also do 'make distclean' and remove
>> config.cache just as what the error message told us.
> Does just removing config.cache work for your problem?
I guess it should, but I haven't checked.
>    I'm concerned
> about running a distclean because some upstreams abuse that target and
> then can't rebuild.
Hmm... I hold the opposite opinion.
I suspect that just doing a `make clean' is more likely to break rebuild 
while doing a `make distclean' should reduce the possibility.

Conceptually, `make clean' is followed by `make' while `make distclean' 
is followed by `configure & make'.
At rebuild, we are doing `configure & make'; so we should use `make 
distclean', in theory.

I'll revisit this issue later and do more investigation.
> Also obviously the proper fix is to not use autotools-brokensep in the
> recipe in the first place.
You are right.
The recipe is cyrus-sasl and the newly updated version has fixed to use 
autotools instead of autotools-brokensep.

To summarize, ideally we should have no recipe inheriting 
autotools-brokensep. But in reality, it's almost not possible.
I sent out this patch because I thought it would be helpful for such 
recipes.

Best Regards,
Chen Qi

> Ross
>


