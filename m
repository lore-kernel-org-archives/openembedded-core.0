Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R9b45-0005XQ-3j
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:15:37 +0200
Received: by yia27 with SMTP id 27so1384591yia.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=li69rQnXcleqF3NHcJEo/3vc7y1TlydxPs86g4b8WY4=;
	b=EwN6KJfsSQOg2uXV+QwP/LPlvRvTheG74a/EyLzE4M9IFEnkFHPtYsRslLqL3oMdCk
	Ue6mEvS5P+SbVFj27bzygRR/gmaa+DXXZLSVwJ1ZI5TAIH1ADyyLo9bapTlUmWz1vSVr
	pXMDxx6DZVVBkw27ivVASrGoIGv+5JRv4WsF8=
MIME-Version: 1.0
Received: by 10.150.8.10 with SMTP id 10mr10475419ybh.60.1317381007497; Fri,
	30 Sep 2011 04:10:07 -0700 (PDT)
Received: by 10.150.211.6 with HTTP; Fri, 30 Sep 2011 04:10:07 -0700 (PDT)
In-Reply-To: <20110930105219.GA15856@jama.jama.net>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<121b26267ee494182d88e07b7fe63761088b8bde.1317367429.git.Martin.Jansa@gmail.com>
	<1317374312.12332.132.camel@ted>
	<20110930105219.GA15856@jama.jama.net>
Date: Fri, 30 Sep 2011 13:10:07 +0200
Message-ID: <CAAQYJAupp4ZfU=rvRp50A0qfxeP7MUwvZtFZxXvwXBBXaS+DZg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] xserver-nodm-init: merge some changes from meta-oe
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
X-List-Received-Date: Fri, 30 Sep 2011 11:15:37 -0000
Content-Type: multipart/alternative; boundary=000e0cd2537cfc5bbf04ae26aafc

