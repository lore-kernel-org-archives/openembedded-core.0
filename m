Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C81C373117
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 01:54:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v851sIBq004789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Sep 2017 18:54:19 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Sep 2017 18:54:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1504517912.git.kai.kang@windriver.com>
	<1919461d34964f3fccb8fe31931dc4daef977b41.1504517912.git.kai.kang@windriver.com>
	<1504555483.2175.78.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <cab5b6a6-5d4a-fb02-d2c4-2aadd7b81732@windriver.com>
Date: Tue, 5 Sep 2017 09:56:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504555483.2175.78.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] dbus: fix ptest runtime failures
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
X-List-Received-Date: Tue, 05 Sep 2017 01:54:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年09月05日 04:04, Richard Purdie wrote:
> On Mon, 2017-09-04 at 17:39 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> When run dbus ptest cases, there are some failures:
>>
>>> ./test/test-dbus-daemon: relocation error: ./test/test-dbus-daemon:
>>> symbol
>>> _dbus_real_assert, version LIBDBUS_PRIVATE_1.10.20 not defined in
>>> file
>>> libdbus-1.so.3 with link time reference
>>> FAIL: test/test-dbus-daemon
>>> [   24.943454] test-dbus-daemo[251]: segfault at 0
>>> ip           (null) sp
>>> 00007ffddabe6818 error 14 in test-dbus-daemon-eavesdrop[
>>> 400000+a000]
>> It disables tests in dbus recipe which cases symbols missing and
>> segment
>> fault. When 'ptest' in DISTRO_FEATURES, it should enable some
>> configure
>> options to make the symbols visible to ptest cases.
>>
>> It also need to correct paths in ptest configure files.
> Does this have a runtime effect on dbus, i.e. are these runtime asserts
> which we don't want in production code?

HI Richard,

I am sorry that did some copy and paste errors for packageconfig ptest. 
It should disable them all if 'ptest' is disabled.
Did that make myself misunderstood?


If not, please:

It gives warnings in configure.ac for enable embedded_tests and asserts:

if test x$enable_embedded_tests = xyes; then
         echo "NOTE: building with unit tests increases the size of the 
installed library and renders it insecure."
fi

if test x$enable_asserts = xyes; then
         echo "NOTE: building with assertions increases library size and 
decreases performance."
fi


It seems true that enable asserts will affect runtime performance. But 
the configure options are required for ptest cases.
Would is it not ok that only enable them when ptest in DISTRO_FEATURES?


I'll send V2 to correct the typos. Sorry for inconvenience.


Regards,
Kai

> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


