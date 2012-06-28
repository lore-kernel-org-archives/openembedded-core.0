Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Sk9ne-0008SY-3h
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 10:10:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5S7x5mW000692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jun 2012 00:59:05 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Jun 2012 00:59:05 -0700
Message-ID: <4FEC0EC7.6050800@windriver.com>
Date: Thu, 28 Jun 2012 15:59:03 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
	<CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
In-Reply-To: <CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q5S7x5mW000692
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
X-List-Received-Date: Thu, 28 Jun 2012 08:10:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B406=E6=9C=8821=E6=97=A5 23:47, Khem Raj wrote:
> On Thu, Jun 21, 2012 at 12:13 AM,  <xin.ouyang@windriver.com> wrote:
>> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>>
>> We should not just replace CCFLAGS with CFLAGS while compiling, becaus=
e
>> this may cause run-time errors with perl's DynaLoader.pm.
>>
>> Tested on qemux86 with new libnet-libidn-perl bb recipe:
>
> can you instead try the patch from
>
> http://bugs.debian.org/cgi-bin/bugreport.cgi?msg=3D19;bug=3D628522
>
This debian patch takes no effect.

Actually it try to fix this:

Some packages which has those lines in Makefile.PL:
   WriteMakefile(
       ...
       'CCFLAGS'    =3D> 'some cflags',
       ...
   );
While run perl Makefile.PL to configure, there are CCFLAGS=3D"some cflags=
"=20
to override the original CCFLAGS=3D$Config{ccflags} in generated Makefile=
s.


In Poky, CCFLAGS in our generated Makefiles are all right.
But when we run oe_runmake CCFLAGS=3D"${CFLAGS}" to do_compile, this will=
=20
override our right CCFLAGS.


- Xin

>>
>> root@qemux86:~# perl -e "use Net::LibIDN"
>> Not a CODE reference at /usr/lib/perl/5.14.2//DynaLoader.pm line 213.
>> END failed--call queue aborted at /usr/lib/perl/vendor_perl/5.14.2//Ne=
t/LibIDN.pm line 213.
>> Compilation failed in require at -e line 1.
>> BEGIN failed--compilation aborted at -e line 1.
>>
>> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
>> ---
>>   meta/classes/cpan.bbclass |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
>> index 2e9432c..957a6e2 100644
>> --- a/meta/classes/cpan.bbclass
>> +++ b/meta/classes/cpan.bbclass
>> @@ -26,13 +26,14 @@ cpan_do_configure () {
>>                         test -f $f2 || continue
>>                         sed -i -e "s:\(PERL_ARCHLIB =3D \).*:\1${PERL_=
ARCHLIB}:" \
>>                                 -e 's/perl.real/perl/' \
>> +                               -e "s/^\(CCFLAGS =3D.*\)/\1 ${CFLAGS}/=
" \
>>                                 $f2
>>                 done
>>         fi
>>   }
>>
>>   cpan_do_compile () {
>> -       oe_runmake PASTHRU_INC=3D"${CFLAGS}" CCFLAGS=3D"${CFLAGS}" LD=3D=
"${CCLD}"
>> +       oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}"
>>   }
>>
>>   cpan_do_install () {
>> --
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


--=20
- Pascal




