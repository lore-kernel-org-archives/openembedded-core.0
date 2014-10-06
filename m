Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6F24270734
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 08:58:33 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id id10so2776706vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=72w77GURxF+Gpix4CY15OOoz5wNEHCBLr1wsW331QjM=;
	b=RSPZ0yRx2gkXRiKRXDZVnnApc84vV9poFJi4OJgJG1o0VLcvPxDo/OR97L/lIqDhJp
	I3StmCxpWdctt9jkF9GUC43uBAVNfC7nIFa39++VHGz9cdysUxdgJ2uTqnESnxSq5cqc
	CItPA8iIpx0x+depwoijAB4sIrCO7cLVl9cEXLvKgSb6t2o24lL9xWl6wt9HvF2sKz0O
	kSaRQ72blx6Y5T0LZMJEc24+61JU87I/Le/57LHlmsQWKqhVLFWmzOh43jhkhVZ1fP+9
	8BKfC4m94LNvfurp8HZKJSBNkpmo14kqwcnRptuBUws4Md5tLAqQUCNKIXEd4XA0amkb
	lW2w==
MIME-Version: 1.0
X-Received: by 10.220.20.5 with SMTP id d5mr17455839vcb.9.1412585914692; Mon,
	06 Oct 2014 01:58:34 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Mon, 6 Oct 2014 01:58:34 -0700 (PDT)
In-Reply-To: <20141002150515.GH25706@jama>
References: <cover.1410177322.git.ross.burton@intel.com>
	<0d89eb7181ce4f386f585597b9f04e786b759434.1410177322.git.ross.burton@intel.com>
	<CALbNGRQAAGk9PM=E=DReoY36OtZh8WTBgRTxoovtXWpJeKudLg@mail.gmail.com>
	<20141002150515.GH25706@jama>
Date: Mon, 6 Oct 2014 10:58:34 +0200
Message-ID: <CALbNGRQmhEJi1hL8UV=hoMwEnvP0B1OvHh7xv=8wFs5N1O272Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/27] qemu.bbclass: add -r ${OLDEST_KERNEL} parameter
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
X-List-Received-Date: Mon, 06 Oct 2014 08:58:41 -0000
Content-Type: multipart/alternative; boundary=001a11c334f2a8f84d0504bd4918

--001a11c334f2a8f84d0504bd4918
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2014 at 5:05 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:

> On Thu, Oct 02, 2014 at 11:22:11AM +0200, Andreas M=C3=BCller wrote:
> > On Mon, Sep 8, 2014 at 1:58 PM, Ross Burton <ross.burton@intel.com>
> wrote:
> >
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > >
> > > * in some cases (e.g. with external toolchain which doesn't respect o=
ur
> > >   reasonably old version set in OLDEST_KERNEL) it's possible to have
> libc
> > >   which requires newer kernel than what we have on builders, qemu
> supports
> > >   -r param to use different uname than what's returned by host system=
.
> > > * change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the same
> to
> > >   QEMU_OPTIONS which are used by qemuwrapper-cross
> > > * maybe we should eventually convert all qemu_run_binary usages alway=
s
> > > include
> > >   qemuwrapper-cross dependency and always call qemu through that (it
> > >   seems very strange that qemu_target_binary is called from qemuwrapp=
er
> > >   and for allarch recipes it can return qemu-allarch as qemu binary).
> > >
> > >   qemu_run_binary is used by:
> > >   meta/classes/gtk-immodules-cache.bbclass:
> > > ${@qemu_run_binary(d, '$D',
> '${bindir}/gtk-query-immodules-$maj_ver.0')} \
> > >   meta/classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path,
> binary):
> > >   meta/recipes-core/systemd/systemd_213.bb:
>  ${@qemu_run_binary(d,
> > > '$D', '${base_bindir}/udevadm')} hwdb --update \
> > >   meta/recipes-graphics/pango/pango.inc:    ${@qemu_run_binary(d,
> > > '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
> > >
> > >   and qemuwrapper directly by:
> > >   scripts/postinst-intercepts/update_font_cache:PSEUDO_UNLOAD=3D1
> > > qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}=
\
> > >   scripts/postinst-intercepts/update_pixbuf_cache:PSEUDO_UNLOAD=3D1
> > > qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}=
\
> > >
> > > Somehow related but I don't understand fully yet:
> >
> > do_rootfs complains:
> > NOTE: > Executing update_pixbuf_cache intercept ...
> > FATAL: kernel too old
> > WARNING: The postinstall intercept hook 'update_pixbuf_cache' failed
> (exit
> > code: 127)! See log for details!
> >
> > and many other 'kernel too old' messages. Target kernel is 3.14.19 / Ho=
st
> > is 3.14.17. Too old?
>
> What is your OLDEST_KERNEL value? and what does "file" show as required
> kernel on those binaries?
>
>
> Thanks: Angstrom sets 2.6.16 and file says 'for GNU/Linux 2.6.32'. Will
send out a patch to angstrom after testing

