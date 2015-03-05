Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 337DC738B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 10:32:37 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 0581C3F79B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 11:32:37 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 11:32:36 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 11:32:36 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 5 Mar 2015 11:33:48 +0100
Message-ID: <54F830C0.5010108@topic.nl>
Date: Thu, 5 Mar 2015 11:32:32 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <54F4798C.8070402@topic.nl>	<5774096.IiVkEzFHVb@peggleto-mobl5.ger.corp.intel.com>
	<54F49E5C.7020408@topic.nl>
In-Reply-To: <54F49E5C.7020408@topic.nl>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: Building with OpenMP support in OE fails on #include <omp.h>
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
X-List-Received-Date: Thu, 05 Mar 2015 10:32:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 02-03-15 18:31, Mike Looijmans wrote:
> On 02-03-15 16:45, Paul Eggleton wrote:
>> Hi Mike,
>>
>> On Monday 02 March 2015 15:54:04 Mike Looijmans wrote:
>>> Here's the problem, running in a devshell:
>>>
>>> # echo '#include <omp.h>' > /tmp/compileme.c
>>> # $CC -c -fopenmp /tmp/compileme.c
>>> /tmp/compileme.c:1:17: fatal error: omp.h: No such file or directory
>>>    #include <omp.h>
>>>                    ^
>>> compilation terminated.
>>>
>>>
>>> The #pragma's and linking of OpenMP work just fine, it's just the inclu=
sion
>>> of omp.h that appears to fail.
>>>
>>> What I was actually trying to do is to activate OpenMP in OpenCV to get
>>> decent performance on a multicore ARM system. But this is holding me ba=
ck
>>> now.
>>>
>>> Looking in the sysroots reveals that the include file is actually there=
:
>>>
>>> $ find tmp-glibc/sysroots/topic-miami-florida-med-xc7z030 -name omp.h
>>> tmp-glibc/sysroots/topic-miami-florida-med-xc7z030/usr/lib/gcc/arm-oe-l=
inux-
>>> gnueabi/4.9.1/include/omp.h
>>
>> Funnily enough this is an issue I fixed a few weeks ago - here's the bug=
 which
>> contains a link to the fix:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7141
>
> Ah okay, I'll upgrade to current master and retest.
>
> If it works, I'll post the patch to make opencv build with openmp.

Hmm, OpenCV now builds fine with OpenMP support for my dual-core ARM system=
, I=20
can also see that it now links to libgomp, but apparently it doesn't actual=
ly=20
use any OpenMP threading, as none of the filters I've tried ever uses more=
=20
than one thread to process the image data. So I guess actually activating=20
OpenMP is just a pointless waste. But for those willing to try, just add th=
is=20
line to the opencv recipe:

EXTRA_OECMAKE +=3D "-DWITH_OPENMP=3DON"




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


