Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD5E7D900
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 08:04:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F84TXc000863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 01:04:29 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 15 Apr 2019 01:04:29 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
	<1555314041-117426-1-git-send-email-mingli.yu@windriver.com>
	<8879daf5747ec05fa2430354dbd38cc3ae5e1cd5.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CB43C2A.4050908@windriver.com>
Date: Mon, 15 Apr 2019 16:09:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <8879daf5747ec05fa2430354dbd38cc3ae5e1cd5.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.194]
Subject: Re: [PATCH v2] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 08:04:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月15日 15:59, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2019-04-15 at 15:40 +0800, mingli.yu@windriver.com wrote:
>> ---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000
>> -0700
>> -+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860
>> -0700
>> -@@ -9,7 +9,7 @@
>> +diff --git a/testsuite/dlopen-test.c b/testsuite/dlopen-test.c
>> +index 99d3535..92de9f8 100644
>> +--- a/testsuite/dlopen-test.c
>> ++++ b/testsuite/dlopen-test.c
>> +@@ -9,7 +9,9 @@ int
>>    main (int argc UNUSED, char **argv UNUSED)
>>    {
>>    #if HAVE_LIBDL
>>   -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
>>   +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
>> ++  if (!handle)
>> ++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);
>>      int (*get_version)(void);
>>      if (!handle)
>>        {
>
> What happens on a 32 bit system?
>
> You can't hardcode a specific libdir like that!

I just rework the patch dlopen-test.patch which Juro Bystricky generated 
before, the previous patch only check /usr/lib/libnettle.so and I 
updated it also to check /usr/lib64/libnettle.so if no 
/usr/lib/libnettle.so exist.
  -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
  +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
++  if (!handle)
++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);


Thanks,

>
> Cheers,
>
> Richard
>
>

