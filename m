Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FAD374FCB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:42:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w849gBBS011055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 02:42:11 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 02:42:10 -0700
To: <richard.purdie@linuxfoundation.org>
References: <cover.1535288685.git.kai.kang@windriver.com>
	<9ae08680d92897330510b0de660a9b2afc7d00bb.1535288685.git.kai.kang@windriver.com>
	<040ce37698d169827043fa7ca17e2509a45cd58f.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <23399419-f0b3-35bc-2bcf-0be471793a68@windriver.com>
Date: Tue, 4 Sep 2018 17:41:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <040ce37698d169827043fa7ca17e2509a45cd58f.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] update_font_cache: update script for multilib
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
X-List-Received-Date: Tue, 04 Sep 2018 09:42:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月04日 17:12, richard.purdie@linuxfoundation.org wrote:
> On Sun, 2018-08-26 at 06:06 -0700, Kai Kang wrote:
>> Packages which inherit fontcache.bbclass call postinstall script
>> update_font_cache. And in update_font_cache, it calls ${bindir}/fc-
>> cache
>> by qemuwrapper. When multilib is enabled, both packages foo and
>> lib32-foo
>> will call ${bindir}/fc-cache and one of them will fail to run
>> obviously.
>>
>> Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and
>> call proper fc-cache in update_font_cache.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 8 +++++++-
>>   scripts/postinst-intercepts/update_font_cache         | 2 +-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> index d4cbce80b45..db36c867741 100644
>> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> @@ -35,9 +35,15 @@ do_configure_prepend() {
>>       rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
>>   }
>>   
>> +do_install_append_class-target() {
>> +    # duplicate fc-cache for postinstall script
>> +    mkdir -p ${D}${libexecdir}
>> +    cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
> We may as well hardlink this, same for the following patch too.

OK. Got it.

--Kai

>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


