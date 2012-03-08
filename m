Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5dsF-0004RH-By
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 14:59:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 884043159F53
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 14:34:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lji5fJgKuugc
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 14:34:29 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed42d.pool.mediaWays.net [89.14.212.45])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 7BE8E3159F51
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 14:34:29 +0100 (CET)
Message-ID: <4F58B564.5040708@opendreambox.org>
Date: Thu, 08 Mar 2012 14:34:28 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
In-Reply-To: <CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
Subject: Re: Recipes with disabled parallel make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2012 13:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02.03.2012 23:29, Yury Bushmelev wrote:
> 2012/2/10 Khem Raj <raj.khem@gmail.com>:
>> Hi
>>
>> Just grepped for the occurances of disabled parallel make and I see
>> around 40 cases on oe-core
>>
>> git grep PARALLEL_MAKE.*=.*\"\" recipes* | grep -v "#"
>>
>> If someone has time to kill then it would help to see if some of these
>> are fixed by time or can be fixed
>>
>> it can help in paralleling the build a bit more.
> 
> Well, I have some first results! :)
> 
> 
> 1. Recipes (files) confirmed to fail with P_M enabled (need to have
> P_M disabled as it is now):
> meta/recipes-connectivity/bind/bind_9.8.1.bb
> meta/recipes-extended/slang/slang_2.2.4.bb
> meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> meta/recipes-support/pth/pth_2.0.7.bb

meta/recipes-devtools/libtool/libtool_2.4.2.bb might need disabled
P_M, too:

| ./mipsel-oe-linux-libtool  --tag=CC   --mode=compile ccache mipsel-oe-linux-gcc  -mel -mabi=32   -mhard-float -march=mips32 --sysroot=.../tmp/sysroots/dm7020hd -DHAVE_CONFIG_H -I.  -DLTDLOPEN=libltdl -DLT_CONFIG_H='<config.h>' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl/libltdl   -Os -pipe -g -feliminate-unused-debug-types -c -o libltdl/libltdl_libltdl_la-slist.lo `test -f 'libltdl/slist.c' || echo './'`libltdl/slist.c
| /bin/sh: ./mipsel-oe-linux-libtool: /bin/sh: bad interpreter: Text file busy
| make[2]: *** [libltdl/libltdl_libltdl_la-slist.lo] Error 126
| make[2]: *** Waiting for unfinished jobs....

This was a fresh build with clean tmp and sstate-cache. I've just
seen this failue for the first time.

BB_NUMBER_THREADS = "4"
PARALLEL_MAKE = "-j 4"

Regards,
Andreas


