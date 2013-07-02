Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 04AF66A642
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 23:53:09 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id eb20so6208448lab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 16:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=OiV/M6PMXML3N8JpbKfnD8jMJITuOviv1FYKgs7de6w=;
	b=CDqRHUCbnYa/PzD2yxZammnWVLjdoh3F6wgWmBNGNL0GCGiIS5jzmvZNBcsmHy02le
	1v6GpK0p1e1DEbb5Er5ZX8fGqzY2yl1h8+f0jbn4Jbiv+anLqcoQKDHoXjnSAfXGIFbm
	mOJ+hY6AXP4v0eLntLBX8+6SrqHZHfJrwBKtkyn0YvLXSUr9930WQVXrGQOtHq7jP0Wy
	nRmE6yjc6/UxcH4+3n+zyHoIQViX4SZrMBHAygpHKPdbqXPnzjhZFL03Ktz07pX4NXmk
	8OSMDG1drpqICIVbkufVTkg4JdEpjQEyqH7NIWkrFHK34OSryOonukYIcFlJHFIXyXD8
	VbiQ==
X-Received: by 10.112.143.162 with SMTP id sf2mr96982lbb.1.1372809190003; Tue,
	02 Jul 2013 16:53:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.3.5 with HTTP; Tue, 2 Jul 2013 16:52:49 -0700 (PDT)
In-Reply-To: <51D363F4.3020103@linux.intel.com>
References: <1372248906-2554-1-git-send-email-kirgene@gmail.com>
	<51D363F4.3020103@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 2 Jul 2013 16:52:49 -0700
X-Google-Sender-Auth: DK4rlP2oPQ1moBHfO7PWfD9INhU
Message-ID: <CABcZANncqRZqdEvFCm7NsMcKEh=Cz=hgFpLNx3Bg1voPo22L1w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Yevhen Kyriukha <kirgene@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 02 Jul 2013 23:53:10 -0000
Content-Type: multipart/alternative; boundary=089e011830381d5aa704e0900caa

--089e011830381d5aa704e0900caa
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 2, 2013 at 4:36 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/26/2013 05:15 AM, Yevhen Kyriukha wrote:
>
>> ---
>>   meta/recipes-core/systemd/syst**emd_204.bb <http://systemd_204.bb> |
>> 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/sy**stemd_204.bb<http://systemd_204.bb>b/meta/recipes-core/systemd/
>> sy**stemd_204.bb <http://systemd_204.bb>
>> index b8b1290..a12c6c9 100644
>> --- a/meta/recipes-core/systemd/sy**stemd_204.bb <http://systemd_204.bb>
>> +++ b/meta/recipes-core/systemd/sy**stemd_204.bb <http://systemd_204.bb>
>> @@ -13,9 +13,15 @@ PE = "1"
>>   DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native
>> gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native
>> util-linux"
>>   DEPENDS += "${@base_contains('DISTRO_**FEATURES', 'pam', 'libpam', '',
>> d)}"
>>
>> +# need to export these variables for python-config to work
>> +export BUILD_SYS
>> +export HOST_SYS
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>> +
>>   SECTION = "base/shell"
>>
>> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
>> update-alternatives qemu
>> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
>> update-alternatives qemu pythonnative python-dir
>>
>>
> There is still a problem with that, that systemd will no bring in python
> native unconditionally even if the PACKAGECONFIG is disabled, we will need
> a way to wrap the inherit some how using variables.
>

One possibility might be to split out the python support into a separate
recipe, if you can point it at bits in the sysroot from the main recipe.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e011830381d5aa704e0900caa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jul 2, 2013 at 4:36 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</=
span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 06/26/2013 05:15 AM, Ye=
vhen Kyriukha wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
---<br>
=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=
=3D"_blank">syst<u></u>emd_204.bb</a> | =C2=A0 20 ++++++++++++++++----<br>
=C2=A0 1 file changed, 16 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" ta=
rget=3D"_blank">sy<u></u>stemd_204.bb</a> b/meta/recipes-core/systemd/<a hr=
ef=3D"http://systemd_204.bb" target=3D"_blank">sy<u></u>stemd_204.bb</a><br=
>
index b8b1290..a12c6c9 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">sy<u></u>stemd_204.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">sy<u></u>stemd_204.bb</a><br>
@@ -13,9 +13,15 @@ PE =3D &quot;1&quot;<br>
=C2=A0 DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native g=
perf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-li=
nux&quot;<br>
=C2=A0 DEPENDS +=3D &quot;${@base_contains(&#39;DISTRO_<u></u>FEATURES&#39;=
, &#39;pam&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
<br>
+# need to export these variables for python-config to work<br>
+export BUILD_SYS<br>
+export HOST_SYS<br>
+export STAGING_INCDIR<br>
+export STAGING_LIBDIR<br>
+<br>
=C2=A0 SECTION =3D &quot;base/shell&quot;<br>
<br>
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-=
alternatives qemu<br>
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-=
alternatives qemu pythonnative python-dir<br>
<br>
</blockquote>
<br></div>
There is still a problem with that, that systemd will no bring in python na=
tive unconditionally even if the PACKAGECONFIG is disabled, we will need a =
way to wrap the inherit some how using variables.<br></blockquote><div>

<br></div><div style>One possibility might be to split out the python suppo=
rt into a separate recipe, if you can point it at bits in the sysroot from =
the main recipe.</div></div>-- <br>Christopher Larson<br>clarson at kergoth=
 dot com<br>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--089e011830381d5aa704e0900caa--
