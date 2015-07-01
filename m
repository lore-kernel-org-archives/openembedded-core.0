Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 07AE260017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 06:49:20 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so154374631wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 23:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=usYi80co+l4959neC0HjF2Uubr22oQXTzh8aZ/Tzzxg=;
	b=UyRG0Qg+EdbcdnbdS0PZmB4jqVFKb5Eqry+pJjiXmQXIdrmnPUj5OStNiQBDT8fPk2
	VADhWrWJSAW1LqIXpTlRQN1iOpGKn6edXmY6uwLg0RWlCJG7MEmRK7phId+rhxp7Ay4B
	NveK/Iok5gFm5VzFFsmtDMNA5LcYjkk3dpU64Y4agsKZvyAIGE4pCoKHcZiMgk+k7Ghl
	9JKi423xuJFjXgIqSIsFR9vl3TY1ZSwBlD9X/iXncPwiYYIViKasHesKR49fIhxT1SZp
	MCGoui5aAmLpVUpCzXCAX+jVwLJ5XABsLwZGvWFy/flEUfEGjfCLwBtOSrx8wP5yoc2l
	j0sw==
X-Gm-Message-State: ALoCoQmJ0FIj3haJu5zmTZ03Q90PxFh+SOVc1gqRpsYps/ZvynzhoeP7M0OILoxX7uoIQ6hhZksM
X-Received: by 10.194.216.230 with SMTP id ot6mr46611563wjc.68.1435733360517; 
	Tue, 30 Jun 2015 23:49:20 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	fb3sm20470119wib.21.2015.06.30.23.49.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jun 2015 23:49:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <55929998.8020209@herbrechtsmeier.net>
Date: Wed, 1 Jul 2015 08:49:17 +0200
Message-Id: <E41ABE09-0361-4226-A554-DD199D29B42B@dominion.thruhere.net>
References: <1435670336-17154-1-git-send-email-koen.kooi@linaro.org>
	<55929998.8020209@herbrechtsmeier.net>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
X-Mailer: Apple Mail (2.2098)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake bbclass: fix support for native builds
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
X-List-Received-Date: Wed, 01 Jul 2015 06:49:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 30 jun. 2015, om 15:28 heeft Stefan Herbrechtsmeier =
<stefan@herbrechtsmeier.net> het volgende geschreven:
>=20
> Am 30.06.2015 um 15:18 schrieb Koen Kooi:
>> For native builds  of recipes (e.g. mariadb-native) cmake *must* look =
outside of its sysroot to find the compiler, so instruct it to do so.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>  meta/classes/cmake.bbclass | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> index b0a3972..29a78e5 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -27,6 +27,9 @@ OECMAKE_RPATH ?=3D ""
>>  OECMAKE_PERLNATIVE_DIR ??=3D ""
>>  OECMAKE_EXTRA_ROOT_PATH ?=3D ""
>>  +OECMAKE_PATHS ?=3D ""
>> +OECMAKE_PATHS_class-native =3D "set( =
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )"
>> +
>>  cmake_do_generate_toolchain_file() {
>>  	cat > ${WORKDIR}/toolchain.cmake <<EOF
>>  # CMake system name must be something like "Linux".
>> @@ -67,6 +70,8 @@ list(APPEND CMAKE_MODULE_PATH =
"${STAGING_DATADIR}/cmake/Modules/")
>>  # add for non /usr/lib libdir, e.g. /usr/lib64
>>  set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
>>  +${OECMAKE_PATHS}
>> +
>>  EOF
>>  }
>> =20
> This would generate a second set of the =
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM with a different value.
>=20
> Why not add a new variable and use it in the existing set:
>=20
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "ONLY"
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D "BOTH"
>=20
> -set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
> +set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM =
${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM})

That=E2=80=99s a much better solution, v2 coming up. Thanks for the =
feedback!=

