Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.6131.1587573727289704722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 09:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NiYxkGtW;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id d16so2000596edv.8
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=klsAlI5Pb8G1drcRLJCm5e3IErCt0KewPsrPtWJbOiY=;
        b=NiYxkGtWWLN5qKsYVcvIQYQm+REgW8CbHNifoslz5c/6fdCZigJKgXafgpwKzewQN0
         k+cX9H4VFIrFV4geCYtLOwFGJ3LcU2v2UrTVrLMCG1vLiDKgAaNU8Wp2IuC0/mJvj2Wc
         RZL3nN+ISdgngAUvfM8lQLWkPIOcz6SBRbdVlaW7bQ1dsGYxNsu9FP0/XfweZUrVFRYy
         61WAMI6uFaTf9c7cTizRSWVPRNzPPL/ElMR3cIdyDZ5v6EltWZX7rkbhMrvvtUNLyDVD
         ObBpcJe9IYFJuV/FECI0r1cFtKIGn5Qp+5cPoKfjYhztL3M45J9g3+P6uUXKfc4vDHTn
         cM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=klsAlI5Pb8G1drcRLJCm5e3IErCt0KewPsrPtWJbOiY=;
        b=b+SCrzUkXzwsAQEwa8Y7XGM/uVHEE8mEU2N6y/nSqYF9htdvyZWxWFMFxNjhb4Cmui
         hE8LPutCtG8/VnH+8Xq+IxvTzGmWZToY3YFafnCKOWyUjTu2oE9diKEO9VP/7U1PIF8Y
         ZhtK8HbMei1L+AhG7p1pVDUqeLMmn1I0E+O3VAWHQgbQsdjtZof1o4B1ZYjIN/IriYeS
         fB8F0QQD5FW/gbko6grU24ZLpbn1e1SgwkzJwoXjybyyWak27TKXEeAM9189NwszNKJg
         qL8UC8HNzCCnarxXnJfE5U5X2ckUnROOFmjPlyXr5S0c7WVtPjLN7EsAD1Gen5NOOprW
         Ssfg==
X-Gm-Message-State: AGi0PuZvrRlf1QrUvP4oXZhr7WwFe55aRj75cKgjFMDV0tAGsjbK/l/l
	48Oq17Qcc7P5wm5MQ/CnDLs4aa9NZ/+6b4va41o=
X-Google-Smtp-Source: APiQypIfP7ViAwncteo/OIaNF7nRLNfThtbDsDoLG7h8F/QewgKoaMwJkT4qgzPqy56wrx/J/EYNyLg/HwGWEkwLMg4=
X-Received: by 2002:aa7:c714:: with SMTP id i20mr20896742edq.230.1587573725816;
 Wed, 22 Apr 2020 09:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200422143824.2634423-1-Martin.Jansa@gmail.com> <20200422163653.GJ11927@denix.org>
In-Reply-To: <20200422163653.GJ11927@denix.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 22 Apr 2020 18:41:54 +0200
Message-ID: <CA+chaQfH2gHzCqs57fDEoNwi7N+HSccLqUaCOvfK9n-yGXRjvw@mail.gmail.com>
Subject: Re: [OE-core] [zeus][PATCH] qemu: Replace stime() API with clock_settime
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000fb6acf05a3e3cf25"

--000000000000fb6acf05a3e3cf25
Content-Type: text/plain; charset="UTF-8"

qemu-native in more recent host distributions needs it, because it uses
glibc from host, not glibc from zeus (and it fails with uninative as well).

I'm seeing this issue with Ubuntu 20.04 and someone reported the same
with Opensuse Tumbleweed in:
https://stackoverflow.com/questions/61367173/core-image-minimal-fails

On Wed, Apr 22, 2020 at 6:37 PM Denys Dmytriyenko <denis@denix.org> wrote:

