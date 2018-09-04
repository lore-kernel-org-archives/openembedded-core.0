Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A587E750FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 01:35:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w841ZT7n001908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2018 18:35:29 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 3 Sep 2018 18:35:28 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1535981492-1670-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1sqgV3LvMF7c17QzE4WP=+wA67S1hpNTC6W9WThGSx5Qzg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <63520b28-0bbe-5304-7722-8b44d571e969@windriver.com>
Date: Tue, 4 Sep 2018 09:35:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqgV3LvMF7c17QzE4WP=+wA67S1hpNTC6W9WThGSx5Qzg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags.inc: Remove `-fstack-protector-strong' from LDFLAGS
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
X-List-Received-Date: Tue, 04 Sep 2018 01:35:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月04日 00:30, Khem Raj wrote:
> On Mon, Sep 3, 2018 at 6:31 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> The `-fstack-protector-***' should be passed to gcc rather than linker,
>> since `4ca946c security_flags: use -fstack-protector-strong', it was
>> added to LDFLAGS, although there is no extra build failure introduced,
>> but it is still unnecessary.(-Wl,** is for linker)
>>
> There are cases where CFLAGS is not combined into LDFLAGS by package
> component builds
> which creates the disjoint, If we remove this here then that will
> start to show up. remember we do
> not configure toolchains to provide the hardening flags by default as
> yet, so we have to be explicit.
> Do you see issues with current settings ?

Yes, I know a recipe (libsign in meta-secure-core) check LDFLAGS with 
`-Wl,***'
and it failed with `-fstack-protector-strong', and our Wind River Linux
had to maintain a list of `SECURITY_LDFLAGS_remove_pn-*** = 
"-fstack-protector-strong"'
for non oe-core layers.

I know some recipes may not combine CFLAGS to their build, but
we should investigate some way like `-Wl,--hash-style=gnu'
to check LDFALGS for CFLAGS, and mention a warning to figure it out.

//Hongxu

>> Reported-by: Lans Zhang <https://github.com/jiazhang0>
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/conf/distro/include/security_flags.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
>> index 620978a..362b1db 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -26,8 +26,8 @@ SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
>>   SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>>   SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>>
>> -SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
>> -SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
>> +SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
>> +SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
>>
>>   # powerpc does not get on with pie for reasons not looked into as yet
>>   GCCPIE_powerpc = ""
>> --
>> 2.7.4
>>


