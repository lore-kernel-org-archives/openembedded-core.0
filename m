Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id EB3826EF89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 22:33:24 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so9791200yha.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 15:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fG+IyVw6fgnIGMS8+pDa2TEmpWlaH6ZzvVxonoJUI44=;
	b=HI+PyY94Bf26MSqkQtQACoOLau9qqda0aBj+fLCG4fDjsRp0yypY9qVnPmKFVs5zev
	l5Otnz+qr3F5CgDavziKxZlaOR0fepFytARWT5i8uRxi69LrusLjMYhMA9ulwdxHm822
	q84LjM4hZNxQvj8ZrXnijz7M7mjzM/5yYESLaQVPyG3UTctdfkz01WiiAFGmgMS3hXML
	WWvqMRFit1o91aKtuLct09u88xFhxT63aAl/aip8YRMGMCL1JucOy+qbbPmEyqvEhIDd
	nqKovjbCyGXwMERYf39e7Qvt+f4HrgrtzHw3h5ZjUliO0J2ZL9udofCF9+OmpqvaA1KB
	La4g==
MIME-Version: 1.0
X-Received: by 10.236.110.131 with SMTP id u3mr15397739yhg.99.1396391605127;
	Tue, 01 Apr 2014 15:33:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 1 Apr 2014 15:33:25 -0700 (PDT)
In-Reply-To: <1396349360.1432.2.camel@ted>
References: <cover.1396343261.git.kai.kang@windriver.com>
	<26f22e4e2b8b1fa1eff604feac7088986d561eab.1396343261.git.kai.kang@windriver.com>
	<1396349360.1432.2.camel@ted>
Date: Tue, 1 Apr 2014 19:33:25 -0300
X-Google-Sender-Auth: kmIoVZuUeVJb--qLQ5eJusR5icw
Message-ID: <CAP9ODKpm7Kw5MJvrPVvUga_nhUhtNTPsD1ciEk5Rp0zOES3CUg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cmake: follow ptest output format
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
X-List-Received-Date: Tue, 01 Apr 2014 22:33:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Apr 1, 2014 at 7:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-04-01 at 17:09 +0800, Kai Kang wrote:
>> From: Li Wang <li.wang@windriver.com>
>>
>> ptest output format is incorrect, according to yocto Development Manual
>> (http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
>>
>> The test generates output in the format used by Automake:
>> <result>: <testname>
>> where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
>>
>> So we should change the test result format to match yocto ptest rules.
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta/recipes-devtools/cmake/cmake.inc              |   1 +
>>  .../cmake/cmake/follow_ptest_output_format.patch   | 118 +++++++++++++++++++++
>>  2 files changed, 119 insertions(+)
>>  create mode 100644 meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
>>
>> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
>> index 1d5303f..254af45 100644
>> --- a/meta/recipes-devtools/cmake/cmake.inc
>> +++ b/meta/recipes-devtools/cmake/cmake.inc
>> @@ -17,6 +17,7 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
>>             file://aarch64-kwsys.patch \
>>             file://qt4-fail-silent.patch \
>>             file://cmake-2.8.11.2-FindFreetype.patch \
>> +           file://follow_ptest_output_format.patch \
>>             "
>>
>>  inherit autotools-brokensep
>> diff --git a/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
>> new file mode 100644
>> index 0000000..5428df2
>> --- /dev/null
>> +++ b/meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
>> @@ -0,0 +1,118 @@
>> +cmake: follow ptest output format
>> +
>> +ptest output format is incorrect, according to yocto Development Manual
>> +(http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
>> +5.10.6. Testing Packages With ptest
>> +The test generates output in the format used by Automake:
>> +<result>: <testname>
>> +where the result can be PASS, FAIL, or SKIP, and the testname can be any identifying string.
>> +So we should change the test result format to match yocto ptest rules.
>> +
>> +Signed-off-by: Li Wang <li.wang@windriver.com>
>
> No upstream status. Is there any chance of this going upstream? Might we
> be better off postprocessing the output with a script to put it into the
> right format?

I agree with both remarks. It'd be good to try to get it somehow
integrated upstream and for OE-Core interim solution would be better
to 'convert' using an external script. This may break external tests
tools people may be using as it changes the format without allowing to
'revert' for normal format.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

