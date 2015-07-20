Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF9B75874
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 14:59:55 +0000 (UTC)
Received: by qgii95 with SMTP id i95so42572434qgi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 07:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u1ZbS5OD1u5jspYBHPSUrZtkDd+Ha9aA6JAhbZ3BxgM=;
	b=dWm7r7n1agb3NThF0u3uRInahmMG6rE0bTSVoQ0tFSVZJIYCvZZRaLhpNWfOp20L3Z
	V9B8iuXmPSW/R0DWNs+m+s08Hyk915nTmXiuhQEC3trKNBluO0hudGD9AV1/mm5fauoT
	2mBzl1JRAR+mQx2vcibN3Wye7kBAvqieLQnIGpLg+bPcAgMhrfSLnyuplhVD1MIw0y+p
	TMWfFnI3xTaWAsgmZ8d7DRxlFbfxQ3B0PeZ77a145nbqsydfL96HyoC875sA7cx29dgj
	rktoNWEXxG+eO1W4uLr1TWfD8nGUVS/kngTvmVjwqyNiLJLjFU9gDVw8fTcKCbtmbzz3
	0M+Q==
X-Gm-Message-State: ALoCoQniOKRHfJHIPyavnEYWTO04gwN/M0HDQpnQtDXLEyrbDZOYVcIGlJSXDqEqfKHjOP0h2FsV
X-Received: by 10.55.15.129 with SMTP id 1mr46547581qkp.29.1437404395514; Mon,
	20 Jul 2015 07:59:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 20 Jul 2015 07:59:36 -0700 (PDT)
In-Reply-To: <34337e7400db6002b7d708a32609e2731d908a1f.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
	<34337e7400db6002b7d708a32609e2731d908a1f.1436889188.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jul 2015 15:59:36 +0100
Message-ID: <CAJTo0LY0CMVgM5FeuLDoejRYCsX1O5JX_JV3t7BZUZbRUxGFBw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Mon, 20 Jul 2015 14:59:59 -0000
Content-Type: multipart/alternative; boundary=001a1146f10064c14d051b4fcaeb

--001a1146f10064c14d051b4fcaeb
Content-Type: text/plain; charset=UTF-8

On 14 July 2015 at 16:57, Christopher Larson <kergoth@gmail.com> wrote:

> +        parser_create_workspace =
> subparsers.add_parser('create-workspace',
> +                                                        help='Set up a
> workspace',
> +                                                        description='Sets
> up a new workspace. NOTE: other devtool subcommands will create a
> workspace automatically as needed, so you only need to use %(prog)s if you
> want to specify where the workspace should be located.')
> +        parser_create_workspace.add_argument('layerpath', nargs='?',
> help='Path in which the workspace layer should be created')
> +        parser_create_workspace.add_argument('--create-only',
> action="store_true", help='Only create the workspace layer, do not alter
> configuration')
> +        parser_create_workspace.set_defaults(func=create_workspace)
>

This is causing the selftests to abort:

FAIL: test_create_workspace (oeqa.selftest.devtool.DevtoolTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/ross/Yocto/poky/meta/lib/oeqa/utils/decorators.py", line 102,
in wrapped_f
    return func(*args)
  File "/home/ross/Yocto/poky/meta/lib/oeqa/selftest/devtool.py", line 97,
in test_create_workspace
    result = runCmd('devtool create-workspace %s' % tempdir)
  File "/home/ross/Yocto/poky/meta/lib/oeqa/utils/commands.py", line 104,
in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status
%d:\n%s" % (command, result.status, result.output))
AssertionError: Command 'devtool create-workspace /tmp/devtoolqaCuFJBv'
returned non-zero exit status 1:
Traceback (most recent call last):
  File "/home/ross/Yocto/poky/scripts/devtool", line 279, in <module>
    ret = main()
  File "/home/ross/Yocto/poky/scripts/devtool", line 268, in main
    ret = args.func(args, config, basepath, workspace, tinfoil)
TypeError: create_workspace() takes exactly 4 arguments (5 given)

(MACHINE=qemux86 oe-selftest --run-tests devtool)

Ross

--001a1146f10064c14d051b4fcaeb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 July 2015 at 16:57, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D":45l" class=3D"" style=3D"overf=
low:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_create_workspace =3D subpar=
sers.add_parser(&#39;create-workspace&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Set up a works=
pace&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description=3D&#39;Sets up=
 a new workspace. NOTE: other <span class=3D"">devtool</span> subcommands w=
ill create a workspace automatically as needed, so you only need to use %(p=
rog)s if you want to specify where the workspace should be located.&#39;)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_create_workspace.add_argument(&#39;laye=
rpath&#39;, nargs=3D&#39;?&#39;, help=3D&#39;Path in which the workspace la=
yer should be created&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_create_workspace.add_argument(&#39;--cr=
eate-only&#39;, action=3D&quot;store_true&quot;, help=3D&#39;Only create th=
e workspace layer, do not alter configuration&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser_create_workspace.set_defaults(func=3Dcr=
eate_workspace)</div></blockquote></div><br>This is causing the selftests t=
o abort:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a"><div class=3D"gmail_extra">FAIL: test_create_workspace (oeqa.selftest.de=
vtool.DevtoolTests)</div><div class=3D"gmail_extra">-----------------------=
-----------------------------------------------</div><div class=3D"gmail_ex=
tra">Traceback (most recent call last):</div><div class=3D"gmail_extra">=C2=
=A0 File &quot;/home/ross/Yocto/poky/meta/lib/oeqa/utils/decorators.py&quot=
;, line 102, in wrapped_f</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 ret=
urn func(*args)</div><div class=3D"gmail_extra">=C2=A0 File &quot;/home/ros=
s/Yocto/poky/meta/lib/oeqa/selftest/devtool.py&quot;, line 97, in test_crea=
te_workspace</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 result =3D runCm=
d(&#39;devtool create-workspace %s&#39; % tempdir)</div><div class=3D"gmail=
_extra">=C2=A0 File &quot;/home/ross/Yocto/poky/meta/lib/oeqa/utils/command=
s.py&quot;, line 104, in runCmd</div><div class=3D"gmail_extra">=C2=A0 =C2=
=A0 raise AssertionError(&quot;Command &#39;%s&#39; returned non-zero exit =
status %d:\n%s&quot; % (command, result.status, result.output))</div><div c=
lass=3D"gmail_extra">AssertionError: Command &#39;devtool create-workspace =
/tmp/devtoolqaCuFJBv&#39; returned non-zero exit status 1:</div><div class=
=3D"gmail_extra">Traceback (most recent call last):</div><div class=3D"gmai=
l_extra">=C2=A0 File &quot;/home/ross/Yocto/poky/scripts/devtool&quot;, lin=
e 279, in &lt;module&gt;</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 ret =
=3D main()</div><div class=3D"gmail_extra">=C2=A0 File &quot;/home/ross/Yoc=
to/poky/scripts/devtool&quot;, line 268, in main</div><div class=3D"gmail_e=
xtra">=C2=A0 =C2=A0 ret =3D args.func(args, config, basepath, workspace, ti=
nfoil)</div><div class=3D"gmail_extra">TypeError: create_workspace() takes =
exactly 4 arguments (5 given)</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">(MACHINE=3Dqemux86 oe-selftest --run-tests devtool)=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div></div>

--001a1146f10064c14d051b4fcaeb--
