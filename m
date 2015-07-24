Return-Path: <pespin.shar@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id A4413761AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 15:10:33 +0000 (UTC)
Received: by lagw2 with SMTP id w2so15928436lag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wuaPDMIFegKmrmsXxpN1NpnvhPIS6gzM5Tu6bvspBXc=;
	b=LNj1QmD5Hh/vXioBvHZiyC/V+2tvaspOuMZYIFr+B7hiw1tJXzfnoygZUohkAg+Ykq
	oB1NVcLVXy2fuu/4BVk5Lzu3lOZ07UC62QjAGWrSPTeQT68IWdphEMqUV3eFVvyaFcfH
	igTSWhAEiAnKHyfBCKezjwuiUd0rM1yVkJ5gglSPdSMe3n2S2dyj47bC7npHBc3WbXSe
	PpC7M7Mo6DFHq7O9qIyT593ym/JD0bbShj6nzQlm6JNG8qUM/abwVO1CLr0WGxm6++bv
	Gcjy/jCGHA0UFmeLTq7VjzMUkUYZOUoPkhsCcyLpGq+N4pXjf2jUY747vSluGTZIU+R8
	rKiw==
MIME-Version: 1.0
X-Received: by 10.153.4.40 with SMTP id cb8mr13946891lad.39.1437750631973;
	Fri, 24 Jul 2015 08:10:31 -0700 (PDT)
Received: by 10.25.3.10 with HTTP; Fri, 24 Jul 2015 08:10:31 -0700 (PDT)
In-Reply-To: <1437746580-31696-2-git-send-email-pau.espin@aweurope.be>
References: <1437746580-31696-1-git-send-email-pau.espin@aweurope.be>
	<1437746580-31696-2-git-send-email-pau.espin@aweurope.be>
Date: Fri, 24 Jul 2015 17:10:31 +0200
Message-ID: <CAEGpDubFdWgrcje9hzz9CQ56MDB2kfQ5GKOG0Y9qEzsqz63=8A@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>,
	Christopher Larson <clarson@kergoth.com>
Subject: Re: [PATCH v3 2/3] systemd.bbclass: Use systemd_system_unitdir
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
X-List-Received-Date: Fri, 24 Jul 2015 15:10:35 -0000
Content-Type: multipart/alternative; boundary=001a113433d6b1c909051ba06710

--001a113433d6b1c909051ba06710
Content-Type: text/plain; charset=UTF-8

Hi,

actually this breaks build of systemd.bb itself, because it installs its
system recipes using paths from Makefile.am:

> userunitdir=$(prefix)/lib/systemd/user
> systemunitdir=$(rootprefix)/lib/systemd/system
>

And in the recipe for systemd_219.bb we have:

> # Helper variables to clarify locations.  This mirrors the logic in
> systemd's
> # build system.
> rootprefix ?= "${base_prefix}"
> rootlibdir ?= "${base_libdir}"
> rootlibexecdir = "${rootprefix}/lib"
>

So, that means it installs its own services into /lib, not /usr/lib. The
changes done in systemd.bbclass in this patch remove the search path of
/lib, allowing only ${system_system_unitdir} which is
"/usr/lib/systemd/system".

I tried changing rootprefix to use "${prefix}" but then I get other
problems:

> ERROR: QA Issue: systemd: Files/directories were installed but not shipped
>   /usr/bin/udevadm
>   /usr/bin/journalctl
>   /usr/bin/loginctl
>   /usr/bin/machinectl
>   /usr/bin/systemctl
>   /usr/lib/udev/.debug
>   /usr/lib/udev/.debug/cdrom_id
>   /usr/lib/udev/.debug/collect
>   /usr/lib/udev/.debug/ata_id
>   /usr/lib/udev/.debug/v4l_id
>   /usr/lib/udev/.debug/mtd_probe
>   /usr/lib/udev/.debug/scsi_id
>   /usr/lib/udev/.debug/accelerometer
>   /usr/lib/udev/rules.d/70-uaccess.rules
>   /usr/lib/udev/rules.d/73-seat-late.rules
>   /usr/lib/udev/rules.d/71-seat.rules
>   /usr/lib/udev/rules.d/99-systemd.rules
>

Which at the end makes me think... is it really a good idea to set
systemd_unitdir and system_system_unitdir to use "${nonarch_libdir}"? I
think we should be better using ${nonarch_base_libdir} for those, as
systemd guys themselves make distinction between both (prefix vs
rootprefix).

