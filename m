Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB45609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 22:13:57 +0000 (UTC)
Received: by qkdn188 with SMTP id n188so14490650qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 15:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WaUBmcD7kkPgvc7qcqbfsdegmhPs2EOFRA4S4r9RrgE=;
	b=aiQB2aN72oj/Jwbcl+5FyKHqtS++Gyr+oivrTG1E2z3RwKM5ksIoe8BduUBz+VJmeu
	6V1wFEOkoA+DBzCV12B0UKHSheqz9z/cbpEOOpoWHyJpGVP9Tp74zgbZQ3yEqbAqyWy4
	11TSZ3ZDJGfEueY9j/XWsELIZ/4EhdC2PGLDMEPu+7QcbqkMLfDiNQ3g17kPKd4iCcUc
	87Cn5Co4rRaJLOp9BPi/nUd4paFHwSLfBDSJYvSWzwDmwDah+wNAR0AB2cqFy0i3u0uv
	qtvs15jmW9rtQlPqhbxwt13xX6oH8U58J6krVrCTWo4o0awGBBv8tSizbJRMV7naI3d1
	C/gw==
X-Received: by 10.140.19.48 with SMTP id 45mr27076379qgg.56.1432764838473;
	Wed, 27 May 2015 15:13:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.117 with HTTP; Wed, 27 May 2015 15:13:37 -0700 (PDT)
In-Reply-To: <55663691.30806@linux.intel.com>
References: <cover.1432706896.git.Qi.Chen@windriver.com>
	<061547e2e995fd41cd68e5f3d00f94389dd92bd1.1432706896.git.Qi.Chen@windriver.com>
	<CABcZANnA4C2Y4VG4qrgEzJrU2L4e=KVt_KS0PK6DnNh+gkEkvQ@mail.gmail.com>
	<55663691.30806@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 27 May 2015 15:13:37 -0700
X-Google-Sender-Auth: i9B2a5wDshCVTvulW_-xqx0MiGA
Message-ID: <CABcZANm=0NjHSeHZ2EJ0aGYzf+sAa1mZxOL4fB+W4f4Tzu2rnA@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 27 May 2015 22:14:03 -0000
Content-Type: multipart/alternative; boundary=001a11352a6a3e769d0517178fc0

--001a11352a6a3e769d0517178fc0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2015 at 2:26 PM, Randy Witt <randy.e.witt@linux.intel.com>
wrote:

> On 05/27/2015 11:54 AM, Christopher Larson wrote:
>
>> On Tue, May 26, 2015 at 11:09 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>>  If we do `bitbake buildtools-tarball' and then after one day do `bitbak=
e
>>> core-image-minimal -c populate_sdk_ext', we would meet errors like belo=
w.
>>>
>>> | install: cannot stat
>>> '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
>>>
>>>
>>> poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-stan=
dalone
>>> -1.8+snapshot-20150429.sh': No such file or directory
>>>
>>> The problem is that the output name for buildtools-tarball has ${DATE} =
in
>>> it.
>>> So if populate_sdk_ext task is executed but buildtools-tarball is not
>>> rebuilt,
>>> the above error appears.
>>>
>>> Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in th=
e
>>> install_tools() function, we should find the latest buildtools-tarball
>>> based
>>> on the modification time and install it.
>>>
>>> [YOCTO #7674]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>
>>>
>> Hmm, if buildtools-tarball is required, why not just pull it in via
>> dependencies and build a current one, rather than assuming/forcing the
>> user
>> to have done so themselves?
>>
>
> It is a dependency and will be built if it hasn't been built. But since
>
> TOOLCHAIN_OUTPUTNAME ?=3D
> "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
>
> in buildtools-tarball.bb the filename will be different each time we try
> to copy it, unless we force buildtools-tarball to be rebuilt each time th=
e
> sdk is constructed.
>
> ${DATE} being used in DISTRO_VERSION is misleading in my opinion because
> different dates don't necessarily mean different contents. So we could
> change DISTRO_VERSION to not use date, or buildtools-tarball.bb to not
> use DISTRO_VERSION.


I expect it=E2=80=99d be good if in this case DATE wasn=E2=80=99t whitelist=
ed, so recipes
which use a DISTRO_VERSION which includes a date get rebuilt for a new day,
and if you don=E2=80=99t want that, you can remove DATE from DISTRO_VERSION=
.

Actually, it=E2=80=99d be interesting to try to rig some form of auto-incre=
menting
distro version based on distro metadata checksum changes or something.. Hmm=
.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11352a6a3e769d0517178fc0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 27, 2015 at 2:26 PM, Randy Witt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On 05/27/2015 11:54 AM, Christopher Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tue, May 26, 2015 at 11:09 PM, Chen Qi &lt;<a href=3D"mailto:Qi.Chen@win=
driver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
If we do `bitbake buildtools-tarball&#39; and then after one day do `bitbak=
e<br>
core-image-minimal -c populate_sdk_ext&#39;, we would meet errors like belo=
w.<br>
<br>
| install: cannot stat<br>
&#39;/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/<br>
<br>
poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalo=
ne<br>
-1.8+snapshot-20150429.sh&#39;: No such file or directory<br>
<br>
The problem is that the output name for buildtools-tarball has ${DATE} in<b=
r>
it.<br>
So if populate_sdk_ext task is executed but buildtools-tarball is not<br>
rebuilt,<br>
the above error appears.<br>
<br>
Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in the<br=
>
install_tools() function, we should find the latest buildtools-tarball<br>
based<br>
on the modification time and install it.<br>
<br>
[YOCTO #7674]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
</blockquote>
<br>
Hmm, if buildtools-tarball is required, why not just pull it in via<br>
dependencies and build a current one, rather than assuming/forcing the user=
<br>
to have done so themselves?<br>
</blockquote>
<br></span>
It is a dependency and will be built if it hasn&#39;t been built. But since=
<br>
<br>
TOOLCHAIN_OUTPUTNAME ?=3D &quot;${SDK_NAME}-buildtools-nativesdk-standalone=
-${DISTRO_VERSION}&quot;<br>
<br>
in <a href=3D"http://buildtools-tarball.bb" target=3D"_blank">buildtools-ta=
rball.bb</a> the filename will be different each time we try to copy it, un=
less we force buildtools-tarball to be rebuilt each time the sdk is constru=
cted.<br>
<br>
${DATE} being used in DISTRO_VERSION is misleading in my opinion because di=
fferent dates don&#39;t necessarily mean different contents. So we could ch=
ange DISTRO_VERSION to not use date, or <a href=3D"http://buildtools-tarbal=
l.bb" target=3D"_blank">buildtools-tarball.bb</a> to not use DISTRO_VERSION=
.</blockquote></div><br>I expect it=E2=80=99d be good if in this case DATE =
wasn=E2=80=99t whitelisted, so recipes which use a DISTRO_VERSION which inc=
ludes a date get rebuilt for a new day, and if you don=E2=80=99t want that,=
 you can remove DATE from DISTRO_VERSION.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Actually, it=E2=80=99d be interesting t=
o try to rig some form of auto-incrementing distro version based on distro =
metadata checksum changes or something.. Hmm.<br>-- <br><div class=3D"gmail=
_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - B=
itBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software E=
ngineer, Mentor Graphics</div>
</div></div>

--001a11352a6a3e769d0517178fc0--
