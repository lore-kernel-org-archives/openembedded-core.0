Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIsfN-0003hG-JQ
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 04:24:45 +0200
Received: by lagw12 with SMTP id w12so2689634lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 19:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=plPt+cywBwzzGytd/H5EEqV5cGuZb7a48xMEpidMO2U=;
	b=ASJ1ac8BOeuzP/MMuAzMVnjtCdHbLSUgfNVUGcXpXORBPvnKmgRHc6tWz9U657TA1F
	b3ceG4tukxVw3PIlRfFWvcrH+bempczGN3lFHzTTKiJ+LVSQ29xzUK5J7Php6yc8prTJ
	bTH8hUWKunouCgFVso/WwJwLLZrgBwhpTYiYkQfcJUe6R3d+QgFcnYs418jKPN9PkauH
	FCS/N4ethV9UDaSB7oX/1mRA22QcZWx74F6GLwyQSegiDX6OxMra5czaEoQJWiPHsoWW
	HtUd/7fCOGeCqe20mF1VRYroSTXq+GBVWrFSFxWQ0bU841z5yh2F+rtiodJ391lrHmDx
	rC7A==
Received: by 10.152.146.234 with SMTP id tf10mr3275787lab.31.1334369723139;
	Fri, 13 Apr 2012 19:15:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 19:14:52 -0700 (PDT)
In-Reply-To: <4F88A76C.2000308@linux.intel.com>
References: <36ED13F3654AE54CA763E6821D93A5711043A0E3@szxeml534-mbs.china.huawei.com>
	<4F88A76C.2000308@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 19:14:52 -0700
Message-ID: <CAMKF1so2tFrdJgQHEcTXmN8vU4KetHL0QUjv+3=Yhi=o3DjESg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: Re: [PATCH] boost: fix re-execution of task
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
X-List-Received-Date: Sat, 14 Apr 2012 02:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 3:23 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 04/13/2012 04:42 AM, Venkata ramana gollamudi wrote:
>>
>> After building boost package, re-execution of boostconfig task followed =
by
>> re-execution of compile task is giving following error
>> "error: duplicate initialization of gcc with the following parameters"
>> during compilation
>> It is because multiple entries of gcc are being added during boostconfig
>> re-execution
>> there by failing the compilation.
>>
>> The patch fixes adding multiple "Using gcc" entries into
>> /tools/build/v2/user-config.jam
>>
>> [Yocto #2194]
>>
>> Signed-off-by: Venkata Ramana Gollamudi<ramana.gollamudi@huawei.com>
>> ---
>> =C2=A0meta/recipes-support/boost/boost.inc | =C2=A0 =C2=A06 +++++-
>> =C2=A01 files changed, 5 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-support/boost/boost.inc
>> b/meta/recipes-support/boost/boost.inc
>> index d70a7e2..c9306df 100644
>> --- a/meta/recipes-support/boost/boost.inc
>> +++ b/meta/recipes-support/boost/boost.inc
>> @@ -135,7 +135,11 @@ BJAM_OPTS =C2=A0 =C2=A0=3D '${BJAM_TOOLS} \
>> =C2=A0do_boostconfig() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f boost/config/platform/linux.hpp
>> boost/config/platform/linux-gnueabi.hpp
>>
>> - =C2=A0 =C2=A0 =C2=A0 echo 'using gcc : 4.3.1 : ${CXX} : compileflags
>> -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;'>>
>> =C2=A0${S}/tools/build/v2/user-config.jam
>> + =C2=A0 =C2=A0 =C2=A0 # D2194:Fixing the failure of "error: duplicate i=
nitialization of
>> gcc with the following parameters" during compilation.
>> + =C2=A0 =C2=A0 =C2=A0 if ! grep -qe "^using gcc : 4.3.1"
>> ${S}/tools/build/v2/user-config.jam
>> + =C2=A0 =C2=A0 =C2=A0 then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'using gcc : 4.3=
.1 : ${CXX} : compileflags
>> -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;'>>
>> =C2=A0${S}/tools/build/v2/user-config.jam
>> + =C2=A0 =C2=A0 =C2=A0 fi
>> =C2=A0}
>>
>> =C2=A0addtask do_boostconfig after do_patch before do_configure
>
>
> Merged into OE-Core

I had some feedback on this patch series. I wonder if it was so meaningless=
.

>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


