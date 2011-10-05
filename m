Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBLJN-0004hU-W4
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 08:50:38 +0200
Received: from mail39-db3-R.bigfish.com (10.3.81.250) by
	DB3EHSOBE004.bigfish.com (10.3.84.24) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 06:45:02 +0000
Received: from mail39-db3 (localhost.localdomain [127.0.0.1])	by
	mail39-db3-R.bigfish.com (Postfix) with ESMTP id 4E9AC17300ED	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 06:45:02 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h946h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail39-db3 (localhost.localdomain [127.0.0.1]) by mail39-db3
	(MessageSwitch) id 1317797102163894_20249;
	Wed,  5 Oct 2011 06:45:02 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.248])	by
	mail39-db3.bigfish.com (Postfix) with ESMTP id 18B151AE804C	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 06:45:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 06:45:02 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 01:45:00 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/6] Fix sysprof for powerpc64
Thread-Index: AQHMgypNmll0mnSWpki4iAxH2ajb3w==
Date: Wed, 5 Oct 2011 06:44:59 +0000
Message-ID: <CAEsOVNceFDNoWZu-aqv3fs=K1a=dyGF1kZp2j4=xzec_iPqL3w@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com>
In-Reply-To: <4E8B9F2C.5030706@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 05 Oct 2011 06:50:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <2AD39EAA92038F4F9A410DF54E60AB3E@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2011 at 7:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb
>> b/meta/recipes-kernel/sysprof/sysprof_git.bb
>> index 10bde04..271b5d8 100644
>> --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
>> +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
>> @@ -16,6 +16,8 @@ SRC_URI_append_arm =A0=3D " file://rmb-arm.patch"
>> =A0SRC_URI_append_mips =3D " file://rmb-mips.patch"
>> =A0SRC_URI_append_powerpc =3D " file://ppc-macro-fix.patch"
>>
>> +export CFLAGS_append_powerpc64 =3D " -D__ppc64__"
>> +
>
> this is a gcc built-in define I wonder why you need to add it explicitly

The file in question is compiled like:

powerpc64-fsl-linux-gcc     -m64 -mcpu=3De5500
--sysroot=3D/local/home/mattsm/git/poky/build_p5020ds-64b_release/tmp/sysro=
ots/p5020ds-64b
-DHAVE_CONFIG_H -I.
-I/local/home/mattsm/git/poky/build_p5020ds-64b_release/tmp/sysroots/p5020d=
s-64b/usr/include/glib-2.0
-I/local/home/mattsm/git/poky/build_p5020ds-64b_release/tmp/sysroots/p5020d=
s-64b/usr/lib64/glib-2.0/include
    -O2 -pipe -g -feliminate-unused-debug-types -Wall -MT
sysprof_cli-collector.o -MD -MP -MF .deps/sysprof_cli-collector.Tpo -c
-o sysprof_cli-collector.o `test -f 'collector.c' || echo
'./'`collector.c

Without the -D__ppc64__ it gives the following:

collector.c: In function =91sysprof_perf_counter_open=92:
collector.c:193:21: error: =91__NR_perf_counter_open=92 undeclared (first
use in this function)
collector.c:193:21: note: each undeclared identifier is reported only
once for each function it appears in
collector.c: In function =91process_event=92:
collector.c:654:11: warning: variable =91name=92 set but not used
[-Wunused-but-set-variable]
collector.c: In function =91sysprof_perf_counter_open=92:
collector.c:194:1: warning: control reaches end of non-void function
[-Wreturn-type]

Looking at collector.c it's very simple:

#ifndef __NR_perf_counter_open
#if defined(__i386__)
#define __NR_perf_counter_open 336
#elif defined(__x86_64__)
#define __NR_perf_counter_open 298
[...snip...]
#elif defined(__hppa__)
#define __NR_perf_counter_open 318
#elif defined(__ppc__) || defined(__ppc64__)
#define __NR_perf_counter_open 319
#elif defined(__s390__)
[...snip...]
#endif
#endif

Am I missing something obvious?

-M=



