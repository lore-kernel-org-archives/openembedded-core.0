Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 528316E78E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 01:20:58 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so1205459iec.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 18:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=q7jCAs3H08Vgx/Q3irqY9AW7PvIHiysKfY+SbCSZcdY=;
	b=XvyeMpJutnCpsYt2arYaqLC4ZjxVGA7yNz5FtaZQNKbgUR9HFO8ar5Vl6+IpxAcZI4
	Y3xH30XMXTSX7CzoR4jELoWHOkwmiWxrVaF5Ds3WumjQGUrQKC8NR81Svbzbq+Htt28s
	Ae37inetNe7gSIRJbHSNfC1GVgamQoZb0GCmoMOl17QP3/FSdbmphnqZKjOvbx+U7e7O
	lK5sguMV8r8OSnSt0rcoS6nGSzcZEXWX7CamkyVdrMcEOzgKbWd57bg7mNSUILHGVzBF
	oB22qq02YI5rn7acYbHpgTu0N53BcvrfByti4xBgtyfP5WnyGkZXpON9DT3djIpXXJn2
	z+IA==
MIME-Version: 1.0
X-Received: by 10.43.79.66 with SMTP id zp2mr53875icb.76.1395796859436; Tue,
	25 Mar 2014 18:20:59 -0700 (PDT)
Received: by 10.50.224.136 with HTTP; Tue, 25 Mar 2014 18:20:59 -0700 (PDT)
Received: by 10.50.224.136 with HTTP; Tue, 25 Mar 2014 18:20:59 -0700 (PDT)
In-Reply-To: <53322B15.3000807@windriver.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
	<a856ac4a0c03a5374e8e2f3567a213f09f33c10b.1394948105.git.raj.khem@gmail.com>
	<53322B15.3000807@windriver.com>
Date: Tue, 25 Mar 2014 18:20:59 -0700
Message-ID: <CAMKF1sqtuqieAvjD+OAePAeC5D-OP31sRvubvGxAnWj4QYx+jw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
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
X-List-Received-Date: Wed, 26 Mar 2014 01:20:59 -0000
Content-Type: multipart/alternative; boundary=001a113322b0fc441204f578479d

--001a113322b0fc441204f578479d
Content-Type: text/plain; charset=UTF-8

whats native glibc version on build host

-Khem
On Mar 25, 2014 6:19 PM, "Robert Yang" <liezhi.yang@windriver.com> wrote:

