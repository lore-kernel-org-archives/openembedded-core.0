Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1597CBE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 01:59:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x611xb7F022329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 30 Jun 2019 18:59:37 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 30 Jun 2019 18:59:36 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <matt@madison.systems>
References: <20190628075701.78128-1-mingli.yu@windriver.com>
	<9b5dca23cf1d8a90466bc084236599487726f4b6.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D196A07.7040304@windriver.com>
Date: Mon, 1 Jul 2019 10:03:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <9b5dca23cf1d8a90466bc084236599487726f4b6.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Subject: Re: [PATCH] go-dep: disable PTEST_ENABLED
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
X-List-Received-Date: Mon, 01 Jul 2019 01:59:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年06月28日 19:02, Richard Purdie wrote:
> On Fri, 2019-06-28 at 00:57 -0700, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> The run-ptest logic for go-dep actually runs the
>> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
>> source file is
>> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.
>>
>> That dep_test.go starts by rebuilding the dep program
>> from source, then runs the tests using that copy of the
>> program, so it's assuming that we're still in a development
>> environment where we can run a full go build.
>>
>> Considering it not being designed for a cross-build setup,
>> so disable PTEST_ENABLED.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-devtools/go/go-dep_0.5.0.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-
>> devtools/go/go-dep_0.5.0.bb
>> index a4d631f8ea..e9fc12fa5a 100644
>> --- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
>> +++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
>> @@ -21,5 +21,6 @@ BBCLASSEXTEND = "native nativesdk"
>>
>>   # For compiling ptest on mips and mips64, the current go-dep version
>> fails with the go 1.11 toolchain.
>>   # error message: vet config not found
>> -PTEST_ENABLED_mips = "0"
>> -PTEST_ENABLED_mips64 = "0"
>> +# disable PTEST_ENABLED as the run-ptest script for go-dep actually
>> runs the /usr/lib64/go-
>> dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose source file is
>> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go not
>> being designed for a cross-build setup.
>> +PTEST_ENABLED = "0"
>> +PTEST_ENABLED = "0"
>
> Setting it twice looks wrong.

Sorry, it should be my typo.

>
> If we're disabling it, why would we inherit the ptest class at all as
> its not going to work anywhere?
>
> Upstream not considering cross test usecases isn't a reason to disable
> a test, we have many tests enabled where upstream haven't considered a
> cross use case, we just tend to patch as needed and start a discussion
> with them.
>
> It sounds like its actually a network access problem from the image
> you're running into anyway?

Hi RP,

Have discussed the ptest more with Matt in the maillist and also tried 
to add the patch under the guide from Matt to make the 
https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go work with 
cross-setup env. But seems it still doesn't work.

Hi Matt,
What's your opinion?

Thanks,

>
> Cheers,
>
> Richard
>
>
>

