Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2188C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:59:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.3325.1750751962107108205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 00:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FdIPijMi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so115863f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 00:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750751960; x=1751356760; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jUf4/YPELJzCy/Xv0LNHbEn9pXQ0TJ6De9ceS3ajvGI=;
        b=FdIPijMiiJplMLPsPiuTCJ4Mob6uplXRPlfYktDu477C3gRPcH8DuulEVQLTuAgjMI
         JIVoBuIXpnZV9nxcTFXrFVp2yfvm/NqM7YskSODsvMyfcAwCtXCasFDHudrc8l8Z/usk
         kokfEKh6YAKtJLwpJhn1Ri2XixkToFMI8CBI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750751960; x=1751356760;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUf4/YPELJzCy/Xv0LNHbEn9pXQ0TJ6De9ceS3ajvGI=;
        b=GG+iTiLl94CJqX/rZSzfmq7MSzT52DYZjQZBbnEDxKzQYvx7wULBSBfDqEhDhJTzdy
         qnDpEPtXYwGvZyZjHdco8HYZ/vvB5lPFHcum4baTfsKTv2vwmfJWpJoL7orkAtcIfYJ0
         GpXET3d8S5A/kboQnnazDMLhT/CiCV9DGN//US25t30QsZaDqsEaRXzsZgIloE6q0XYU
         zaqZ1wLWa7+13Z5h9PeuxQCM6NxdiXn/f3bSecdOfTAcyfX191U3+vTvorljw+uv9Myc
         wn8XbBkOMCxFJjKFDIvYUG+cEz3VBY063tRgB1o27NjfBbMcG25fG2cQAcoDn1TwqZoC
         +JgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeA/iqVXZAyMpchYW8TNAaEEbV2/im5rpx1QdihpVumay6Gx1wuHTz8N58E4o+YP5JMToHlzCgK28hExSaOXfk8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9BOtC1jGx7kXa2OYKO3I6taAEbo2xt7gf/5qYNo6OBas1mcrv
	t8O1G3D1d7eVWhC5fnQMng4l66VK0QOde2Nf+h7p1S1uIvfph40Z3dfMe3QoR01Udy8=
X-Gm-Gg: ASbGncsn7PFtC0Gd5E/EJwarCfTnDQqmDFTb5WQiYDIacIUp4rhJ/5fBExcKWmpIa3W
	LqXjTm51wNOenQ32Vyvr30SG96rVxfkv1F0fg40WuE37QtgmwDqHDe7uyUXS6ouWewDXoL7E8bj
	54f8AdX/ckrZ0HzJbbj0m5qPcZB7Y05BTvsToJBJBvB8J1/a501AZcar2GjzPVe1E8zBIGFnfxI
	YJqtspC2KLfnBniO2C7Uq+XeUWxQL0ypKtjPaqhpx2vuO52D0h88ivy663j+VIvmzQQrsN9o2I2
	9vzuRCP4AaTc2WQwGIa7XHbcG8dJFTxf1ApcZFc8ajcj+voG3HoI/RrCuxotJD4mEyY80GOI/VE
	V6nVmWxiAQ+Q4HULBdWdBqORqMUPplroZjqKZnmb3zCCZ0Jik+EY=
