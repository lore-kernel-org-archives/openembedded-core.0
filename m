Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsPhz-0005tW-IQ
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 03:14:03 +0100
Received: by lahc1 with SMTP id c1so406690lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 18:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=6BbFhmW/B0aTm9cKRVrC3CWBQjrOe8ugK63ZbPpIUBA=;
	b=F6kX2wOr1AZMgca3Gg537DXAEhaNprJhFo3Sp8o0TGD/FFjuiBtDyOF1xMFhMW+g8u
	2rNThT91NZvAkNrT1ievXAK+I6X9w6uhnfvzVDXwFgsXuCka2FvmXUxVkQXt3mgtjOfy
	Yv+ua2y7teTMHIQduDxMEO8NdZUOdC+eR6hGw=
MIME-Version: 1.0
Received: by 10.112.36.34 with SMTP id n2mr3902157lbj.24.1328061969088; Tue,
	31 Jan 2012 18:06:09 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Tue, 31 Jan 2012 18:06:09 -0800 (PST)
In-Reply-To: <e2b46859bfa16f03f06e0368857740a549a1c33c.1328057677.git.josh@linux.intel.com>
References: <cover.1328057677.git.josh@linux.intel.com>
	<e2b46859bfa16f03f06e0368857740a549a1c33c.1328057677.git.josh@linux.intel.com>
Date: Wed, 1 Feb 2012 00:06:09 -0200
X-Google-Sender-Auth: Vtk4iY4sZ1FalI-3RWemWyeUBR8
Message-ID: <CAP9ODKpG8L222QfS7usbp1Y9X8pi5qb2=SMiehvccBw9J7xjpw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] sysklogd: various fixes so it starts/stops cleanly
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
X-List-Received-Date: Wed, 01 Feb 2012 02:14:03 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe34ece841ce04b7dd85d8

--e0cb4efe34ece841ce04b7dd85d8
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 31, 2012 at 22:58, Joshua Lock <josh@linux.intel.com> wrote:

> @@ -46,12 +46,18 @@ do_install () {
>  pkg_preinst_${PN} () {
>        # all this is needed to avoid sysmlink errors,
>        # because update-rc.d runs before pkg_postinst
> -       if [ -e ${sysconfdir}/init.d/syslog -a ! -L
> ${sysconfdir}/init.d/syslog ]; then
> +       if test "x$D" != "x"; then
> +               ETC=$D/${sysconfdir}
> +       else
> +               ETC=${sysconfdir}
> +       fi
>

You might use

ETC=$D${sysconfdir}

and avoid the if block as a whole.


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe34ece841ce04b7dd85d8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 31, 2012 at 22:58, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
@@ -46,12 +46,18 @@ do_install () {<br>
=A0pkg_preinst_${PN} () {<br>
 =A0 =A0 =A0 =A0# all this is needed to avoid sysmlink errors,<br>
 =A0 =A0 =A0 =A0# because update-rc.d runs before pkg_postinst<br>
- =A0 =A0 =A0 if [ -e ${sysconfdir}/init.d/syslog -a ! -L ${sysconfdir}/ini=
t.d/syslog ]; then<br>
+ =A0 =A0 =A0 if test &quot;x$D&quot; !=3D &quot;x&quot;; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ETC=3D$D/${sysconfdir}<br>
+ =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ETC=3D${sysconfdir}<br>
+ =A0 =A0 =A0 fi<br></blockquote><div><br></div><div>You might use</div><di=
v><br></div><div>ETC=3D$D${sysconfdir}</div><div><br></div><div>and avoid t=
he if block as a whole.</div><div><br></div><div>=A0</div></div>-- <br>Otav=
io Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. =
Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e0cb4efe34ece841ce04b7dd85d8--
