Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1S0vql-0002NW-Tk
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 15:10:20 +0100
Received: by wibhq7 with SMTP id hq7so1540217wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 06:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of bruce.ashfield@gmail.com designates
	10.180.80.40 as permitted sender) client-ip=10.180.80.40; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	bruce.ashfield@gmail.com designates 10.180.80.40 as permitted
	sender) smtp.mail=bruce.ashfield@gmail.com;
	dkim=pass header.i=bruce.ashfield@gmail.com
Received: from mr.google.com ([10.180.80.40])
	by 10.180.80.40 with SMTP id o8mr4806837wix.10.1330092117560 (num_hops
	= 1); Fri, 24 Feb 2012 06:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EYsLNMdD8dfjB29hvIGOGYNAClhgoWiKzEo8nht4atQ=;
	b=ClXrix3LOMX2xAzkWmGPvd2Hv/sUFzY8FOc4IpvQA9Aa5GpKPG4kKG4gmxX+Fo1Y+n
	9uD738jPoqHkbZDEWyNtKoCpAldgHh3IGhHlj3PJjfgNwipcr22FDUThcisAx6QCROAv
	7M5GpQ2DbjrzizLKyd+ak+a5efQpOAi93EpFc=
MIME-Version: 1.0
Received: by 10.180.80.40 with SMTP id o8mr3844336wix.10.1330092117437; Fri,
	24 Feb 2012 06:01:57 -0800 (PST)
Received: by 10.216.170.4 with HTTP; Fri, 24 Feb 2012 06:01:57 -0800 (PST)
In-Reply-To: <1330088135.32006.14.camel@ted>
References: <1330088135.32006.14.camel@ted>
Date: Fri, 24 Feb 2012 09:01:57 -0500
Message-ID: <CADkTA4PAUUb6RXtriMJ5qqkMx051U42Y2+QAjY7j0xm1f9u7Sw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using external source trees with OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 14:10:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 7:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Someone recently asked me about using external source trees with
> OE-Core. I was aware of srctree.bbclass in OE-Classic and did start
> looking at it but it has various elements I wasn't so keen on. I
> therefore wondered if I could improve upon it. I did start from that
> code base but came up with:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/a0&=
id=3Dac8a54c18c33aaab6758c34a3d6093d3d3384cee
> [patch inline below]
>
> which I've called externalsrc.bbclass since it behaves a bit
> differently. In particular, all the usual task targets are available.
>
> As an example usage with the above patch applied:
>
> cd ~
> tar -xvzf $DL_DIR/libfm-0.1.17.tar.gz
> (creates libfm-0.1.17 in my homedir)
>
> edit libfm_0.1.17.bb and add:
>
> inherit externalsrc
> S =3D "/home/richard/libfm-0.1.17"
>
> bitbake libfm
>
> and it does what you'd expect. You can also -c clean and it will wipe
> out WORKDIR but it won't touch ${S}. I picked libfm effectively at
> random. It won't remove the autoreconf changes from configure but I'm
> not sure I care much about that.
>
> Admittedly, I did have to fix one Makefile.am which did '-I../' instead
> of "-I$(srcdir)/../" but that is a bug in libfm.
>
> Obviously this won't work quite as well with some recipes like
> linux-yocto which manipulate ${S} a lot more but it should work in most
> cases. I also found it very hard to remove tasks from the anonymous
> python, we probably need to improve the API for this.

I was just looking at this myself, and I agree that when using this class,
you'd want to drop a few phases that linux-yocto does and just let things
run from compile onwards. You aren't using much infrastructure that is
provided in this scenario .. but that is the point :)

I like the option that this provides for a development workflow, with some
safety and with associated risks. But overall, if used properly .. I see th=
e
value.

Cheers,

Bruce

>
> Opinions on including this class?
>
> Cheers,
>
> Richard
>
>
>
> From ac8a54c18c33aaab6758c34a3d6093d3d3384cee Mon Sep 17 00:00:00 2001
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Fri, 24 Feb 2012 12:29:36 +0000
> Subject: externalsrc.bbclass: Add class for handling external source tree=
s
>
> This is loosly based upon srctree.bbclass from OE-Classic but with some
> changes appropriate to OE-Core.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> new file mode 100644
> index 0000000..7e00ef8
> --- a/dev/null
> +++ b/meta/classes/externalsrc.bbclass
> @@ -0,0 +1,53 @@
> +# Copyright (C) 2012 Linux Foundation
> +# Author: Richard Purdie
> +# Some code and influence taken from srctree.bbclass:
> +# Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +#
> +# externalsrc.bbclass enables use of an existing source tree, usually ex=
ternal to
> +# the build system to build a piece of software rather than the usual fe=
tch/unpack/patch
> +# process.
> +#
> +# To use, set S to point at the directory you want to use containing the=
 sources
> +# e.g. S =3D "/path/to/my/source/tree"
> +#
> +# If the class is to work for both target and native versions (or with m=
ultilibs/
> +# cross or other BBCLASSEXTEND variants), its expected that setting B to=
 point to
> +# where to place the compiled binaries will work (split source and build=
 directories).
> +# This is the default but B can be set to S if circumstaces dictate.
> +#
> +
> +SRC_URI =3D ""
> +SRCTREECOVEREDTASKS ?=3D "do_patch do_unpack do_fetch"
> +B =3D "${WORKDIR}/${BPN}-${PV}/"
> +
> +def remove_tasks(tasks, deltasks, d):
> + =A0 =A0for task in tasks:
> + =A0 =A0 =A0 =A0deps =3D d.getVarFlag(task, "deps")
> + =A0 =A0 =A0 =A0for preptask in deltasks:
> + =A0 =A0 =A0 =A0 =A0 =A0if preptask in deps:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0deps.remove(preptask)
> + =A0 =A0 =A0 =A0d.setVarFlag(task, "deps", deps)
> + =A0 =A0# Poking around bitbake internal variables is evil but there app=
ears to be no better way :(
> + =A0 =A0tasklist =3D d.getVar('__BBTASKS') or []
> + =A0 =A0for task in deltasks:
> + =A0 =A0 =A0 =A0d.delVarFlag(task, "task")
> + =A0 =A0 =A0 =A0if task in tasklist:
> + =A0 =A0 =A0 =A0 =A0 =A0tasklist.remove(task)
> + =A0 =A0d.setVar('__BBTASKS', tasklist)
> +
> +python () {
> + =A0 =A0tasks =3D filter(lambda k: d.getVarFlag(k, "task"), d.keys())
> + =A0 =A0covered =3D d.getVar("SRCTREECOVEREDTASKS", True).split()
> +
> + =A0 =A0for task in tasks:
> + =A0 =A0 =A0 =A0if task.endswith("_setscene"):
> + =A0 =A0 =A0 =A0 =A0 =A0# sstate is never going to work for external sou=
rce trees, disable it
> + =A0 =A0 =A0 =A0 =A0 =A0covered.append(task)
> + =A0 =A0 =A0 =A0else:
> + =A0 =A0 =A0 =A0 =A0 =A0# Since configure will likely touch ${S}, ensure=
 only we lock so one task has access at a time
> + =A0 =A0 =A0 =A0 =A0 =A0d.appendVarFlag(task, "lockfiles", "${S}/singlet=
ask.lock")
> +
> + =A0 =A0remove_tasks(tasks, covered, d)
> +}
> +
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


