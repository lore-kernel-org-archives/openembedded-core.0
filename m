Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B77CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 07:56:22 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.32978.1712217377403085368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 00:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHyeg+T8;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: andreaskleist@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56e030624d1so1023048a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712217376; x=1712822176; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SCo6FHd70wnLj5qD43R5UmIEGFsEQbCsCl6bUV81824=;
        b=GHyeg+T8FWXI4NRM02rf0EdAl5Qs3Dkwaa6R2NpwxTK1NP+biSESkK2eOxjY04fZHd
         dIzFmO7ZymMAldf1BhdRNlMQh/EJlhfknybUYQjU2t/mEiqOfCCIEfu/ofv8VG34jdro
         eSNW7IWE+MHQwYJUHyntOPiSOZXWXtVuVnOPo9tkigQmEqxPT0cQw3IVMsZie/3J2RGC
         gk5BW6OKl45p1vhb4Fjcn7r+CXr1o+S0JjkGakPgzHeiZ8MU0O8UMurHIq3dWyXgD6CO
         dKxN9HpHvzB8VaqGQfhUXcCQBqF6CTZMdU7JIj1PZWd+QezP2xjiVVshlhMDLWVTz1Tw
         VxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712217376; x=1712822176;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCo6FHd70wnLj5qD43R5UmIEGFsEQbCsCl6bUV81824=;
        b=InicatiF63D2tfAU3oj67SuDw6SdDDMEldmBUQ8wzBFS260HKeybCWttqh5iS1DJVe
         nG5fl07OqTLBivQN8CJOGiejABdEotvLtpTZ0BoFiFPb+dEX+cdzyJfv8X0cbtQSj+Xm
         qd7UGHhiBC5MxZtz4lFTXLoLiWJyPEpQ2G/RnO8cliohgnPGiECaRoOHWBOF9WiY8yXW
         L5ZIZB2d/G1IqvPnzKZuUlGejupA8b2yPIBB1eKN3l10lkPSR8NnwSH7qQoO1S2rkTnJ
         Hh2bRMj5PCmEE8ZGagC0n9zrN866U4zqMPENx/34c6nRhl430vcXw5E+mF8TtI3bGrti
         7Rcw==
X-Forwarded-Encrypted: i=1; AJvYcCXQehtaxwXulj3SkwmbvNQBsSPDaA0z8DenxpE1RtJaaL8zZiN1+IXNpcOOoBQI8tT1yz9rbTtUALrsbgO8aK5iBOaB15x7OIiPv3nHkVK74f3YnuxZ7xqr
X-Gm-Message-State: AOJu0YwVuQSDWt5+pM8Kct9lHczvC9awOwsulpHJ6tUKfxeJJ6bD9D6T
	GinIaKrlJ2lj1NNnwMCIATelMjXDQiWt58XvBTEVcmaU7kxSXfXS
X-Google-Smtp-Source: AGHT+IGmMA5AvRBijSi+2w8oiHNa6Pz2Yk4cpnzDjeSBcXNFZDY5LIVbzvivbYdl7+U8wbVKWldGVQ==
X-Received: by 2002:a50:9301:0:b0:56e:22a1:a9a2 with SMTP id m1-20020a509301000000b0056e22a1a9a2mr69076eda.33.1712217375481;
        Thu, 04 Apr 2024 00:56:15 -0700 (PDT)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id b4-20020a0564021f0400b0056c1cca33bfsm8922771edb.6.2024.04.04.00.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 00:56:14 -0700 (PDT)
Message-ID: <3fd7861181945979c16d57176b45aa2e78a1f700.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] classes: jobserver: support gnu make fifo
 jobserver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: Martin Hundeb?ll <martin@geanix.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj
 <raj.khem@gmail.com>,  Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 04 Apr 2024 09:56:14 +0200
In-Reply-To: <20240403070204.367470-2-martin@geanix.com>
References: <20240403070204.367470-1-martin@geanix.com>
	 <20240403070204.367470-2-martin@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 07:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197947

Hi=C2=A0

Very interesting patch series. I stumbled upon a couple of spelling
errors while looking through it, and have a question about the
hardcoded dependency list.

On Wed, 2024-04-03 at 09:02 +0200, Martin Hundeb?ll wrote:
> Add a class to implement the gnu make fifo style jobserver. The class
> can be activated by symply adding an `INHERIT +=3D "jobserver"` to the

s/symply/simply/