>
> Hi Khem,
>
> I got an error on CentOS 5.10, seems caused by this patch:
>
> | /home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-
> linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:
> In function 'main':
> | /home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-
> linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151:
> error: 'MS_PRIVATE' undeclared (first use in this function)
> | /home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-
> linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151:
> error: (Each undeclared identifier is reported only once
> | /home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-
> linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151:
> error: for each function it appears in.)
> | /home/build/lyang1/testre/bitbake_build/tmp/work/x86_64-
> linux/util-linux-native/2.24.1-r0/util-linux-2.24.1/sys-utils/unshare.c:151:
> error: 'MS_REC' undeclared (first use in this function)
> | make[2]: *** [sys-utils/unshare.o] Error 1
>
> We can add the following lines to util-linux/sys-utils/unshare.c as a
> workaround:
>
> #ifndef MS_PRIVATE
> #define MS_PRIVATE      (1<<18) /* 262144 Private*/
> #endif
>
> #ifndef MS_REC
> #define MS_REC          0x4000  /* 16384: Recursive loopback */
> #endif
>
> #ifndef MS_NOSUID
> #define MS_NOSUID        2      /* Ignore suid and sgid bits */
> #endif
>
> #ifndef MS_NOEXEC
> #define MS_NOEXEC        8      /* Disallow program execution */
> #endif
>
> #ifndef MS_NODEV
> #define MS_NODEV         4      /* Disallow access to device special files
> */
> #endif
>
> Do you have any ideas, please ?
>
> // Robert
>
> On 03/16/2014 01:42 PM, Khem Raj wrote:
>
>> This patch actually makes sense for uclibc more than glibc
>> since if we did not cache scanf_cv_alloc_modifier configure
>> test will determine it correctly for glibc but the test does
>> not do proper job when uclibc is involved the reason is it
>> depends on define __GLIBC_ and uclibc unfortunately poses as
>> glibc and defines this variable.
>>
>> %m is implemented in uclibc as well and we enable it so caching value of
>> 'ms' specifier is going to work across all libcs
>>
>> This fixes mounting errors we see with util-linux/mount on
>> uclibc/systemd
>>
>> Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount:
>> /proc/self/mountinfo: parse error: ignore entry at line 21.
>> Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount:
>> /proc/self/mountinfo: parse error: ignore entry at line 22.
>> Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: can't find /
>> in /etc/fstab
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux_2.24.1.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bbb/meta/recipes-core/util-
>> linux/util-linux_2.24.1.bb
>> index b08d68d..aa98b65 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
>> @@ -17,7 +17,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch
>> \
>>   SRC_URI[md5sum] = "88d46ae23ca599ac5af9cf96b531590f"
>>   SRC_URI[sha256sum] = "835eb6232cfab0118ef2e4fd649de0
>> ba9f5bd1b8cbf9a7d4d84594541dec8410"
>>
>> -CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>> +CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
>> +
>>   EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
>>                                --disable-fallocate
>> --disable-use-tty-group \
>>   "
>>
>>

--001a113322b0fc441204f578479d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">whats native glibc version on build host</p>
<p dir=3D"ltr">-Khem</p>
<div class=3D"gmail_quote">On Mar 25, 2014 6:19 PM, &quot;Robert Yang&quot;=
 &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com=
</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Hi Khem,<br>
<br>
I got an error on CentOS 5.10, seems caused by this patch:<br>
<br>
| /home/build/lyang1/testre/<u></u>bitbake_build/tmp/work/x86_64-<u></u>lin=
ux/util-linux-native/2.24.<u></u>1-r0/util-linux-2.24.1/sys-<u></u>utils/un=
share.c: In function &#39;main&#39;:<br>
| /home/build/lyang1/testre/<u></u>bitbake_build/tmp/work/x86_64-<u></u>lin=
ux/util-linux-native/2.24.<u></u>1-r0/util-linux-2.24.1/sys-<u></u>utils/un=
share.c:151: error: &#39;MS_PRIVATE&#39; undeclared (first use in this func=
tion)<br>

| /home/build/lyang1/testre/<u></u>bitbake_build/tmp/work/x86_64-<u></u>lin=
ux/util-linux-native/2.24.<u></u>1-r0/util-linux-2.24.1/sys-<u></u>utils/un=
share.c:151: error: (Each undeclared identifier is reported only once<br>

| /home/build/lyang1/testre/<u></u>bitbake_build/tmp/work/x86_64-<u></u>lin=
ux/util-linux-native/2.24.<u></u>1-r0/util-linux-2.24.1/sys-<u></u>utils/un=
share.c:151: error: for each function it appears in.)<br>
| /home/build/lyang1/testre/<u></u>bitbake_build/tmp/work/x86_64-<u></u>lin=
ux/util-linux-native/2.24.<u></u>1-r0/util-linux-2.24.1/sys-<u></u>utils/un=
share.c:151: error: &#39;MS_REC&#39; undeclared (first use in this function=
)<br>

