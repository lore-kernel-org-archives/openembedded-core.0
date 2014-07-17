Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E39F4705E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 01:43:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H1hPk6026330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jul 2014 18:43:25 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 16 Jul 2014 18:43:25 -0700
Message-ID: <53C72A3A.50101@windriver.com>
Date: Thu, 17 Jul 2014 09:43:22 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1405497586.git.Chong.Lu@windriver.com>	<5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>
	<CADkTA4MMphKfFSKw5ViEBgYn+fFJbABeO1hZg+cs4j0eqr__Jw@mail.gmail.com>
In-Reply-To: <CADkTA4MMphKfFSKw5ViEBgYn+fFJbABeO1hZg+cs4j0eqr__Jw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] perf: split package
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
X-List-Received-Date: Thu, 17 Jul 2014 01:43:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/16/2014 09:04 PM, Bruce Ashfield wrote:
> On Wed, Jul 16, 2014 at 4:00 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
>> Fix incorrect paths to split perf package.
> Can you elaborate here ? This commit message doesn't really tell us much.
> Why is the current split incorrect ? What is the symptom and result of the
> incorrect split ? Are the package contents the same after this change ?
>
> Bruce
Hi Bruce,

Currently, perf can't split to perf-archive, perf-tests, perf-python and 
perf-perl.
All files are included in perf package. For example, like perf-tests 
package:
It generates files in '${exec_prefix}/libexec/perf-core/tests', not in 
'${libdir}/perf/perf-core/tests'.
So I change the files paths to make split successfully.

I will improve commit message and resend a V2.

Best Regards
Chong
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index 20968f9..781a738 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -166,10 +166,10 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
>>
>>   FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
>>   FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
>> -FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
>> -FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
>> -FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
>> -FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
>> +FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
>> +FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
>> +FILES_${PN}-python = "${libdir}/python*/site-packages ${exec_prefix}/libexec/perf-core/scripts/python"
>> +FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
>>
>>
>>   INHIBIT_PACKAGE_DEBUG_SPLIT="1"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


