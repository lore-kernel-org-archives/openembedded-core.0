Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1Smg5K-0007OS-Sw
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 09:02:43 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Jul 2012 23:51:33 -0700
Received: by lbbgj3 with SMTP id gj3so10030897lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 23:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=B+fSDCVAeXhkt9mCQOLtV89GlzMnGLnp9PyYVZdoOFo=;
	b=X3BBO/CdVbQkfPYGa6KfU3eRkVWOMzSY28fkOxEDltQMAH4I7kTeHw6FI0JShHga82
	n4MbrTXa5wpX6vfmGdU1YEuSMZ42uouhzPiBEDJDCRj26YOKvvsEIY/gzEtIaFkDbs/n
	hPAPLr0m1shkN4s1zU3jIJU7s8a2JYbmML/59vHnfYznirGFkATZ0NgQNLkgXy3R2DoC
	C+fXw419xV8cbejST6jYz0WNkJhzU3/zLSzb1nDQPl4mdQw5x4B6SAmlR1md+cvg0swl
	7UTPQ2+PPM3EaOgcqluNZtGCS0ls+V3+MMMh6E4fsuo5BED5LU4YZfmai05B/Wm+7xR6
	xIMg==
MIME-Version: 1.0
Received: by 10.152.148.1 with SMTP id to1mr24566547lab.34.1341471090953; Wed,
	04 Jul 2012 23:51:30 -0700 (PDT)
Received: by 10.112.38.132 with HTTP; Wed, 4 Jul 2012 23:51:30 -0700 (PDT)
In-Reply-To: <20120704152111.GB15100@jama.jama.net>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com> <1341413143.3906.31.camel@ted>
	<CAJ2CSBuRsmRDCaj5oY8xToURc3GkCJzRj8y6auzTUxA32AZBMQ@mail.gmail.com>
	<1341414137.3906.33.camel@ted>
	<CAJ2CSBtESa4NVB1YF_VSN3BOj-n8NipPN7krkuLHH-nRdEVfcg@mail.gmail.com>
	<20120704152111.GB15100@jama.jama.net>
Date: Thu, 5 Jul 2012 09:51:30 +0300
Message-ID: <CAJ2CSBvQJtFPBXf-QEVm7bO84W4_K2ziYAOR=1kiQfENyK_D_Q@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnRuIVp6st2y+X5PhopHjXSVrOyUpALQ4DFVGzzkJEz5YfrGjOyV9J1xGClxQHMgIPP7BCC
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Thu, 05 Jul 2012 07:02:43 -0000
Content-Type: multipart/alternative; boundary=e89a8f22c34fda4ddc04c40f937f

--e89a8f22c34fda4ddc04c40f937f
Content-Type: text/plain; charset=ISO-8859-1

I guess the root of the problem is when the autotools start up - we're
having autoconf 2.68,
which is not liked by gcc 4.7.1

configure.ac:33: error: Please use exactly Autoconf 2.64 instead of 2.68.
config/override.m4:12: _GCC_AUTOCONF_VERSION_CHECK is expanded from...
configure.ac:33: the top level
autom4te: m4 failed with exit status: 1


I'm gonna downgrade to autoconf 2.64 and see what happens.

Alex

On Wed, Jul 4, 2012 at 6:21 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Jul 04, 2012 at 06:06:55PM +0300, Damian, Alexandru wrote:
> > I guess the problem is no lmld, (skips over), Mihai says that
> >
> > - library search path "/usr/lib/cmplrs/cc2.11" is unsafe for
> > cross-compilation
>
> It's one of issues I sometimes see during gcc upgrades.. and it was
> there with e.g. gcc-4.6.3 too
> http://build.shr-project.org/tests/jama/gcc-issue/gcc.issue (from Jan
> 14)
>
> > is the cause.
> >
> >
> > I'm unable to trace back the cc2.11 file name (path).
> >
> >
> >
> > Let's take it bit by bit, we have two issues here.
> > 1. - why the configure hangs from time to time (what is that c2.11 ??)
> >
> > 2. - why sometimes it triggers massive rebuild even if nothing is
> changed.
> >
> > Regarding point 2, does anybody else sees it ?
> >
> > Alex
> >
> > On Wed, Jul 4, 2012 at 6:02 PM, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> >
> > > On Wed, 2012-07-04 at 17:50 +0300, Damian, Alexandru wrote:
> > > > The question wasn't why it fails, but why sometimes it goes through,
> > > > why sometimes fail, and why is it retriggered
> > > > without any changes to the config or files (run 5 times the
> > > > core-image-sato-sdk build in a row, and at least once it will fail).
> > > >
> > > > I don't trust systems that are not deterministic :).
> > >
> > > The check runs at the end of the do_configure task.
> > >
> > > The config.log is generated by do_compile. If do_configure is re-run,
> > > you'll hit the failure.
> > >
> > > > This being said:
> > > >
> > > > grep -C5 -e 'CROSS COMPILE Badness:' -e 'is unsafe for
> > > > cross-compilation'
> > >
> /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log
> > > > | return ldopen ();
> > > > |   ;
> > > > |   return 0;
> > > > | }
> > > > configure:8836: i586-poky-linux-gcc  -m32   -march=i586
> > > > --sysroot=/home/ddalex/ssd/yocto/build/tmp/sysroots/qemux86 -o
> > > > conftest -pipe -g -feliminate-unused-debug-types   -Wl,-O1
> > > > -Wl,--hash-style=gnu -Wl,--as-needed conftest.c
> > > > -L/usr/lib/cmplrs/cc2.11 -lmld >&5
> > > >
> > >
> /home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:
> > > warning: library search path "/usr/lib/cmplrs/cc2.11" is unsafe for
> > > cross-compilation
> > > >
> > >
> /home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:
> > > cannot find -lmld
> > > > collect2: error: ld returned 1 exit status
> > > > configure:8836: $? = 1
> > > > configure: failed program was:
> > > > | /* confdefs.h */
> > >
> > > So we need it to stop looking for libmld whatever that is. Hopefully
> > > there is a --disable-xxxx option we can pass in?
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > >
>
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
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

