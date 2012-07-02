Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Slbdo-0001Q3-2L
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 10:05:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q627snUH028500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2012 00:54:50 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 2 Jul 2012 00:54:49 -0700
Message-ID: <4FF153C8.2060902@windriver.com>
Date: Mon, 2 Jul 2012 15:54:48 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
	<CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
	<4FEC0EC7.6050800@windriver.com> <4FEC807C.1040803@gmail.com>
In-Reply-To: <4FEC807C.1040803@gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q627snUH028500
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Mon, 02 Jul 2012 08:05:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B406=E6=9C=8829=E6=97=A5 00:04, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 6/28/2012 12:59 AM, Pascal Ouyang wrote:
>> On 2012=E5=B9=B406=E6=9C=8821=E6=97=A5 23:47, Khem Raj wrote:
>>> On Thu, Jun 21, 2012 at 12:13 AM,  <xin.ouyang@windriver.com>
>>> wrote:
>>>> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>>>>
>>>> We should not just replace CCFLAGS with CFLAGS while compiling,
>>>> because this may cause run-time errors with perl's
>>>> DynaLoader.pm.
>>>>
>>>> Tested on qemux86 with new libnet-libidn-perl bb recipe:
>>>
>>> can you instead try the patch from
>>>
>>> http://bugs.debian.org/cgi-bin/bugreport.cgi?msg=3D19;bug=3D628522
>>>
>> This debian patch takes no effect.
>>
>> Actually it try to fix this:
>>
>> Some packages which has those lines in Makefile.PL: WriteMakefile(
>> ... 'CCFLAGS'    =3D> 'some cflags', ... ); While run perl
>> Makefile.PL to configure, there are CCFLAGS=3D"some cflags" to
>> override the original CCFLAGS=3D$Config{ccflags} in generated
>> Makefiles.
>>
>>
>> In Poky, CCFLAGS in our generated Makefiles are all right. But when
>> we run oe_runmake CCFLAGS=3D"${CFLAGS}" to do_compile, this will
>> override our right CCFLAGS.
>
> but thats what assign operator is meant to do isnt it ?
>

But CCFLAGS cannot be overrided by CFLAGS, because original CCFLAGS has=20
some -DXXX flags read from the config for perl.
Without these compile flags, the perl modules cannot run correctly.

root@qemux86:~# perl -e "use Net::LibIDN"
...
Compilation failed in require at -e line 1.
BEGIN failed--compilation aborted at -e line 1.

-P

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk/sgHwACgkQuwUzVZGdMxSvoACdHtcMLShjJIglhq/KXuE73QIW
> 7FsAoI/IFxzDXZWX/xLj3tNkDDzdUM++
> =3DMWVl
> -----END PGP SIGNATURE-----
>


--=20
- Pascal




