Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8F860289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:56:52 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id er20so6903178lab.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=2opWCSbeYaks7c97uS1G17CgerapiG4mb4YYSxyoqA0=;
	b=H7pmQAfHBGybJfC9NBDBrHRriGH4aTJm1qY13JcPVY6H+RkmthIvMMd2pM+i/htZ4Z
	WlDRVK/ENQrCYv6MsCIiYuUZG5XKpCKUDq9MHKjw4fxd2PCMCmqawqtpeuaeX0smCaoN
	2dokchQLWdL2Vvy9tijFYEM4F34YervhQ5/u1r2Wd6hqUUtArg08+FkA5RTkQXei/U8+
	ovamSGj2hUqeMz4iE1BVrenyWLrVd3h6riJtY6x4b5tfY1ngHjWduYXCyb4GU6CWHStK
	2hE3bEBhaJ10RMHjT1c4ZQ1HwvEztS89KQetVK0f+M1mhXfoD6wfSErjcOiMma6oNBHg
	mU+g==
X-Received: by 10.152.1.134 with SMTP id 6mr17495254lam.16.1373551012215; Thu,
	11 Jul 2013 06:56:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.3.5 with HTTP; Thu, 11 Jul 2013 06:56:32 -0700 (PDT)
In-Reply-To: <20130711134908.GK3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<20130711123810.GJ3288@jama>
	<CABcZANmtvgEeJNoXe_E1CrmoCVn2CZ_kto6CE5UAXix05=Vchg@mail.gmail.com>
	<20130711134908.GK3288@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 11 Jul 2013 06:56:32 -0700
X-Google-Sender-Auth: sKLkbpxI3cqKyMu_HN0TFqySy-U
Message-ID: <CABcZAN=myyxiDdU2t2nFDa4g1awk3jFyuJAxtyAEvTX_kRvq5w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Thu, 11 Jul 2013 13:56:52 -0000
Content-Type: multipart/alternative; boundary=e89a8f234e852a040d04e13cc4a5

--e89a8f234e852a040d04e13cc4a5
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 11, 2013 at 6:49 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Thu, Jul 11, 2013 at 06:28:04AM -0700, Chris Larson wrote:
> > On Thu, Jul 11, 2013 at 5:38 AM, Martin Jansa <martin.jansa@gmail.com
> >wrote:
> >
> > > On Wed, Jul 10, 2013 at 02:38:13PM +0200, Martin Jansa wrote:
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  scripts/test-dependencies.sh | 253
> > > +++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 253 insertions(+)
> > > >  create mode 100755 scripts/test-dependencies.sh
> > > >
> > > > +    echo "!!!Removing tmpdir \"$tmpdir\"!!!"
> > > > +    rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/pkgdata
> > > $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work
> > > $tmpdir/work-shared 2>/dev/null
> > >
> > > I'll send v3 which doesn't remove $tmpdir/cache between the builds, it
> > > takes too long already without reparsing all recipes every time.
> > >
> > > Originally I was removing it as work around for
> > >
> http://lists.openembedded.org/pipermail/bitbake-devel/2013-July/003624.html
> > > but that's not needed for master and people probably won't be changing
> > > PNBLACKLIST while this script is running.
> > >
> >
> > This is quite an interesting script. It looks quite similar to my
> > greedy-deps-tests[1] script, though you've taken it a step further in
> > adding builds #3 and #4.
> >
> > 1. https://github.com/kergoth/oe-test-scripts#oe-test-scripts
>
> pity I didn't know about your script before writing mine, it looks more
> elegant in python
>

Heh, it was shell at first, but I wanted to experiment. It ended up being a
good exercise in clean handling of SIGINT and SIGTERM.

I've started with #3 the idea to detect greedy came later
>
> Do you plan to integrate your script into oe-core? I'm fine with keeping
> my shell script locally until you do. Your python script would better fit
> in bitbake/oe environment and reloc-tests also looks useful.


I hadn't thought about it, but it's a good idea. Perhaps we can get the
best-of-both-worlds and integrate the features of both our scripts.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--e89a8f234e852a040d04e13cc4a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jul 11, 2013 at 6:49 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, Jul 11, 2013 at 06=
:28:04AM -0700, Chris Larson wrote:<br>
&gt; On Thu, Jul 11, 2013 at 5:38 AM, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;wrote:<br>
&gt;<br>
&gt; &gt; On Wed, Jul 10, 2013 at 02:38:13PM +0200, Martin Jansa wrote:<br>
&gt; &gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jan=
sa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0scripts/test-dependencies.sh | 253<br>
&gt; &gt; +++++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt; =C2=A01 file changed, 253 insertions(+)<br>
&gt; &gt; &gt; =C2=A0create mode 100755 scripts/test-dependencies.sh<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0echo &quot;!!!Removing tmpdir \&quot;$tmpdir\=
&quot;!!!&quot;<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/p=
kgdata<br>
&gt; &gt; $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/wo=
rk<br>
&gt; &gt; $tmpdir/work-shared 2&gt;/dev/null<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll send v3 which doesn&#39;t remove $tmpdir/cache between t=
he builds, it<br>
&gt; &gt; takes too long already without reparsing all recipes every time.<=
br>
&gt; &gt;<br>
&gt; &gt; Originally I was removing it as work around for<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/pipermail/bitbake-devel/=
2013-July/003624.html" target=3D"_blank">http://lists.openembedded.org/pipe=
rmail/bitbake-devel/2013-July/003624.html</a><br>
&gt; &gt; but that&#39;s not needed for master and people probably won&#39;=
t be changing<br>
&gt; &gt; PNBLACKLIST while this script is running.<br>
&gt; &gt;<br>
&gt;<br>
&gt; This is quite an interesting script. It looks quite similar to my<br>
&gt; greedy-deps-tests[1] script, though you&#39;ve taken it a step further=
 in<br>
&gt; adding builds #3 and #4.<br>
&gt;<br>
&gt; 1. <a href=3D"https://github.com/kergoth/oe-test-scripts#oe-test-scrip=
ts" target=3D"_blank">https://github.com/kergoth/oe-test-scripts#oe-test-sc=
ripts</a><br>
<br>
</div>pity I didn&#39;t know about your script before writing mine, it look=
s more<br>
elegant in python<br></blockquote><div><br></div><div style>Heh, it was she=
ll at first, but I wanted to experiment. It ended up being a good exercise =
in clean handling of SIGINT and SIGTERM.</div><div style><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">


I&#39;ve started with #3 the idea to detect greedy came later<br>
<br>
Do you plan to integrate your script into oe-core? I&#39;m fine with keepin=
g<br>
my shell script locally until you do. Your python script would better fit<b=
r>
in bitbake/oe environment and reloc-tests also looks useful.</blockquote></=
div><br>I hadn&#39;t thought about it, but it&#39;s a good idea. Perhaps we=
 can get the best-of-both-worlds and integrate the features of both our scr=
ipts.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--e89a8f234e852a040d04e13cc4a5--
