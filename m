Return-Path: <rewitt@declaratino.com>
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4937197E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:30:20 +0000 (UTC)
Received: from mail-lf0-f41.google.com ([209.85.215.41])
	by :SMTPAUTH: with SMTP
	id Pc57cclUPIBqWPc58cY3tu; Fri, 06 Jan 2017 14:29:50 -0700
Received: by mail-lf0-f41.google.com with SMTP id v186so7220264lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 13:29:49 -0800 (PST)
X-Gm-Message-State: AIkVDXLnqZkVxdp700/AeC50bCf7YXzpqbU3lZWX/PhxcMMURluxKdA0Ug79B22GNOzuE8nhJUVWHEKcxXsCJQ==
X-Received: by 10.25.159.78 with SMTP id i75mr27216904lfe.123.1483738188891;
	Fri, 06 Jan 2017 13:29:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.223.84 with HTTP; Fri, 6 Jan 2017 13:29:18 -0800 (PST)
In-Reply-To: <1483730551.4383.19.camel@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
	<CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
	<1483730551.4383.19.camel@intel.com>
From: Randy Witt <rewitt@declaratino.com>
Date: Fri, 6 Jan 2017 13:29:18 -0800
X-Gmail-Original-Message-ID: <CAP5N7XH56aXsVvqVns=Pa4mbmHOZvGecD638nApM94LHibpDqQ@mail.gmail.com>
Message-ID: <CAP5N7XH56aXsVvqVns=Pa4mbmHOZvGecD638nApM94LHibpDqQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-CMAE-Envelope: MS4wfGEks+72Udt7jZkIyXGs+JfA1hggl7xZ3FM1EZXkEGIJqr3os1Yn0IAJYWwEj7J77Q4Zn4+3ecWTETAWGLgXIDstoEJ8yQq0JqZdYD5A+3+TVxA3NPmj
	O3qCH8I6lnEsJsKekKSwudli7NHsLZWkzHB7wHKewvMppKxsehr+rgfN+R64cT6Qm6r1f+aIWsC3MzGLT4RruDg/C/YviX0adII=
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
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
X-List-Received-Date: Fri, 06 Jan 2017 21:30:21 -0000
Content-Type: multipart/alternative; boundary=001a114116e6b04d04054573b775

--001a114116e6b04d04054573b775
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 6, 2017 at 11:22 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Fri, 2017-01-06 at 10:31 -0800, Randy Witt wrote:
>
> >
> > I'd rather see this be a new class independent from rm_work. People
> > can always in inherit both rm_work and rm_download.
>
> I'm not sure whether it's worth supporting that mode: what would be the
> motivation for removing downloads, but not the work directory?
>
>
There are times that the work directories help with the debugging of build
failures. The logs aren't always enough. So a person might want to do
something like remove the downloads, but preserve the actual work,
especially in the case of failures.

I'll admit it is a fabricated scenario, but in general I'm against one knob
requiring the turning of another knob.


> The motivation for rm_work_and_downloads.bbclass is the same as for
> rm_work.bbclass: reducing the required disk space *during* the build, to
> get builds to succeed which otherwise would run out of disk space.
>
>
Disk space isn't the only motivation for rm_work. It also allows for
deletion of large amounts of inodes before they've been flushed to disk. So
rather than taking minutes worth of time to clean up post build, and
thrashing media that other tasks may be using, it is almost instantaneous
because everything is still in the page cache.

Also the build itself can be faster for the same reason, there is no
waiting for data to be flushed out to disk( because it was deleted while
still in the page cache) and thus impacting reads in other parts of the
build.


> A "rm -rf downloads" at the end of the build doesn't help achieve that
> goal.
>
>
That's true, I hadn't yet processed it completely. Ignore that comment. :)

As an overall comment though, I really like the idea of rm_work not being
deferred for so long. It always seemed strange to me to see the thundering
herd of rm_works after certain do_builds would finish.

--001a114116e6b04d04054573b775
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 6, 2017 at 11:22 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a =
href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Fri, =
2017-01-06 at 10:31 -0800, Randy Witt wrote:<br>
<br>
&gt;<br>
&gt; I&#39;d rather see this be a new class independent from rm_work. Peopl=
e<br>
&gt; can always in inherit both rm_work and rm_download.<br>
<br>
</span>I&#39;m not sure whether it&#39;s worth supporting that mode: what w=
ould be the<br>
motivation for removing downloads, but not the work directory?<br>
<br></blockquote><div><br></div><div>There are times that the work director=
ies help with the debugging of build failures. The logs aren&#39;t always e=
nough. So a person might want to do something like remove the downloads, bu=
t preserve the actual work, especially in the case of failures.</div><div><=
br></div><div>I&#39;ll admit it is a fabricated scenario, but in general I&=
#39;m against one knob requiring the turning of another knob.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">The motivation for rm_work_and_down=
loads.bbclass is the same as for<br>
rm_work.bbclass: reducing the required disk space *during* the build, to<br=
>
get builds to succeed which otherwise would run out of disk space.<br>
<br></blockquote><div><br></div><div>Disk space isn&#39;t the only motivati=
on for rm_work. It also allows for deletion of large amounts of inodes befo=
re they&#39;ve been flushed to disk. So rather than taking minutes worth of=
 time to clean up post build, and thrashing media that other tasks may be u=
sing, it is almost instantaneous because everything is still in the page ca=
che.</div><div><br></div><div>Also the build itself can be faster for the s=
ame reason, there is no waiting for data to be flushed out to disk( because=
 it was deleted while still in the page cache) and thus impacting reads in =
other parts of the build.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
A &quot;rm -rf downloads&quot; at the end of the build doesn&#39;t help ach=
ieve that<br>
goal.<br>
<span class=3D"m_7274032114801509996HOEnZb"><font color=3D"#888888"><br></f=
ont></span></blockquote><div><br></div><div>That&#39;s true, I hadn&#39;t y=
et processed it completely. Ignore that comment. :)</div><div><br></div><di=
v>As an overall comment though, I really like the idea of rm_work not being=
 deferred for so long. It always seemed strange to me to see the thundering=
 herd of rm_works after certain do_builds would finish.</div><div>=C2=A0</d=
iv><div><br></div></div></div></div>

--001a114116e6b04d04054573b775--
