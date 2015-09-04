Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8094F77016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:19:06 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so12604165wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=onB8Ao4bkNZ0TjEK0YAZFMJ46ckVwJzgFU7N28JR/1E=;
	b=gZoNtNiMK5L2JqqeOwxLO/QlAGqro3W4B8uiKuTLEwY7V8pVTKwraoA4+Zmgn13rRX
	z+YLqTAVob803goZlaJIJr30G42WxBrtPmMX2UoD+SpC/vexjhaDw0Hq7ZUgWhfLx+po
	9xdEjya86UCXunvstaUa4P8bWH4V6J2t0uTAfGLzA4dMJhkbSwZ7nFg9xtH4xi/Pw58D
	53zgZ9Workn7wxDBr7f6C1kTkOrUDhhC97EgbigsjxZyke4bmSmMKW2WmBEshPjOQHU/
	nE8+jMZZw/AxUmrV+8AiKWwnHe4qpbxJ1F+xbV7bMxAqz944NakXSlGDACaVQ2dWWtc+
	91HA==
X-Gm-Message-State: ALoCoQnTg+mNvBhvw4hFViK4WbWsuSm3mXYENPWnLO5geSE7K4NR+qbU4Hf/e5HnScyQBiUruhe0
X-Received: by 10.194.7.106 with SMTP id i10mr4410286wja.86.1441351146506;
	Fri, 04 Sep 2015 00:19:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Fri, 4 Sep 2015 00:18:37 -0700 (PDT)
In-Reply-To: <1441348974.9573.42.camel@intel.com>
References: <1441348974.9573.42.camel@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 4 Sep 2015 10:18:37 +0300
Message-ID: <CAHiDW_FhSvkAAUN80W0h4cape+Wbb_xTNONGMRbrTE0UL8-KQg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: oe-init-build-env slowdown: chmod -R
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
X-List-Received-Date: Fri, 04 Sep 2015 07:19:08 -0000
Content-Type: multipart/alternative; boundary=047d7b5d27ce15a7d2051ee6b77d

--047d7b5d27ce15a7d2051ee6b77d
Content-Type: text/plain; charset=UTF-8

On 4 September 2015 at 09:42, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Hello!
>
> The following commit introduced a "chmod -R -st" on the build dir:
>
> commit f0d3587706fffdcc1c708013f6d6ce296dfc5f24
> Author: Alex Franco <alejandro.franco@linux.intel.com>
> Date:   Fri Aug 28 17:34:04 2015 -0500
>
>     Fix mode +st on TMPDIR when creating it
>
>     A sanity check fails when TMPDIR has setuid, setgid set. It was
>     proposed to fix this on TMPDIR creation instead of failing with
>     a sanity test only. This patch handles removal of those special
>     bits (and additonally, the sticky bit) from BUILDDIR and TMPDIR
>     when these directories are created.
>
> In my case (*), that chmod takes about 2 minutes to complete. strace
> shows that it does a fchmodat on all files, even if nothing needs to be
> changed. atop then shows that this keeps the disk 100% busy with writes.
> I don't know what gets written (can't be the access time, I tried
> mounting with noatime).
>
> Are others seeing the same behavior? I can't rule out that my disk is
> just slow due to fragmentation.
>

 d8caef4f6 in master should fix this (and yes it was a problem elsewhere
too -- an autobuilder was seen spending 12 minutes on that).

Jussi

--047d7b5d27ce15a7d2051ee6b77d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 4 September 2015 at 09:42, Patrick Ohly <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex">Hello!<br>
<br>
The following commit introduced a &quot;chmod -R -st&quot; on the build dir=
:<br>
<br>
commit f0d3587706fffdcc1c708013f6d6ce296dfc5f24<br>
Author: Alex Franco &lt;<a href=3D"mailto:alejandro.franco@linux.intel.com"=
>alejandro.franco@linux.intel.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Aug 28 17:34:04 2015 -0500<br>
<br>
=C2=A0 =C2=A0 Fix mode +st on TMPDIR when creating it<br>
<br>
=C2=A0 =C2=A0 A sanity check fails when TMPDIR has setuid, setgid set. It w=
as<br>
=C2=A0 =C2=A0 proposed to fix this on TMPDIR creation instead of failing wi=
th<br>
=C2=A0 =C2=A0 a sanity test only. This patch handles removal of those speci=
al<br>
=C2=A0 =C2=A0 bits (and additonally, the sticky bit) from BUILDDIR and TMPD=
IR<br>
=C2=A0 =C2=A0 when these directories are created.<br>
<br>
In my case (*), that chmod takes about 2 minutes to complete. strace<br>
shows that it does a fchmodat on all files, even if nothing needs to be<br>
changed. atop then shows that this keeps the disk 100% busy with writes.<br=
>
I don&#39;t know what gets written (can&#39;t be the access time, I tried<b=
r>
mounting with noatime).<br>
<br>
Are others seeing the same behavior? I can&#39;t rule out that my disk is<b=
r>
just slow due to fragmentation.<br></blockquote><div><br></div><div>=C2=A0d=
8caef4f6 in master should fix this (and yes it was a problem elsewhere too =
-- an autobuilder was seen spending 12 minutes on that).</div><div><br></di=
v><div>Jussi</div></div></div></div>

--047d7b5d27ce15a7d2051ee6b77d--
