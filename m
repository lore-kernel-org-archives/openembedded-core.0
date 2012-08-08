Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1Sz6cX-0003Iq-5O
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:48:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q78DaXAc006119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 06:36:33 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Wed, 8 Aug 2012 06:36:33 -0700
Message-ID: <50226B5E.9090605@windriver.com>
Date: Wed, 8 Aug 2012 09:36:30 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
	<1344364223.4874.16.camel@x121e.pbcl.net>
	<50216009.6020601@windriver.com>
	<1344364696.4874.19.camel@x121e.pbcl.net>
	<502161DC.9020705@windriver.com>
	<1344365134.4874.23.camel@x121e.pbcl.net>
	<50216C8B.20802@windriver.com>
	<1344374402.4874.32.camel@x121e.pbcl.net>
	<50226880.6050808@windriver.com>
	<1344432356.23275.247.camel@phil-desktop>
In-Reply-To: <1344432356.23275.247.camel@phil-desktop>
X-Originating-IP: [128.224.147.210]
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 13:48:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-08 09:25 AM, Phil Blundell wrote:
> On Wed, 2012-08-08 at 09:24 -0400, Yao Zhao wrote:
>> I want both libz.a and libz.so* in /lib.
>>
>> I wrote a simple test case:
>> cat Makefile
>> all:
>>           gcc -c -fPIC -DPIC -o test.o test.c -g
>>           gcc -o libtest.so -shared test.o
>>           gcc -c -o test_main.o test_main.c -g
>>           ar rc libtest.a test.o
>>           mv libtest.a usr/lib
>>           mv libtest.so lib
>>           gcc -o test_main_static test_main.o -L./usr/lib -L./lib -ltest
>>           gcc -o test_main_shared test_main.o -L./lib -L./usr/lib -ltest
>>
>> If don't install to same directory then it will have problems.
> That testcase isn't terribly representative since you have libtest.so
> being the actual shared library.  In the zlib case, since it has a
> proper SONAME, libz.so.1 and libz.so are distinct.
Slightly modified:
cat Makefile
all:
         gcc -c -fPIC -DPIC -o test.o test.c -g
         gcc -o libtest.so.1.2 -Wl,-soname,libtest.so.1 -shared test.o
         gcc -c -o test_main.o test_main.c -g
         ar rc libtest.a test.o
         ln -s libtest.so.1.2 libtest.so.1
         ln -s libtest.so.1.2 libtest.so
         mv libtest.a usr/lib
         mv libtest.so* lib
         gcc -o test_main_static test_main.o -L./usr/lib -L./lib -ltest
         gcc -o test_main_shared test_main.o -Llib -L./usr/lib -ltest

yao
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




