Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1TkgVX-0002FM-42
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 20:37:47 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 11:21:08 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so16718153iak.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 11:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=h2qf7bmpAHjKMTFch9WPfziAoF0Z6tuSIPzR7l9J1tg=;
	b=D5aQHMSRbwqegmfxGZwGetU/b4bGeFdUn9UG3UGWS3wnTW87yZ1w38sbwKajIgzzQq
	p0Y269i6UJrPrZEUyJRuYQ3DsVvJF04vbWf2Ix23MQwWuKqJ61V9XzmjJCk1FEiY9Ozb
	MZ9NACIS2F7u/ysQZBimPUQ8SrVQy+tgeOXcb9vWJwdK01T1Ay77jhLtvbnl3jwC1F6f
	cFXhJwrTaA1Gh0PkaAxEVbh2peMi+yO7dBlwGwq1a5HFYQ6hEfh3hjwwJ24/2VempBcT
	BL5tjtKZBOnd4aBeRY1BXXNAXqVqLHRaW/1rUPrb28xM+EikC4FcVKG7Mrcc0zAaqpqc
	5zOg==
Received: by 10.50.149.131 with SMTP id ua3mr10420329igb.5.1355772112154;
	Mon, 17 Dec 2012 11:21:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.149.131 with SMTP id ua3mr10420306igb.5.1355772112011; Mon,
	17 Dec 2012 11:21:52 -0800 (PST)
Received: by 10.64.49.164 with HTTP; Mon, 17 Dec 2012 11:21:51 -0800 (PST)
In-Reply-To: <50CF510B.7040705@linux.intel.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
	<1355748923-24459-1-git-send-email-alexandru.damian@intel.com>
	<50CF510B.7040705@linux.intel.com>
Date: Mon, 17 Dec 2012 21:21:51 +0200
Message-ID: <CAJ2CSBt1amQV=Mvkmp=vXaxQbYOFewMiYw-pnm31xv28aqWN=g@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQnCUIeHpIbuGfMB9YAWgLuw02o1sMtWv5X4Ggrg95RxLKNxLn3+NkCAlWc8ahZIH4BSMntDXuLCOV0HT9zrkmXj2V+f9Z+x20YRl8Qx3lUlSKY6qmBneENfAsX6+3/teQH9Xmd+9T2J+8b2OViYXAfkjtoDUkTLIpnIln3cntoNnLbtkdZoXxv6stKcPXf9mG3xDUll
Cc: Damien Lespiau <damien.lespiau@intel.com>, otavio@ossystems.com.br,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] init-live: default to initrd shell if image isn't found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 19:37:47 -0000
Content-Type: multipart/alternative; boundary=e89a8f3bb0532202f204d1114b9c

--e89a8f3bb0532202f204d1114b9c
Content-Type: text/plain; charset=ISO-8859-1

IMHO, if the system has to fatal() here, something VERY wrong is going on.

This isn't your general debug option, this is a last-resort emergency
rescue. I suppose that if you need to debug this, the system is so
problematic you need to deep-dive into it anyway.

I suggest taking it as it is now, and fill in a bugzilla entry about
handling it better in initramfs-framework as it should be.

Alex


On Mon, Dec 17, 2012 at 7:06 PM, Darren Hart <dvhart@linux.intel.com> wrote:

>
>
> On 12/17/2012 04:55 AM, Alex DAMIAN wrote:
> > From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >
> > Adds "debugshell" command line parameter for live/install images.
> >
> > If the init live fails to find and mount a root-fs image,
> > dumps to a shell after timeout so that the developer can figure
> > what's wrong.
> >
> > Timeout defaults to 30 seconds, but it can be changed as param
> > argument.
> >
> > Prior art in Ubuntu. Also, leaving a system stale isn't good form.
> >
> > Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> > ---
> >  meta/recipes-core/initrdscripts/files/init-live.sh |   18
> +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh
> b/meta/recipes-core/initrdscripts/files/init-live.sh
> > index c591f0d..d99a8ea 100644
> > --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> > +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> > @@ -45,7 +45,13 @@ read_args() {
> >                      console_params=$arg
> >                  else
> >                      console_params="$console_params $arg"
> > -                fi
> > +                fi ;;
> > +            debugshell*)
> > +                if [ -z "$optarg" ]; then
> > +                        shelltimeout=30
> > +                else
> > +                        shelltimeout=$optarg
> > +                fi
> >          esac
> >      done
> >  }
> > @@ -75,6 +81,7 @@ early_setup
> >  read_args
> >
> >  echo "Waiting for removable media..."
> > +C=0
> >  while true
> >  do
> >    for i in `ls /media 2>/dev/null`; do
> > @@ -90,6 +97,15 @@ do
> >    if [ "$found" = "yes" ]; then
> >        break;
> >    fi
> > +  # don't wait for more than $shelltimeout seconds, if it's set
> > +  if [ -n "$shelltimeout" ]; then
> > +      echo -n " " $(( $shelltimeout - $C ))
> > +      if [ $C -ge $shelltimeout ]; then
> > +           echo "..."
> > +           fatal "Cannot find root image on media, dropping to shell "
>
> I'd recommend being explicity about what it is looking for when
> debugshell is used. Which devices where probed, what was the file it
> looked for. Save the developer from having to find this script in the
> repository and look it up.
>
> --
> Darren
>
> > +      fi
> > +      C=$(( C + 1 ))
> > +  fi
> >    sleep 1
> >  done
> >
> >
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel
>

