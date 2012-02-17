Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyTdw-0006uv-Pa
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 20:38:56 +0100
Received: by vcqp1 with SMTP id p1so528345vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 11:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=09pjr70ahJXECN8O7mvp/RULQp6nHTLgbugqd8srYkg=;
	b=CT9E0KRyZwxtMBXX3/bwHBF1pUUruPha36YSBCPe6hhWt6v0v0UKDPrWRuTK/Vd/8c
	peShRJTMolBctSY0mBWRkXCUSHbFEgN7/BT16QWEynISIVHAtu+ds4dXt42MUPxABZqU
	9C2jWbbrSl/3qwAtudsqttrNe3qqZjHiKxPlY=
MIME-Version: 1.0
Received: by 10.52.66.225 with SMTP id i1mr3819206vdt.65.1329507042015; Fri,
	17 Feb 2012 11:30:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Fri, 17 Feb 2012 11:30:41 -0800 (PST)
In-Reply-To: <1329506739.2591.114.camel@x121e.pbcl.net>
References: <cover.1329500798.git.otavio@ossystems.com.br>
	<a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
	<1329501107.14363.205.camel@phil-desktop>
	<CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
	<1329506739.2591.114.camel@x121e.pbcl.net>
Date: Fri, 17 Feb 2012 17:30:41 -0200
X-Google-Sender-Auth: kM-hz8knvnNM39kWGLxSVD9TXdI
Message-ID: <CAP9ODKq5jiun+bcQZeR2d9Dx2gJM3v=eu2N2WiCuwTb7sb4A-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Fri, 17 Feb 2012 19:38:57 -0000
Content-Type: multipart/alternative; boundary=20cf307d0220f73ab804b92dfa77

--20cf307d0220f73ab804b92dfa77
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 17, 2012 at 17:25, Phil Blundell <philb@gnu.org> wrote:

> Er, does it?  My copy doesn't seem to.
>
> pb@x121e:~/oe/oe-core$ grep opkg-cl
> meta/recipes-devtools/dpkg/run-postinsts/*
> pb@x121e:~/oe/oe-core$
>
> Where are you seeing the call to opkg-cl?


I don't use dpkg but opkg.

So, looking at opkg.inc we find out:

...
pkg_postinst_${PN} () {
#!/bin/sh
if [ "x$D" != "x" ]; then
        install -d $D${sysconfdir}/rcS.d
        # this happens at S98 where our good 'ole packages script used to
run
        echo "#!/bin/sh
opkg-cl configure
rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
        chmod 0755
$D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
fi
...

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--20cf307d0220f73ab804b92dfa77
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Feb 17, 2012 at 17:25, Phil Blundell <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">Er, does it? =A0My copy doesn&#39;t seem to.</div>
<br>
pb@x121e:~/oe/oe-core$ grep opkg-cl meta/recipes-devtools/dpkg/run-postinst=
s/*<br>
pb@x121e:~/oe/oe-core$<br>
<br>
Where are you seeing the call to opkg-cl?</blockquote><div><br></div><div>I=
 don&#39;t use dpkg but opkg.</div><div><br></div><div>So, looking at opkg.=
inc we find out:</div><div><br></div><div>...</div><div><div>pkg_postinst_$=
{PN} () {</div>
<div>#!/bin/sh</div><div>if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then</d=
iv><div>=A0 =A0 =A0 =A0 install -d $D${sysconfdir}/rcS.d</div><div>=A0 =A0 =
=A0 =A0 # this happens at S98 where our good &#39;ole packages script used =
to run</div><div>
=A0 =A0 =A0 =A0 echo &quot;#!/bin/sh</div><div>opkg-cl configure</div><div>=
rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure</div><div>=
&quot; &gt; $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure</di=
v><div>
=A0 =A0 =A0 =A0 chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITIO=
N}configure</div><div>fi</div><div>...</div></div><div>=A0</div></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--20cf307d0220f73ab804b92dfa77--