> local configuration.
>=20
> Furthermore, one can configure an external jobserver (i.e. a server
> shared between multiple builds), by configured the `JOBSERVER_FIFO`
> variable to point at an existing jobserver fifo.
>=20
> The jobserver class uses the fifo style jobserver, which doesn't require
> passing open file descriptors around. It does, however, require
> make-4.4, which isn't available in common distro yet. To work around
> this, the class make all recipes (except make and its dependencies
> itself) depend on `virtual/make-native`.
>=20
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  meta/classes-global/jobserver.bbclass | 80 +++++++++++++++++++++++++++
>  meta/conf/bitbake.conf                |  2 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes-global/jobserver.bbclass
>=20
> diff --git a/meta/classes-global/jobserver.bbclass b/meta/classes-global/=
jobserver.bbclass
> new file mode 100644
> index 0000000000..c76909fe50
> --- /dev/null
> +++ b/meta/classes-global/jobserver.bbclass
> @@ -0,0 +1,80 @@
> +JOBSERVER_FIFO ?=3D ""
> +JOBSERVER_FIFO[doc] =3D "Path to external jobserver fifo to use instead =
of creating a per-build server."
> +
> +addhandler jobserver_setup_fifo
> +jobserver_setup_fifo[eventmask] =3D "bb.event.ConfigParsed"
> +
> +python jobserver_setup_fifo() {
> +    # don't setup a per-build fifo, if an external one is configured
> +    if d.getVar("JOBSERVER_FIFO"):
> +        return
> +
> +    # don't use a job-server if no parallelism is configured
> +    jobs =3D oe.utils.parallel_make(d)
> +    if jobs in (None, 1):
> +        return
> +
> +    # reduce jobs by one as a token has implicitly been handed to the
> +    # process requesting tokens
> +    jobs -=3D 1
> +
> +    fifo =3D d.getVar("TMPDIR") + "/jobserver_fifo"
> +
> +    # and old fifo might be lingering; remove it
> +    if os.path.exists(fifo):
> +        os.remove(fifo)
> +
> +    # create a new fifo to use for communicating tokens
> +    os.mkfifo(fifo)
> +
> +    # fill the fifo with the number of tokens to hand out
> +    wfd =3D os.open(fifo, os.O_RDWR)
> +    written =3D os.write(wfd, b"+" * jobs)
> +    if written !=3D (jobs):
> +        bb.error("Failed to fil make fifo: {} !=3D {}".format(written, j=
obs))
> +
> +    # configure the per-build fifo path to use
> +    d.setVar("JOBSERVER_FIFO", fifo)
> +}
> +
> +python () {
> +    # don't configure the fifo if none is defined
> +    fifo =3D d.getVar("JOBSERVER_FIFO")
> +    if not fifo:
> +        return
> +
> +    # avoid making make-native or its dependencies depend on make-native=
 itself
> +    if d.getVar("PN") in (
> +                "make-native",
> +                "libtool-native",
> +                "pkgconfig-native",
> +                "automake-native",
> +                "autoconf-native",
> +                "m4-native",
> +                "texinfo-dummy-native",
> +                "gettext-minimal-native",
> +                "quilt-native",
> +                "gnu-config-native",

This seems a bit brittle, but I guess make's dependencies doesn't
change often. So it is probably not a big issue.

How does it break if a dependency is missing?

> +            ):
> +        return
> +
> +    # don't make unwilling recipes depend on make-native
> +    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
> +        return
> +
> +    # make other recipes depend on make-native to make sure it is new en=
ough to
> +    # support the --jobserver-auth=3Dfifo:<path> syntax (from make-4.4 a=
nd onwards)
> +    d.appendVar("DEPENDS", " virtual/make-native")
> +
> +    # disable the "-j <jobs>" flag, as that overrides the jobserver fifo=
 tokens
> +    d.setVar("PARALLEL_MAKE", "")
> +    d.setVar("PARALLEL_MAKEINST", "")
> +
> +    # set and export the jobserver in the environment
> +    d.appendVar("MAKEFLAGS", " --jobserver-auth=3Dfifo:" + fifo)
> +    d.setVarFlag("MAKEFLAGS", "export", "1")
> +
> +    # ignore the joberserver argument part of MAKEFLAGS in the hash, as =
that

s/joberserver/jobserver/

> +    # shouldn't change the build output
> +    d.appendVarFlag("MAKEFLAGS", "vardepvalueexclude", "| --jobserver-au=
th=3Dfifo:" + fifo)
> +}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6f180d18b0..23a016b31e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -960,7 +960,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB_T=
ASKHASH BBPATH BBSERVER DL_DI
>      BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEP=
LOY_DIR \
>      SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
>      SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIREC=
TORIES \
> -    OMP_NUM_THREADS BB_CURRENTTASK"
> +    OMP_NUM_THREADS BB_CURRENTTASK JOBSERVER_FIFO"
>  BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PAT=
HS BUILDHISTORY_DIR \
>      SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGE=
T_SYS"
>  BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_A=
GENT_PID \
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197910): https://lists.openembedded.org/g/openembedde=
d-core/message/197910
> Mute This Topic: https://lists.openembedded.org/mt/105304233/7501392
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
dreaskleist@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

/Andreas