--e89a8f22c34fda4ddc04c40f937f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I guess the root of the problem is when the autotools start up - we&#39;re =
having autoconf 2.68,<br>which is not liked by gcc 4.7.1<br><br><a href=3D"=
http://configure.ac:33">configure.ac:33</a>: error: Please use exactly Auto=
conf 2.64 instead of 2.68.<br>
config/override.m4:12: _GCC_AUTOCONF_VERSION_CHECK is expanded from...<br><=
a href=3D"http://configure.ac:33">configure.ac:33</a>: the top level<br>aut=
om4te: m4 failed with exit status: 1<br><br><br>I&#39;m gonna downgrade to =
autoconf 2.64 and see what happens.<br>
<br>Alex <br><br><div class=3D"gmail_quote">On Wed, Jul 4, 2012 at 6:21 PM,=
 Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<div class=3D"im">On Wed, Jul 04, 2012 at 06:06:55PM +0300, Damian, Alexand=
ru wrote:<br>
&gt; I guess the problem is no lmld, (skips over), Mihai says that<br>
&gt;<br>
&gt; - library search path &quot;/usr/lib/cmplrs/cc2.11&quot; is unsafe for=
<br>
&gt; cross-compilation<br>
<br>
</div>It&#39;s one of issues I sometimes see during gcc upgrades.. and it w=
as<br>
there with e.g. gcc-4.6.3 too<br>
<a href=3D"http://build.shr-project.org/tests/jama/gcc-issue/gcc.issue" tar=
get=3D"_blank">http://build.shr-project.org/tests/jama/gcc-issue/gcc.issue<=
/a> (from Jan<br>
14)<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; is the cause.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m unable to trace back the cc2.11 file name (path).<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Let&#39;s take it bit by bit, we have two issues here.<br>
&gt; 1. - why the configure hangs from time to time (what is that c2.11 ??)=
<br>
&gt;<br>
&gt; 2. - why sometimes it triggers massive rebuild even if nothing is chan=
ged.<br>
&gt;<br>
&gt; Regarding point 2, does anybody else sees it ?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed, Jul 4, 2012 at 6:02 PM, Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Wed, 2012-07-04 at 17:50 +0300, Damian, Alexandru wrote:<br>
&gt; &gt; &gt; The question wasn&#39;t why it fails, but why sometimes it g=
oes through,<br>
&gt; &gt; &gt; why sometimes fail, and why is it retriggered<br>
&gt; &gt; &gt; without any changes to the config or files (run 5 times the<=
br>
&gt; &gt; &gt; core-image-sato-sdk build in a row, and at least once it wil=
l fail).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t trust systems that are not deterministic :).<br>
&gt; &gt;<br>
&gt; &gt; The check runs at the end of the do_configure task.<br>
&gt; &gt;<br>
&gt; &gt; The config.log is generated by do_compile. If do_configure is re-=
run,<br>
&gt; &gt; you&#39;ll hit the failure.<br>
&gt; &gt;<br>
&gt; &gt; &gt; This being said:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; grep -C5 -e &#39;CROSS COMPILE Badness:&#39; -e &#39;is unsa=
fe for<br>
&gt; &gt; &gt; cross-compilation&#39;<br>
&gt; &gt; /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+s=
vnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/confi=
g.log<br>
&gt; &gt; &gt; | return ldopen ();<br>
&gt; &gt; &gt; | =A0 ;<br>
&gt; &gt; &gt; | =A0 return 0;<br>
&gt; &gt; &gt; | }<br>
&gt; &gt; &gt; configure:8836: i586-poky-linux-gcc =A0-m32 =A0 -march=3Di58=
6<br>
&gt; &gt; &gt; --sysroot=3D/home/ddalex/ssd/yocto/build/tmp/sysroots/qemux8=
6 -o<br>
&gt; &gt; &gt; conftest -pipe -g -feliminate-unused-debug-types =A0 -Wl,-O1=
<br>
&gt; &gt; &gt; -Wl,--hash-style=3Dgnu -Wl,--as-needed conftest.c<br>
&gt; &gt; &gt; -L/usr/lib/cmplrs/cc2.11 -lmld &gt;&amp;5<br>
&gt; &gt; &gt;<br>
&gt; &gt; /home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexe=
c/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:<br>
&gt; &gt; warning: library search path &quot;/usr/lib/cmplrs/cc2.11&quot; i=
s unsafe for<br>
&gt; &gt; cross-compilation<br>
&gt; &gt; &gt;<br>
&gt; &gt; /home/ddalex/ssd/yocto/build/tmp/sysroots/x86_64-linux/usr/libexe=
c/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld:<br>
&gt; &gt; cannot find -lmld<br>
&gt; &gt; &gt; collect2: error: ld returned 1 exit status<br>
&gt; &gt; &gt; configure:8836: $? =3D 1<br>
&gt; &gt; &gt; configure: failed program was:<br>
&gt; &gt; &gt; | /* confdefs.h */<br>
&gt; &gt;<br>
&gt; &gt; So we need it to stop looking for libmld whatever that is. Hopefu=
lly<br>
&gt; &gt; there is a --disable-xxxx option we can pass in?<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/op=
enembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailm=
an/listinfo/openembedded-core</a><br>
&gt; &gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--e89a8f22c34fda4ddc04c40f937f--
