Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4416FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 09:22:10 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id hq11so1082860vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2vRE/2jns1X24xzPv0dWgmILN5biqEKq4pIAsD0utig=;
	b=C8tC1oXOICQBZtZiqMQzQG4cVkwlO59qBnt9eIBNvL4jOSCsTBfQq1YT8U1ljO8Edb
	KY0BYHWQYDE36yK6/tz8b/Dkq+VRJHOm8j+vFL0Di2ybEmOkeU74NwrglX5mcruwAoHK
	ZsDvdpxLpJ+YKtPmW/Iw3IXJ9XTJb2Uld+hed4mpz++4KHATP+XPUXM2PJwX616SpIsH
	ZAxT8d2lcKefuCDwN6Kb+4zD9yNcBBKu8avCptkhjjCmcTTVHgLvxfGtAczRXGVaw8l4
	3tk657AbII+MK5MRVlR4HTObww8ID2kWg7WF5lN3+SVadEZZmWMYgBOQANPXKoCoFMsC
	sL1g==
MIME-Version: 1.0
X-Received: by 10.220.133.1 with SMTP id d1mr28823893vct.5.1412241731400; Thu,
	02 Oct 2014 02:22:11 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Thu, 2 Oct 2014 02:22:11 -0700 (PDT)
In-Reply-To: <0d89eb7181ce4f386f585597b9f04e786b759434.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
	<0d89eb7181ce4f386f585597b9f04e786b759434.1410177322.git.ross.burton@intel.com>
Date: Thu, 2 Oct 2014 11:22:11 +0200
Message-ID: <CALbNGRQAAGk9PM=E=DReoY36OtZh8WTBgRTxoovtXWpJeKudLg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ross Burton <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 02 Oct 2014 09:22:14 -0000
Content-Type: multipart/alternative; boundary=001a11362742bcbaaa05046d2696

--001a11362742bcbaaa05046d2696
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 8, 2014 at 1:58 PM, Ross Burton <ross.burton@intel.com> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> * in some cases (e.g. with external toolchain which doesn't respect our
>   reasonably old version set in OLDEST_KERNEL) it's possible to have libc
>   which requires newer kernel than what we have on builders, qemu supports
>   -r param to use different uname than what's returned by host system.
> * change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the same to
>   QEMU_OPTIONS which are used by qemuwrapper-cross
> * maybe we should eventually convert all qemu_run_binary usages always
> include
>   qemuwrapper-cross dependency and always call qemu through that (it
>   seems very strange that qemu_target_binary is called from qemuwrapper
>   and for allarch recipes it can return qemu-allarch as qemu binary).
>
>   qemu_run_binary is used by:
>   meta/classes/gtk-immodules-cache.bbclass:
> ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
>   meta/classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path, binary):
>   meta/recipes-core/systemd/systemd_213.bb:         ${@qemu_run_binary(d,
> '$D', '${base_bindir}/udevadm')} hwdb --update \
>   meta/recipes-graphics/pango/pango.inc:    ${@qemu_run_binary(d,
> '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
>
>   and qemuwrapper directly by:
>   scripts/postinst-intercepts/update_font_cache:PSEUDO_UNLOAD=1
> qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
>   scripts/postinst-intercepts/update_pixbuf_cache:PSEUDO_UNLOAD=1
> qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
>
> Somehow related but I don't understand fully yet:

do_rootfs complains:
NOTE: > Executing update_pixbuf_cache intercept ...
FATAL: kernel too old
WARNING: The postinstall intercept hook 'update_pixbuf_cache' failed (exit
code: 127)! See log for details!

and many other 'kernel too old' messages. Target kernel is 3.14.19 / Host
is 3.14.17. Too old?

Andreas

--001a11362742bcbaaa05046d2696
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Sep 8, 2014 at 1:58 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: M=
artin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmai=
l.com</a>&gt;<br>
<br>
* in some cases (e.g. with external toolchain which doesn&#39;t respect our=
<br>
=C2=A0 reasonably old version set in OLDEST_KERNEL) it&#39;s possible to ha=
ve libc<br>
=C2=A0 which requires newer kernel than what we have on builders, qemu supp=
orts<br>
=C2=A0 -r param to use different uname than what&#39;s returned by host sys=
tem.<br>
* change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the same to<br=
>
=C2=A0 QEMU_OPTIONS which are used by qemuwrapper-cross<br>
* maybe we should eventually convert all qemu_run_binary usages always incl=
ude<br>
=C2=A0 qemuwrapper-cross dependency and always call qemu through that (it<b=
r>
=C2=A0 seems very strange that qemu_target_binary is called from qemuwrappe=
r<br>
=C2=A0 and for allarch recipes it can return qemu-allarch as qemu binary).<=
br>
<br>
=C2=A0 qemu_run_binary is used by:<br>
=C2=A0 meta/classes/gtk-immodules-cache.bbclass:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ${@qemu_run_binary(d, &#39;$D&#39;, &#39;${bindir}/gtk-query=
-immodules-$maj_ver.0&#39;)} \<br>
=C2=A0 meta/classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path, bin=
ary):<br>
=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_213.bb" target=
=3D"_blank">systemd_213.bb</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@qemu_ru=
n_binary(d, &#39;$D&#39;, &#39;${base_bindir}/udevadm&#39;)} hwdb --update =
\<br>
=C2=A0 meta/recipes-graphics/pango/pango.inc:=C2=A0 =C2=A0 ${@qemu_run_bina=
ry(d, &#39;$D&#39;,&#39;${bindir}/${MLPREFIX}pango-querymodules&#39;)} \<br=
>
<br>
=C2=A0 and qemuwrapper directly by:<br>
=C2=A0 scripts/postinst-intercepts/update_font_cache:PSEUDO_UNLOAD=3D1 qemu=
wrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}\<br>
=C2=A0 scripts/postinst-intercepts/update_pixbuf_cache:PSEUDO_UNLOAD=3D1 qe=
muwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}\<br>
<br></blockquote></div>Somehow related but I don&#39;t understand fully yet=
:<br><br></div><div class=3D"gmail_extra">do_rootfs complains:<br>NOTE: &gt=
; Executing update_pixbuf_cache intercept ...<br>FATAL: kernel too old<br>W=
ARNING: The postinstall intercept hook &#39;update_pixbuf_cache&#39; failed=
 (exit code: 127)! See log for details!<br><br></div><div class=3D"gmail_ex=
tra">and many other &#39;kernel too old&#39; messages. Target kernel is 3.1=
4.19 / Host is 3.14.17. Too old?<br><br></div><div class=3D"gmail_extra">An=
dreas<br></div></div>

--001a11362742bcbaaa05046d2696--
