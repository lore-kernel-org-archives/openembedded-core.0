Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOt0l-0004ce-0J
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:55:07 +0200
Received: by pvc30 with SMTP id 30so3083938pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:references:in-reply-to:mime-version
	:content-transfer-encoding:content-type:message-id:cc:x-mailer:from
	:subject:date:to;
	bh=P6F6TDJlAMYF+k2YVXNIRU2u5MeRGBYWhXhzZiqXjpM=;
	b=oXjk7Ve05Rh+UsYxS4js9CC88AORIdh2roYhZ9wtI4mDAgDJWwUtAjNOY9abcuVOpj
	9hgcSue63UufcQChLuBUhvC6qdazUvQwhpHrti5JImudCzR4w2by7yEJ/kedGVplNxqT
	CUzshFvF+iVepk3jjyXcWqNkX5jXiFdVLTZPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	b=ihJ0yHAgIk5Cp4RVKMueTjYdyOatejgOCafn1wEwOac+PRQYfJzWrusWztuVlsnm2d
	ZBrXCe5dgsnZVGG2TR27LWoeTScy8zOUpDUN4PUaIx6mbDUOALdPW1hQ8LQK9LqPCz6S
	DErSna9RUpw59ZExz9Lv4dm47gXAa8rFZZFzk=
Received: by 10.68.44.73 with SMTP id c9mr3039687pbm.163.1306248724522;
	Tue, 24 May 2011 07:52:04 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x6sm589285pbt.42.2011.05.24.07.52.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 07:52:02 -0700 (PDT)
References: <cover.1306037150.git.raj.khem@gmail.com>
	<c3ce108a01c4c250640528973e4cf12dfe062671.1306037150.git.raj.khem@gmail.com>
	<4DDBC45A.6090102@intel.com>
In-Reply-To: <4DDBC45A.6090102@intel.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <D0F7BA36-2C4C-4442-851F-EC89894864F4@gmail.com>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2011 07:52:33 -0700
To: Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Tue, 24 May 2011 14:55:07 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On May 24, 2011, at 7:44 AM, Saul Wold <saul.wold@intel.com> wrote:

> On 05/21/2011 09:09 PM, Khem Raj wrote:
>> * Currently we are passing -jN flags to eglibc makefiles
>>   however eglibc uses a make variable called PARALLELMFLAGS
>>   to pass information about parallel build to sub-makes
>>=20
>> * Currently make install ran without parallelism but now
>>   it should have parallel building flags passed to do_install
>>   correctly which inturn should improve build time of
>>   eglibc on systems using parallel build -j with values>  1
>>=20
> Khem,
>=20
> What kind of testing have you done with this patch, I get a consistent fai=
lure on multiple machines with eglibc-initial do_install.
>=20
> Please review this error log, the make target `<number>' changes, which
> leads me to believe it's related to the PARALLEL_MAKE number.
>=20

I have done couple of builds of eglibc with -j 2

Will see what's wrong with eglibc-initial=20
> Thanks
>    Sau!
>=20
>=20
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/eglibc/eglibc.inc |    6 ++++++
>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/egli=
bc/eglibc.inc
>> index 8314cb1..39972b0 100644
>> --- a/meta/recipes-core/eglibc/eglibc.inc
>> +++ b/meta/recipes-core/eglibc/eglibc.inc
>> @@ -36,4 +36,10 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>>=20
>>  ARM_INSTRUCTION_SET =3D "arm"
>>=20
>> +# eglibc uses PARALLELMFLAGS variable to pass parallel build info so tra=
nsfer
>> +# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
>> +EGLIBCPARALLELISM :=3D "PARALLELMFLAGS=3D${PARALLEL_MAKE}"
>> +EXTRA_OEMAKE +=3D ${EGLIBCPARALLELISM}
>> +PARALLEL_MAKE =3D ""
>> +
>>  PACKAGES =3D "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-d=
ev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-=
pcprofile"
>=20
> <do_install_failure>