> Why? glibc on zeus doesn't need it.
>
>
> On Wed, Apr 22, 2020 at 04:38:24PM +0200, Martin Jansa wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |  1 +
> >  ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> > index f451017f6d..ad4ff52892 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -27,6 +27,7 @@ SRC_URI = "
> https://download.qemu.org/${BPN}-${PV}.tar.xz \
> >
>  file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
> >             file://0009-Fix-webkitgtk-builds.patch \
> >
>  file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
> > +           file://0011-linux-user-remove-host-stime-syscall.patch \
> >             file://CVE-2019-15890.patch \
> >             file://CVE-2019-12068.patch \
> >             file://CVE-2020-1711.patch \
> > diff --git
> a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> > new file mode 100644
> > index 0000000000..659e6be45d
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> > @@ -0,0 +1,61 @@
> > +From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 2001
> > +From: Laurent Vivier <laurent@vivier.eu>
> > +Date: Tue, 12 Nov 2019 15:25:56 +0100
> > +Subject: [PATCH] linux-user: remove host stime() syscall
> > +
> > +stime() has been withdrawn from glibc
> > +(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
> > +
> > +Implement the target stime() syscall using host
> > +clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
> > +
> > +Tested qemu-ppc/x86_64 with:
> > +
> > +     #include <time.h>
> > +     #include <stdio.h>
> > +
> > +     int main(void)
> > +     {
> > +             time_t t;
> > +             int ret;
> > +
> > +             /* date -u -d"2019-11-12T15:11:00" "+%s" */
> > +             t = 1573571460;
> > +             ret = stime(&t);
> > +             printf("ret %d\n", ret);
> > +             return 0;
> > +     }
> > +
> > +        # date; ./stime; date
> > +        Tue Nov 12 14:18:32 UTC 2019
> > +        ret 0
> > +        Tue Nov 12 15:11:00 UTC 2019
> > +
> > +Upstream-Status: Backport [
> https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f
> ]
> > +Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
> > +Reported-by: Cole Robinson <crobinso@redhat.com>
> > +Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > +Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > +Message-Id: <20191112142556.6335-1-laurent@vivier.eu>
> > +---
> > + linux-user/syscall.c | 8 +++++---
> > + 1 file changed, 5 insertions(+), 3 deletions(-)
> > +
> > +--- a/linux-user/syscall.c
> > ++++ b/linux-user/syscall.c
> > +@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
> > + #ifdef TARGET_NR_stime /* not on alpha */
> > +     case TARGET_NR_stime:
> > +         {
> > +-            time_t host_time;
> > +-            if (get_user_sal(host_time, arg1))
> > ++            struct timespec ts;
> > ++            ts.tv_nsec = 0;
> > ++            if (get_user_sal(ts.tv_sec, arg1)) {
> > +                 return -TARGET_EFAULT;
> > +-            return get_errno(stime(&host_time));
> > ++            }
> > ++            return get_errno(clock_settime(CLOCK_REALTIME, &ts));
> > +         }
> > + #endif
> > + #ifdef TARGET_NR_alarm /* not on alpha */
> > --
> > 2.25.1
> >
>
> > 
>
>

--000000000000fb6acf05a3e3cf25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">qemu-native in more recent host distributions needs it, be=
cause it uses glibc from host, not glibc from zeus (and it fails with unina=
tive as well).<div><br></div><div>I&#39;m seeing this issue with Ubuntu 20.=
04 and someone reported the same with=C2=A0Opensuse Tumbleweed in:=C2=A0<a =
href=3D"https://stackoverflow.com/questions/61367173/core-image-minimal-fai=
ls">https://stackoverflow.com/questions/61367173/core-image-minimal-fails</=
a></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Apr 22, 2020 at 6:37 PM Denys Dmytriyenko &lt;<a href=3D"ma=
ilto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Why? glibc on zeus doesn&#39;t need it=
.<br>
<br>
<br>
On Wed, Apr 22, 2020 at 04:38:24PM +0200, Martin Jansa wrote:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 ...linux-user-remove-host-stime-syscall.patch | 61 ++++++++++++=
+++++++<br>
&gt;=C2=A0 2 files changed, 62 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-u=
ser-remove-host-stime-syscall.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devto=
ols/qemu/qemu.inc<br>
&gt; index f451017f6d..ad4ff52892 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; @@ -27,6 +27,7 @@ SRC_URI =3D &quot;<a href=3D"https://download.qemu.=
org/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://download.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-linux-user=
-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-Fix-webkit=
gtk-builds.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-configure-=
Add-pkg-config-handling-for-libgcrypt.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-linux-user-remo=
ve-host-stime-syscall.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-15890.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-12068.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-1711.p=
atch \<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-h=
ost-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-r=
emove-host-stime-syscall.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..659e6be45d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-sti=
me-syscall.patch<br>
&gt; @@ -0,0 +1,61 @@<br>
&gt; +From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=
=
=3D"_blank">laurent@vivier.eu</a>&gt;<br>
&gt; +Date: Tue, 12 Nov 2019 15:25:56 +0100<br>
&gt; +Subject: [PATCH] linux-user: remove host stime() syscall<br>
&gt; +<br>
&gt; +stime() has been withdrawn from glibc<br>
&gt; +(12cbde1dae6f &quot;Use clock_settime to implement stime; withdraw s=
time.&quot;)<br>
&gt; +<br>
&gt; +Implement the target stime() syscall using host<br>
&gt; +clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc=
.<br>
&gt; +<br>
&gt; +Tested qemu-ppc/x86_64 with:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#include &lt;time.h&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int main(void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time_t t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* date -u -d&quot;2=
019-11-12T15:11:00&quot; &quot;+%s&quot; */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D 1573571460;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D stime(&amp;t=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;ret %d\=
n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # date; ./stime; date<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Tue Nov 12 14:18:32 UTC 2019<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Tue Nov 12 15:11:00 UTC 2019<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.qemu.org/?p=3Dqemu=
.git;a=3Dcommit;h=3D0f1f2d4596aee037d3ccbcf10592466daa54107f" rel=3D"norefe=
rrer" target=3D"_blank">https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D0=
f1f2d4596aee037d3ccbcf10592466daa54107f</a>]<br>
&gt; +Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1852115" re=
l=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/185=
2115</a><br>
&gt; +Reported-by: Cole Robinson &lt;<a href=3D"mailto:crobinso@redhat.com=
" target=3D"_blank">crobinso@redhat.com</a>&gt;<br>
&gt; +Signed-off-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.e=
u" target=3D"_blank">laurent@vivier.eu</a>&gt;<br>
&gt; +Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; +Message-Id: &lt;<a href=3D"mailto:20191112142556.6335-1-laurent@vivi=
er.eu" target=3D"_blank">20191112142556.6335-1-laurent@vivier.eu</a>&gt;<br=
>
&gt; +---<br>
&gt; + linux-user/syscall.c | 8 +++++---<br>
&gt; + 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +--- a/linux-user/syscall.c<br>
&gt; ++++ b/linux-user/syscall.c<br>
&gt; +@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en<br>
&gt; + #ifdef TARGET_NR_stime /* not on alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case TARGET_NR_stime:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time_t host_time;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_user_sal(host_tim=
e, arg1))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec ts;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_user_sal(ts.tv_se=
c, arg1)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 -TARGET_EFAULT;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return get_errno(stime(&a=
mp;host_time));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return get_errno(clock_se=
ttime(CLOCK_REALTIME, &amp;ts));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + #endif<br>
&gt; + #ifdef TARGET_NR_alarm /* not on alpha */<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000fb6acf05a3e3cf25--
