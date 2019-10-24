Return-Path: <nick.owens@eero.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id B85667F998
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 18:26:00 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u184so24356220qkd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c1MsleL6nqLVFggkVQ3MK9RoxQUPBc9blkZ3gOp7pIU=;
	b=f722gSIabZ6te2xrde090QLBQv6gV7VvhKmpmdur1EY54ip+rVZ7hooBiEHpwL+S5a
	maWlg1T7Qp61WjM0PX+HknX0ixnIkaGD4W675Qb5VYc5QHlG0bEUvZ9CdB4SllOmZeP3
	/np19hgg+p/WIOWyFdAZ/3dMBDOjOFSYQABag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c1MsleL6nqLVFggkVQ3MK9RoxQUPBc9blkZ3gOp7pIU=;
	b=ODGwIWGPNrpsASbtCqZI2vQ7wCDRPcbXHuDaPXSJtf5+TNR3eH4XpnMmE3lPbFgJAK
	zby0KOcqqNUk6zvbyaBuuTkbsdaGOZIN+djQRgcCtdAG728fEPXUk64gat4pTGpSgKsB
	XkotWUpHxot0LAKDmTzCSB4wmfwyBdPILU9ornbD8z+XTKKLFz3+AeFLp90DguZlvc2e
	UmFVFnc6tkQ922Vj1+5jJGi+nUnscJCu6W4Cu5WmsbWPO18q6Me7g3h9ZJuyXnNOfEUi
	I3Qeo6DuGPUzdWVz/TtZeXMY0dTwT/unvmfpmGnyoB3aYnBGuWaxKLMyEYhySgWDaaBc
	lXDQ==
X-Gm-Message-State: APjAAAV4dBC35E9KCE+GIga2cz/jWja/cLMhU+nnjz5sVcSVXQ97wJ1x
	MLsR+mMC9bK4RKiVy3qPwiNfWfq5QcAevF5X8Y9ahA==
X-Google-Smtp-Source: APXvYqwCNGkgNzUrvDf5tBl7MKPgdaatBvGCOQX+IbpZOPWkCJaQ7wnA93fIwEQfM6Ipou0FLmpnmeeILNrxNfyXKXo=
X-Received: by 2002:a05:620a:74b:: with SMTP id
	i11mr14989694qki.397.1571941561522; 
	Thu, 24 Oct 2019 11:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191022235935.19461-1-nick.owens@eero.com>
	<20191023175939.14612-1-nick.owens@eero.com>
	<20191023175939.14612-2-nick.owens@eero.com>
	<600949430430d26d2c62d0e5c99868b2752978a0.camel@linuxfoundation.org>
In-Reply-To: <600949430430d26d2c62d0e5c99868b2752978a0.camel@linuxfoundation.org>
From: Nick Owens <nick.owens@eero.com>
Date: Thu, 24 Oct 2019 11:25:49 -0700
Message-ID: <CAFQxptWDXReMxPvH4a2y5BiHqquhOhdFnNUpHgFFyU+3FaMjtg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distutils: pass along parallel make flags to setup.py build
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
X-List-Received-Date: Thu, 24 Oct 2019 18:26:00 -0000
Content-Type: multipart/alternative; boundary="00000000000061ed8c0595ac2a91"

--00000000000061ed8c0595ac2a91
Content-Type: text/plain; charset="UTF-8"

i see, it looks like i should apply this to distutils3.bbclass and not
distutils.bbclass, since python2 never got support for --parallel. does
that seem right?

On Thu, Oct 24, 2019 at 1:21 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2019-10-23 at 10:59 -0700, Nick Owens wrote:
> > parallel builds for native code in python modules was added about 5
> > years ago. distutils understands '-j N', so just pass along
> > the right argument to setup.py build.
> >
> > Signed-off-by: Nick Owens <nick.owens@eero.com>
> > ---
> >  meta/classes/distutils.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/distutils.bbclass
> > b/meta/classes/distutils.bbclass
> > index b5c9c2fbbd..ea479f552e 100644
> > --- a/meta/classes/distutils.bbclass
> > +++ b/meta/classes/distutils.bbclass
> > @@ -23,7 +23,7 @@ distutils_do_compile() {
> >           NO_FETCH_BUILD=1 \
> >           STAGING_INCDIR=${STAGING_INCDIR} \
> >           STAGING_LIBDIR=${STAGING_LIBDIR} \
> > -         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> > setup.py build ${DISTUTILS_BUILD_ARGS} || \
> > +         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> > setup.py build ${@oe.utils.parallel_make_argument(d, "-j %d")}
> > ${DISTUTILS_BUILD_ARGS} || \
> >           bbfatal_log "'${PYTHON_PN} setup.py build
> > ${DISTUTILS_BUILD_ARGS}' execution failed."
> >  }
>
> Fails on the autobuilder in testing (step 3b):
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/1164
>
> ERROR: python-setuptools-native-41.4.0-r0 do_compile: 'python setup.py
> build ' execution failed.
> ERROR: python-setuptools-native-41.4.0-r0 do_compile: Execution of
> '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035'
> failed with exit code 1:
> usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
>    or: setup.py --help [cmd1 cmd2 ...]
>    or: setup.py --help-commands
>    or: setup.py cmd --help
>
> error: option -j not recognized
> WARNING:
> /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1
> exit 1 from 'exit 1'
>
> ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/log.do_compile.5035
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
> |    or: setup.py --help [cmd1 cmd2 ...]
> |    or: setup.py --help-commands
> |    or: setup.py cmd --help
> |
> | error: option -j not recognized
> | ERROR: 'python setup.py build ' execution failed.
> | WARNING:
> /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1
> exit 1 from 'exit 1'
> | ERROR: Execution of
> '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035'
> failed with exit code 1:
> | usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
> |    or: setup.py --help [cmd1 cmd2 ...]
> |    or: setup.py --help-commands
> |    or: setup.py cmd --help
> |
> | error: option -j not recognized
> | WARNING:
> /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1
> exit 1 from 'exit 1'
> |
> NOTE: recipe python-setuptools-native-41.4.0-r0: task do_compile: Failed
> ERROR: Task
> (virtual:native:/home/pokybuild/yocto-worker/qa-extras/build/meta/recipes-devtools/python/python-setuptools_41.4.0.bb:do_compile)
> failed with exit code '1'
>
> Also:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1164
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1166
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1163
>
> Cheers,
>
> Richard
>
>
>

