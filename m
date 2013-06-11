Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38E136A9A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:13:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5BGDI4D022761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jun 2013 09:13:18 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (147.11.4.139) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 11 Jun 2013 09:13:18 -0700
Message-ID: <51B74CAA.9060203@windriver.com>
Date: Tue, 11 Jun 2013 09:13:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1370015746-22465-1-git-send-email-mark.hatle@windriver.com>
	<7FC71AE1-8B85-4A2C-8E5D-A8A29DF05193@gmail.com>
In-Reply-To: <7FC71AE1-8B85-4A2C-8E5D-A8A29DF05193@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gcc: add build directory to include directories
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
X-List-Received-Date: Tue, 11 Jun 2013 16:13:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/13 7:21 PM, Khem Raj wrote:
> what happens if you use --disable-libunwind-exceptions

As far as I know we have not tried that.  Doesn't this change some of the 
processing though for systems that use unwind as the only way to generate proper 
back traces?

--Mark

> On May 31, 2013, at 8:55 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> Add build directory to include directories by -I${B}/include which will
>> be searched before standard system include directories.
>>
>> Both libunwind and gcc supply unwind.h, once gcc use libunwind's unwind.h,
>> the compiling will fail.
>>
>> This patch is generally not applicable to the upstream as they do not
>> use libunwind.
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>> meta/recipes-devtools/gcc/gcc_4.7.bb | 2 +-
>> meta/recipes-devtools/gcc/gcc_4.8.bb | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc_4.7.bb b/meta/recipes-devtools/gcc/gcc_4.7.bb
>> index 9954375..f68c67a 100644
>> --- a/meta/recipes-devtools/gcc/gcc_4.7.bb
>> +++ b/meta/recipes-devtools/gcc/gcc_4.7.bb
>> @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
>> require gcc-configure-target.inc
>> require gcc-package-target.inc
>>
>> -ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
>> +ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
>> diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb b/meta/recipes-devtools/gcc/gcc_4.8.bb
>> index 9954375..f68c67a 100644
>> --- a/meta/recipes-devtools/gcc/gcc_4.8.bb
>> +++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
>> @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
>> require gcc-configure-target.inc
>> require gcc-package-target.inc
>>
>> -ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
>> +ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
>> --
>> 1.8.3.rc1.25.g423ecb0
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


