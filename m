Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TRZ6c-0004zS-7m
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 03:53:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9Q1dVJA027735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Oct 2012 18:39:31 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Thu, 25 Oct 2012 18:39:28 -0700
Message-ID: <5089E9F3.1090400@windriver.com>
Date: Fri, 26 Oct 2012 09:40:03 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1351155183.git.kai.kang@windriver.com>
	<6568219d957b11739d325f2573df9266cfe228a6.1351155183.git.kai.kang@windriver.com>
	<508952B7.7050502@linux.intel.com>
In-Reply-To: <508952B7.7050502@linux.intel.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q9Q1dVJA027735
Cc: Zhenfeng.Zhao@windriver.com, "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl: update dependencies
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
X-List-Received-Date: Fri, 26 Oct 2012 01:53:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B410=E6=9C=8825=E6=97=A5 22:54, Saul Wold wrote:
> On 10/25/2012 02:50 AM, Kang Kai wrote:
>> Update dependencies for perl modules again. When only install
>> perl-module-file-glob, run perl script with "require File::Glob;" will
>> fail. Update dependencies to fix that.
>>
> Is this just a point fix for the File::Glob issue?

Fix perl-module-dynaloader too. It didn't expose to run failed when=20
update the deps among perl modules.

>
> As I was originally researching this issue it seemed to me that the=20
> perl_rdepends was incorrect, the script used to generate it did not=20
> actually work, please review the bug comment.
>
> Are you going to look at the bigger issue?

I'm glad to. But this may need more time.

Regards,
Kai

>
> Thanks
> Sau!
>
>> [Yocto 3069]
>>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2 ++
>> meta/recipes-devtools/perl/perl_5.14.2.bb | 2 +-
>> 2 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc=20
>> b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
>> index 2707fe8..39972ca 100644
>> --- a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
>> +++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
>> @@ -13,8 +13,10 @@
>>
>> # Some additional dependencies that the above doesn't manage to=20
>> figure out
>> # Please take care that exporter depends exporter-heavy, not reverse
>> +RDEPENDS_${PN}-module-dynaloader +=3D "${PN}-module-carp"
>> RDEPENDS_${PN}-module-exporter +=3D "${PN}-module-exporter-heavy"
>> RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-feature"
>> +RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-file"
>> RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-cwd"
>> RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-file-spec-unix"
>> RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-fcntl"
>> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb=20
>> b/meta/recipes-devtools/perl/perl_5.14.2.bb
>> index 3ede831..1e1eb04 100644
>> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D=20
>> "file://Copying;md5=3D2b4c6ffbcfcbdee469f02565f253d81a \
>> # We need gnugrep (for -I)
>> DEPENDS =3D "virtual/db grep-native"
>> DEPENDS +=3D "gdbm zlib"
>> -PR =3D "r13"
>> +PR =3D "r14"
>>
>> # 5.10.1 has Module::Build built-in
>> PROVIDES +=3D "libmodule-build-perl"
>>
>