X-Google-Smtp-Source: AGHT+IGZdaur3hPS+GjlOJ5mYl+M5xBX1DcJ+OnolLpsCN3IBXMRgoIkLtHuiNwgKcDkHhz6tuGDxA==
X-Received: by 2002:a05:6000:2102:b0:3a4:e56a:48c1 with SMTP id ffacd0b85a97d-3a6d13145a4mr11012639f8f.55.1750751960213;
        Tue, 24 Jun 2025 00:59:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:341b:1360:3bd8:8ecc? ([2001:8b0:aba:5f3c:341b:1360:3bd8:8ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8068d3fsm1259404f8f.37.2025.06.24.00.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:59:19 -0700 (PDT)
Message-ID: <fc236595167fbad1b128f73b64ec236f9e9d4164.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] host_dmesg_logger: dmesg diff on
 BuildStarted and BuildCompleted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Randy MacLeod	
 <randy.macleod@windriver.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Tue, 24 Jun 2025 08:59:18 +0100
In-Reply-To: <184BC8A6CD5551EF.5589@lists.openembedded.org>
References: <20250623171552.28824-1-gavrosc.ref@yahoo.com>
		 <20250623171552.28824-1-gavrosc@yahoo.com>
	 <184BC8A6CD5551EF.5589@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 07:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219233

On Mon, 2025-06-23 at 22:18 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Mon, 2025-06-23 at 19:15 +0200, Christos Gavros via lists.openembedded=
.org wrote:
> > This class is used to capture the host dmesg output
> > when BuildStarted and BuildCompleted. Then computes
> > a diff and prints the result.
> > Fixes [YOCTO #15557]
> >=20
> > CC: Yoann Congal <yoann.congal@smile.fr>
> > CC: Randy MacLeod <randy.macleod@windriver.com>
> > CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> > ---
> > v1->v2
> > * add in the description class's usage and drawbacks
> > * add in the description how to enable the class
> > * add spaces around "=3D"
> > * run dmesg with '-T' option
> > ---
> > =C2=A0meta/classes-global/host_dmesg_logger.bbclass | 92 ++++++++++++++=
+++++
> > =C2=A01 file changed, 92 insertions(+)
> > =C2=A0create mode 100644 meta/classes-global/host_dmesg_logger.bbclass
> >=20
> > diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/class=
es-global/host_dmesg_logger.bbclass
> > new file mode 100644
> > index 0000000000..fd4261c53d
> > --- /dev/null
> > +++ b/meta/classes-global/host_dmesg_logger.bbclass
> > @@ -0,0 +1,92 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +# This class captures the host's dmesg output at the start and complet=
ion of a build.
> > +# It stores these outputs in a variable and upon build completion, com=
putes a diff between
> > +# the two logs to detect any changes that occurred during the build pr=
ocess. It prints the diff
> > +# using bb.warn().
> > +# This class is intended to expose failures (e.g. segmentation faults)=
 that=20
> > +# are hidden or ignored by the host build system. However, it may also=
 capture
> > +# irrelevant or unimportant messages.
> > +# The user needs to have privileges to run dmesg otherwise the operati=
on is not allowed
> > +# and a warning is generated.
> > +# To enable dmesg logging, add the following to your local.conf:
> > +# INHERIT +=3D "host_dmesg_logger"
> > +
> > +def append_log(msg, d):
> > +=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0 Appends a log message to variable '_dmesg_log'
> > +=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0 current_log =3D d.getVar('_dmesg_log') or ''
> > +=C2=A0=C2=A0=C2=A0 current_log +=3D msg + '\n'
> > +=C2=A0=C2=A0=C2=A0 d.setVar('_dmesg_log', current_log)
> > +
> > +def capture_dmesg():
> > +=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0 Returns the current output of dmesg command
> > +=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0 import subprocess
> > +
> > +=C2=A0=C2=A0=C2=A0 try:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D subprocess.run([=
'dmesg', '-T'], capture_output=3DTrue, text=3DTrue, check=3DFalse)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if result.returncode !=3D 0=
:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn f"Error running dmesg: {result.stderr.strip()}"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return result.stdout
> > +=C2=A0=C2=A0=C2=A0 except Exception as e:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return f"Exception running =
dmesg: {str(e)}"
> > +
> > +addhandler hostdmesglogger_eventhandler
> > +python hostdmesglogger_eventhandler() {
> > +=C2=A0=C2=A0=C2=A0 import difflib
> > +
> > +=C2=A0=C2=A0=C2=A0 start_marker =3D "=3D=3D=3D BuildStarted dmesg =3D=
=3D=3D"
> > +=C2=A0=C2=A0=C2=A0 end_marker =3D "=3D=3D=3D BuildCompleted dmesg =3D=
=3D=3D"
> > +=C2=A0=C2=A0=C2=A0 diff_marker =3D "=3D=3D=3D dmesg diff =3D=3D=3D"
> > +
> > +=C2=A0=C2=A0=C2=A0 # execute dmesg when BuildStarted event is fired
> > +=C2=A0=C2=A0=C2=A0 if isinstance(e, bb.event.BuildStarted):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmesg_output =3D capture_dm=
esg()
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if dmesg_output.startswith(=
"Error running dmesg:") or dmesg_output.startswith("Exception running dmesg=
:"):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.=
warn(dmesg_output)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 app=
end_log(start_marker, d)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 app=
end_log(dmesg_output, d)
> > +
> > +=C2=A0=C2=A0=C2=A0 # execute dmesg when BuildCompleted event is fired
> > +=C2=A0=C2=A0=C2=A0 if isinstance(e, bb.event.BuildCompleted):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmesg_output =3D capture_dm=
esg()
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if dmesg_output.startswith(=
"Error running dmesg:") or dmesg_output.startswith("Exception running dmesg=
:"):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.=
warn(dmesg_output)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 app=
end_log(end_marker, d)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 app=
end_log(dmesg_output, d)
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 content =3D d.getVar('_dmes=
g_log') or ''
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if start_marker in content =
and end_marker in content:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
rt_dmesg =3D content.split(start_marker)[1].split(end_marker)[0]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end=
_dmesg =3D content.split(end_marker)[1]
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
rt_lines =3D start_dmesg.strip().splitlines()
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end=
_lines =3D end_dmesg.strip().splitlines()
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # g=
enerating diff between BuildStarted and BuildCompleted dmesg outputs
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dif=
f =3D list(difflib.unified_diff(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 start_lines, end_lines,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fromfile =3D 'dmesg_start',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tofile =3D 'dmesg_end',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 lineterm =3D ''
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ))
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 app=
end_log(diff_marker, d)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
diff:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for line in diff:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(line)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 els=
e:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bb.warn("No differences in dmesg output.")
>=20
> Thanks for this. I decided to test on the autobuilder by using this
> patch:
>=20
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D56c251c675=
82835bd131114e903401c169f4b7c1
>=20
> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/met=
a/conf/fragments/yocto-autobuilder/autobuilder.conf
> index e3bac34339..d698c877dc 100644
> --- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> @@ -3,6 +3,7 @@ BB_CONF_FRAGMENT_DESCRIPTION =3D "Default variables used =
on the Yocto Projects aut
> =C2=A0
> =C2=A0QEMU_USE_KVM ?=3D 'True'
> =C2=A0INHERIT +=3D 'report-error'
> +INHERIT +=3D "host_dmesg_logger"
> =C2=A0PREMIRRORS =3D ''
> =C2=A0BB_GENERATE_MIRROR_TARBALLS =3D '1'
> =C2=A0IMAGE_CLASSES +=3D 'testimage'
>=20
> I started a build and you can see 1 warning so far:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1867
>=20
> If no differences are detected, do we really want to show a warning?
> These are going to pollute the CI logs significantly and detract from
> real issues. They are useful to see that the code is running but we
> probably don't want to do that in general.


Since the builds were too noisy with the warning about no differences,
I ran a second build with that line commented out.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1868

As you can see, there were still a lot of warnings, enough that it is
hard to spot the real issues compared to the ones that aren't
important.

For example, this one:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/1886/ste=
ps/23/logs/warnings
"stdio: WARNING: +[Mon Jun 23 23:21:37 2025] hrtimer: interrupt took 7320 n=
s"

isn't really anything we can do anything about.

Similiarly:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/1924/ste=
ps/14/logs/warnings
"stdio: WARNING: +[Mon Jun 23 23:54:18 2025] workqueue: inode_switch_wbs_wo=
rk_fn hogged CPU for >10000us 4 times, consider switching to WQ_UNBOUND"

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1906
stdio: WARNING: +[Mon Jun 23 23:16:39 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap1: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:16:39 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap2: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:16:40 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap0: link becomes ready

which we see any time qemu starts/stops using a device.

Similiarly, this one is quite long but nothing we can do much about:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/1930
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap2: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap4: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap5: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap7: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap10: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap8: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap11: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap14: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:54 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap15: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:55 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap12: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:55 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap13: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:55 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap9: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:55 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap1: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:55 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap3: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:12:56 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap6: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:13:32 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap17: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:13:32 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap18: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:13:35 2025] IPv6: ADDRCONF(NETDEV_CHANGE): =
tap16: link becomes ready
stdio: WARNING: +[Mon Jun 23 23:16:06 2025] hrtimer: interrupt took 1480 ns

However there is an issue here:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1900

stdio: WARNING: +[Mon Jun 23 23:24:20 2025] rustc[2793145]: segfault at 7d8=
5a57fef60 ip 00007d85ace75881 sp 00007d85a57fef60 error 6 in librustc_drive=
r-2c391d96288416bb.so[7d85a72c0000+6246000] likely on CPU 23 (core 53, sock=
et 0)
stdio: WARNING: +[Mon Jun 23 23:24:20 2025] Code: b5 13 03 48 89 df e8 be a=
f 44 fa 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 55 41 57 41 56 41 55 41 5=
4 53 48 81 ec b8 00 00 00 <48> 89 34 24 49 89 ff 4c 8b 2f 49 83 fd 02 0f 84=
 dc 00 00 00 49 83
stdio: WARNING: +[Mon Jun 23 23:24:20 2025] rustc[2793415]: segfault at 761=
e429fee20 ip 0000761e49d83872 sp 0000761e429fee10 error 6 in librustc_drive=
r-2c391d96288416bb.so[761e444c0000+6246000] likely on CPU 65 (core 21, sock=
et 0)
stdio: WARNING: +[Mon Jun 23 23:24:20 2025] Code: 84 00 00 00 00 00 66 90 5=
5 41 57 41 56 41 55 41 54 53 48 81 ec b8 06 00 00 48 8b 9e b8 00 00 00 80 4=
e 64 10 49 89 d4 49 89 fe <48> 89 74 24 10 0f b6 86 a8 00 00 00 83 f8 22 74=
 1e 83 f8 23 0f 85
stdio: WARNING: +[Mon Jun 23 23:24:20 2025] rustc[2792864]: segfault at 733=
6b89fef50 ip 00007336bf403241 sp 00007336b89fef40 error 6 in librustc_drive=
r-2c391d96288416bb.so[7336ba4c0000+6246000] likely on CPU 91 (core 41, sock=
et 0)
stdio: WARNING: +[Mon Jun 23 23:24:20 2025] Code: 48 8d 7c 24 40 e8 8f 9d f=
f ff 48 89 df e8 f7 d5 0b fb ff 15 49 98 d9 03 90 55 41 57 41 56 41 55 41 5=
4 53 48 81 ec 18 02 00 00 <4c> 89 44 24 10 48 89 cb 89 94 24 b0 00 00 00 49=
 89 f7 48 89 7c 24
stdio: WARNING: +[Mon Jun 23 23:24:21 2025] rustc[2792945]: segfault at 7b4=
c847fefe0 ip 00007b4c8b003241 sp 00007b4c847fefd0 error 6 in librustc_drive=
r-2c391d96288416bb.so[7b4c860c0000+6246000] likely on CPU 46 (core 44, sock=
et 0)
stdio: WARNING: +[Mon Jun 23 23:24:21 2025] Code: 48 8d 7c 24 40 e8 8f 9d f=
f ff 48 89 df e8 f7 d5 0b fb ff 15 49 98 d9 03 90 55 41 57 41 56 41 55 41 5=
4 53 48 81 ec 18 02 00 00 <4c> 89 44 24 10 48 89 cb 89 94 24 b0 00 00 00 49=
 89 f7 48 89 7c 24
stdio: WARNING: +[Mon Jun 23 23:24:24 2025] rustc[2792678]: segfault at 731=
2ff7fff80 ip 000073130ad372c9 sp 00007312ff7fff80 error 6 in librustc_drive=
r-2c391d96288416bb.so[7313058c0000+6246000] likely on CPU 64 (core 20, sock=
et 0)
stdio: WARNING: +[Mon Jun 23 23:24:24 2025] Code: 00 00 48 89 b4 24 c8 00 0=
0 00 48 39 ca 0f 85 97 06 00 00 49 89 d6 49 89 f7 48 89 fb 0f b6 86 f5 00 0=
0 00 0f b6 8e f7 00 00 00 <48> 89 14 24 88 4c 24 08 88 44 24 09 48 89 e6 4c=
 89 ff e8 e0 d1 fe

The question is therefore going to be how to filter this down to
something useful, and/or how to save the data so we can work on
reducing these issues over time?

The data is useful to have, and over time we should look for and fix
these segfaults and so on but we can't have this level of warnings on
the builds.

Cheers,

Richard