| make[2]: *** [sys-utils/unshare.o] Error 1<br>
<br>
We can add the following lines to util-linux/sys-utils/unshare.c as a<br>
workaround:<br>
<br>
#ifndef MS_PRIVATE<br>
#define MS_PRIVATE =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;18) /* 262144 Private*/<br=
>
#endif<br>
<br>
#ifndef MS_REC<br>
#define MS_REC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4000 =C2=A0/* 16384: Rec=
ursive loopback */<br>
#endif<br>
<br>
#ifndef MS_NOSUID<br>
#define MS_NOSUID =C2=A0 =C2=A0 =C2=A0 =C2=A02 =C2=A0 =C2=A0 =C2=A0/* Ignor=
e suid and sgid bits */<br>
#endif<br>
<br>
#ifndef MS_NOEXEC<br>
#define MS_NOEXEC =C2=A0 =C2=A0 =C2=A0 =C2=A08 =C2=A0 =C2=A0 =C2=A0/* Disal=
low program execution */<br>
#endif<br>
<br>
#ifndef MS_NODEV<br>
#define MS_NODEV =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 =C2=A0 =C2=A0 =C2=A0/* Disal=
low access to device special files */<br>
#endif<br>
<br>
Do you have any ideas, please ?<br>
<br>
// Robert<br>
<br>
On 03/16/2014 01:42 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This patch actually makes sense for uclibc more than glibc<br>
since if we did not cache scanf_cv_alloc_modifier configure<br>
test will determine it correctly for glibc but the test does<br>
not do proper job when uclibc is involved the reason is it<br>
depends on define __GLIBC_ and uclibc unfortunately poses as<br>
glibc and defines this variable.<br>
<br>
%m is implemented in uclibc as well and we enable it so caching value of<br=
>
&#39;ms&#39; specifier is going to work across all libcs<br>
<br>
This fixes mounting errors we see with util-linux/mount on<br>
uclibc/systemd<br>
<br>
Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: /proc/self/mou=
ntinfo: parse error: ignore entry at line 21.<br>
Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: /proc/self/mou=
ntinfo: parse error: ignore entry at line 22.<br>
Mar 16 01:46:40 qemux86 systemd-remount-fs[124]: /bin/mount: can&#39;t find=
 / in /etc/fstab<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.24.1.bb"=
 target=3D"_blank">u<u></u>til-linux_2.24.1.bb</a> | 3 ++-<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/util-<u></u>linux/<a href=3D"http://util-lin=
ux_2.24.1.bb" target=3D"_blank">util-linux_2.24.1.bb</a> b/meta/recipes-cor=
e/util-<u></u>linux/<a href=3D"http://util-linux_2.24.1.bb" target=3D"_blan=
k">util-linux_2.24.1.bb</a><br>

index b08d68d..aa98b65 100644<br>
--- a/meta/recipes-core/util-<u></u>linux/<a href=3D"http://util-linux_2.24=
.1.bb" target=3D"_blank">util-linux_2.24.1.bb</a><br>
+++ b/meta/recipes-core/util-<u></u>linux/<a href=3D"http://util-linux_2.24=
.1.bb" target=3D"_blank">util-linux_2.24.1.bb</a><br>
@@ -17,7 +17,8 @@ SRC_URI +=3D &quot;file://util-linux-ng-replace-<u></u>si=
ginterrupt.patch \<br>
=C2=A0 SRC_URI[md5sum] =3D &quot;<u></u>88d46ae23ca599ac5af9cf96b53159<u></=
u>0f&quot;<br>
=C2=A0 SRC_URI[sha256sum] =3D &quot;<u></u>835eb6232cfab0118ef2e4fd649de0<u=
></u>ba9f5bd1b8cbf9a7d4d84594541dec<u></u>8410&quot;<br>
<br>
-CACHED_CONFIGUREVARS +=3D &quot;scanf_cv_alloc_modifier=3Das&quot;<br>
+CACHED_CONFIGUREVARS +=3D &quot;scanf_cv_alloc_modifier=3Dms&quot;<br>
+<br>
=C2=A0 EXTRA_OECONF_class-native =3D &quot;${SHARED_EXTRA_OECONF} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-fallocate --disable-use-tty=
-group \<br>
=C2=A0 &quot;<br>
<br>
</blockquote>
</blockquote></div>

--001a113322b0fc441204f578479d--
