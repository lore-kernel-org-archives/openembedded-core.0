Return-Path: <alexandru.damian@intel.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7FE60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 15:41:32 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp4so172006obc.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rGmvGRDdk1s93DNMIq5W5jb6ya4ie68jxPy69A65Jcg=;
	b=Rfk0TxGPhnjODmOghvJ7dQu+a/unvqaq8KJONEpiO74blBwbqSJCLk2lmjWMjruy5Y
	7W0WcL6wxJgwJ2YQO0eQ2zSUMqaE2kINjJh4AoPfrnioRCXGiqG6JJMvNiOovLJizope
	GF3RHsqMpCYPuNYiCukEbr9Kh/yylfvsbqOYojPP5mKZEpaKVfPsbP+BGh5KAdSCFmPe
	MrgDmZXZA95EWx3omQaIGKe15TB/xSYZhn4noZsamT16X/nC5qaXdNaWnJ2iu5Y1dBPY
	HbAnzFWlXw8Y5GegmR16cRbi+ovdt3ZCQvKRvUGLAtrWRuy/ktl+UE6aHrrNbCNe+n2E
	EJew==
X-Gm-Message-State: ALoCoQkhxN2MKCYDnPLw3Vsocbiapc7w+/z404WCHwiU2jwot83c9JQi4Urli6/w6aG9mYEJWpTp
X-Received: by 10.182.16.33 with SMTP id c1mr2157483obd.4.1392910890920; Thu,
	20 Feb 2014 07:41:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.124.146 with HTTP; Thu, 20 Feb 2014 07:41:10 -0800 (PST)
In-Reply-To: <1392906622.1560.1.camel@ted>
References: <1392658389-19826-1-git-send-email-alexandru.damian@intel.com>
	<1392906622.1560.1.camel@ted>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Thu, 20 Feb 2014 15:41:10 +0000
Message-ID: <CAJ2CSBtk4okj2Pn9-qcB-kQ+jBAMU53sxxvYyH9YXL43Go-Pxw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate: list missing files for toaster
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
X-List-Received-Date: Thu, 20 Feb 2014 15:41:33 -0000
Content-Type: multipart/alternative; boundary=f46d04479f93dcdbee04f2d856bd

--f46d04479f93dcdbee04f2d856bd
Content-Type: text/plain; charset=UTF-8

I would think against it, because

- it's very inefficient to send a Skipped event for each missed task than
to collect all the data and send it in one shot
- it's faster to send the event from the sstate.bbclass than to return the
task ids and then call again a python function to generate the sstate file
names - basically replicating the sstate.bbclass code in bitbake
- the queueTaskSkipped event has a different semantic than what we need
here to return a whole batch of data; creating a new event type from
scratch is a bit pointless since the inheritance would need to be broken
- knotty can receive MetadataEvents just as well as sceneTaskSkipped event,
or any variation of it

I would suggest actually just sending this event at all times, not just
when toaster is enabled.

Please advise,
Alex


On Thu, Feb 20, 2014 at 2:30 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2014-02-17 at 17:33 +0000, Alex DAMIAN wrote:
> > From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >
> > Toaster needs to record the attempts to restore
> > setscene tasks that don't have a sstate file.
> >
> > We build a list of tasks for which we can't find an
> > sstate file, and if we're running under Toaster data
> > collection, we send it off with a MetadataEvent.
> >
> > Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> > ---
> >  meta/classes/sstate.bbclass | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
>
> I'm wondering if we should perhaps do this in bitbake and add a setscene
> "missed" event type there based upon the return value of this function?
>
> Ideally I'd like to be able to report the stats in knotty too.
>
> Cheers,
>
> Richard
>
>


-- 
Alex Damian
Yocto Project
SSG / OTC

--f46d04479f93dcdbee04f2d856bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">I would think against it, because</div><div class=3D"gmail_defau=
lt" style=3D"font-family:tahoma,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:tahoma,sans-serif">

- it&#39;s very inefficient to send a Skipped event for each missed task th=
an to collect all the data and send it in one shot</div><div class=3D"gmail=
_default" style=3D"font-family:tahoma,sans-serif">- it&#39;s faster to send=
 the event from the sstate.bbclass than to return the task ids and then cal=
l again a python function to generate the sstate file names - basically rep=
licating the sstate.bbclass code in bitbake</div>

<div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif">- the =
queueTaskSkipped event has a different semantic than what we need here to r=
eturn a whole batch of data; creating a new event type from scratch is a bi=
t pointless since the inheritance would need to be broken</div>

<div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif">- knot=
ty can receive MetadataEvents just as well as sceneTaskSkipped event, or an=
y variation of it</div><div class=3D"gmail_default" style=3D"font-family:ta=
homa,sans-serif">

<br></div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-ser=
if">I would suggest actually just sending this event at all times, not just=
 when toaster is enabled.</div><div class=3D"gmail_default" style=3D"font-f=
amily:tahoma,sans-serif">

<br></div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-ser=
if">Please advise,</div><div class=3D"gmail_default" style=3D"font-family:t=
ahoma,sans-serif">Alex</div></div><div class=3D"gmail_extra"><br><br><div c=
lass=3D"gmail_quote">

On Thu, Feb 20, 2014 at 2:30 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

<div class=3D"">On Mon, 2014-02-17 at 17:33 +0000, Alex DAMIAN wrote:<br>
&gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.co=
m">alexandru.damian@intel.com</a>&gt;<br>
&gt;<br>
&gt; Toaster needs to record the attempts to restore<br>
&gt; setscene tasks that don&#39;t have a sstate file.<br>
&gt;<br>
&gt; We build a list of tasks for which we can&#39;t find an<br>
&gt; sstate file, and if we&#39;re running under Toaster data<br>
&gt; collection, we send it off with a MetadataEvent.<br>
&gt;<br>
&gt; Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian=
@intel.com">alexandru.damian@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/sstate.bbclass | 11 +++++++++++<br>
&gt; =C2=A01 file changed, 11 insertions(+)<br>
<br>
</div>I&#39;m wondering if we should perhaps do this in bitbake and add a s=
etscene<br>
&quot;missed&quot; event type there based upon the return value of this fun=
ction?<br>
<br>
Ideally I&#39;d like to be able to report the stats in knotty too.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr">Alex Damian<div>Yocto Project<br></div><div>SSG / OTC=C2=A0</div></div=
>
</div>

--f46d04479f93dcdbee04f2d856bd--
