Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5E93677031
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:17:27 +0000 (UTC)
Received: by obqa2 with SMTP id a2so4941562obq.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 04:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rLClt1HxLuIEPGcYmhbk04/igYmGHxOpOtj3HmQGbfs=;
	b=aguCEtZ9Mrh50Jy4d8UkTn+yhrUcVdyHzg2ip1fTCkopOy4BFFjbY11iMZMoRsblLG
	DcX5j+ZJK708P4oMMKiTe+m3L66VazUfGbE1NYQEZClYzStSCKvQyuUAaleSKnywuRim
	V7pUxQNASQW3kuWDL2mq2WRzB1bGgOA5+OkWigHUMUSN1yt5YPKR1PIoOxvIu7o81KHQ
	Jkup56l60TdQyEQ3ciSNksbxvDrWoGFExKMB8dZJEAhKcukNB7JP2QmHZ1WYtDV2i+aM
	tMJfSYTqdM5ARSU0LJLYAslUK359NM0PbdzpE3cYP84MNkBim0TCiY9fC+63nRyyvplK
	sbOA==
X-Gm-Message-State: ALoCoQke0ysmMdM9DORY47jon7DoAJMIHIea0IKsJOKih1d3ftMAZPdi5dGXLExVm7KSLrpSSBV9
X-Received: by 10.60.50.169 with SMTP id d9mr21561876oeo.9.1441192648109; Wed,
	02 Sep 2015 04:17:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Wed, 2 Sep 2015 04:16:58 -0700 (PDT)
In-Reply-To: <8c9a985168c6e8d52ac777bc7322c6fda92983c2.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
	<8c9a985168c6e8d52ac777bc7322c6fda92983c2.1440950164.git.ed.bartosh@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 2 Sep 2015 14:16:58 +0300
Message-ID: <CAHiDW_EA-=tfahxA7_KXhfmWmOMBjES4_WCTOns3O25odMJTZg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] devtool: make 2 functions public
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
X-List-Received-Date: Wed, 02 Sep 2015 11:17:28 -0000
Content-Type: multipart/alternative; boundary=001a11c3087ad842d9051ec1cf70

--001a11c3087ad842d9051ec1cf70
Content-Type: text/plain; charset=UTF-8

On 30 August 2015 at 19:08, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>
> Moved standard.py:_parse_recipe -> __init__.py:parse_recipe and
>       standard.py:_get_recipe_file ->  __init__.py:get_recipe_file
> to be able to call them from other modules.

Hi Ed,