--000e0cd2537cfc5bbf04ae26aafc
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 30, 2011 at 12:52 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, Sep 30, 2011 at 10:17:25AM +0100, Richard Purdie wrote:
> > On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> > > * /etc/X11/Xusername handling should be moved to x11-common so the same
> > >   username and logic is used from initscript and when user starts it
> > >   from terminal
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  .../x11-common/xserver-nodm-init/xserver-nodm      |   30
> ++++++--------------
> > >  1 files changed, 9 insertions(+), 21 deletions(-)
> > >
> > > diff --git
> a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> > > index c707a4b..9cd7904 100755
> > > --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> > > +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> > > @@ -8,10 +8,7 @@
> > >  # Default-Stop:      0 1 6
> > >  ### END INIT INFO
> > >
> > > -killproc() {            # kill the named process(es)
> > > -        pid=`/bin/pidof $1`
> > > -        [ "$pid" != "" ] && kill $pid
> > > -}
> > > +. /etc/init.d/functions
> > >
> > >  read CMDLINE < /proc/cmdline
> > >  for x in $CMDLINE; do
> > > @@ -25,25 +22,16 @@ done
> > >
> > >  case "$1" in
> > >    start)
> > > +    # We don't want this script to block the rest of the boot process
> > > +    if [ "$2" != "background" ]; then
> > > +      $0 $1 background &
> > > +    else
> > >         . /etc/profile
> > > -       username=root
> > > +
> > >         echo "Starting Xserver"
> > > -       if [ -f /etc/X11/Xusername ]; then
> > > -           username=`cat /etc/X11/Xusername`
> > > -           # setting for rootless X
> > > -           chmod o+w /var/log
> > > -           chmod g+r /dev/tty[0-3]
> > > -           chmod o+rw /dev/input/*
> > > -           # hidraw device is probably needed
> > > -           if [ -e /dev/hidraw0 ]; then
> > > -               chmod o+rw /dev/hidraw*
> > > -           fi
> > > -       fi
> > > -       # Using su rather than sudo as latest 1.8.1 cause failure
> [YOCTO #1211]
> > > -       su -l -c '/etc/X11/Xserver&' $username
> > > -       # Wait for the desktop to say its finished loading
> > > -       # before loading the rest of the system
> > > -       # dbus-wait org.matchbox_project.desktop Loaded
> > > +       . /etc/X11/xserver-common
> > > +       xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS
> >/var/log/Xsession.log 2>&1
> > > +    fi
> > >    ;;
> ]> >
> > >    stop)
> >
> > This is not "merge some changes from meta-oe", this is "overwrite
> > whatever is in oe-core with meta-oe" :(.
> >
> > The above wipes out rootless X support.
>
> Sorry about that and please ignore this patch..
>
> I've started moving rootless X support from not only xserver-nodm-init
> to unified x11-common/xserver-common, but because I didn't finish it
> I've removed xserver-common from this patchset and sent it here for
> review (ie because ant asked me to).
>
>
Yes, I'm to blame for that :)
Thanks again JaMa for your work.

The point is we are trying to reduce the delta between oe-core and meta-oe.
This has to be done asap, before drifting too much.
I have atm three cases of recipes present in both layers whitout any reason
(there are more, I know):

- udev
- xserver
- tzdata/tzcode

I hope the oe-core maintainers will give a look at meta-oe when updating
their recipes.



> > I've noticed this theme in several of the patches where for example a
> > decent long DESCRIPTION and a separate short SUMMARY are replaced with a
> > single one line SUMMARY.
>
> I'll recheck this, but I was really trying to keep whatever was better
> in orginal recipes, so if it's the case somewhere I'll fix it and send
> updated patch, sorry about that.
>
> > The fact you've done this means I'm going to have to go over every line
> > of changes in this and double check what is happening. Some of the
> > patches look ok but some like this are not.
>
> BTW: meta-oe patchset wasn't sent because git was offline..
>
> Bad luck. Please insist!

Regards,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Regards

Andrea

--000e0cd2537cfc5bbf04ae26aafc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Fri, Sep 30, 2011 at 12:52 PM, Martin Jan=
sa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.j=
ansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div><div></div><div class=3D"h5">On Fri, Sep 30, 2011 at 10:17:25AM +0100,=
 Richard Purdie wrote:<br>
&gt; On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:<br>
&gt; &gt; * /etc/X11/Xusername handling should be moved to x11-common so th=
e same<br>
&gt; &gt; =A0 username and logic is used from initscript and when user star=
ts it<br>
&gt; &gt; =A0 from terminal<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0.../x11-common/xserver-nodm-init/xserver-nodm =A0 =A0 =A0| =A0=
 30 ++++++--------------<br>
&gt; &gt; =A01 files changed, 9 insertions(+), 21 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/x=
server-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-no=
dm<br>
&gt; &gt; index c707a4b..9cd7904 100755<br>
&gt; &gt; --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-=
nodm<br>
&gt; &gt; +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-=
nodm<br>
&gt; &gt; @@ -8,10 +8,7 @@<br>
&gt; &gt; =A0# Default-Stop: =A0 =A0 =A00 1 6<br>
&gt; &gt; =A0### END INIT INFO<br>
&gt; &gt;<br>
&gt; &gt; -killproc() { =A0 =A0 =A0 =A0 =A0 =A0# kill the named process(es)=
<br>
&gt; &gt; - =A0 =A0 =A0 =A0pid=3D`/bin/pidof $1`<br>
&gt; &gt; - =A0 =A0 =A0 =A0[ &quot;$pid&quot; !=3D &quot;&quot; ] &amp;&amp=
; kill $pid<br>
&gt; &gt; -}<br>
&gt; &gt; +. /etc/init.d/functions<br>
&gt; &gt;<br>
&gt; &gt; =A0read CMDLINE &lt; /proc/cmdline<br>
&gt; &gt; =A0for x in $CMDLINE; do<br>
&gt; &gt; @@ -25,25 +22,16 @@ done<br>
&gt; &gt;<br>
&gt; &gt; =A0case &quot;$1&quot; in<br>
&gt; &gt; =A0 =A0start)<br>
&gt; &gt; + =A0 =A0# We don&#39;t want this script to block the rest of the=
 boot process<br>
&gt; &gt; + =A0 =A0if [ &quot;$2&quot; !=3D &quot;background&quot; ]; then<=
br>
&gt; &gt; + =A0 =A0 =A0$0 $1 background &amp;<br>
&gt; &gt; + =A0 =A0else<br>
&gt; &gt; =A0 =A0 =A0 =A0 . /etc/profile<br>
&gt; &gt; - =A0 =A0 =A0 username=3Droot<br>
&gt; &gt; +<br>
&gt; &gt; =A0 =A0 =A0 =A0 echo &quot;Starting Xserver&quot;<br>
&gt; &gt; - =A0 =A0 =A0 if [ -f /etc/X11/Xusername ]; then<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 username=3D`cat /etc/X11/Xusername`<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 # setting for rootless X<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 chmod o+w /var/log<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 chmod g+r /dev/tty[0-3]<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 chmod o+rw /dev/input/*<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 # hidraw device is probably needed<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 if [ -e /dev/hidraw0 ]; then<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chmod o+rw /dev/hidraw*<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; &gt; - =A0 =A0 =A0 fi<br>
&gt; &gt; - =A0 =A0 =A0 # Using su rather than sudo as latest 1.8.1 cause f=
ailure [YOCTO #1211]<br>
&gt; &gt; - =A0 =A0 =A0 su -l -c &#39;/etc/X11/Xserver&amp;&#39; $username<=
br>
&gt; &gt; - =A0 =A0 =A0 # Wait for the desktop to say its finished loading<=
br>
&gt; &gt; - =A0 =A0 =A0 # before loading the rest of the system<br>
&gt; &gt; - =A0 =A0 =A0 # dbus-wait org.matchbox_project.desktop Loaded<br>
&gt; &gt; + =A0 =A0 =A0 . /etc/X11/xserver-common<br>
&gt; &gt; + =A0 =A0 =A0 xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS &=
gt;/var/log/Xsession.log 2&gt;&amp;1<br>
&gt; &gt; + =A0 =A0fi<br>
&gt; &gt; =A0 =A0;;<br>
]&gt; &gt;<br>
&gt; &gt; =A0 =A0stop)<br>
&gt;<br>
&gt; This is not &quot;merge some changes from meta-oe&quot;, this is &quot=
;overwrite<br>
&gt; whatever is in oe-core with meta-oe&quot; :(.<br>
&gt;<br>
&gt; The above wipes out rootless X support.<br>
<br>
</div></div>Sorry about that and please ignore this patch..<br>
<br>
I&#39;ve started moving rootless X support from not only xserver-nodm-init<=
br>
to unified x11-common/xserver-common, but because I didn&#39;t finish it<br=
>
I&#39;ve removed xserver-common from this patchset and sent it here for<br>
review (ie because ant asked me to).<br>
<div class=3D"im"><br></div></blockquote><div><br>Yes, I&#39;m to blame for=
 that :)<br>Thanks again JaMa for your work.<br><br>The point is we are try=
ing to reduce the delta between oe-core and meta-oe.<br>This has to be done=
 asap, before drifting too much.<br>
I have atm three cases of recipes present in both layers whitout any reason=
 (there are more, I know):<br><br>- udev<br>- xserver<br>- tzdata/tzcode<br=
><br>I hope the oe-core maintainers will give a look at meta-oe when updati=
ng their recipes.<br>
<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt=
 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div=
 class=3D"im">
&gt; I&#39;ve noticed this theme in several of the patches where for exampl=
e a<br>
&gt; decent long DESCRIPTION and a separate short SUMMARY are replaced with=
 a<br>
&gt; single one line SUMMARY.<br>
<br>
</div>I&#39;ll recheck this, but I was really trying to keep whatever was b=
etter<br>
in orginal recipes, so if it&#39;s the case somewhere I&#39;ll fix it and s=
end<br>
updated patch, sorry about that.<br>
<div class=3D"im"><br>
&gt; The fact you&#39;ve done this means I&#39;m going to have to go over e=
very line<br>
&gt; of changes in this and double check what is happening. Some of the<br>
&gt; patches look ok but some like this are not.<br>
<br>
</div>BTW: meta-oe patchset wasn&#39;t sent because git was offline..<br>
<br></blockquote><div>Bad luck. Please insist!<br><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px sol=
id rgb(204, 204, 204); padding-left: 1ex;">
Regards,<br>
<font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>Regards<br><br>Andrea<br>

--000e0cd2537cfc5bbf04ae26aafc--
