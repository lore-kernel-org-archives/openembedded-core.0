Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1B46971042
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 10:51:35 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h3so3937038igd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 03:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=0dKRtBXW3rkQNKtGVMqVmqWZ8iujfuUVgVg5TA456uI=;
	b=JxUZoLAagGVSFiyS2iA2hUn33o5nEwK0+VCYld6fRXnoEsJfw8h+ff0am4ndOX2ddC
	8uMwjPsC6OfBiDdfvjAseGE/ngtkm/8S9RS3smGSEXJOze7j5vRJEoO8YUETaqMHqs5k
	v2BqF8TdeAVTaWDlYhE5G3bPLvxVmghX+ZleYvm/kJyB0WIb1h39QhELTq4IyfFt+EiN
	9exwmT1wiSYUspDiNI6MTgbGZJe1n2zFDSkE10d+1EDx4YT5lIGqF4YIbKpMEagbqFvp
	oEExhUySl0qOippNBKPDnZ52PhYX3Hq8KMQUfYTsCY6NYxKztlIkn6lGqVhxUUaR6Pa5
	UuLQ==
MIME-Version: 1.0
X-Received: by 10.50.33.73 with SMTP id p9mr14451757igi.24.1408963896411; Mon,
	25 Aug 2014 03:51:36 -0700 (PDT)
Received: by 10.107.35.133 with HTTP; Mon, 25 Aug 2014 03:51:36 -0700 (PDT)
In-Reply-To: <20140825101437.GP20524@jama>
References: <1408953391-25759-1-git-send-email-sven.ebenfeld@gmail.com>
	<20140825101437.GP20524@jama>
Date: Mon, 25 Aug 2014 12:51:36 +0200
Message-ID: <CAD0=qkK6b35LFkFx9+9Z847B+aFRrDTJh4GMfH+EfyhAbwyeUQ@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] md5deep: Add Recipe for md5deep package version 4.4
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
X-List-Received-Date: Mon, 25 Aug 2014 10:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thank you, I've posted an updated patch to openembedded-devel mailing list.

2014-08-25 12:14 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Aug 25, 2014 at 09:56:31AM +0200, Sven Ebenfeld wrote:
>> I need to build hashdeep/md5deep within OE to include it in my images. T=
his recipe enables OE to cross-compile md5deep. I needed to add the patch a=
s do_configure_qa is complaining about cross-compilation errors otherwise. =
I added a pull request for the issue with the variable expansion to hashdee=
p as well.
>
> Please send this to openembedded-devel@lists.openembedded.org
>
>
>> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
>> ---
>>  .../md5deep/files/wrong-variable-expansion.patch   | 39 +++++++++++++++=
+++++++
>>  meta-oe/recipes-extended/md5deep/md5deep_4.4.bb    | 16 +++++++++
>>  2 files changed, 55 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/md5deep/files/wrong-variabl=
e-expansion.patch
>>  create mode 100644 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
>>
>> diff --git a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expan=
sion.patch b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansio=
n.patch
>> new file mode 100644
>> index 0000000..3a4c4f4
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.pa=
tch
>> @@ -0,0 +1,39 @@
>> +--- a/configure.ac   2014-08-22 12:22:54.290884351 +0200
>> ++++ b/configure.ac   2014-08-22 12:23:15.822306295 +0200
>> +@@ -42,18 +42,6 @@
>> +      ;;
>> + esac
>> +
>> +-
>> +-# Bring additional directories where things might be found into our
>> +-# search path. I don't know why autoconf doesn't do this by default
>> +-if test x"${mingw}" =3D=3D "xno" ; then
>> +-  for spfx in /usr/local /opt/local /sw ; do
>> +-    echo checking ${spfx}/include
>> +-    if test -d ${spfx}/include; then
>> +-        CPPFLAGS=3D"-I${spfx}/include $CPPFLAGS"
>> +-        LDFLAGS=3D"-L${spfx}/lib $LDFLAGS"
>> +-    fi
>> +-  done
>> +-fi
>> + #
>> + #
>> + ################################################################
>> +@@ -71,7 +59,7 @@
>> +
>> + if test $mingw =3D "no" ; then
>> +   # add the warnings we don't want to do on mingw
>> +-  $WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -W=
effc++"
>> ++  WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -We=
ffc++"
>> + fi
>> +
>> + for option in $WARNINGS_TO_TEST
>> +@@ -105,7 +93,7 @@
>> +
>> + if test $mingw =3D "no" ; then
>> +   # add the warnings we don't want to do on mingw
>> +-  $WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST  -Weffc++"
>> ++  WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST  -Weffc++"
>> + fi
>> +
>> + for option in $WARNINGS_TO_TEST
>> diff --git a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb b/meta-oe/r=
ecipes-extended/md5deep/md5deep_4.4.bb
>> new file mode 100644
>> index 0000000..4e4a2f5
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION =3D "md5deep"
>
> Please use better description than just PN (and use SUMMARY if it's
> still short).
>
>> +AUTHOR =3D "Jesse Kornblum, Simson L. Garfinkel"
>> +HOMEPAGE =3D "http://md5deep.sourceforge.net"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9190f660105b9a56cdb272309bfd=
5491"
>> +
>> +inherit autotools
>> +
>> +SRC_URI =3D "git://github.com/jessek/hashdeep.git \
>> +        file://wrong-variable-expansion.patch \
>> +        "
>> +
>> +# Release 4.4
>> +SRCREV =3D "cd2ed7416685a5e83eb10bb659d6e9bec01244ae"
>> +
>> +S =3D "${WORKDIR}/git"
>> --
>> 1.8.1.rc3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

