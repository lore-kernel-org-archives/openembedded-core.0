Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfXne-0008WC-HZ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 16:46:58 +0200
Received: by eekd49 with SMTP id d49so960245eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=hqYMBZMeLXYBfrfHndgwg4t80Z0/EQFLbVPibDAo50c=;
	b=DJGo0oTK67KZNOG9KyolbBoibNEaoCc6vWEvuZ41tkcekEFWqWv9jcbqNzn6fFQR6p
	nPdx/QRDpj08DKZF2X5b+zu6T7QFQuYyUdo8E7K/qDF9v7fLIx87QFNXCt4cOOJznzmE
	epqloi0LvOfX6JiZq4H2NPbMP7/ZEsMm/6lAR0Z/DnRUDDCKHBb77Rxx7g3/GYIEKIdv
	3JkIb1RKXaL4fFUUqrqez+qhn/hAIvAJZfoXn41Za9hYdIHckeH2bY9XIuQPlfZIjuHa
	BTTLS0/AqRrpgGZtcCm3aNlsLuc+uv6xFIZoff6pRSOjKzSlIS/qx5Jt/fdGli1cLDbO
	T2Yg==
Received: by 10.14.99.200 with SMTP id x48mr1391019eef.77.1339770980151; Fri,
	15 Jun 2012 07:36:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Fri, 15 Jun 2012 07:35:49 -0700 (PDT)
In-Reply-To: <1339764954.24333.117.camel@ted>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<c49e7e2915d4ade3dd67f706f12b3979a3b5c021.1339740433.git.raj.khem@gmail.com>
	<1339764954.24333.117.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2012 07:35:49 -0700
Message-ID: <CAMKF1sp2rkyVvE1ioArPakZz0F0TKytfZFRSt97hxPAPq1KNZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] sat-solver: Fix build on uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 14:46:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 5:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-06-14 at 23:12 -0700, Khem Raj wrote:
>> futimes is not available on uclibc so use utimes
>> qsort is also not as expected by sat-solver therefore
>> for uclibc we resort to using internal version of
>> qsort
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../sat-solver/sat-solver/futimes.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 32 ++++++++++++++++++++
>> =C2=A0meta/recipes-extended/sat-solver/sat-solver_git.bb | =C2=A0 =C2=A0=
3 ++
>> =C2=A02 files changed, 35 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-extended/sat-solver/sat-solver/fut=
imes.patch
>>
>> diff --git a/meta/recipes-extended/sat-solver/sat-solver/futimes.patch b=
/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
>> new file mode 100644
>> index 0000000..b24d852
>> --- /dev/null
>> +++ b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
>> @@ -0,0 +1,32 @@
>> +This patch uses utimes instead of futimes for uclibc
>> +since futimes is not available
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Index: git/examples/solv.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/examples/solv.c 2012-06-01 12:06:22.041552848 -0700
>> ++++ git/examples/solv.c =C2=A0 =C2=A0 =C2=A02012-06-01 12:49:17.4176774=
49 -0700
>> +@@ -1027,7 +1027,8 @@
>> + =C2=A0 int flags;
>> +
>> + =C2=A0 cinfo =3D repo->appdata;
>> +- =C2=A0if (!(fp =3D fopen(calccachepath(repo, repoext), "r")))
>> ++ =C2=A0const char* fname =3D calccachepath(repo, repoext);
>> ++ =C2=A0if (!(fp =3D fopen(fname, "r")))
>> + =C2=A0 =C2=A0 return 0;
>> + =C2=A0 if (fseek(fp, -sizeof(mycookie), SEEK_END) || fread(mycookie, s=
izeof(mycookie), 1, fp) !=3D 1)
>> + =C2=A0 =C2=A0 {
>> +@@ -1068,7 +1069,11 @@
>> + =C2=A0 =C2=A0 =C2=A0 memcpy(cinfo->extcookie, myextcookie, sizeof(myex=
tcookie));
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 if (mark)
>> ++#ifdef __UCLIBC__
>> ++ =C2=A0 =C2=A0utimes(fname, 0); =C2=A0 =C2=A0 =C2=A0 /* try to set mod=
ification time */
>> ++#else
>> + =C2=A0 =C2=A0 futimes(fileno(fp), 0); /* try to set modification time =
*/
>> ++#endif
>> + =C2=A0 fclose(fp);
>> + =C2=A0 return 1;
>> + }
>> diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/r=
ecipes-extended/sat-solver/sat-solver_git.bb
>> index b0382f6..b0daa6a 100644
>> --- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
>> +++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
>> @@ -20,6 +20,7 @@ SRC_URI =3D "git://github.com/openSUSE/sat-solver.git;=
protocol=3Dgit \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sat-solver_core.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_gcc-4.6.0_compile_i=
ssue.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-sat_xfopen.c-Forwa=
rd-port-to-zlib-1.2.6-gzFile.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://futimes.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>>
>> =C2=A0S =3D "${WORKDIR}/git"
>> @@ -28,6 +29,8 @@ EXTRA_OECMAKE +=3D "-DRPM5=3DRPM5 -DOE_CORE=3DOE_CORE"
>>
>> =C2=A0EXTRA_OECMAKE +=3D " -DLIB=3D${@os.path.basename('${libdir}')}"
>>
>> +TUNE_CCARGS_libc-uclibc_append =3D " -DUSE_OWN_QSORT=3D1 "
>> +
>
> I suspect you mean TUNE_CCARGS_append_libc-uclibc here?

indeed good catch. This was incorrect and it worked  because it overwrote
TUNE_CCARGS and I did not see it because the options I wanted
was still present and it was building.

I have updated the pull tree with this changed.

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


