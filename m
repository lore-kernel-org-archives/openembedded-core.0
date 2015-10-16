Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id D2072770E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 12:27:54 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so12647674igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=VnkuDcPrBeysj5wT/OruNSxhNphuEsYBkYCnknH/NUo=;
	b=hLlqj8LzZ1rQerfw4T3bQzho2nloZEdM/IH8YgXbr07gBaFaXox4qe18tqlDdoHknl
	F5mhc/z5l5TOi1NGoNzFhFKEhjtwGWOWJlvcnwtsJgydn2VcWzKGCc5sJYOuEiP9AxWn
	WgJdvIGLMui620GTSW2DhUToLZ1rOA3TkGtygSSqHaIRgO5Z0ZPqwB5CU7S4jSalU8Tz
	3g7I1GljnuY6iX0vAfFPKF00RsUd63lj11uNXtvubj8q7+y300qs4Zplj9MgYTG9T0jI
	ZrUyLMJ/SLXAKsl2OL967xe0Cysk9c65/HBxvS+ixwXX/tJsWWl4mj2hIzLzaXLksN1B
	fLOw==
MIME-Version: 1.0
X-Received: by 10.50.50.238 with SMTP id f14mr1837683igo.64.1444998474532;
	Fri, 16 Oct 2015 05:27:54 -0700 (PDT)
Received: by 10.36.98.143 with HTTP; Fri, 16 Oct 2015 05:27:54 -0700 (PDT)
In-Reply-To: <CAHiDW_E_B=4bLheE2W6DcOPKCNZRixiELGDVhfzHY8LM7CjeEw@mail.gmail.com>
References: <cover.1444392901.git.jussi.kukkonen@intel.com>
	<CALbNGRSLEKJUYXgMCdv_oB+JD++AemnvNyM8cmCqD7o26wXqeQ@mail.gmail.com>
	<CALbNGRSUht+HkkJOkv0NZ38yjcOdahPRVOhar830BbcSFYEj9Q@mail.gmail.com>
	<CAJTo0Lb+ocUQw0O=423w9MO9Tr=J64yTb==GxHzWhQgUu7=AvQ@mail.gmail.com>
	<CALbNGRTPFkfP5CRa=qH18OLX8D7qgxNQx35jOEJakfAUvXMZSw@mail.gmail.com>
	<CAHiDW_E_B=4bLheE2W6DcOPKCNZRixiELGDVhfzHY8LM7CjeEw@mail.gmail.com>
Date: Fri, 16 Oct 2015 14:27:54 +0200
Message-ID: <CALbNGRQUa0X=+oFF_3oTeWAgipeLjVK0svcxM8Tt0xkWpWexLQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:27:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 10:32 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 15 October 2015 at 20:26, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
> wrote:
>>
>> On Fri, Oct 9, 2015 at 2:20 PM, Jussi Kukkonen <jussi.kukkonen@intel.com=
>
>> wrote:
>> >
>> > Recap of the situation as I understand it:
>> > * Gtk+3 works fine without any OpenGL, if GtkGLArea is not used
>> > * When GtkGLArea is used, Gtk+ uses libepoxy which is supposed
>> >   dlopen the correct libraries as they are needed
>> I have several gtk3+ applications that stopped working. E.G
>> network-manager-applet has stopped working: running
>> nm-connection-editor fails with 'Couldn't open libGL.so.1'. Same for
>> parole.
>
>
> I just realized this  as well. Gdk initialization calls epoxy which calls
> exit() if libGL.so.1 is not there. This is clearly a major problem as it
> happens for all GTK+ applications, not just GL users.
>
> As an aside the reason this didn't come up before was that something seem=
s
> to cache that initialization: If I run an application with libGL.so.1 in
> place once, I can then remove the library and run the application again
> successfully... Not sure what's going on there but it did hide the proble=
m
> from me.
>
> A quick workaround is setting environment variable "GDK_GL=3Ddisabled". I=
'm
> looking at other possible fixes now.
>
> Jussi
1. Thanks for taking care
2. I can confirm GDK_GL=3Ddisabled makes application start properly.
Same: this setting seems to be cached also as tested with following
sequence:
| GDK_GL=3Ddisabled nm-connection-editor -> starts
| nm-connection-editor -> starts too
3. The images I had in mind which considered working did work only
because of libgl installed

Andreas

