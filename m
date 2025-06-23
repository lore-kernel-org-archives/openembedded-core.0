Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C60C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 21:18:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.6376.1750713498427367874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 14:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bD4aSohS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2226169f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 14:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750713497; x=1751318297; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QN02mgXEySBV6vkVPBJV95hnvXvQWpjuNDx5ZR+MVwg=;
        b=bD4aSohSREB3RT7BKMvG9k/P3NpinsPh6aOzV74B0nntBh3Vd2kaXi1WoSTd8Wk1uj
         0T6lF2QyriOvhKo3BzjRxe7QsoLhxB1LFTPQdmccnEs3h/4zIV0OpyivlhaZP5FCiJEM
         4Kerz8AUqwvTilpWh/euqhaydbOEhxx4ag7eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750713497; x=1751318297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QN02mgXEySBV6vkVPBJV95hnvXvQWpjuNDx5ZR+MVwg=;
        b=Iv2HolfzkcnX3Ruabs12J3UoWLSUG7uo/is3am7Iz27EugHWD2a2rPVJWll6i5KLeK
         lO/RPjR1A4HJhLrqH5Uv5SJ9JeCDtYWyiwUEXZl1ZqRoMkt3+TUA6CKzgyvxkyskMuhW
         5jNf/98PxvI5Dj3MkjdKrK4QameluQ8aH/AjmBb7FrPpgl0eDnGknrVf6R6WMN6nj967
         clXOXmBXP+HVxJQu+qwVH5N9qJ5IyaYRjdqDCbxMEtHmoRuVTyreFxVeyeHme9EEBTAC
         61jJiKWk1pYd8DoLB1EDGJXEUD1AIu2Ivf5u1gu2jbOzr0SfRhshm+FIV/dXOLf+aJfe
         hT+w==
X-Forwarded-Encrypted: i=1; AJvYcCW4mk/Ddd0ivq3LFOwc2TcAtIVMs8Eb7JDNeOfbInzGPW8leCgmFnqLd0SeNEmhtpdAZWV00i0FGF7VvUSM84Kz+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLyjAHDEHk1QqiUjTFBGpwEfGUiBvMEloVHhN/98ncFfTrQJcn
	uWlHYy87k4k5kEeCzSuopckhbzoT1ecSds/XzDwmRSdfK23inCXBKPV6VQHw0QHqG+c=
X-Gm-Gg: ASbGncsvXXDn6v9waDnusUAXFBL4Iej4g9fNy88zO0e1RATpNzuCDyCVxLaqKavZx7K
	FTtnCwRXJg4ruCGg/ftw02Wyr8+wusz1FH67NO3LTiWnUgUxtoRmMZLwAzyDndUHydXBKrDbcCn
	mzLARbIZby/XQSI3rVEOG+f2ABsflFBC+/kAV93w1BdyxAt9ZiViYu1UQyu2a+4dSKRUIpYOcsK
	QcVjm4nxPxoeq0CWsHfJ5CnuYNBvIcebeSfDWMAGmLK0rn/OxQxup9IbXkOq4cRlEd+D7+ucw6M
	NWfhaUEtHLebK7bj92xld8mEJYsKd7BdlVbw8vanciHOY+gt7nz0O87GpogjWGbIyAgd5cizG/m
	ubZ8CXw6oN4JU/ZEa7jr0P/mKHVtpmGdNuBOKGaSsyLk1zSFbmXToo440fK2upQ==
