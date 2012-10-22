Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TQFFD-0005Jv-9u
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 12:28:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9MAF161020323
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Oct 2012 03:15:02 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 22 Oct 2012 03:14:59 -0700
Message-ID: <50851CC4.6040501@windriver.com>
Date: Mon, 22 Oct 2012 18:15:32 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1350645464.git.kai.kang@windriver.com>
	<44a03f4c870063fd0405695db1de2bfaae976a71.1350645464.git.kai.kang@windriver.com>
	<1350658913.2520.34.camel@ted>
In-Reply-To: <1350658913.2520.34.camel@ted>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q9MAF161020323
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] nativesdk-autoconf: add dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 10:28:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B410=E6=9C=8819=E6=97=A5 23:01, Richard Purdie wrote:
> On Fri, 2012-10-19 at 19:22 +0800, Kang Kai wrote:
>> When use toolchain gmae to compile iptables, autoreconf needs perl and
>> some perl modules. It is too many item to put in the .bb file, so just
>> add nativesdk-perl-modules to provide them.
>>
>> [Yocto 3100]
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/autoconf/autoconf.inc     |    4 +++-
>>   meta/recipes-devtools/autoconf/autoconf_2.69.bb |    2 +-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipe=
s-devtools/autoconf/autoconf.inc
>> index 315e773..29d67a0 100644
>> --- a/meta/recipes-devtools/autoconf/autoconf.inc
>> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
>> @@ -10,7 +10,9 @@ DEPENDS_virtclass-native =3D "m4-native gnu-config-n=
ative"
>>   DEPENDS_virtclass-nativesdk =3D "nativesdk-m4 nativesdk-gnu-config"
>>   RDEPENDS_${PN} =3D "m4 gnu-config"
>>   RDEPENDS_${PN}_virtclass-native =3D "m4-native gnu-config-native"
>> -RDEPENDS_${PN}_virtclass-nativesdk =3D "nativesdk-m4 nativesdk-gnu-co=
nfig"
>> +RDEPENDS_${PN}_virtclass-nativesdk =3D "nativesdk-m4 nativesdk-gnu-co=
nfig \
>> +                                      nativesdk-perl nativesdk-perl-m=
odules \
>> +                                     "
>>
> Ok, this is getting closer but I'm still not 100% convinced we have
> everything fixed properly. For example, if the above is true, isn't
> RDEPENDS_${PN} wrong? Do we need everything in perl-modules?
>
> I also took a look at the automake recipe which in some ways looks
> better behaved. It does:
>
> RDEPENDS_${PN} +=3D "\
>      autoconf \
>      perl \
>      perl-module-bytes \
>      perl-module-constant \
>      perl-module-cwd \
>      perl-module-data-dumper \
>      perl-module-dynaloader \
>      perl-module-errno \
>      perl-module-exporter-heavy \
>      perl-module-file-basename \
>      perl-module-file-compare \
>      perl-module-file-copy \
>      perl-module-file-glob \
>      perl-module-file-spec-unix \
>      perl-module-file-stat \
>      perl-module-getopt-long \
>      perl-module-io \
>      perl-module-io-file \
>      perl-module-posix \
>      perl-module-strict \
>      perl-module-text-parsewords \
>      perl-module-vars "
>
> RDEPENDS_${PN}_virtclass-native =3D "autoconf-native perl-native-runtim=
e"
> RDEPENDS_${PN}_virtclass-nativesdk =3D "nativesdk-autoconf"
>
> which at least seems to list the modules it really needs. The fact we
> then set a virtclass-nativesdk version which is wrong is worrying.
>
> I think the assumption has been that for nativesdk, we'd use the system
> perl.
>
> So I think we need to

Hi Richard,

> a) Decide whether the sdk should be using the nativesdk perl or the hos=
t
> system one. I'm fine with deciding we should use the nativesdk perl
> b) Fix RDEPENDS_${PN} for autoconf so that it lists the right perl
> modules.

I have put every single perl module to autoconf's rdepend. I also update=20
the dependencies among perl modules themselves.

> c) At this pooint we might be able to simply remove RDEPENDS_
> ${PN}_virtclass-nativesdk and the code should figure things out
> automagically itself.

It looks fine when remove the RDEPENDS_ ${PN}_virtclass-nativesdk from=20
autoconf.

> d) We should verify the list of modules for automake is correct

Because automake depends on autoconf, so how about I remove the=20
perl-module-* in automake's rdepends these already in autoconf rdepends?
> e) We should also see if we can simply remove the RDEPENDS_
> ${PN}_virtclass-nativesdk line from automake.

I'll try to remove it.

Thanks,
Kai


>
> Does that make sense?
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
>
>



