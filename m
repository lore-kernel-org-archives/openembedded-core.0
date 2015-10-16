Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id EADD377104
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:32:34 +0000 (UTC)
Received: by lfaz124 with SMTP id z124so75538255lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W2mo295Y5n91fRLCzrbbBhN8ISQLUf1DnRGGX3MIOuk=;
	b=GiwZyWV8JNgqV28uVIK0LIB9onwXG0g4A4/5rXPTuR/o9XIw3kVGJfcMGoaEKJj4FG
	DqOJk6kK2IIhvnOIsLBBIaJJrZgmJrLzoiA6eK9jisRfvRG96fZf5j7mPxXnxWz8DG+V
	VzrjuMcClQjZSkeJeLN0dDtzzlZ2UhF9eoVKZrg/OaJ2zxQRmX7b2/ovn5eA3OTqU8qX
	eBYo08F2h+lJ9RjpEh3CoNSSuUHTAc4giqM4zEdU6Q8jKpnRI1y15iY7pQRX7THDRIue
	YaIA63GYicCM/ORK9nVX0jq+ohLj7gH0vacsbauu7hTfZnO3lRNpfiaOdhvST95oLbyS
	pikg==
X-Gm-Message-State: ALoCoQkn4IfYLAYT+Sv1EEcFM+C2fywBPXF2XrGbzcizbqe6JLiszb/SKoer/oycr9u+fuefY70k
X-Received: by 10.180.88.198 with SMTP id bi6mr3198821wib.75.1444984353715;
	Fri, 16 Oct 2015 01:32:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Fri, 16 Oct 2015 01:32:04 -0700 (PDT)
In-Reply-To: <CALbNGRTPFkfP5CRa=qH18OLX8D7qgxNQx35jOEJakfAUvXMZSw@mail.gmail.com>
References: <cover.1444392901.git.jussi.kukkonen@intel.com>
	<CALbNGRSLEKJUYXgMCdv_oB+JD++AemnvNyM8cmCqD7o26wXqeQ@mail.gmail.com>
	<CALbNGRSUht+HkkJOkv0NZ38yjcOdahPRVOhar830BbcSFYEj9Q@mail.gmail.com>
	<CAJTo0Lb+ocUQw0O=423w9MO9Tr=J64yTb==GxHzWhQgUu7=AvQ@mail.gmail.com>
	<CALbNGRTPFkfP5CRa=qH18OLX8D7qgxNQx35jOEJakfAUvXMZSw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 16 Oct 2015 11:32:04 +0300
Message-ID: <CAHiDW_E_B=4bLheE2W6DcOPKCNZRixiELGDVhfzHY8LM7CjeEw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/1] Solving the GTK+ libgl runtime dependency issue
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
X-List-Received-Date: Fri, 16 Oct 2015 08:32:38 -0000
Content-Type: multipart/alternative; boundary=f46d0443040c1c0d46052234a311

--f46d0443040c1c0d46052234a311
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 October 2015 at 20:26, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
 wrote:

> On Fri, Oct 9, 2015 at 2:20 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
> >
> > Recap of the situation as I understand it:
> > * Gtk+3 works fine without any OpenGL, if GtkGLArea is not used
> > * When GtkGLArea is used, Gtk+ uses libepoxy which is supposed
> >   dlopen the correct libraries as they are needed
> I have several gtk3+ applications that stopped working. E.G
> network-manager-applet has stopped working: running
> nm-connection-editor fails with 'Couldn't open libGL.so.1'. Same for
> parole.
>

I just realized this  as well. Gdk initialization calls epoxy which calls
exit() if libGL.so.1 is not there. This is clearly a major problem as it
happens for all GTK+ applications, not just GL users.

As an aside the reason this didn't come up before was that something seems
to cache that initialization: If I run an application with libGL.so.1 in
place once, I can then remove the library and run the application again
successfully... Not sure what's going on there but it did hide the problem
from me.

A quick workaround is setting environment variable "GDK_GL=3Ddisabled". I'm
looking at other possible fixes now.

Jussi
=E2=80=8B

--f46d0443040c1c0d46052234a311
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote">On 15 October 2015 at 20:26, An=
dreas M=C3=BCller=C2=A0<span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzelton=
y@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</s=
pan>=C2=A0wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div class=3D""><div class=3D"h5">On F=
ri, Oct 9, 2015 at 2:20 PM, Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukk=
onen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br>&gt;<br>&gt; Rec=
ap of the situation as I understand it:<br>&gt; * Gtk+3 works fine without =
any OpenGL, if GtkGLArea is not used<br>&gt; * When GtkGLArea is used, Gtk+=
 uses libepoxy which is supposed<br>&gt;=C2=A0 =C2=A0dlopen the correct lib=
raries as they are needed<br>I have several gtk3+ applications that stopped=
 working. E.G<br>network-manager-applet has stopped working: running<br>nm-=
connection-editor fails with &#39;Couldn&#39;t open libGL.so.1&#39;. Same f=
or<br>parole.<br></div></div></blockquote><div><br></div><div>I just realiz=
ed this =C2=A0as well. Gdk initialization calls epoxy which calls exit() if=
 libGL.so.1 is not there. This is clearly a major problem as it happens for=
 all GTK+ applications, not just GL users.</div><div><br></div><div>As an a=
side the reason this didn&#39;t come up before was that something seems to =
cache that initialization: If I run an application with libGL.so.1 in place=
 once, I can then remove the library and run the application again successf=
ully... Not sure what&#39;s going on there but it did hide the problem from=
 me.</div><div><br></div><div>A quick workaround is setting environment var=
iable &quot;GDK_GL=3Ddisabled&quot;. I&#39;m looking at other possible fixe=
s now.</div><div><br></div><div>Jussi</div></div>=E2=80=8B</div>

--f46d0443040c1c0d46052234a311--