Any thoughts on this? I will redo the patches accordingly once I get some
more opinions.



Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2015-07-24 16:02 GMT+02:00 Pau Espin Pedrol <pau.espin@aweurope.be>:

> Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
> ---
>  meta/classes/systemd.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index cfe1eb5..46e72c7 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -136,8 +136,7 @@ python systemd_populate_packages() {
>      # Check service-files and call systemd_add_files_and_parse for each
> entry
>      def systemd_check_services():
>          searchpaths = [oe.path.join(d.getVar("sysconfdir", True),
> "systemd", "system"),]
> -        searchpaths.append(oe.path.join(d.getVar("nonarch_base_libdir",
> True), "systemd", "system"))
> -        searchpaths.append(oe.path.join(d.getVar("exec_prefix", True),
> d.getVar("nonarch_base_libdir", True), "systemd", "system"))
> +        searchpaths.append(d.getVar("systemd_system_unitdir", True))
>          systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
>
>          keys = 'Also'
> @@ -185,10 +184,10 @@ python rm_sysvinit_initddir (){
>      if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d)
> and \
>          not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,
> d) and \
>          os.path.exists(sysv_initddir):
> -        systemd_unitdir = oe.path.join(d.getVar("D", True),
> d.getVar('systemd_unitdir', True), "system")
> +        systemd_system_unitdir = oe.path.join(d.getVar("D", True),
> d.getVar('systemd_system_unitdir', True))
>
> -        # If systemd_unitdir contains anything, delete sysv_initddir
> -        if (os.path.exists(systemd_unitdir) and
> os.listdir(systemd_unitdir)):
> +        # If systemd_system_unitdir contains anything, delete
> sysv_initddir
> +        if (os.path.exists(systemd_system_unitdir) and
> os.listdir(systemd_system_unitdir)):
>              shutil.rmtree(sysv_initddir)
>  }
>  do_install[postfuncs] += "rm_sysvinit_initddir "
> --
> 1.9.1
>
>

--001a113433d6b1c909051ba06710
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>actually this breaks build of <a href=3D"h=
ttp://systemd.bb">systemd.bb</a> itself, because it installs its system rec=
ipes using paths from Makefile.am:<br><blockquote style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"=
gmail_quote">userunitdir=3D$(prefix)/lib/systemd/user<br>systemunitdir=3D$(=
rootprefix)/lib/systemd/system<br></blockquote><br>And in the recipe for <a=
 href=3D"http://systemd_219.bb">systemd_219.bb</a> we have:<br><blockquote =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex" class=3D"gmail_quote"># Helper variables to clarify locatio=
ns.=C2=A0 This mirrors the logic in systemd&#39;s<br># build system.<br>roo=
tprefix ?=3D &quot;${base_prefix}&quot;<br>rootlibdir ?=3D &quot;${base_lib=
dir}&quot;<br>rootlibexecdir =3D &quot;${rootprefix}/lib&quot;<br></blockqu=
ote><br></div><div>So, that means it installs its own services into /lib, n=
ot /usr/lib. The changes done in systemd.bbclass in this patch remove the s=
earch path of /lib, allowing only ${system_system_unitdir} which is &quot;/=
usr/lib/systemd/system&quot;.<br><br></div>I tried changing rootprefix to u=
se &quot;${prefix}&quot; but then I get other problems:<br><blockquote styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex" class=3D"gmail_quote">ERROR: QA Issue: systemd: Files/directori=
es were installed but not shipped<br>=C2=A0 /usr/bin/udevadm<br>=C2=A0 /usr=
/bin/journalctl<br>=C2=A0 /usr/bin/loginctl<br>=C2=A0 /usr/bin/machinectl<b=
r>=C2=A0 /usr/bin/systemctl<br>=C2=A0 /usr/lib/udev/.debug<br>=C2=A0 /usr/l=
ib/udev/.debug/cdrom_id<br>=C2=A0 /usr/lib/udev/.debug/collect<br>=C2=A0 /u=
sr/lib/udev/.debug/ata_id<br>=C2=A0 /usr/lib/udev/.debug/v4l_id<br>=C2=A0 /=
usr/lib/udev/.debug/mtd_probe<br>=C2=A0 /usr/lib/udev/.debug/scsi_id<br>=C2=
=A0 /usr/lib/udev/.debug/accelerometer<br>=C2=A0 /usr/lib/udev/rules.d/70-u=
access.rules<br>=C2=A0 /usr/lib/udev/rules.d/73-seat-late.rules<br>=C2=A0 /=
usr/lib/udev/rules.d/71-seat.rules<br>=C2=A0 /usr/lib/udev/rules.d/99-syste=
md.rules<br></blockquote><div><br></div><div>Which at the end makes me thin=
k... is it really a good idea to set systemd_unitdir and system_system_unit=
dir to use &quot;${nonarch_libdir}&quot;? I think we should be better using=
 ${nonarch_base_libdir} for those, as systemd guys themselves make distinct=