Andreas

--001a11c334f2a8f84d0504bd4918
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Oct 2, 2014 at 5:05 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
><div>On Thu, Oct 02, 2014 at 11:22:11AM +0200, Andreas M=C3=BCller wrote:<=
br>
&gt; On Mon, Sep 8, 2014 at 1:58 PM, Ross Burton &lt;<a href=3D"mailto:ross=
.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; &gt; From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; * in some cases (e.g. with external toolchain which doesn&#39;t r=
espect our<br>
&gt; &gt;=C2=A0 =C2=A0reasonably old version set in OLDEST_KERNEL) it&#39;s=
 possible to have libc<br>
&gt; &gt;=C2=A0 =C2=A0which requires newer kernel than what we have on buil=
ders, qemu supports<br>
&gt; &gt;=C2=A0 =C2=A0-r param to use different uname than what&#39;s retur=
ned by host system.<br>
&gt; &gt; * change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the =
same to<br>
&gt; &gt;=C2=A0 =C2=A0QEMU_OPTIONS which are used by qemuwrapper-cross<br>
&gt; &gt; * maybe we should eventually convert all qemu_run_binary usages a=
lways<br>
&gt; &gt; include<br>
&gt; &gt;=C2=A0 =C2=A0qemuwrapper-cross dependency and always call qemu thr=
ough that (it<br>
&gt; &gt;=C2=A0 =C2=A0seems very strange that qemu_target_binary is called =
from qemuwrapper<br>
&gt; &gt;=C2=A0 =C2=A0and for allarch recipes it can return qemu-allarch as=
 qemu binary).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0qemu_run_binary is used by:<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/gtk-immodules-cache.bbclass:<br>
&gt; &gt; ${@qemu_run_binary(d, &#39;$D&#39;, &#39;${bindir}/gtk-query-immo=
dules-$maj_ver.0&#39;)} \<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/qemu.bbclass:def qemu_run_binary(data, r=
ootfs_path, binary):<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_2=
13.bb" target=3D"_blank">systemd_213.bb</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@qemu_run_binary(d,<br>
&gt; &gt; &#39;$D&#39;, &#39;${base_bindir}/udevadm&#39;)} hwdb --update \<=
br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-graphics/pango/pango.inc:=C2=A0 =C2=A0 $=
{@qemu_run_binary(d,<br>
&gt; &gt; &#39;$D&#39;,&#39;${bindir}/${MLPREFIX}pango-querymodules&#39;)} =
\<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0and qemuwrapper directly by:<br>
&gt; &gt;=C2=A0 =C2=A0scripts/postinst-intercepts/update_font_cache:PSEUDO_=
UNLOAD=3D1<br>
&gt; &gt; qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_lib=
dir}\<br>
&gt; &gt;=C2=A0 =C2=A0scripts/postinst-intercepts/update_pixbuf_cache:PSEUD=
O_UNLOAD=3D1<br>
&gt; &gt; qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_lib=
dir}\<br>
&gt; &gt;<br>
&gt; &gt; Somehow related but I don&#39;t understand fully yet:<br>
&gt;<br>
&gt; do_rootfs complains:<br>
&gt; NOTE: &gt; Executing update_pixbuf_cache intercept ...<br>
&gt; FATAL: kernel too old<br>
&gt; WARNING: The postinstall intercept hook &#39;update_pixbuf_cache&#39; =
failed (exit<br>
&gt; code: 127)! See log for details!<br>
&gt;<br>
&gt; and many other &#39;kernel too old&#39; messages. Target kernel is 3.1=
4.19 / Host<br>
&gt; is 3.14.17. Too old?<br>
<br>
</div></div>What is your OLDEST_KERNEL value? and what does &quot;file&quot=
; show as required<br>
kernel on those binaries?<br>
<span><font color=3D"#888888"><br><br>
</font></span></blockquote></div>Thanks: Angstrom sets 2.6.16 and file says=
 &#39;for GNU/Linux 2.6.32&#39;. Will send out a patch to angstrom after te=
sting<br><br></div><div class=3D"gmail_extra">Andreas<br></div></div>

--001a11c334f2a8f84d0504bd4918--