Can you take a look if the failures in
https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/173/steps/Running%20oe-selftest/logs/stdio
are related to this patch (there's lots of "NameError: global name
'_parse_recipe' is not defined")

Jussi

>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/devtool/__init__.py | 27 +++++++++++++++++++++++++++
>  scripts/lib/devtool/standard.py | 36 ++++--------------------------------
>  2 files changed, 31 insertions(+), 32 deletions(-)
>
> diff --git a/scripts/lib/devtool/__init__.py
b/scripts/lib/devtool/__init__.py
> index 1747fff..97ac6ae 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -116,3 +116,30 @@ def add_md5(config, recipename, filename):
>      md5 = bb.utils.md5_file(filename)
>      with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a')
as f:
>          f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename,
config.workspace_path), md5))
> +
> +def get_recipe_file(cooker, pn):
> +    """Find recipe file corresponding a package name"""
> +    import oe.recipeutils
> +    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
> +    if not recipefile:
> +        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
> +        if skipreasons:
> +            logger.error('\n'.join(skipreasons))
> +        else:
> +            logger.error("Unable to find any recipe file matching %s" %
pn)
> +    return recipefile
> +
> +def parse_recipe(config, tinfoil, pn, appends):
> +    """Parse recipe of a package"""
> +    import oe.recipeutils
> +    recipefile = get_recipe_file(tinfoil.cooker, pn)
> +    if not recipefile:
> +        # Error already logged
> +        return None
> +    if appends:
> +        append_files =
tinfoil.cooker.collection.get_file_appends(recipefile)
> +        # Filter out appends from the workspace
> +        append_files = [path for path in append_files if
> +                        not path.startswith(config.workspace_path)]
> +    return oe.recipeutils.parse_recipe(recipefile, append_files,
> +                                       tinfoil.config_data)
> diff --git a/scripts/lib/devtool/standard.py
b/scripts/lib/devtool/standard.py
> index 4aa6ebd..97c45d9 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -26,7 +26,7 @@ import argparse
>  import scriptutils
>  import errno
>  from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
> -from devtool import add_md5
> +from devtool import add_md5, parse_recipe
>
>  logger = logging.getLogger('devtool')
>
> @@ -157,34 +157,6 @@ def _check_compatible_recipe(pn, d):
>                             "from working. You will need to disable this "
>                             "first." % pn)
>
> -def _get_recipe_file(cooker, pn):
> -    """Find recipe file corresponding a package name"""
> -    import oe.recipeutils
> -    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
> -    if not recipefile:
> -        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
> -        if skipreasons:
> -            logger.error('\n'.join(skipreasons))
> -        else:
> -            logger.error("Unable to find any recipe file matching %s" %
pn)
> -    return recipefile
> -
> -def _parse_recipe(config, tinfoil, pn, appends):
> -    """Parse recipe of a package"""
> -    import oe.recipeutils
> -    recipefile = _get_recipe_file(tinfoil.cooker, pn)
> -    if not recipefile:
> -        # Error already logged
> -        return None
> -    if appends:
> -        append_files =
tinfoil.cooker.collection.get_file_appends(recipefile)
> -        # Filter out appends from the workspace
> -        append_files = [path for path in append_files if
> -                        not path.startswith(config.workspace_path)]
> -    return oe.recipeutils.parse_recipe(recipefile, append_files,
> -                                       tinfoil.config_data)
> -
> -
>  def _ls_tree(directory):
>      """Recursive listing of files in a directory"""
>      ret = []
> @@ -200,7 +172,7 @@ def extract(args, config, basepath, workspace):
>
>      tinfoil = setup_tinfoil()
>
> -    rd = _parse_recipe(config, tinfoil, args.recipename, True)
> +    rd = parse_recipe(config, tinfoil, args.recipename, True)
>      if not rd:
>          return 1
>
> @@ -420,7 +392,7 @@ def modify(args, config, basepath, workspace):
>
>      tinfoil = setup_tinfoil()
>
> -    rd = _parse_recipe(config, tinfoil, args.recipename, True)
> +    rd = parse_recipe(config, tinfoil, args.recipename, True)
>      if not rd:
>          return 1
>      recipefile = rd.getVar('FILE', True)
> @@ -762,7 +734,7 @@ def update_recipe(args, config, basepath, workspace):
>
>      tinfoil = setup_tinfoil()
>
> -    rd = _parse_recipe(config, tinfoil, args.recipename, True)
> +    rd = parse_recipe(config, tinfoil, args.recipename, True)
>      if not rd:
>          return 1
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11c3087ad842d9051ec1cf70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 August 2015 at 19:08, Ed Bartosh &lt;<a href=3D"mail=
to:ed.bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt; wrote:<br=
>&gt;<br>&gt; Moved standard.py:_parse_recipe -&gt; __init__.py:parse_recip=
e and<br>&gt; =C2=A0 =C2=A0 =C2=A0 standard.py:_get_recipe_file -&gt; =C2=
=A0__init__.py:get_recipe_file<br>&gt; to be able to call them from other m=
odules.<br><br>Hi Ed,<br><br>Can you take a look if the failures in <a href=
=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/=
builds/173/steps/Running%20oe-selftest/logs/stdio">https://autobuilder.yoct=
oproject.org/main/builders/nightly-oe-selftest/builds/173/steps/Running%20o=
e-selftest/logs/stdio</a> are related to this patch (there&#39;s lots of &q=
uot;NameError: global name &#39;_parse_recipe&#39; is not defined&quot;)<br=
><br>Jussi<br>=C2=A0<br>&gt;<br>&gt; Signed-off-by: Ed Bartosh &lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<b=
r>&gt; ---<br>&gt; =C2=A0scripts/lib/devtool/__init__.py | 27 +++++++++++++=
++++++++++++++<br>&gt; =C2=A0scripts/lib/devtool/standard.py | 36 ++++-----=
---------------------------<br>&gt; =C2=A02 files changed, 31 insertions(+)=
, 32 deletions(-)<br>&gt;<br>&gt; diff --git a/scripts/lib/devtool/__init__=
.py b/scripts/lib/devtool/__init__.py<br>&gt; index 1747fff..97ac6ae 100644=
<br>&gt; --- a/scripts/lib/devtool/__init__.py<br>&gt; +++ b/scripts/lib/de=
vtool/__init__.py<br>&gt; @@ -116,3 +116,30 @@ def add_md5(config, recipena=
me, filename):<br>&gt; =C2=A0 =C2=A0 =C2=A0md5 =3D bb.utils.md5_file(filena=
me)<br>&gt; =C2=A0 =C2=A0 =C2=A0with open(os.path.join(config.workspace_pat=
h, &#39;.devtool_md5&#39;), &#39;a&#39;) as f:<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0f.write(&#39;%s|%s|%s\n&#39; % (recipename, os.path.relpath(f=
ilename, config.workspace_path), md5))<br>&gt; +<br>&gt; +def get_recipe_fi=
le(cooker, pn):<br>&gt; + =C2=A0 =C2=A0&quot;&quot;&quot;Find recipe file c=
orresponding a package name&quot;&quot;&quot;<br>&gt; + =C2=A0 =C2=A0import=
 oe.recipeutils<br>&gt; + =C2=A0 =C2=A0recipefile =3D oe.recipeutils.pn_to_=
