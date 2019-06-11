Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 288107D084
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 03:04:37 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 904FE1C0266;
	Tue, 11 Jun 2019 15:04:37 +1200 (NZST)
To: Kang Kai <Kai.Kang@windriver.com>, openembedded-core@lists.openembedded.org
References: <20190611015756.19184-1-douglas.royds@taitradio.com>
	<73faa614-2438-4e1c-1cf9-d40fa5a60d52@windriver.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <4e14116b-84ac-6138-33ca-4e01a311f866@taitradio.com>
Date: Tue, 11 Jun 2019 15:04:37 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <73faa614-2438-4e1c-1cf9-d40fa5a60d52@windriver.com>
Subject: Re: [PATCH] json-c: update to current upstream head, with --disable-werror
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
X-List-Received-Date: Tue, 11 Jun 2019 03:04:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 11/06/19 2:46 PM, Kang Kai wrote:

> On 2019/6/11 =E4=B8=8A=E5=8D=889:57, Douglas Royds via Openembedded-cor=
e wrote:
>> Upstream json-c haven't made a release since March 2018.
>> Adopt the current HEAD revision, pulling it directly from git.
>>
>> icecc preprocesses source files locally before shipping them off to=20
>> be compiled
>> on remote hosts. This preprocessing removes comments, including /*=20
>> fallthough */
>> comments in switch statements that normally prevent an=20
>> implicit-fallthrough
>> warning, see https://github.com/icecc/icecream/issues/419
>>
>> Rather than turning off -Werror by patching configure.ac, the=20
>> upstream project
>> has implemented a configure option, --disable-werror, in response to=20
>> Ross's
>> https://github.com/json-c/json-c/issues/489
>>
>> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
>> ---
>> =C2=A0 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 30 ------------=
-------
>> =C2=A0 meta/recipes-devtools/json-c/json-c_git.bb=C2=A0=C2=A0=C2=A0 | =
19 ++++++++++++
>
> Use option '-M' of git format-patch may make the patch more clear. And=20
> why not just backport the 'disable-werror' commit?


Re '-M': True, fair point.

Re the backport: There hasn't been a release in over a year, they don't=20
seem to have any plans to do so (see=20
https://github.com/json-c/json-c/issues/487), and this was easier. If=20
you have a substantial objection, yes, I could submit it again with a=20
patch instead of the update.


>
> Regards,
> Kai
>
>
>> =C2=A0 2 files changed, 19 insertions(+), 30 deletions(-)
>> =C2=A0 delete mode 100644 meta/recipes-devtools/json-c/json-c_0.13.1.b=
b
>> =C2=A0 create mode 100644 meta/recipes-devtools/json-c/json-c_git.bb
>>
>> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb=20
>> b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>> deleted file mode 100644
>> index 5b10e68297..0000000000
>> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -SUMMARY =3D "C bindings for apps which will manipulate JSON data"
>> -DESCRIPTION =3D "JSON-C implements a reference counting object model=20
>> that allows you to easily construct JSON objects in C."
>> -HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee216f2"
>> -
>> -SRC_URI =3D=20
>> "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
>> -SRC_URI[md5sum] =3D "04969ad59cc37bddd83741a08b98f350"
>> -SRC_URI[sha256sum] =3D=20
>> "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
>> -
>> -UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+).tar"
>> -# json-c releases page is fetching the list of releases in some=20
>> weird XML format
>> -# from https://s3.amazonaws.com/json-c_releases and processes it=20
>> with javascript :-/
>> -#UPSTREAM_CHECK_URI =3D=20
>> "https://s3.amazonaws.com/json-c_releases/releases/index.html"
>> -RECIPE_UPSTREAM_VERSION =3D "0.13.1"
>> -RECIPE_UPSTREAM_DATE =3D "Mar 04, 2018"
>> -CHECK_DATE =3D "May 02, 2018"
>> -
>> -RPROVIDES_${PN} =3D "libjson"
>> -
>> -inherit autotools
>> -
>> -EXTRA_OECONF =3D "--enable-rdrand"
>> -
>> -do_configure_prepend() {
>> -=C2=A0=C2=A0=C2=A0 # Clean up autoconf cruft that should not be in th=
e tarball
>> -=C2=A0=C2=A0=C2=A0 rm -f ${S}/config.status
>> -}
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta/recipes-devtools/json-c/json-c_git.bb=20
>> b/meta/recipes-devtools/json-c/json-c_git.bb
>> new file mode 100644
>> index 0000000000..07daa5ba11
>> --- /dev/null
>> +++ b/meta/recipes-devtools/json-c/json-c_git.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY =3D "C bindings for apps which will manipulate JSON data"
>> +DESCRIPTION =3D "JSON-C implements a reference counting object model=20
>> that allows you to easily construct JSON objects in C."
>> +HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee216f2"
>> +
>> +SRC_URI =3D "git://github.com/json-c/json-c.git"
>> +SRCREV =3D "07ea04e65193c3e5c902c5b79421d5fa48ff67c7"
>> +S =3D "${WORKDIR}/git"
>> +
>> +RPROVIDES_${PN} =3D "libjson"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF =3D "--disable-werror \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 --enable-rdrand \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>
>


