Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id BA7FA728C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 12:49:47 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id CA0603F683;
	Wed,  7 Jan 2015 13:49:46 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed,  7 Jan 2015 13:49:46 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed,  7 Jan 2015 13:49:45 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 7 Jan 2015 13:51:08 +0100
Message-ID: <54AD2B68.2000201@topic.nl>
Date: Wed, 7 Jan 2015 13:49:44 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1420592855-20473-1-git-send-email-liezhi.yang@windriver.com>
	<1420618033.25779.56.camel@linuxfoundation.org>
	<54ACFB02.5060209@topic.nl>
	<CAJTo0LYYeD6eEA6XpGudTuSVsRBK=XDBvFM4Dafavdq1Zg86rw@mail.gmail.com>
In-Reply-To: <CAJTo0LYYeD6eEA6XpGudTuSVsRBK=XDBvFM4Dafavdq1Zg86rw@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] package.bbclass: omit .pyc and .pyo file
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
X-List-Received-Date: Wed, 07 Jan 2015 12:49:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/07/2015 12:16 PM, Burton, Ross wrote:
>
> On 7 January 2015 at 09:23, Mike Looijmans <mike.looijmans@topic.nl
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     You definitely SHOULD ship the .pyc files. If they don't exist, the
>     interpreter is forced to re-compile the .py source, and will attempt =
to
>     write the result to the filesystem. It won't cause harm, it won't fai=
l,
>     but it's very inefficient. It's better to let the host do the py->pyc
>     conversion anyway.
>
>     The opposite works just fine: You can omit the .py files and ship onl=
y
>     .pyc files. We do that on settopboxes that use Python for the GUI, th=
is
>     saves several megabytes of flash space.
>     To accomplish that, we put the .py files into a $PN-src package.
>
>
> I agree with Mike, there is a use-case for just shipping .pyc.  Whether
> oe-core should do something to assist with this or not is debatable.

We currently have this in a python_2.7.%.bbappend:

PACKAGES =3D+ "${PN}-src"
RDEPENDS_{PN}-src =3D "${PN}"
FILES_${PN}-src +=3D "${libdir}/python${PYTHON_MAJMIN}/*.py"
FILES_${PN}-src +=3D "${libdir}/python${PYTHON_MAJMIN}/*/*.py"
FILES_${PN}-src +=3D "${libdir}/python${PYTHON_MAJMIN}/*/*/*.py"

This moves all sources into a single package. I experimented with creating =
src=20
packages for each python sub-package, but all that accomplished was adding =
a=20
lot of packages to the feed that no one would ever install.

I patched the larger Python recipes (e.g. twisted) in similar ways to reduc=
e=20
the image size (and network traffic).

A generic "please remove or split all .py files" flag or class would be a=20
useful addition.

> There's an open bug report about this:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6434.
>
> https://docs.python.org/2/tutorial/modules.html#compiled-python-files has=
 the
> details we're after.  Summary:
>
> .pyc is Python bytecode, which is an implementation detail of CPython.  A=
s
> such it's version-dependent but explicitly architecture-independent.
> .pyo generated with -O is simply .pyc but with asserts removed.
> .pyo generated with -O -O has asserts and docstrings removed.

For horrible historic reasons OpenPLi (and its many forks) still use a patc=
h=20
that makes .pyo files the default instead of .pyc. It's been on my todo lis=
t=20
for over a year now to get rid of it, but too many plugins and 3rd party st=
uff=20
still count on this being the case.

> I think it's fair to say we should just ignore .pyo - no point generating=
 and
> shipping it.  It does seem that if we want to ship usable .pyc we need to
> ensure that they are compiled with python-native. I guess this could be d=
one
> by calling python-native's compileall module to recompile the sources at
> package time.

I'd expect any halfway decent recipe to have done that already in the=20
do_compile step. Most, if not all, Python recipes already do so. If anythin=
g,=20
the core could provide a class that provides a simple do_compile that calls=
=20
compileall on the source dir.

Moving this to packaging will lead to unexpected failures, there are some=20
situations where the source .py file must be installed and the .pyc will be=
=20
ignored. A simple example is when the .py script is the application entry=20
point, those aren't compiled into pyc at runtime, and adding a pyc would be=
 a=20
waste. Only the package's makefile (or whatever) can be expected to know th=
at.

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