recipe(cooker, pn)<br>&gt; + =C2=A0 =C2=A0if not recipefile:<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0skipreasons =3D oe.recipeutils.get_unavailable_reas=
ons(cooker, pn)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if skipreasons:<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&#39;\n&#39;.join=
(skipreasons))<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;Unable to find any rec=
ipe file matching %s&quot; % pn)<br>&gt; + =C2=A0 =C2=A0return recipefile<b=
r>&gt; +<br>&gt; +def parse_recipe(config, tinfoil, pn, appends):<br>&gt; +=
 =C2=A0 =C2=A0&quot;&quot;&quot;Parse recipe of a package&quot;&quot;&quot;=
<br>&gt; + =C2=A0 =C2=A0import oe.recipeutils<br>&gt; + =C2=A0 =C2=A0recipe=
file =3D get_recipe_file(tinfoil.cooker, pn)<br>&gt; + =C2=A0 =C2=A0if not =
recipefile:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Error already logged<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>&gt; + =C2=A0 =C2=A0if app=
ends:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0append_files =3D tinfoil.cooker.=
collection.get_file_appends(recipefile)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Filter out appends from the workspace<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0append_files =3D [path for path in append_files if<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0not path.startswith(config.workspace_path)]<br>&gt; + =C2=A0 =C2=A0retur=
n oe.recipeutils.parse_recipe(recipefile, append_files,<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfoil.config_data)<b=
r>&gt; diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/s=
tandard.py<br>&gt; index 4aa6ebd..97c45d9 100644<br>&gt; --- a/scripts/lib/=
devtool/standard.py<br>&gt; +++ b/scripts/lib/devtool/standard.py<br>&gt; @=
@ -26,7 +26,7 @@ import argparse<br>&gt; =C2=A0import scriptutils<br>&gt; =
=C2=A0import errno<br>&gt; =C2=A0from devtool import exec_build_env_command=
, setup_tinfoil, DevtoolError<br>&gt; -from devtool import add_md5<br>&gt; =
+from devtool import add_md5, parse_recipe<br>&gt;<br>&gt; =C2=A0logger =3D=
 logging.getLogger(&#39;devtool&#39;)<br>&gt;<br>&gt; @@ -157,34 +157,6 @@ =
def _check_compatible_recipe(pn, d):<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;from working. You will need to disable this &quot;<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;first.&quot; % pn)<br>&gt;<br>&gt; -def _get_recipe_file(c=
ooker, pn):<br>&gt; - =C2=A0 =C2=A0&quot;&quot;&quot;Find recipe file corre=
sponding a package name&quot;&quot;&quot;<br>&gt; - =C2=A0 =C2=A0import oe.=
recipeutils<br>&gt; - =C2=A0 =C2=A0recipefile =3D oe.recipeutils.pn_to_reci=
pe(cooker, pn)<br>&gt; - =C2=A0 =C2=A0if not recipefile:<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0skipreasons =3D oe.recipeutils.get_unavailable_reasons(=
cooker, pn)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if skipreasons:<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&#39;\n&#39;.join(ski=
preasons))<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;Unable to find any recipe=
 file matching %s&quot; % pn)<br>&gt; - =C2=A0 =C2=A0return recipefile<br>&=
