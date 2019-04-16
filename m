Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1928E7C160
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 03:10:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3G39Uh2029996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 20:09:40 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 15 Apr 2019 20:09:20 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <21cc3e7248d8e702f49de8818f26e2e53a001ed1.camel@linuxfoundation.org>
	<1555319122-215657-1-git-send-email-mingli.yu@windriver.com>
	<b7f0fbbdfd6b0523e521cdd7ff84d6b59554abeb.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CB54879.2020303@windriver.com>
Date: Tue, 16 Apr 2019 11:14:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <b7f0fbbdfd6b0523e521cdd7ff84d6b59554abeb.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.194]
Subject: Re: [PATCH v3] nettle: fix ptest failure
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
X-List-Received-Date: Tue, 16 Apr 2019 03:10:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月15日 19:08, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2019-04-15 at 17:05 +0800, mingli.yu@windriver.com wrote:
>> @@ -33,6 +29,8 @@ EXTRA_OECONF = "--disable-openssl"
>>   CFLAGS_append = " -std=c99"
>>
>>   do_compile_ptest() {
>> +        # fix dlopen-test failure as cannot locate libnettle.so
>> +        sed -i 's;dlopen ("../libnettle.so", RTLD_NOW);dlopen
>> ("${libdir}/libnettle.so", RTLD_NOW);g' ${S}/testsuite/dlopen-test.c
>>           oe_runmake buildtest
>>   }
>>
>> @@ -49,4 +47,7 @@ do_install_ptest() {
>>           install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
>>   }
>>
>> +RDEPENDS_${PN}-ptest += "${PN}-dev"
>> +INSANE_SKIP_${PN}-ptest += "dev-deps"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
>
> Does Adrian's suggestion of removing the "../" work? Also, can we

Yes, the Adrian's suggestion works. But I think it's also okay to update 
the actual libnettle.so path in do_compile_ptest phase as we still need 
an extra patch if use Adrian's suggestion.

> install a symlink in do_install_ptest which this code would find? That

Install a symlink? Does it means nettle-ptest will provide libnettle.so?
@@ -45,6 +49,7 @@ do_install_ptest() {
          # tools can be found in PATH, not in ../tools/
          sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
          install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
+        ln -s ${libdir}/libnettle.so.6.5 ${D}${PTEST_PATH}/libnettle.so
  }


> would be less invasive and we could potentially remove the -dev package
> dependency which would be good from an image perspective.

Just nettle-ptest rdepends on nettle-dev.

>
> Cheers,
>
> Richard
>
>

