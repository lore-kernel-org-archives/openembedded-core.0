Return-Path: <net147@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8B79B6065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 03:20:27 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w8so887589vbf.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 20:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lUrUb/bllK0xZLb9HhAqF9XC1BU9cpR8lyQ0OWrUhag=;
	b=jw2jLnYMkmLhhCb9qdGRJsxOqlIPQb5sMvBRyhgFAT/Lim6J6ItCIQb9LN/ioALku9
	TrOxPrxHnIzuf4oS1bbgEEa7a1MAR+ZoYIYl86REj0taN/FAy12LFzqlmb+NQguupfsX
	7+c5KZ0pwZB5tfu1LttBMRiaLglAake5UD1yYWgWiX5D3kB78rkOLG5K+EkuHbP9CXvI
	OeUuBBa3HHrvwfO+FVHPvrjtpm/DaUaroHTQu2QQvpbdd5ajcAErJuyWGwCP/ApGidvC
	V9t9/USefz6zMNbpFKfzQoXPthCsL28y7arIijyREYXjZOjhaKKvAjm9TSFrjOvScjuc
	w9Cw==
MIME-Version: 1.0
X-Received: by 10.52.171.135 with SMTP id au7mr3366638vdc.126.1369279227895;
	Wed, 22 May 2013 20:20:27 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Wed, 22 May 2013 20:20:27 -0700 (PDT)
In-Reply-To: <CAJTo0LawHFMUtJHzYGqyCzHA8sJhwC4x9xF1PwSUkZ4AB34j0Q@mail.gmail.com>
References: <1369187256-31043-1-git-send-email-net147@gmail.com>
	<CAJTo0LawHFMUtJHzYGqyCzHA8sJhwC4x9xF1PwSUkZ4AB34j0Q@mail.gmail.com>
Date: Thu, 23 May 2013 13:20:27 +1000
Message-ID: <CANwerB0S=w9+qpEpnVj==bCpKGpsi0eaakhQwGZj-B+fPXux9Q@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base-files: add /run directory from FHS 3 draft specification
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
X-List-Received-Date: Thu, 23 May 2013 03:20:27 -0000
Content-Type: multipart/alternative; boundary=089e0160cdf6fa294504dd5a2949

--089e0160cdf6fa294504dd5a2949
Content-Type: text/plain; charset=UTF-8

On 23 May 2013 02:33, Burton, Ross <ross.burton@intel.com> wrote:

> Hi Jonathan
>
> On 22 May 2013 02:47, Jonathan Liu <net147@gmail.com> wrote:
> > This adds the /run directory from the Filesystem Hierarchy Standard 3.0
> > Draft [1] and refactors the filesystem as follows:
>
> Good start!
>
> > - Remove /var/run from dbus package as it is created on startup
> > - Remove /var/volatile/run/resolvconf/interface from resolvconf package
> >   as resolvconf package uses /etc/resolvconf/run/interface
>
> Can these be separate patches, as they're essentially unrelated cleanups.
>
Ok.


> Please also drop all PR changes, they're not needed in oe-core.
>

Ok.

>
> > diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> > index becb85c..c829bec 100644
> > --- a/meta/files/fs-perms.txt
> > +++ b/meta/files/fs-perms.txt
> > @@ -45,15 +45,14 @@ ${oldincludedir}    0755    root    root    true
>  0644    root    root
> >
> >  # Items from base-files
> >  # Links
> > -${localstatedir}/run   link    volatile/run
> > +${localstatedir}/run   link    /run
> >  ${localstatedir}/log   link    volatile/log
> > -${localstatedir}/lock  link    volatile/lock
> > +${localstatedir}/lock  link    /run/lock
> >  ${localstatedir}/tmp   link    volatile/tmp
> >
> >  # Special permissions from base-files
> >  # Set 1777
> >  /tmp                           01777   root    root    false - - -
> > -${localstatedir}/volatile/lock 01777   root    root    false - - -
> >  ${localstatedir}/volatile/tmp  01777   root    root    false - - -
>
> Nothing appears to sets mode 1777 on /run/lock.  Then again Fedora
> thinks that 0755 is sufficient, although Debian uses 1777.  We should
> probably keep the permissions as 1777.
>
For sysvinit case, /run/lock is created with root:root owner and 1777
permissions by populate-volatiles.sh.
For systemd case, /run/lock is created with root:root owner and 0755
permissions by /usr/lib/tmpfiles.d/legacy.conf -
http://cgit.freedesktop.org/systemd/systemd/tree/tmpfiles.d/legacy.conf.
Presumably any system using the stock systemd legacy.conf, it would be
using 0755 permissions. This is true on Arch Linux and Fedora for example.
I would generally prefer to stick with permissions from systemd upstream.
What is your opinion on the matter?