gt; -<br>&gt; -def _parse_recipe(config, tinfoil, pn, appends):<br>&gt; - =
=C2=A0 =C2=A0&quot;&quot;&quot;Parse recipe of a package&quot;&quot;&quot;<=
br>&gt; - =C2=A0 =C2=A0import oe.recipeutils<br>&gt; - =C2=A0 =C2=A0recipef=
ile =3D _get_recipe_file(tinfoil.cooker, pn)<br>&gt; - =C2=A0 =C2=A0if not =
recipefile:<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0# Error already logged<br>=
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>&gt; - =C2=A0 =C2=A0if app=
ends:<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0append_files =3D tinfoil.cooker.=
collection.get_file_appends(recipefile)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Filter out appends from the workspace<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0append_files =3D [path for path in append_files if<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0not path.startswith(config.workspace_path)]<br>&gt; - =C2=A0 =C2=A0retur=
n oe.recipeutils.parse_recipe(recipefile, append_files,<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfoil.config_data)<b=
r>&gt; -<br>&gt; -<br>&gt; =C2=A0def _ls_tree(directory):<br>&gt; =C2=A0 =
=C2=A0 =C2=A0&quot;&quot;&quot;Recursive listing of files in a directory&qu=
ot;&quot;&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0ret =3D []<br>&gt; @@ -200,7 +1=
72,7 @@ def extract(args, config, basepath, workspace):<br>&gt;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0tinfoil =3D setup_tinfoil()<br>&gt;<br>&gt; - =C2=A0 =C2=
=A0rd =3D _parse_recipe(config, tinfoil, args.recipename, True)<br>&gt; + =
=C2=A0 =C2=A0rd =3D parse_recipe(config, tinfoil, args.recipename, True)<br=
>&gt; =C2=A0 =C2=A0 =C2=A0if not rd:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return 1<br>&gt;<br>&gt; @@ -420,7 +392,7 @@ def modify(args, config,=
 basepath, workspace):<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0tinfoil =3D setu=
p_tinfoil()<br>&gt;<br>&gt; - =C2=A0 =C2=A0rd =3D _parse_recipe(config, tin=
foil, args.recipename, True)<br>&gt; + =C2=A0 =C2=A0rd =3D parse_recipe(con=
fig, tinfoil, args.recipename, True)<br>&gt; =C2=A0 =C2=A0 =C2=A0if not rd:=
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>&gt; =C2=A0 =C2=A0 =
=C2=A0recipefile =3D rd.getVar(&#39;FILE&#39;, True)<br>&gt; @@ -762,7 +734=
,7 @@ def update_recipe(args, config, basepath, workspace):<br>&gt;<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0tinfoil =3D setup_tinfoil()<br>&gt;<br>&gt; - =C2=A0 =
=C2=A0rd =3D _parse_recipe(config, tinfoil, args.recipename, True)<br>&gt; =
+ =C2=A0 =C2=A0rd =3D parse_recipe(config, tinfoil, args.recipename, True)<=
br>&gt; =C2=A0 =C2=A0 =C2=A0if not rd:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return 1<br>&gt;<br>&gt; --<br>&gt; 2.1.4<br>&gt;<br>&gt; --<br>&gt; =
_______________________________________________<br>&gt; Openembedded-core m=
ailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.=
org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http:/=
/lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.op=
enembedded.org/mailman/listinfo/openembedded-core</a></div>

--001a11c3087ad842d9051ec1cf70--
