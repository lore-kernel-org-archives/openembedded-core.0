Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web08.15948.1609379474132489296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 17:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.145] (unknown [183.129.223.42])
	by kozue.soulik.info (Postfix) with ESMTPSA id 5F21C100792;
	Thu, 31 Dec 2020 10:50:53 +0900 (JST)
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH v2 1/2] meson: don't turn sting into a list in nativesdk
From: "Randy Li" <ayaka@soulik.info>
X-Mailer: iPad Mail (16D57)
In-Reply-To: <a3c9fb86ae674b038915c02aa594abfe@XBOX03.axis.com>
Date: Thu, 31 Dec 2020 09:51:06 +0800
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Message-Id: <4E5410AB-F5F1-485F-8F42-E726264AB613@soulik.info>
References: <20201229035550.226617-1-ayaka@soulik.info> <20201229035550.226617-2-ayaka@soulik.info> <a3c9fb86ae674b038915c02aa594abfe@XBOX03.axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



On Dec 31, 2020, at 7:38 AM, Peter Kjellerstedt <peter.kjellerstedt@axis.com=
> wrote:

>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Randy Li
>> Sent: den 29 december 2020 04:56
>> To: openembedded-core@lists.openembedded.org
>> Cc: Randy Li <ayaka@soulik.info>
>> Subject: [OE-core] [PATCH v2 1/2] meson: don't turn sting into a list in
>> nativesdk
>=20
> Change "sting" to "string".
>=20
Thanks, I noted that just after I sent it, but I think maintainers or someon=
e would correct it when it is merged.
>>=20
>> In the current version of meson, some path variables only
>> accept a string not a list.
>>=20
>> Signed-off-by: Randy Li <ayaka@soulik.info>
>> ---
>> meta/recipes-devtools/meson/meson/meson-setup.py | 10 +++++++---
>> 1 file changed, 7 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py
>> b/meta/recipes-devtools/meson/meson/meson-setup.py
>> index 808e2a062f..7acfe373fa 100755
>> --- a/meta/recipes-devtools/meson/meson/meson-setup.py
>> +++ b/meta/recipes-devtools/meson/meson/meson-setup.py
>> @@ -10,9 +10,13 @@ class Template(string.Template):
>> class Environ():
>>     def __getitem__(self, name):
>>         val =3D os.environ[name]
>> -        val =3D ["'%s'" % x for x in val.split()]
>> -        val =3D ', '.join(val)
>> -        val =3D '[%s]' % val
>> +        val =3D val.split()
>> +        if len(val) > 1:
>> +            val =3D ["'%s'" % x for x in val]
>> +            val =3D ', '.join(val)
>> +            val =3D '[%s]' % val
>> +        else:
>> +            if val: val =3D "'%s'" % val.pop()
>=20
> Change to:
>=20
>        elif val:
>            val =3D "'%s'" % val.pop()
>=20
Nice catch, if this patch would merge for this version and not wait for the Q=
A case, I would suggest you appended be merged. Or I would ship them in the n=
ext version with the QA case.
>>         return val
>>=20
>> try:
>> --
>> 2.29.2
>=20
> //Peter
>=20

