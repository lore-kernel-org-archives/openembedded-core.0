Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TOr8H-0003co-Io
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 16:31:33 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so8638367obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 07:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=qICfDji2ZfdBJ8BSNw7Ujlc41DuV8gauFhh+3217hNU=;
	b=aqULX0BK82dB+1tVD+KD9SYyRzMAWcLE/oON4fKv3MWp+J/LzEJDJI2QtWNLYowOOd
	ZHXc6a4F/M9ErvR1woiSfrv2bTaTnhFvFn0TqgF/WYDiGEIz1MVjY5v5dxOaCEx/qurh
	c973JNfAiN20J8etwiRVwz0Yw+XfSbGAZpPAf8y31Berw3x7fTbGMmNIiq4DWjDN+f/w
	DLCgxtHOursswt/vBgya6eUfxY8RXiUsxsH0WrtSKLcTYU9E+uNZ0TXJgMkRR7thzd1x
	QC7cqyCadxX/9suWVOOUUNMsl+UHgSzIy+9Chuwjm8AxuT8Lms781QME3Ax2fmC3iJa1
	g+fg==
Received: by 10.182.64.14 with SMTP id k14mr17569151obs.72.1350569893518; Thu,
	18 Oct 2012 07:18:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.12.202 with HTTP; Thu, 18 Oct 2012 07:17:53 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <0E923D60-C4AB-460F-91B8-7A45213679BF@gmail.com>
References: <CAK18fxGxttqXrLDFCQkB4_XAEuKFvf7_M1Yfie42k3mXkNqZCg@mail.gmail.com>
	<0E923D60-C4AB-460F-91B8-7A45213679BF@gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 18 Oct 2012 17:17:53 +0300
Message-ID: <CAK18fxE=jT32svCXysbHTj99gSzgXfdmqGq0POLmD--+fLv1qg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQkwWyFdWEV91gilTndqHP3Xr2mGLRrz3PuUTJF35lrBp35LnPAMw8+lZTc16oUhuamIe3Ti
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: meta-systemd base-files issue
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
X-List-Received-Date: Thu, 18 Oct 2012 14:31:33 -0000
Content-Type: multipart/alternative; boundary=14dae93a18f9bf5cbd04cc560efe

--14dae93a18f9bf5cbd04cc560efe
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 12, 2012 at 1:06 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Oct 11, 2012, at 8:36 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>
> I'm trying to get meta-systemd work with meta-oe and oe-core.
> The problem seems to be with the fstab from oe-core where /var/volatile is
> mounted as tmpfs and the directories inside never recreated. So services
> like dbus or whatever needs /var/log or var/run etc which are all symlinks
> to volatile/*, will fail. Is this a known issue? Is there any other fix
> then using a custom stab?
>
>
> its a known issue. Fix is to remove
>
> -${localstatedir}/cache link    volatile/cache
> -${localstatedir}/run   link    volatile/run
> -${localstatedir}/log   link    volatile/log
> -${localstatedir}/lock  link    volatile/lock
> -${localstatedir}/tmp   link    volatile/tmp
>
> from meta/files/fs-perms.txt
>
> I did and bug wasn't solved. The idea is that the directories inside
volatile are "not there" as long as tmpfs mounted.

P.S.: @Khem Sorry for double send.

--14dae93a18f9bf5cbd04cc560efe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Oct 12, 2012 at 1:06 AM, Khem Raj <span =
dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div style=3D"word-wrap:break-word"><br><div><div class=3D"im"><div>On Oct =
11, 2012, at 8:36 AM, Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.r=
o" target=3D"_blank">andrei@gherzan.ro</a>&gt; wrote:</div><br></div><block=
quote type=3D"cite">

<div class=3D"im">I&#39;m trying to get meta-systemd work with meta-oe and =
oe-core.</div><div>The problem seems to be with the fstab from oe-core wher=
e /var/volatile is mounted as tmpfs and the directories inside never recrea=
ted. So services like dbus or whatever needs /var/log or var/run etc which =
are all symlinks to=A0volatile/*, will fail. Is this a known issue? Is ther=
e any other fix then using a custom stab?<br clear=3D"all">

</div></blockquote><div><br></div><div>its a known issue. Fix is to remove<=
/div><div><br></div><div><div>-${localstatedir}/cache link =A0 =A0volatile/=
cache</div><div>-${localstatedir}/run =A0 link =A0 =A0volatile/run</div><di=
v>-${localstatedir}/log =A0 link =A0 =A0volatile/log</div>

<div>-${localstatedir}/lock =A0link =A0 =A0volatile/lock</div><div>-${local=
statedir}/tmp =A0 link =A0 =A0volatile/tmp</div><div><br></div><div>from=A0=
meta/files/fs-perms.txt</div></div><br><blockquote type=3D"cite"><div>

<div style=3D"text-align:center"></div></div></blockquote></div></div></blo=
ckquote></div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:13px;background-color:rgb(255,255,255)">I did and bug wasn&#39=
;t solved. The idea is that the directories inside volatile are &quot;not t=
here&quot; as long as tmpfs mounted.</span><div>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)"><br></span></div><div><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background=
-color:rgb(255,255,255)">P.S.: @Khem Sorry for double send.</span></div>


--14dae93a18f9bf5cbd04cc560efe--
