Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 48BEC65D0D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 07:24:51 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so1158198wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 00:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=S40qBvRsbk963S8UyQ9lHOZu4+4H0hJAfYdObd+eiek=;
	b=XQ4xvO0iEBlMcWSmYjqkH6Knijwc1v4P6gtrlXZyvNFjO/Xmg1PtJqVrGWopNCncfb
	Qq5Ahc8H3AKReO0EJUiswdQGYNbkkMwrN48eyRI4kbzJUiKcoCyXXbHLg2iPckoBOPvQ
	YVT9EkPWtj+CpgTrsBcZ2ndHWhfz6raUDjL9PjrM3oUdd+wmdZEIgbTeTAHyHVbAwr38
	1vT7IxjHiVk4fD6vD50AT9RmkBgxSWlPoeQK4eIGxvAS/HWlnYJYJpxUlBXRdYPsS9Ns
	+AlQS0iYudpGUswB2RIxsUqxyh0yesYfQCxCHIdHsRTcgQicXpoil2wdJ2DSaL+rlL3c
	n6qw==
X-Gm-Message-State: ALoCoQnNwB/RVtbRI2eRfxqVokxb5B6nYVavKi3B8pUMwWLO/1lJzZXRs3ke/IjgH9IqypOGt2Gg
X-Received: by 10.180.82.133 with SMTP id i5mr5548864wiy.50.1397892292096;
	Sat, 19 Apr 2014 00:24:52 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	lb4sm46909261wjb.14.2014.04.19.00.24.50 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Apr 2014 00:24:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53518A29.3090802@linux.intel.com>
Date: Sat, 19 Apr 2014 09:24:45 +0200
Message-Id: <FE65A0A1-6103-4789-AB71-10F3F7510877@dominion.thruhere.net>
References: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
	<53518A29.3090802@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] git: fix perl binding installation
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
X-List-Received-Date: Sat, 19 Apr 2014 07:24:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr. 2014, om 22:25 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 04/17/2014 02:07 AM, Koen Kooi wrote:
>> Git.pm wasn't ending up in the package because do_install removed it
>> with a misleading comment about multilib. Fix the problem at the =
source
>> so that Git.pm ends up in the correct dir *and* doesn't get deleted.
>>=20
>> The perl.mak file gets updated during the regular do_install, so add =
an
>> extra make install step to install the *.pm files to the correct
>> directory.
>>=20
>> This is the first step in making git-perltools actually work.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>  meta/recipes-devtools/git/git.inc | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
>> index f5013f1..888b2a5 100644
>> --- a/meta/recipes-devtools/git/git.inc
>> +++ b/meta/recipes-devtools/git/git.inc
>> @@ -28,10 +28,16 @@ do_install () {
>>  		template_dir=3D${datadir}/git-core/templates \
>>  		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
>>=20
>> +	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' =
\
>> +	       -e 's#${STAGING_LIBDIR_NATIVE}/#${libdir}/#' \
>> +	       -e 's#/lib/perl-native#/lib#g' \
>> +	       ${S}/perl/perl.mak
>> +
>> +	cd ${S}/perl && oe_runmake install DESTDIR=3D"${D}" =
bindir=3D${bindir}
>> +
>=20
> Koen,
>=20
> This still seems to have a problem, and yes I have all 3 patches
>=20
>> | NOTE: make -j 16 NO_PYTHON=3D1 RUNTIME_PREFIX=3D1 NO_GETTEXT=3D1 =
install =
DESTDIR=3D/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/git/1.9.0-r0/i=
mage bindir=3D/usr/bin
>> | make[1]: Entering directory =
`/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/git/1.9.0-r0/git-1.9.0/=
perl'
>> | make[1]: *** No rule to make target =
`/usr/lib/perl/5.14.3/Config.pm', needed by `perl.mak'.  Stop.
>> | make[1]: Leaving directory =
`/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/git/1.9.0-r0/git-1.9.0/=
perl'
>> | make: *** [install] Error 2
>> | ERROR: oe_runmake failed

I've seen that pop up as well, but I couldn't reproduce that with =
'bitbake -c clean git ; bitbake git'. I only tested with -j4, I'll =
retest with -j16. Are you seeing this on all builds or only some of =
them?

regards,

Koen



>=20
>=20
> Sau!
>=20
>=20
>=20
>>  	# ${libdir} is not applicable here, perl-native files are always
>>  	# installed to /usr/lib on both 32/64 bits targets.
>>  	rm -rf ${D}${exec_prefix}/lib/perl-native
>> -	rmdir ${D}${exec_prefix}/lib || true
>>  }
>>=20
>>  PERLSEDFIXUP =3D " \
>> @@ -75,6 +81,7 @@ PERLTOOLS =3D " \
>>  PACKAGES =3D+ "${PN}-perltools"
>>  FILES_${PN}-perltools +=3D " \
>>      ${PERLTOOLS} \
>> +    ${prefix}/lib/perl \
>>      ${datadir}/perl \
>>  "
>>  RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path =
findutils"
>>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


