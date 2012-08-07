Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Sykd1-0004da-LT
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:19:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q77E7Ydk021709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2012 07:07:34 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 7 Aug 2012 07:07:33 -0700
Message-ID: <50212122.50109@windriver.com>
Date: Tue, 7 Aug 2012 10:07:30 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted>
In-Reply-To: <1344348160.9756.255.camel@ted>
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 14:19:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-07 10:02 AM, Richard Purdie wrote:
> On Fri, 2012-08-03 at 23:43 +0800, Liang Li wrote:
>> Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
>> provide slang.h rather than hardcoded host dir in perf's Makefile.
>>
>> Pass WERROR=0 to perf's Makefile to avoid warnings being treated
>> as errors. Warnings are not fatal, and while they will be fixed in the
>> future, there's no need for them to break the build.
>
> No mention of the additional slang dependency is made here?
>
>> Signed-off-by: Liang Li<liang.li@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
>> index 505c7b8..537e926 100644
>> --- a/meta/recipes-kernel/perf/perf_3.4.bb
>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>> @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
>>              ${MLPREFIX}binutils \
>>              ${TUI_DEPENDS} \
>>              ${SCRIPTING_DEPENDS} \
>> +           slang \
>>             "
>>
>>   SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
>> @@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
>>   		AR="${AR}" \
>>   		prefix=/usr \
>>   		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
>> +		WERROR=0 \
>> +		EXTRA_CFLAGS=-I${STAGING_INCDIR} \
>>   		'
>
> This is is not acceptable since the include directory /usr/include/slang
> is still being looked at and this just "hides" the error. STAGING_INCDIR
> is on the compilers default search path anyway.

But this makes it first, which is what we were going for. For
an external toolchain, this also might not be true.

>
> So this patch is wrong in several different ways :(
>
> I've merged a temporary fix until we get this resolved properly.

I think this is a point of view thing, since from here, this is a
better temporary fix than commenting out the path in the perf
Makefile, which will break standalone tree cases if I merge the patch
into the tree, and I don't want to go to a milestone freeze with
an out of tree patch.

So I'd ask again that we reconsider this patch, since what's in tree
has issues with other use cases.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



