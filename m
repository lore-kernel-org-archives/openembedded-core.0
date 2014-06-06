Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 929286FBF9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 01:22:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s561M57S021968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jun 2014 18:22:05 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 5 Jun 2014 18:22:04 -0700
Message-ID: <539117B9.1050504@windriver.com>
Date: Fri, 6 Jun 2014 09:22:01 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1401957639.git.Chong.Lu@windriver.com>	<456ee4334cd0294c3605845d4fceb9c163c86d48.1401957639.git.Chong.Lu@windriver.com>
	<CAP9ODKqwiQyGbBB0J2x=WzgDbXwDsnhi1OKR8nwSgNRUHk3_gg@mail.gmail.com>
In-Reply-To: <CAP9ODKqwiQyGbBB0J2x=WzgDbXwDsnhi1OKR8nwSgNRUHk3_gg@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oprofile: Add PTEST regression testing to oprofile
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
X-List-Received-Date: Fri, 06 Jun 2014 01:22:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/05/2014 11:21 PM, Otavio Salvador wrote:
> On Thu, Jun 5, 2014 at 5:44 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
>> The commit changes the oe-core oprofile recipe by adding the PTEST
>> interface, implementing do_compile_ptest() and do_install_ptest().
>>
>> The install routine adds several files that only the regression tests
>> require. Also, a patch is necessary to inhibit executing the tests on
>> the build host and to point to the correct target directory for the
>> libutil++ test 'file-manip-tests'.
>>
>> That test requires the recipe to set SRCDIR in the build environment
>> instead of determining the value from build-time host paths as for a
>> self-hosted build.
>>
>> Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-kernel/oprofile/oprofile.inc          | 31 ++++++-
>>   .../oprofile/oprofile-cross-compile-tests.patch    | 98 ++++++++++++++++++++++
>>   meta/recipes-kernel/oprofile/oprofile/run-ptest    | 18 ++++
>>   3 files changed, 145 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
>>   create mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest
>>
>> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
>> index ccf9f9f..0a7f7fd 100644
>> --- a/meta/recipes-kernel/oprofile/oprofile.inc
>> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
>> @@ -20,9 +20,11 @@ FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
>>
>>   SRC_URI = "file://opstart.patch \
>>              file://oprofile-root.patch \
>> -           file://acinclude.m4"
>> +           file://acinclude.m4 \
>> +           file://oprofile-cross-compile-tests.patch \
>> +           file://run-ptest"
>>
>> -inherit autotools-brokensep pkgconfig
>> +inherit autotools-brokensep ptest
> You removed pkgconfig, why?
>
It's my mistake. pkgconfig should not be removed. I will resend V2.

Best Regards
Chong