--00000000000061ed8c0595ac2a91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">i see, it looks like i should apply this to distutils3.bbc=
lass and not distutils.bbclass, since python2 never got support for --paral=
lel. does that seem right?<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 24, 2019 at 1:21 AM Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Wed, 2019-10-23 at 10:59 -0700, Nick Owens wrote:<br>
&gt; parallel builds for native code in python modules was added about 5<br=
>
&gt; years ago. distutils understands &#39;-j N&#39;, so just pass along<br=
>
&gt; the right argument to setup.py build.<br>
&gt; <br>
&gt; Signed-off-by: Nick Owens &lt;<a href=3D"mailto:nick.owens@eero.com" t=
arget=3D"_blank">nick.owens@eero.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/distutils.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/distutils.bbclass<br>
&gt; b/meta/classes/distutils.bbclass<br>
&gt; index b5c9c2fbbd..ea479f552e 100644<br>
&gt; --- a/meta/classes/distutils.bbclass<br>
&gt; +++ b/meta/classes/distutils.bbclass<br>
&gt; @@ -23,7 +23,7 @@ distutils_do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NO_FETCH_BUILD=3D1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_INCDIR=3D${STAGING_INC=
DIR} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STAGING_LIBDIR=3D${STAGING_LIB=
DIR} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_P=
N}-native/${PYTHON_PN}<br>
&gt; setup.py build ${DISTUTILS_BUILD_ARGS} || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${PYTHON_P=
N}-native/${PYTHON_PN}<br>
&gt; setup.py build ${@oe.utils.parallel_make_argument(d, &quot;-j %d&quot;=
)}<br>
&gt; ${DISTUTILS_BUILD_ARGS} || \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;&#39;${PYTHO=
N_PN} setup.py build<br>
&gt; ${DISTUTILS_BUILD_ARGS}&#39; execution failed.&quot;<br>
&gt;=C2=A0 }<br>
<br>
Fails on the autobuilder in testing (step 3b):<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/69/build=
s/1164" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/69/builds/1164</a><br>
<br>
ERROR: python-setuptools-native-41.4.0-r0 do_compile: &#39;python setup.py =
build &#39; execution failed.<br>
ERROR: python-setuptools-native-41.4.0-r0 do_compile: Execution of &#39;/ho=
me/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64-linux/pytho=
n-setuptools-native/41.4.0-r0/temp/run.do_compile.5035&#39; failed with exi=
t code 1:<br>
usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]<br>
=C2=A0 =C2=A0or: setup.py --help [cmd1 cmd2 ...]<br>
=C2=A0 =C2=A0or: setup.py --help-commands<br>
=C2=A0 =C2=A0or: setup.py cmd --help<br>
<br>
error: option -j not recognized<br>
WARNING: /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_64=
-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1 exit 1=
 from &#39;exit 1&#39;<br>
<br>
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qa-extras=
/build/build/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/=
log.do_compile.5035<br>
Log data follows:<br>
| DEBUG: Executing shell function do_compile<br>
| usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]<br>
|=C2=A0 =C2=A0 or: setup.py --help [cmd1 cmd2 ...]<br>
|=C2=A0 =C2=A0 or: setup.py --help-commands<br>
|=C2=A0 =C2=A0 or: setup.py cmd --help<br>
| <br>
| error: option -j not recognized<br>
| ERROR: &#39;python setup.py build &#39; execution failed.<br>
| WARNING: /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_=
64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1 exit=
 1 from &#39;exit 1&#39;<br>
| ERROR: Execution of &#39;/home/pokybuild/yocto-worker/qa-extras/build/bui=
ld/tmp/work/x86_64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_com=
pile.5035&#39; failed with exit code 1:<br>
| usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]<br>
|=C2=A0 =C2=A0 or: setup.py --help [cmd1 cmd2 ...]<br>
|=C2=A0 =C2=A0 or: setup.py --help-commands<br>
|=C2=A0 =C2=A0 or: setup.py cmd --help<br>
| <br>
| error: option -j not recognized<br>
| WARNING: /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/x86_=
64-linux/python-setuptools-native/41.4.0-r0/temp/run.do_compile.5035:1 exit=
 1 from &#39;exit 1&#39;<br>
| <br>
NOTE: recipe python-setuptools-native-41.4.0-r0: task do_compile: Failed<br=
>
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/qa-extras/build/me=
ta/recipes-devtools/python/python-setuptools_41.4.0.bb:do_compile) failed w=
ith exit code &#39;1&#39;<br>
<br>
Also:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/1164" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/64/builds/1164</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/1166" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/45/builds/1166</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/1163" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/40/builds/1163</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--00000000000061ed8c0595ac2a91--
