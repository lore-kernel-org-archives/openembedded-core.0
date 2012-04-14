Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SItgn-0004fk-DZ
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 05:30:17 +0200
Received: by lagw12 with SMTP id w12so2704252lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 20:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=HaWx75CianUfyifqxq3+/6FjhwUi+dvsA5XLEsO9oz8=;
	b=Axrd64ETl3E7bLzIM2Zg1vhbNEUDSfbM3Mfoo0Tp0jw/La2ztRNraKO5toNujir5L/
	TsvWTpq1hngXZpUenJYvPNbTwSW2HFUlXFUXznoyspmUPpJ7J6YQk2sEtvkpp3sZGiOs
	rD9UQCMgwWdaEMAJcxGIF7/lFP6Vh6i1ZztfW3pMM8Cx+QuEx+N5H0gnlqussLaAAN74
	IAPyOT88YhPnwXI/oN5WJGCwm7HD3VTVzwuEae2V+j19XeMckjakNuZnCyMuW3zGO3OW
	zrtusKJbcrdnKq2xoN0zkuWhH8cdD2++3REdBSMPgs2atoYTL69f+3D3Gd4Ke+c7RTSQ
	0hgw==
Received: by 10.152.133.144 with SMTP id pc16mr3461006lab.0.1334373655166;
	Fri, 13 Apr 2012 20:20:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 20:20:24 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C03060012@fmsmsx152.amr.corp.intel.com>
References: <cover.1334308316.git.liezhi.yang@windriver.com>
	<638c4f827223820ee30ff0820df4179d41acfb60.1334308316.git.liezhi.yang@windriver.com>
	<CAMKF1soUx3Ov3Z1jZJpn3=hj_u79j5VaTVEG-S27SMQ8icsUWg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C03060012@fmsmsx152.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 20:20:24 -0700
Message-ID: <CAMKF1spMNCc3dUkp-SyOMvWhc3diKY3nbiFUxQuDb1PjBsPKiA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub 1.99: fix build for gcc 4.7
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
X-List-Received-Date: Sat, 14 Apr 2012 03:30:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 4:43 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Friday, April 13, 2012 1:21 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 1/1] grub 1.99: fix build for gcc 4.7
>>
>> On Fri, Apr 13, 2012 at 2:41 AM, Robert Yang
>> <liezhi.yang@windriver.com> wrote:
>> > There was an error when build with gcc 4.7 (FC 17 64bit):
>> > | fs/zfs/zfs.c: In function 'get_filesystem_dnode':
>> > | fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will
>> > | break strict-aliasing rules [-Werror=3Dstrict-aliasing]
>> > ......
>> > cc1: all warnings being treated as errors
>> >
>> > While compare the compile command between gcc 4.4.4 and gcc 4.7.0,
>> > they are the same (both of them have -Wall and -Werror), it seems
>> that
>> > gcc
>> > 4.7.0 has changed its algorithm for the strict aliasing check, but I
>> > didn't find the related information from its release note.
>> >
>> > Add "-fno-strict-aliasing" to gcc's option would fix the problem,
>> this
>> > would disable the optimization for strict-aliasing.
>>
>> This seems a bit more than whats needed. You could try adding -Wno-
>> error=3Dstrict-aliasing to CFLAGS
>>
>> on another note. I do not see this failing with gcc-4.7(target
>> compiler) here when I build grub for qemux86 so I am a bit puzzled
>>
>
>
> Khem,
> =C2=A0There is another grub recipe issue, it is building target binaries =
with distro compiler. Probably because of that you did not see issue with 4=
.7 cross compiler. We have fix for that issue now.

hmmm interesting that clarifies. So I guess once you fix it to do
_proper_ cross compile build then I guess the problem gets fixed when
we use gcc 4.6 but as soon as we move to gcc-4.7 this will reappear so
in any case this issue needs to fixed in a good manner I think
in anycase.


