Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 252327E89F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 02:33:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5E2XEn4001297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Jun 2019 19:33:14 -0700 (PDT)
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 13 Jun 2019 19:33:13 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
	<fddad43f3c2052f390bddeb16fce29b30999b5d1.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <c4c94351-08c8-9547-ddfa-b2b118060c98@windriver.com>
Date: Fri, 14 Jun 2019 10:33:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fddad43f3c2052f390bddeb16fce29b30999b5d1.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.221]
Subject: Re: [PATCH v3] lttng-modules: Add git based recipe
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
X-List-Received-Date: Fri, 14 Jun 2019 02:33:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/12/19 8:36 PM, Richard Purdie wrote:
> On Wed, 2019-06-12 at 19:12 +0800, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> The git based recipe is for those who want to build lttng-modules with bleeding
>> edge kernel, to avoid regularly backporting patches from upstream.
>>
>> Note that PREFERRED_VERSION needs to be set to select the git recipe instead of
>> the tar ball one.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>> v2: Correct a typo in SOB in 0001
>> v3: Use devupstream to make it more clean and clear
>>
>>  meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
>> index 70a6843..dfd166a 100644
>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
>> @@ -11,7 +11,6 @@ inherit module
>>  
>>  COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
>>  
>> -#https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
>>  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>> @@ -34,3 +33,13 @@ python do_package_prepend() {
>>          bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
>>  }
>>  
>> +BBCLASSEXTEND = "devupstream:target"
>> +LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
>> +DEFAULT_PREFERENCE_class-devupstream = "-1"
>> +SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=master \
>> +           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>> +           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>> +           "
>> +SRCREV_class-devupstream = "${AUTOREV}"
>> +PV_class-devupstream = "2.11.0-rc+git${SRCPV}"
>> +S_class-devupstream = "${WORKDIR}/git"
> OE-Core can't access the network by default so this will need to be a
> specific SRCREV which you can set to AUTOREV in local config if that
> makes sense.
>
> I've sent a separate email to openembedded-architecture about a better
> syntax for some of this but that isn't anything wrong with this patch,
> more just the way devupstream works.

Thanks. I assumed this patch was on the way to be merged. But with Jonathan
Rajotte-Julien's idea coming after your comment, I want to make sure if there's
anything/update I should do for the patch.

Zhe

>
> Cheers,
>
> Richard
>
>


