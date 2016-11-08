Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id BEF9360938
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 06:41:35 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 73A6768A019; Tue,  8 Nov 2016 06:41:35 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id DFC1D68A019;
	Tue,  8 Nov 2016 06:41:34 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 5E4A36740384;
	Tue,  8 Nov 2016 07:41:34 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <d1522ddb-4dd2-5f1c-5dc6-558ff6aefd75@mlbassoc.com>
	<1478253823.23123.93.camel@linuxfoundation.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <390c7dd5-dd7b-8364-66ac-d2853f0a574a@mlbassoc.com>
Date: Tue, 8 Nov 2016 07:41:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478253823.23123.93.camel@linuxfoundation.org>
Subject: Re: uninative binary?
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
X-List-Received-Date: Tue, 08 Nov 2016 06:41:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-11-04 11:03, Richard Purdie wrote:
> On Fri, 2016-11-04 at 08:16 +0100, Gary Thomas wrote:
>> Some of my customers need to be able to build without any
>> network connectivity, so I normally use BB_NO_NETWORK="1"
>>
>> Is there a way to add the uninative "binary shim" to my
>> download mirror?  Given that the path includes a hash as
>> a directory, it's not clear to me how to put it into my
>> mirror.
>>
>> Thanks for any ideas
>
> Set UNINATIVE_URL to point at your mirror?
>
> If the file already exists in DL_DIR, it will be used without touching
> the network.

Thanks, that worked.  I keep a link to my mirror in my meta tree,
so I added these lines to my ${DISTRO}.conf:
   UNINATIVE_URL ?= "file://${COREBASE}/sources/uninative/1.4/"
   require conf/distro/include/yocto-uninative.inc
   INHERIT += "uninative"
When I ran a build, this got sucked into my ${DL_DIR} as
   $ ls -lR downloads/uninative/
   downloads/uninative/:
   total 4
   drwxrwxr-x 2 gthomas gthomas 4096 Nov  7 13:02 101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca

   downloads/uninative/101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca:
   total 4
   lrwxrwxrwx 1 gthomas gthomas 76 Nov  7 13:02 x86_64-nativesdk-libc.tar.bz2 -> 
/local/poky-cutting-edge/sources/uninative/1.4/x86_64-nativesdk-libc.tar.bz2

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