X-Google-Smtp-Source: AGHT+IGRrvCe6nlhsPk+2tKW0ajJUZWCWe8ICo7cC9kte5yG3uyzTFsU0/qRjjT3RM12XkopZ0H62g==
X-Received: by 2002:a05:6000:210a:b0:3a5:2ef8:34f0 with SMTP id ffacd0b85a97d-3a6d12ded04mr8286822f8f.22.1750713496700;
        Mon, 23 Jun 2025 14:18:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a? ([2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805175asm149756f8f.20.2025.06.23.14.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:18:15 -0700 (PDT)
Message-ID: <4de61479095b50a83e94eb66f35fadc68e044298.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] host_dmesg_logger: dmesg diff on
 BuildStarted and BuildCompleted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Randy MacLeod	
 <randy.macleod@windriver.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Mon, 23 Jun 2025 22:18:15 +0100
In-Reply-To: <20250623171552.28824-1-gavrosc@yahoo.com>
References: <20250623171552.28824-1-gavrosc.ref@yahoo.com>
	 <20250623171552.28824-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 21:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219222

On Mon, 2025-06-23 at 19:15 +0200, Christos Gavros via lists.openembedded.o=
rg wrote:
> This class is used to capture the host dmesg output
> when BuildStarted and BuildCompleted. Then computes
> a diff and prints the result.
> Fixes [YOCTO #15557]
>=20
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v1->v2
> * add in the description class's usage and drawbacks
> * add in the description how to enable the class
> * add spaces around "=3D"
> * run dmesg with '-T' option
> ---
> =C2=A0meta/classes-global/host_dmesg_logger.bbclass | 92 ++++++++++++++++=
+++
> =C2=A01 file changed, 92 insertions(+)
> =C2=A0create mode 100644 meta/classes-global/host_dmesg_logger.bbclass
>=20
> diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/classes=
-global/host_dmesg_logger.bbclass
> new file mode 100644
> index 0000000000..fd4261c53d
> --- /dev/null
> +++ b/meta/classes-global/host_dmesg_logger.bbclass
> @@ -0,0 +1,92 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# This class captures the host's dmesg output at the start and completio=
n of a build.
> +# It stores these outputs in a variable and upon build completion, compu=
tes a diff between
> +# the two logs to detect any changes that occurred during the build proc=
ess. It prints the diff
> +# using bb.warn().
> +# This class is intended to expose failures (e.g. segmentation faults) t=
hat=20
> +# are hidden or ignored by the host build system. However, it may also c=
apture
> +# irrelevant or unimportant messages.
> +# The user needs to have privileges to run dmesg otherwise the operation=
 is not allowed
> +# and a warning is generated.
> +# To enable dmesg logging, add the following to your local.conf:
> +# INHERIT +=3D "host_dmesg_logger"
> +
> +def append_log(msg, d):
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 Appends a log message to variable '_dmesg_log'
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 current_log =3D d.getVar('_dmesg_log') or ''
> +=C2=A0=C2=A0=C2=A0 current_log +=3D msg + '\n'
> +=C2=A0=C2=A0=C2=A0 d.setVar('_dmesg_log', current_log)
> +
> +def capture_dmesg():
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 Returns the current output of dmesg command
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 import subprocess
> +
> +=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D subprocess.run(['d=
mesg', '-T'], capture_output=3DTrue, text=3DTrue, check=3DFalse)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if result.returncode !=3D 0:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n f"Error running dmesg: {result.stderr.strip()}"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return result.stdout
> +=C2=A0=C2=A0=C2=A0 except Exception as e:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return f"Exception running dm=
esg: {str(e)}"
> +
> +addhandler hostdmesglogger_eventhandler
> +python hostdmesglogger_eventhandler() {
> +=C2=A0=C2=A0=C2=A0 import difflib
> +
> +=C2=A0=C2=A0=C2=A0 start_marker =3D "=3D=3D=3D BuildStarted dmesg =3D=3D=
=3D"
> +=C2=A0=C2=A0=C2=A0 end_marker =3D "=3D=3D=3D BuildCompleted dmesg =3D=3D=
=3D"
> +=C2=A0=C2=A0=C2=A0 diff_marker =3D "=3D=3D=3D dmesg diff =3D=3D=3D"
> +
> +=C2=A0=C2=A0=C2=A0 # execute dmesg when BuildStarted event is fired
> +=C2=A0=C2=A0=C2=A0 if isinstance(e, bb.event.BuildStarted):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmesg_output =3D capture_dmes=
g()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if dmesg_output.startswith("E=
rror running dmesg:") or dmesg_output.startswith("Exception running dmesg:"=
):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.wa=
rn(dmesg_output)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appen=
d_log(start_marker, d)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appen=
d_log(dmesg_output, d)
> +
> +=C2=A0=C2=A0=C2=A0 # execute dmesg when BuildCompleted event is fired
> +=C2=A0=C2=A0=C2=A0 if isinstance(e, bb.event.BuildCompleted):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmesg_output =3D capture_dmes=
g()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if dmesg_output.startswith("E=
rror running dmesg:") or dmesg_output.startswith("Exception running dmesg:"=
):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.wa=
rn(dmesg_output)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appen=
d_log(end_marker, d)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appen=
d_log(dmesg_output, d)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 content =3D d.getVar('_dmesg_=
log') or ''
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if start_marker in content an=
d end_marker in content:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start=
_dmesg =3D content.split(start_marker)[1].split(end_marker)[0]
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end_d=
mesg =3D content.split(end_marker)[1]
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start=
_lines =3D start_dmesg.strip().splitlines()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end_l=
ines =3D end_dmesg.strip().splitlines()
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # gen=
erating diff between BuildStarted and BuildCompleted dmesg outputs
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 diff =
=3D list(difflib.unified_diff(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 start_lines, end_lines,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fromfile =3D 'dmesg_start',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 tofile =3D 'dmesg_end',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 lineterm =3D ''
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ))
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appen=
d_log(diff_marker, d)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if di=
ff:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 for line in diff:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(line)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bb.warn("No differences in dmesg output.")

Thanks for this. I decided to test on the autobuilder by using this
patch:

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D56c251c67582=
835bd131114e903401c169f4b7c1

diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/=
conf/fragments/yocto-autobuilder/autobuilder.conf
index e3bac34339..d698c877dc 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -3,6 +3,7 @@ BB_CONF_FRAGMENT_DESCRIPTION =3D "Default variables used on=
 the Yocto Projects aut
=20
 QEMU_USE_KVM ?=3D 'True'
 INHERIT +=3D 'report-error'
+INHERIT +=3D "host_dmesg_logger"
 PREMIRRORS =3D ''
 BB_GENERATE_MIRROR_TARBALLS =3D '1'
 IMAGE_CLASSES +=3D 'testimage'

I started a build and you can see 1 warning so far:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1867

If no differences are detected, do we really want to show a warning?
These are going to pollute the CI logs significantly and detract from
real issues. They are useful to see that the code is running but we
probably don't want to do that in general.

Cheers,

Richard