> diff --git a/meta/recipes-core/dbus/dbus.inc
> b/meta/recipes-core/dbus/dbus.inc
> index 2be5bda..8055824 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -101,9 +101,9 @@ do_install() {
>              > ${D}${sysconfdir}/default/volatiles/99_dbus
>
>
> -       mkdir -p ${D}${localstatedir}/run/dbus
> ${D}${localstatedir}/lib/dbus
> +       mkdir -p ${D}${localstatedir}/lib/dbus
>
> Presumably dbus will create /run/dbus if required?
>
> Ross
>
/run/dbus is created automatically on boot.
For sysvinit case, it is created by populate-volatiles.sh which also sets
messagebus:messagebus owner.
For systemd case, it is created when dbus.socket (a dependency of
dbus.service) is started by systemd. dbus.socket implicitly creates it when
specifying:
[Socket]
ListenStream=/var/run/dbus/system_bus_socket

Regards,
Jonathan

--089e0160cdf6fa294504dd5a2949
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 May 2013 02:33, Burton, Ross <span dir=3D"ltr">&lt;<=
a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel=
.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Hi Jonathan<br>
<div class=3D"im"><br>
On 22 May 2013 02:47, Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">=
net147@gmail.com</a>&gt; wrote:<br>
&gt; This adds the /run directory from the Filesystem Hierarchy Standard 3.=
0<br>
&gt; Draft [1] and refactors the filesystem as follows:<br>
<br>
</div>Good start!<br>
<div class=3D"im"><br>
&gt; - Remove /var/run from dbus package as it is created on startup<br>
&gt; - Remove /var/volatile/run/resolvconf/interface from resolvconf packag=
e<br>
&gt; =C2=A0 as resolvconf package uses /etc/resolvconf/run/interface<br>
<br>
</div>Can these be separate patches, as they&#39;re essentially unrelated c=
leanups.<br></blockquote><div style>Ok.</div><div style>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-=
left:1ex">

Please also drop all PR changes, they&#39;re not needed in oe-core.<br></bl=
ockquote><div><br></div><div style>Ok.=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

<div class=3D"im"><br>
&gt; diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt<br>
&gt; index becb85c..c829bec 100644<br>
&gt; --- a/meta/files/fs-perms.txt<br>
&gt; +++ b/meta/files/fs-perms.txt<br>
&gt; @@ -45,15 +45,14 @@ ${oldincludedir} =C2=A0 =C2=A00755 =C2=A0 =C2=A0ro=
ot =C2=A0 =C2=A0root =C2=A0 =C2=A0true =C2=A0 =C2=A00644 =C2=A0 =C2=A0root =
=C2=A0 =C2=A0root<br>
&gt;<br>
&gt; =C2=A0# Items from base-files<br>
&gt; =C2=A0# Links<br>
&gt; -${localstatedir}/run =C2=A0 link =C2=A0 =C2=A0volatile/run<br>
&gt; +${localstatedir}/run =C2=A0 link =C2=A0 =C2=A0/run<br>
&gt; =C2=A0${localstatedir}/log =C2=A0 link =C2=A0 =C2=A0volatile/log<br>
&gt; -${localstatedir}/lock =C2=A0link =C2=A0 =C2=A0volatile/lock<br>
&gt; +${localstatedir}/lock =C2=A0link =C2=A0 =C2=A0/run/lock<br>
&gt; =C2=A0${localstatedir}/tmp =C2=A0 link =C2=A0 =C2=A0volatile/tmp<br>
&gt;<br>
&gt; =C2=A0# Special permissions from base-files<br>
&gt; =C2=A0# Set 1777<br>
&gt; =C2=A0/tmp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 01777 =C2=A0 root =C2=A0 =C2=A0root =C2=A0 =
=C2=A0false - - -<br>
&gt; -${localstatedir}/volatile/lock 01777 =C2=A0 root =C2=A0 =C2=A0root =
=C2=A0 =C2=A0false - - -<br>
&gt; =C2=A0${localstatedir}/volatile/tmp =C2=A001777 =C2=A0 root =C2=A0 =C2=
=A0root =C2=A0 =C2=A0false - - -<br>
<br>
</div>Nothing appears to sets mode 1777 on /run/lock. =C2=A0Then again Fedo=
ra<br>
thinks that 0755 is sufficient, although Debian uses 1777. =C2=A0We should<=
br>
probably keep the permissions as 1777.<br></blockquote><div>For sysvinit ca=
se, /run/lock is created with root:root owner and 1777 permissions by popul=
ate-volatiles.sh.</div><div>For systemd case, /run/lock is created with roo=
t:root owner and 0755 permissions by /usr/lib/tmpfiles.d/legacy.conf - <a h=
ref=3D"http://cgit.freedesktop.org/systemd/systemd/tree/tmpfiles.d/legacy.c=
onf">http://cgit.freedesktop.org/systemd/systemd/tree/tmpfiles.d/legacy.con=
f</a>. Presumably any system using the stock systemd legacy.conf, it would =
be using 0755 permissions. This is true on Arch Linux and Fedora for exampl=
e.</div>
<div>I would generally prefer to stick with permissions from systemd upstre=
am.</div><div>What is your opinion on the matter?</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex">

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.=
inc<br>
index 2be5bda..8055824 100644<br>
--- a/meta/recipes-core/dbus/dbus.inc<br>
+++ b/meta/recipes-core/dbus/dbus.inc<br>
<div class=3D"im">@@ -101,9 +101,9 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ${D}${sysconfdir}/defa=
ult/volatiles/99_dbus<br>
<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${localstatedir}/run/dbus ${D}${localst=
atedir}/lib/dbus<br>
+ =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${localstatedir}/lib/dbus<br>
<br>
</div>Presumably dbus will create /run/dbus if required?<br>
<span class=3D""><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><div class=3D"gmail_extra"><div class=3D"g=
mail_extra">/run/dbus is created automatically on boot.</div><div class=3D"=
gmail_extra">For sysvinit case, it is created by populate-volatiles.sh whic=
h also sets messagebus:messagebus owner.</div>
<div class=3D"gmail_extra">For systemd case, it is created when dbus.socket=
 (a dependency of dbus.service) is started by systemd. dbus.socket implicit=
ly creates it when specifying:</div></div></div><div class=3D"gmail_extra" =
style>
[Socket]</div><div class=3D"gmail_extra" style>ListenStream=3D/var/run/dbus=
/system_bus_socket</div><div class=3D"gmail_extra" style><br></div><div cla=
ss=3D"gmail_extra" style>Regards,</div><div class=3D"gmail_extra" style>Jon=
athan</div>
</div>

--089e0160cdf6fa294504dd5a2949--
