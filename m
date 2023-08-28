Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA37C83F15
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:36:35 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.556.1693244186919110923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=D3tPy1tJ;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wOycQPwj7EYaHgFl0CKhHLxR2hZX+03c/nrOONJvL6E=; b=D3tPy1tJqA5+DNPMIatUY93RNJ
	B9FF2rq4OEZkxFETm+MYxBg+jGIrQHgL7q1Wxuns7K75dfHevyZNAmHBy0jVSX3ZXgYHDUqQNlIZZ
	JyZn+cD4Kfsf00KnBKFuCtQdd2pXEYeTyo9jHInFbtjshRcQomA6b7DapSZNBYYJC1hmIEvZ7OKDK
	yp8p1A/bWmvayv2Hd5rbzv4wrIkynQrND9//9e0sTJREuvCiQjdorAYo/x63wifdO7Saw6/gusU1e
	aFBxztbMn6aTRMP0ThGaeMuH7nTDXYR5qM19bVCd/WRe8zavS3D/99mx4Q0/mbYxG7TB08R2HqegI
	pk+9+VRw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qagA5-00025o-0r
	for openembedded-core@lists.openembedded.org; Mon, 28 Aug 2023 19:36:24 +0200
Received: from 85.184.138.13.dynamic.dhcp.aura-net.dk ([85.184.138.13] helo=[127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qagA4-000DTT-LI
	for openembedded-core@lists.openembedded.org; Mon, 28 Aug 2023 19:36:24 +0200
Date: Mon, 28 Aug 2023 19:36:24 +0200 (GMT+02:00)
From: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <27f3367a-91a9-4606-b52b-108a80c77b25@geanix.com>
In-Reply-To: <20230828124834.376779-1-martin@geanix.com>
References: <20230828124834.376779-1-martin@geanix.com>
Subject: Re: [RFC PATCH 1/5] classes: jobserver: support gnu make fifo
 jobserver
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_25_37832458.1693244184423"
X-Correlation-ID: <27f3367a-91a9-4606-b52b-108a80c77b25@geanix.com>
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 17:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186842

------=_Part_25_37832458.1693244184423
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Aug 28, 2023 14:48:46 Martin Hundeb=C3=B8ll <martin@geanix.com>:

> Add a class to implement the gnu make fifo style jobserver. The class
> can be activated by symply adding an `INHERIT +=3D "jobserver"` to the
> local configuration.
>
> Furthermore, one can configure an external jobserver (i.e. a server
> shared between multiple builds), by configured the `JOBSERVER_FIFO`
> variable to point at an existing jobserver fifo.
>
> The jobserver class uses the fifo style jobserver, which doesn't require
> passing open file descriptors around. It does, however, require
> make-4.4, which isn't available in common distro yet. To work around
> this, the class make all recipes (except make and its dependencies
> itself) depend on `virtual/make-native`.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
> meta/classes-global/jobserver.bbclass | 80 +++++++++++++++++++++++++++
> meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> 2 files changed, 81 insertions(+), 1 deletion(-)
> create mode 100644 meta/classes-global/jobserver.bbclass
>
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
> +=C2=A0=C2=A0=C2=A0 # don't setup a per-build fifo, if an external one is=
 configured
> +=C2=A0=C2=A0=C2=A0 if d.getVar("JOBSERVER_FIFO"):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> +
> +=C2=A0=C2=A0=C2=A0 # don't use a job-server if no parallelism is configu=
red
> +=C2=A0=C2=A0=C2=A0 jobs =3D oe.utils.parallel_make(d)
> +=C2=A0=C2=A0=C2=A0 if jobs in (None, 1):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> +
> +=C2=A0=C2=A0=C2=A0 # reduce jobs by one as a token has implicitly been h=
anded to the
> +=C2=A0=C2=A0=C2=A0 # process requesting tokens
> +=C2=A0=C2=A0=C2=A0 jobs -=3D 1
> +
> +=C2=A0=C2=A0=C2=A0 fifo =3D d.getVar("TMPDIR") + "/jobserver_fifo"
> +
> +=C2=A0=C2=A0=C2=A0 # and old fifo might be lingering; remove it
> +=C2=A0=C2=A0=C2=A0 if os.path.exists(fifo):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.remove(fifo)
> +
> +=C2=A0=C2=A0=C2=A0 # create a new fifo to use for communicating tokens
> +=C2=A0=C2=A0=C2=A0 os.mkfifo(fifo)
> +
> +=C2=A0=C2=A0=C2=A0 # fill the fifo with the number of tokens to hand out
> +=C2=A0=C2=A0=C2=A0 wfd =3D os.open(fifo, os.O_RDWR)
> +=C2=A0=C2=A0=C2=A0 written =3D os.write(wfd, b"+" * jobs)
> +=C2=A0=C2=A0=C2=A0 if written !=3D (jobs):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.error("Failed to fil make =
fifo: {} !=3D {}".format(written, jobs))
> +
> +=C2=A0=C2=A0=C2=A0 # configure the per-build fifo path to use
> +=C2=A0=C2=A0=C2=A0 d.setVar("JOBSERVER_FIFO", fifo)
> +}
> +
> +python () {
> +=C2=A0=C2=A0=C2=A0 # don't configure the fifo if none is defined
> +=C2=A0=C2=A0=C2=A0 fifo =3D d.getVar("JOBSERVER_FIFO")
> +=C2=A0=C2=A0=C2=A0 if not fifo:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> +
> +=C2=A0=C2=A0=C2=A0 # avoid making make-native or its dependencies depend=
 on make-native itself
> +=C2=A0=C2=A0=C2=A0 if d.getVar("PN") in (
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "make-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "libtool-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "pkgconfig-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "automake-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "autoconf-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "m4-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "texinfo-dummy-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "gettext-minimal-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "quilt-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "gnu-config-native",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> +
> +=C2=A0=C2=A0=C2=A0 # don't make unwilling recipes depend on make-native
> +=C2=A0=C2=A0=C2=A0 if d.getVar('INHIBIT_DEFAULT_DEPS', False):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> +
> +=C2=A0=C2=A0=C2=A0 # make other recipes depend on make-native to make su=
re it is new enough to
> +=C2=A0=C2=A0=C2=A0 # support the --jobserver-auth=3Dfifo:<path> syntax (=
from make-4.4 and onwards)
> +=C2=A0=C2=A0=C2=A0 d.appendVar("DEPENDS", " virtual/make-native")

I would like some feedback on this part, i.e. changing package dependencies=
 depending on a pure build-configuration like this. I would prefer if the b=
uild didn't change at all when enabling the jobserver class, which would re=
quire adding virtual/make-native to the base dependencies regardless of thi=
s class. Would that be acceptable?

> +=C2=A0=C2=A0=C2=A0 # disable the "-j <jobs>" flag, as that overrides the=
 jobserver fifo tokens
> +=C2=A0=C2=A0=C2=A0 d.setVar("PARALLEL_MAKE", "")
> +=C2=A0=C2=A0=C2=A0 d.setVar("PARALLEL_MAKEINST", "")
> +
> +=C2=A0=C2=A0=C2=A0 # set and export the jobserver in the environment
> +=C2=A0=C2=A0=C2=A0 d.appendVar("MAKEFLAGS", " --jobserver-auth=3Dfifo:" =
+ fifo)
> +=C2=A0=C2=A0=C2=A0 d.setVarFlag("MAKEFLAGS", "export", "1")
> +
> +=C2=A0=C2=A0=C2=A0 # ignore the joberserver argument part of MAKEFLAGS i=
n the hash, as that
> +=C2=A0=C2=A0=C2=A0 # shouldn't change the build output
> +=C2=A0=C2=A0=C2=A0 d.appendVarFlag("MAKEFLAGS", "vardepvalueexclude", "|=
 --jobserver-auth=3Dfifo:" + fifo)
> +}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cf7ff3328c..8cf188270b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -946,7 +946,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB_T=
ASKHASH BBPATH BBSERVER DL_DI
> =C2=A0=C2=A0=C2=A0=C2=A0 BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH exten=
d_recipe_sysroot DEPLOY_DIR \
> =C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_=
TASKDATA \
> =C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSER=
VE GIT_CEILING_DIRECTORIES \
> -=C2=A0=C2=A0=C2=A0 OMP_NUM_THREADS BB_CURRENTTASK"
> +=C2=A0=C2=A0=C2=A0 OMP_NUM_THREADS BB_CURRENTTASK JOBSERVER_FIFO"
> BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATH=
S BUILDHISTORY_DIR \
> =C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST=
_HOST_SYS RUST_TARGET_SYS"
> BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AG=
ENT_PID \
> --
> 2.41.0


------=_Part_25_37832458.1693244184423
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
 </head>
 <body>
  <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Aug 28, 2=
023 14:48:46 Martin Hundeb=C3=B8ll &lt;martin@geanix.com&gt;:</span> <br> <=
br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; Add a c=
lass to implement the gnu make fifo style jobserver. The class</span> <br> =
<span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; can be acti=
vated by symply adding an `INHERIT +=3D "jobserver"` to the</span> <br> <sp=
an dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; local configur=
ation.</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0=
;">&gt;</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:=
0;">&gt; Furthermore, one can configure an external jobserver (i.e. a serve=
r</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&g=
t; shared between multiple builds), by configured the `JOBSERVER_FIFO`</spa=
n> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; var=
iable to point at an existing jobserver fifo.</span> <br> <span dir=3D"ltr"=
 style=3D"margin-top:0; margin-bottom:0;">&gt;</span> <br> <span dir=3D"ltr=
" style=3D"margin-top:0; margin-bottom:0;">&gt; The jobserver class uses th=
e fifo style jobserver, which doesn't require</span> <br> <span dir=3D"ltr"=
 style=3D"margin-top:0; margin-bottom:0;">&gt; passing open file descriptor=
s around. It does, however, require</span> <br> <span dir=3D"ltr" style=3D"=
margin-top:0; margin-bottom:0;">&gt; make-4.4, which isn't available in com=
mon distro yet. To work around</span> <br> <span dir=3D"ltr" style=3D"margi=
n-top:0; margin-bottom:0;">&gt; this, the class make all recipes (except ma=
ke and its dependencies</span> <br> <span dir=3D"ltr" style=3D"margin-top:0=
; margin-bottom:0;">&gt; itself) depend on `virtual/make-native`.</span> <b=
r> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span> <=
br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; Signed-=
off-by: Martin Hundeb=C3=B8ll &lt;martin@geanix.com&gt;</span> <br> <span d=
ir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; ---</span> <br> <s=
pan dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; meta/classes-=
global/jobserver.bbclass | 80 +++++++++++++++++++++++++++</span> <br> <span=
 dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; meta/conf/bitbak=
e.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-</span> <br> <span dir=3D"ltr" style=3D"m=
argin-top:0; margin-bottom:0;">&gt; 2 files changed, 81 insertions(+), 1 de=
letion(-)</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-botto=
m:0;">&gt; create mode 100644 meta/classes-global/jobserver.bbclass</span> =
<br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span>=
 <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; diff =
--git a/meta/classes-global/jobserver.bbclass b/meta/classes-global/jobserv=
er.bbclass</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bott=
om:0;">&gt; new file mode 100644</span> <br> <span dir=3D"ltr" style=3D"mar=
gin-top:0; margin-bottom:0;">&gt; index 0000000000..c76909fe50</span> <br> =
<span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; --- /dev/nu=
ll</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&=
gt; +++ b/meta/classes-global/jobserver.bbclass</span> <br> <span dir=3D"lt=
r" style=3D"margin-top:0; margin-bottom:0;">&gt; @@ -0,0 +1,80 @@</span> <b=
r> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +JOBSERV=
ER_FIFO ?=3D ""</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin=
-bottom:0;">&gt; +JOBSERVER_FIFO[doc] =3D "Path to external jobserver fifo =
to use instead of creating a per-build server."</span> <br> <span dir=3D"lt=
r" style=3D"margin-top:0; margin-bottom:0;">&gt; +</span> <br> <span dir=3D=
"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +addhandler jobserver_s=
etup_fifo</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-botto=
m:0;">&gt; +jobserver_setup_fifo[eventmask] =3D "bb.event.ConfigParsed"</sp=
an> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +<=
/span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;=
 +python jobserver_setup_fifo() {</span> <br> <span dir=3D"ltr" style=3D"ma=
rgin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; # don't setup a per-=
build fifo, if an external one is configured</span> <br> <span dir=3D"ltr" =
style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; if d.getV=
ar("JOBSERVER_FIFO"):</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; =
margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return</=
span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; =
+</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&g=
t; +&nbsp;&nbsp;&nbsp; # don't use a job-server if no parallelism is config=
ured</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;"=
>&gt; +&nbsp;&nbsp;&nbsp; jobs =3D oe.utils.parallel_make(d)</span> <br> <s=
pan dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;=
&nbsp; if jobs in (None, 1):</span> <br> <span dir=3D"ltr" style=3D"margin-=
top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;=
">&gt; +</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom=
:0;">&gt; +&nbsp;&nbsp;&nbsp; # reduce jobs by one as a token has implicitl=
y been handed to the</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; m=
argin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; # process requesting tokens</span=
> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nb=
sp;&nbsp;&nbsp; jobs -=3D 1</span> <br> <span dir=3D"ltr" style=3D"margin-t=
op:0; margin-bottom:0;">&gt; +</span> <br> <span dir=3D"ltr" style=3D"margi=
n-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; fifo =3D d.getVar("TMPD=
IR") + "/jobserver_fifo"</span> <br> <span dir=3D"ltr" style=3D"margin-top:=
0; margin-bottom:0;">&gt; +</span> <br> <span dir=3D"ltr" style=3D"margin-t=
op:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; # and old fifo might be li=
ngering; remove it</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; mar=
gin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; if os.path.exists(fifo):</span> <br=
> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.remove(fifo)</span> <br> <span dir=3D=
"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +</span> <br> <span dir=
=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; =
# create a new fifo to use for communicating tokens</span> <br> <span dir=
=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; =
os.mkfifo(fifo)</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin=
-bottom:0;">&gt; +</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; mar=
gin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; # fill the fifo with the number of =
tokens to hand out</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; mar=
gin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; wfd =3D os.open(fifo, os.O_RDWR)</s=
pan> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +=
&nbsp;&nbsp;&nbsp; written =3D os.write(wfd, b"+" * jobs)</span> <br> <span=
 dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nb=
sp; if written !=3D (jobs):</span> <br> <span dir=3D"ltr" style=3D"margin-t=
op:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb=
.error("Failed to fil make fifo: {} !=3D {}".format(written, jobs))</span> =
<br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +</spa=
n> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&n=
bsp;&nbsp;&nbsp; # configure the per-build fifo path to use</span> <br> <sp=
an dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&=
nbsp; d.setVar("JOBSERVER_FIFO", fifo)</span> <br> <span dir=3D"ltr" style=
=3D"margin-top:0; margin-bottom:0;">&gt; +}</span> <br> <span dir=3D"ltr" s=
tyle=3D"margin-top:0; margin-bottom:0;">&gt; +</span> <br> <span dir=3D"ltr=
" style=3D"margin-top:0; margin-bottom:0;">&gt; +python () {</span> <br> <s=
pan dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;=
&nbsp; # don't configure the fifo if none is defined</span> <br> <span dir=
=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; =
fifo =3D d.getVar("JOBSERVER_FIFO")</span> <br> <span dir=3D"ltr" style=3D"=
margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; if not fifo:</span=
> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return</span> <br> <span dir=3D"ltr=
" style=3D"margin-top:0; margin-bottom:0;">&gt; +</span> <br> <span dir=3D"=
ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; # av=
oid making make-native or its dependencies depend on make-native itself</sp=
an> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&=
nbsp;&nbsp;&nbsp; if d.getVar("PN") in (</span> <br> <span dir=3D"ltr" styl=
e=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "make-native",</=
span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; "libtool-native",</span> <br> <span dir=3D"ltr" style=3D"m=
argin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "pkgconfig-native",</s=
pan> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; "automake-native",</span> <br> <span dir=3D"ltr" style=3D"m=
argin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "autoconf-native",</sp=
an> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; "m4-native",</span> <br> <span dir=3D"ltr" style=3D"margin-t=
op:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "texinfo-dummy-native",</span=
> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; "gettext-minimal-native",</span> <br> <span dir=3D"ltr" style=
=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "quilt-native",</=
span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; "gnu-config-native",</span> <br> <span dir=3D"ltr" style=
=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ):</span> <br> <span dir=3D"ltr" style=3D=
"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-b=
ottom:0;">&gt; +</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margi=
n-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; # don't make unwilling recipes depend=
 on make-native</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin=
-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; if d.getVar('INHIBIT_DEFAULT_DEPS', Fa=
lse):</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;=
">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return</span> <br> <span=
 dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +</span> <br> <s=
pan dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;=
&nbsp; # make other recipes depend on make-native to make sure it is new en=
ough to</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:=
0;">&gt; +&nbsp;&nbsp;&nbsp; # support the --jobserver-auth=3Dfifo:&lt;path=
&gt; syntax (from make-4.4 and onwards)</span> <br> <span dir=3D"ltr" style=
=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; d.appendVar("D=
EPENDS", " virtual/make-native")</span> <br> <br> <span dir=3D"ltr" style=
=3D"margin-top:0; margin-bottom:0;">I would like some feedback on this part=
, i.e. changing package dependencies depending on a pure build-configuratio=
n like this. I would prefer if the build didn't change at all when enabling=
 the jobserver class, which would require adding virtual/make-native to the=
 base dependencies regardless of this class. Would that be acceptable?</spa=
n> <br> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt=
; +&nbsp;&nbsp;&nbsp; # disable the "-j &lt;jobs&gt;" flag, as that overrid=
es the jobserver fifo tokens</span> <br> <span dir=3D"ltr" style=3D"margin-=
top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; d.setVar("PARALLEL_MAKE",=
 "")</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;"=
>&gt; +&nbsp;&nbsp;&nbsp; d.setVar("PARALLEL_MAKEINST", "")</span> <br> <sp=
an dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +</span> <br> =
<span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbs=
p;&nbsp; # set and export the jobserver in the environment</span> <br> <spa=
n dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&n=
bsp; d.appendVar("MAKEFLAGS", " --jobserver-auth=3Dfifo:" + fifo)</span> <b=
r> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&=
nbsp;&nbsp; d.setVarFlag("MAKEFLAGS", "export", "1")</span> <br> <span dir=
=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +</span> <br> <span =
dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbs=
p; # ignore the joberserver argument part of MAKEFLAGS in the hash, as that=
</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt=
; +&nbsp;&nbsp;&nbsp; # shouldn't change the build output</span> <br> <span=
 dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nb=
sp; d.appendVarFlag("MAKEFLAGS", "vardepvalueexclude", "| --jobserver-auth=
=3Dfifo:" + fifo)</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; marg=
in-bottom:0;">&gt; +}</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; =
margin-bottom:0;">&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitb=
ake.conf</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom=
:0;">&gt; index cf7ff3328c..8cf188270b 100644</span> <br> <span dir=3D"ltr"=
 style=3D"margin-top:0; margin-bottom:0;">&gt; --- a/meta/conf/bitbake.conf=
</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt=
; +++ b/meta/conf/bitbake.conf</span> <br> <span dir=3D"ltr" style=3D"margi=
n-top:0; margin-bottom:0;">&gt; @@ -946,7 +946,7 @@ BB_HASHEXCLUDE_COMMON ?=
=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI</span> <br> <sp=
an dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp;&nbsp;&n=
bsp;&nbsp; BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot=
 DEPLOY_DIR \</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-b=
ottom:0;">&gt; &nbsp;&nbsp;&nbsp;&nbsp; SSTATE_HASHEQUIV_METHOD SSTATE_HASH=
EQUIV_REPORT_TASKDATA \</span> <br> <span dir=3D"ltr" style=3D"margin-top:0=
; margin-bottom:0;">&gt; &nbsp;&nbsp;&nbsp;&nbsp; SSTATE_HASHEQUIV_OWNER CC=
ACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \</span> <br> <span dir=
=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; -&nbsp;&nbsp;&nbsp; =
OMP_NUM_THREADS BB_CURRENTTASK"</span> <br> <span dir=3D"ltr" style=3D"marg=
in-top:0; margin-bottom:0;">&gt; +&nbsp;&nbsp;&nbsp; OMP_NUM_THREADS BB_CUR=
RENTTASK JOBSERVER_FIFO"</span> <br> <span dir=3D"ltr" style=3D"margin-top:=
0; margin-bottom:0;">&gt; BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_CO=
MMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \</span> <br> <span dir=3D"ltr" =
style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp;&nbsp;&nbsp;&nbsp; SSTA=
TE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"</spa=
n> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; BB_=
HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_P=
ID \</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;"=
>&gt; --</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom=
:0;">&gt; 2.41.0</span> <br> <br>
 </body>
</html>
------=_Part_25_37832458.1693244184423--

