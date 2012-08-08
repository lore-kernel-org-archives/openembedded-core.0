Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1Sz6Qh-0001ob-Kx
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:36:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q78DOJwT004213
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 06:24:19 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Wed, 8 Aug 2012 06:24:18 -0700
Message-ID: <50226880.6050808@windriver.com>
Date: Wed, 8 Aug 2012 09:24:16 -0400
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
In-Reply-To: <1344374402.4874.32.camel@x121e.pbcl.net>
X-Originating-IP: [128.224.147.210]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q78DOJwT004213
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
X-List-Received-Date: Wed, 08 Aug 2012 13:36:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12-08-07 05:20 PM, Phil Blundell wrote:
> On Tue, 2012-08-07 at 15:29 -0400, Yao Zhao wrote:
>> On 12-08-07 02:45 PM, Phil Blundell wrote:
>>> On Tue, 2012-08-07 at 14:43 -0400, Yao Zhao wrote:
>>>> On 12-08-07 02:38 PM, Phil Blundell wrote:
>>>>> On Tue, 2012-08-07 at 14:35 -0400, Yao Zhao wrote:
>>>>>> On 12-08-07 02:30 PM, Phil Blundell wrote:
>>>>>>> Where do libz.a and libz.so end up after your patch?
>>>>>> =E2=94=9C=E2=94=80=E2=94=80 zlib-dev
>>>>>> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 lib
>>>>>> =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 libz.so -> libz.so=
.1.2.7
>>>>>> =E2=94=94=E2=94=80=E2=94=80 zlib-staticdev
>>>>>> =E2=94=94=E2=94=80=E2=94=80 lib
>>>>>> =E2=94=94=E2=94=80=E2=94=80 libz.a
>>>>> I found the output from "tree" a bit hard to read, but that doesn't=
 look
>>>>> right to me.
>>>> any reason? It shouldn't go to lib, but still /usr/libxx?
>>> Conventionally, yeah.  I think the linker does search both but the
>>> development files would traditionally go in /usr/lib.
>> If don't install libz.a to the same directory, will linker find libz.a
>> not libz.so if -L /usr/lib -L /lib?
> You want both libz.a and libz.so in /usr/lib so I think that ought to b=
e
> a non-issue.  But in any case, I think (though I'm not 100% certain)
> that it will look for libz.so in all paths before searching for libz.a.
I want both libz.a and libz.so* in /lib.

I wrote a simple test case:
cat Makefile
all:
         gcc -c -fPIC -DPIC -o test.o test.c -g
         gcc -o libtest.so -shared test.o
         gcc -c -o test_main.o test_main.c -g
         ar rc libtest.a test.o
         mv libtest.a usr/lib
         mv libtest.so lib
         gcc -o test_main_static test_main.o -L./usr/lib -L./lib -ltest
         gcc -o test_main_shared test_main.o -L./lib -L./usr/lib -ltest

If don't install to same directory then it will have problems.

yao
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