ion between both (prefix vs rootprefix).<br><br></div><div>Any thoughts on =
this? I will redo the patches accordingly once I get some more opinions.<br=
></div><br><div><br></div></div><div class=3D"gmail_extra"><br clear=3D"all=
"><div><div class=3D"gmail_signature">Pau Espin Pedrol<br>mail/jabber: <a h=
ref=3D"mailto:pespin.shar@gmail.com" target=3D"_blank">pespin.shar@gmail.co=
m</a><br><a href=3D"http://blog.espeweb.net" target=3D"_blank">http://blog.=
espeweb.net</a><br></div></div>
<br><div class=3D"gmail_quote">2015-07-24 16:02 GMT+02:00 Pau Espin Pedrol =
<span dir=3D"ltr">&lt;<a href=3D"mailto:pau.espin@aweurope.be" target=3D"_b=
lank">pau.espin@aweurope.be</a>&gt;</span>:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div class=3D"HOEnZb"><div class=3D"h5">Signed-off-by: Pau Espin Pedrol =
&lt;<a href=3D"mailto:pau.espin@aweurope.be">pau.espin@aweurope.be</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/systemd.bbclass | 9 ++++-----<br>
=C2=A01 file changed, 4 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass<br=
>
index cfe1eb5..46e72c7 100644<br>
--- a/meta/classes/systemd.bbclass<br>
+++ b/meta/classes/systemd.bbclass<br>
@@ -136,8 +136,7 @@ python systemd_populate_packages() {<br>
=C2=A0 =C2=A0 =C2=A0# Check service-files and call systemd_add_files_and_pa=
rse for each entry<br>
=C2=A0 =C2=A0 =C2=A0def systemd_check_services():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0searchpaths =3D [oe.path.join(d.getVar(&q=
uot;sysconfdir&quot;, True), &quot;systemd&quot;, &quot;system&quot;),]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(oe.path.join(d.getVar(&quot=
;nonarch_base_libdir&quot;, True), &quot;systemd&quot;, &quot;system&quot;)=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(oe.path.join(d.getVar(&quot=
;exec_prefix&quot;, True), d.getVar(&quot;nonarch_base_libdir&quot;, True),=
 &quot;systemd&quot;, &quot;system&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(d.getVar(&quot;systemd_syst=
em_unitdir&quot;, True))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_packages =3D d.getVar(&#39;SYSTEM=
D_PACKAGES&#39;, True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0keys =3D &#39;Also&#39;<br>
@@ -185,10 +184,10 @@ python rm_sysvinit_initddir (){<br>
=C2=A0 =C2=A0 =C2=A0if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, True, False, d) and \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;sysvinit&#39;, True, False, d) and \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.exists(sysv_initddir):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_unitdir =3D oe.path.join(d.getVar(&quo=
t;D&quot;, True), d.getVar(&#39;systemd_unitdir&#39;, True), &quot;system&q=
uot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_system_unitdir =3D oe.path.join(d.getV=
ar(&quot;D&quot;, True), d.getVar(&#39;systemd_system_unitdir&#39;, True))<=
br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If systemd_unitdir contains anything, delete=
 sysv_initddir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (os.path.exists(systemd_unitdir) and os.lis=
tdir(systemd_unitdir)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If systemd_system_unitdir contains anything,=
 delete sysv_initddir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (os.path.exists(systemd_system_unitdir) and=
 os.listdir(systemd_system_unitdir)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree(sysv_initddir=
)<br>
=C2=A0}<br>
=C2=A0do_install[postfuncs] +=3D &quot;rm_sysvinit_initddir &quot;<br>
--<br>
1.9.1<br>
<br>
</div></div></blockquote></div><br></div>

--001a113433d6b1c909051ba06710--
