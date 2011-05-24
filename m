Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOt68-00053E-ER
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 17:00:40 +0200
Received: by pwj9 with SMTP id 9so3130160pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:references:in-reply-to:mime-version
	:content-transfer-encoding:content-type:message-id:cc:x-mailer:from
	:subject:date:to;
	bh=pubcJQuwdTNMRsKv8lcsCUhEMzozzUEvPy8OtkJniv4=;
	b=Z12I8cNoocdTIYryLr1paW41EvD5gPHYXSNC4OFshKzFFWhHGb6RbCv4Y1x+4k2zlY
	8VWaJFi6PVlWK8E1KuqgzZtDMxU4Z4uS2RjrzNEGgUc4exoCmIUVdYQVqoSg+5RYw5Se
	Chq8naUp8ACJUmB8ePMpxBHyiWciwfHM4CFPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	b=WVat60kPGp3j7cPb1kPc6xzuiQpXxhOTk1eaiM8HkwOluItbZ6alMUd54JA5Y2nW21
	RqlTnvKFHS/o6xTUFIxF6CvuQQYPPY/Zm/zpqSU3V0CuWX0uESGfqMu3163Hx5QBXzr5
	VzRL6QGe995PSdwdR1ERfZ376i5fRfCfGJWG0=
Received: by 10.68.62.39 with SMTP id v7mr2804084pbr.341.1306249057052;
	Tue, 24 May 2011 07:57:37 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n3sm2177460pbh.16.2011.05.24.07.57.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 07:57:34 -0700 (PDT)
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
	<1306246595.3424.932.camel@rex>
In-Reply-To: <1306246595.3424.932.camel@rex>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <8C6B221F-0EDD-447B-B0F4-A3568281AAE8@gmail.com>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2011 07:58:04 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] bitbake.conf: make OVERRIDES match what people expect
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
X-List-Received-Date: Tue, 24 May 2011 15:00:40 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On May 24, 2011, at 7:16 AM, Richard Purdie <richard.purdie@linuxfoundatio=
n.org> wrote:

> On Tue, 2011-05-24 at 16:04 +0200, Koen Kooi wrote:
>> In the current situation TARGET_ARCH will override MACHINE, which is co=
unter intuitive since the machine is more specific than the arch.
>>=20
>> The order is now pn-$PN} -> arch -> machine -> distro as the machine is=
 a set of defaults and the distro is the ultimate policy.
>>=20
>> 'failfast' has been removed since it's not used anymore, just like 'loc=
al'
>=20
> I've been thinking through the different use cases and briefly talked
> with Koen offlist about this. I think the revised order makes sense with
> what users would expect and am happy to remove local and fail-fast as
> overrides since we don't have people using them (local is pretty
> weak/useless and fail-fast has only ever been used by gcc recipes
> afaik).
>=20

Local is useful when one has to override a hard assignment say from distro=
.conf
In local.conf AFAIR it did not worm without local override

> Its a potentially disruptive change but one I do think we need to make.
> We don't have many double/stacked overrides so there shouldn't be much
> impact to existing metadata.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>> ---
>> meta/conf/bitbake.conf |   12 ++++++------
>> 1 files changed, 6 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index a0af672..59238b8 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -602,15 +602,15 @@ AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
>> #=20
>> # This means that an envionment variable named '<foo>_arm' overrides an
>> # environment variable '<foo>' (when ${TARGET_ARCH} is arm).
>> -# An environment variable '<foo>_ramses' overrides '<foo>' but doesn't=
 override
>> -# '<foo>_arm' when ${MACHINE} is 'ramses'.=20
>> -# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses=
' will override=20
>> -# '<foo>_arm' and then '<foo>' will be overriden with that value from =
'<foo>_arm'.
>> -# And finally '<foo>_local' overrides any standard variable, but with =
lowest priority.
>> +# An environment variable '<foo>_qemuarm' overrides '<foo>' and overri=
des
>> +# '<foo>_arm' when ${MACHINE} is 'qemuarm'.=20
>> +# If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_a=
rm' will override=20
>> +# '<foo>_qemuarm' and then '<foo>' will be overriden with that value f=
rom '<foo>_qemuarm'.
>> +# And finally '<foo>_forcevariable' overrides any standard variable, w=
ith the highest priority.
>> #
>> # This works for  functions as well, they are really just environment v=
ariables.
>> # Default OVERRIDES to make compilation fail fast in case of build syst=
em misconfiguration.
>> -OVERRIDES =3D "local:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${TARGET_O=
S}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
>> +OVERRIDES =3D "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:=
${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>> DISTROOVERRIDES ?=3D "${DISTRO}"
>> MACHINEOVERRIDES ?=3D "${MACHINE}"
>>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