--e89a8f3bb0532202f204d1114b9c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

IMHO, if the system has to fatal() here, something VERY wrong is going on.<=
div><br></div><div>This isn&#39;t your general debug option, this is a last=
-resort emergency rescue. I suppose that if you need to debug this, the sys=
tem is so problematic you need to deep-dive into it anyway.</div>
<div><br></div><div>I suggest taking it as it is now, and fill in a bugzill=
a entry about handling it better in initramfs-framework as it should be.</d=
iv><div><br></div><div>Alex</div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">
On Mon, Dec 17, 2012 at 7:06 PM, Darren Hart <span dir=3D"ltr">&lt;<a href=
=3D"mailto:dvhart@linux.intel.com" target=3D"_blank">dvhart@linux.intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 12/17/2012 04:55 AM, Alex DAMIAN wrote:<br>
&gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.co=
m">alexandru.damian@intel.com</a>&gt;<br>
&gt;<br>
&gt; Adds &quot;debugshell&quot; command line parameter for live/install im=
ages.<br>
&gt;<br>
&gt; If the init live fails to find and mount a root-fs image,<br>
&gt; dumps to a shell after timeout so that the developer can figure<br>
&gt; what&#39;s wrong.<br>
&gt;<br>
&gt; Timeout defaults to 30 seconds, but it can be changed as param<br>
&gt; argument.<br>
&gt;<br>
&gt; Prior art in Ubuntu. Also, leaving a system stale isn&#39;t good form.=
<br>
&gt;<br>
&gt; Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian=
@intel.com">alexandru.damian@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-core/initrdscripts/files/init-live.sh | =A0 18 +++++++=
++++++++++-<br>
&gt; =A01 file changed, 17 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta=
/recipes-core/initrdscripts/files/init-live.sh<br>
&gt; index c591f0d..d99a8ea 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/files/init-live.sh<br>
&gt; +++ b/meta/recipes-core/initrdscripts/files/init-live.sh<br>
&gt; @@ -45,7 +45,13 @@ read_args() {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0console_params=3D$arg<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0console_params=3D&quot;$con=
sole_params $arg&quot;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi ;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0debugshell*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ -z &quot;$optarg&quot; ]; then<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0shelltimeout=3D30<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0shelltimeout=3D$optar=
g<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
&gt; =A0 =A0 =A0 =A0 =A0esac<br>
&gt; =A0 =A0 =A0done<br>
&gt; =A0}<br>
&gt; @@ -75,6 +81,7 @@ early_setup<br>
&gt; =A0read_args<br>
&gt;<br>
&gt; =A0echo &quot;Waiting for removable media...&quot;<br>
&gt; +C=3D0<br>
&gt; =A0while true<br>
&gt; =A0do<br>
&gt; =A0 =A0for i in `ls /media 2&gt;/dev/null`; do<br>
&gt; @@ -90,6 +97,15 @@ do<br>
&gt; =A0 =A0if [ &quot;$found&quot; =3D &quot;yes&quot; ]; then<br>
&gt; =A0 =A0 =A0 =A0break;<br>
&gt; =A0 =A0fi<br>
&gt; + =A0# don&#39;t wait for more than $shelltimeout seconds, if it&#39;s=
 set<br>
&gt; + =A0if [ -n &quot;$shelltimeout&quot; ]; then<br>
&gt; + =A0 =A0 =A0echo -n &quot; &quot; $(( $shelltimeout - $C ))<br>
&gt; + =A0 =A0 =A0if [ $C -ge $shelltimeout ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 echo &quot;...&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 fatal &quot;Cannot find root image on media, dro=
pping to shell &quot;<br>
<br>
</div></div>I&#39;d recommend being explicity about what it is looking for =
when<br>
debugshell is used. Which devices where probed, what was the file it<br>
looked for. Save the developer from having to find this script in the<br>
repository and look it up.<br>
<br>
--<br>
Darren<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; + =A0 =A0 =A0fi<br>
&gt; + =A0 =A0 =A0C=3D$(( C + 1 ))<br>
&gt; + =A0fi<br>
&gt; =A0 =A0sleep 1<br>
&gt; =A0done<br>
&gt;<br>
&gt;<br>
<br>
--<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">Darren Hart<br>
Intel Open Source Technology Center<br>
Yocto Project - Technical Lead - Linux Kernel<br>
</font></span></blockquote></div><br></div>

--e89a8f3bb0532202f204d1114b9c--
