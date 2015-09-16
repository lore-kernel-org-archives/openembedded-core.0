Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3066D60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 15:25:22 +0000 (UTC)
Received: by vkhf67 with SMTP id f67so103624447vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zUGhV88bvRUZVOwiz01jZHZUQXSN17RfGmZMUt3EAoU=;
	b=ViVWPwOvDI5Dg346i3PTqeKNYKewc8VHLnNzUftHZ+1M2k3EMLArto9rKDh/k/QI6l
	A0ndBJD1SuRnL1YsqZmivmRa05Y9q1973yEirm5ietLTCxIAyvdyv4KQMlmXv+QIwNXk
	TPC094cw/GPK410KrzkNhKk4p6uJ90Ql8e2Owtx2tveuZcLtQTeT3E5mLxl9VRAzJzYD
	rnp3l9a3PueeSp7Qij1P+woVd6BqQOMvgL/Eij1b31lmY2wl0kLbKlBDxvviTnguoJEt
	MHbpB2Khq+5E4+Hsrj3ZWsQ2oRCES4S84Y4aVCHkLqMMshBMIc3xKjiw8fdlqNtUdbha
	2E4Q==
X-Received: by 10.31.132.131 with SMTP id g125mr29799347vkd.40.1442417122582; 
	Wed, 16 Sep 2015 08:25:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.203.2 with HTTP; Wed, 16 Sep 2015 08:25:03 -0700 (PDT)
In-Reply-To: <1473703.IaEkCir4YU@peggleto-mobl.ger.corp.intel.com>
References: <1442375866-1848-1-git-send-email-kergoth@gmail.com>
	<1473703.IaEkCir4YU@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 16 Sep 2015 08:25:03 -0700
Message-ID: <CABcZANkpaqkzk+YffX4c0+Q7M6x6K-RvvDrRmVxOXN7nQgqSSQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipetool: add 'newappend' sub-command
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
X-List-Received-Date: Wed, 16 Sep 2015 15:25:25 -0000
Content-Type: multipart/alternative; boundary=001a1143d7b635a5cc051fdee88b

--001a1143d7b635a5cc051fdee88b
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 16, 2015 at 8:21 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Chris,
>
> On Tuesday 15 September 2015 20:57:46 Christopher Larson wrote:
> > This sub-command creates a bbappend for the specified target and prints
> the
> > path to the bbappend. The -w argument, as with some of the other
> recipetool
> > commands, will make a version-independent bbappend.
> >
> > Example usage: recipetool newappend meta-mylayer virtual/kernel
> >
> > [YOCTO #7964]
> >
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > ---
> >  scripts/lib/recipetool/newappend.py | 126
> > ++++++++++++++++++++++++++++++++++++ 1 file changed, 126 insertions(+)
> >  create mode 100644 scripts/lib/recipetool/newappend.py
> >
> > diff --git a/scripts/lib/recipetool/newappend.py
> > b/scripts/lib/recipetool/newappend.py new file mode 100644
> > index 0000000..be9077c
> > --- /dev/null
> > +++ b/scripts/lib/recipetool/newappend.py
> > @@ -0,0 +1,126 @@
> > +# Recipe creation tool - newappend plugin
> > +#
> > +# This sub-command creates a bbappend for the specified target and
> prints
> > the +# path to the bbappend.
> > +#
> > +# Example: recipetool newappend meta-mylayer busybox
> > +#
> > +# Copyright (C) 2015 Christopher Larson <kergoth@gmail.com>
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2 as
> > +# published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> along
> > +# with this program; if not, write to the Free Software Foundation,
> Inc.,
> > +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > +
> > +import argparse
> > +import errno
> > +import logging
> > +import os
> > +import re
> > +
> > +
> > +logger = logging.getLogger('recipetool')
> > +tinfoil = None
> > +
> > +
> > +def plugin_init(pluginlist):
> > +    # Don't need to do anything here right now, but plugins must have
> this
> > function defined +    pass
> > +
> > +
> > +def tinfoil_init(instance):
> > +    global tinfoil
> > +    tinfoil = instance
> > +
> > +
> > +def _provide_to_pn(cooker, provide):
> > +    """Get the name of the preferred recipe for the specified
> provide."""
> > +    import bb.providers
> > +    filenames = cooker.recipecache.providers[provide]
> > +    eligible, foundUnique = bb.providers.filterProviders(filenames,
> > provide, cooker.expanded_data, cooker.recipecache) +    filename =
> > eligible[0]
> > +    pn = cooker.recipecache.pkg_fn[filename]
> > +    return pn
> > +
> > +
> > +def _get_recipe_file(cooker, pn):
> > +    import oe.recipeutils
> > +    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
> > +    if not recipefile:
> > +        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
> > +        if skipreasons:
> > +            logger.error('\n'.join(skipreasons))
> > +        else:
> > +            logger.error("Unable to find any recipe file matching %s" %
> pn)
> > +    return recipefile
> > +
> > +
> > +def layer(layerpath):
> > +    if not os.path.exists(os.path.join(layerpath, 'conf',
> 'layer.conf')):
> > +        raise argparse.ArgumentTypeError('{0!r} must be a path to a
> valid
> > layer'.format(layerpath)) +    return layerpath
> > +
> > +
> > +def newappend(args):
> > +    pn = _provide_to_pn(tinfoil.cooker, args.target)
> > +    recipe_path = _get_recipe_file(tinfoil.cooker, pn)
> > +
> > +    # Map recipe path to the layer it's in
> > +    for layerpath in tinfoil.config_data.getVar('BBLAYERS',
> True).split():
> > +        layerconf = os.path.join(layerpath, 'conf', 'layer.conf')
> > +        l = bb.data.init()
> > +        l.setVar('LAYERDIR', layerpath)
> > +        l = bb.parse.handle(layerconf, l)
> > +        l.expandVarref('LAYERDIR')
> > +
> > +        for layername in l.getVar('BBFILE_COLLECTIONS', True).split():
> > +            pattern = l.getVar('BBFILE_PATTERN_' + layername, True)
> > +            if pattern and re.match(pattern, recipe_path):
> > +                recipe_layer_path = layerpath
> > +                break
> > +        else:
> > +            continue
> > +        break
> > +    else:
> > +        recipe_layer_path =
> > os.path.dirname(os.path.dirname(os.path.dirname(recipe_path))) +
> > +    recipe_relpath = os.path.relpath(recipe_path, recipe_layer_path)
> > +    append_relpath = recipe_relpath + 'append'
> > +    append_path = os.path.join(args.destlayer, append_relpath)
> > +
> > +    if args.wildcard_version and '_' in os.path.basename(append_path):
> > +        base, _ = os.path.splitext(append_path)
> > +        base, _ = base.rsplit('_', 1)
> > +        append_path = base + '_%.bbappend'
> > +
> > +    if not os.path.exists(append_path):
> > +        try:
> > +            os.makedirs(os.path.dirname(append_path))
> > +        except OSError as exc:
> > +            if exc.errno != errno.EEXIST:
> > +                raise
> > +
> > +        try:
> > +            open(append_path, 'a')
> > +        except (OSError, IOError) as exc:
> > +            logger.critical(str(exc))
> > +            return 1
> > +
> > +    print(append_path)
> > +
> > +
> > +def register_command(subparsers):
> > +    parser = subparsers.add_parser('newappend',
> > +                                   help='Create a bbappend for the
> > specified target in the specified layer') +    parser.add_argument('-w',
> > '--wildcard-version', help='Use wildcard to make the bbappend apply to
> any
> > recipe version', action='store_true') +
> parser.add_argument('destlayer',
> > help='Base directory of the destination layer to write the bbappend to',
> > type=layer) +    parser.add_argument('target', help='Target
> recipe/provide
> > to append') +    parser.set_defaults(func=newappend, parserecipes=True)
>
> So the first thing that springs to mind here is that there's a bunch of
> code to
> do the major part of this in recipeutils (e.g. finding the correct name and
> location for a bbappend file is done by get_bbappend_path()) - shouldn't
> we be
> using that here?
>

Probably, I had no idea that function existed :) Thanks, will take a look.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143d7b635a5cc051fdee88b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 16, 2015 at 8:21 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":2yp" class=3D"a3s" style=3D"overflow:hidden">Hi Chris,<br>
<div><div class=3D"h5"><br>
On Tuesday 15 September 2015 20:57:46 Christopher Larson wrote:<br>
&gt; This sub-command creates a bbappend for the specified target and print=
s the<br>
&gt; path to the bbappend. The -w argument, as with some of the other recip=
etool<br>
&gt; commands, will make a version-independent bbappend.<br>
&gt;<br>
&gt; Example usage: recipetool newappend meta-mylayer virtual/kernel<br>
&gt;<br>
&gt; [YOCTO #7964]<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com">kergoth@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/recipetool/newappend.py | 126<br>
&gt; ++++++++++++++++++++++++++++++++++++ 1 file changed, 126 insertions(+)=
<br>
&gt;=C2=A0 create mode 100644 scripts/lib/recipetool/newappend.py<br>
&gt;<br>
&gt; diff --git a/scripts/lib/recipetool/newappend.py<br>
&gt; b/scripts/lib/recipetool/newappend.py new file mode 100644<br>
&gt; index 0000000..be9077c<br>
&gt; --- /dev/null<br>
&gt; +++ b/scripts/lib/recipetool/newappend.py<br>
&gt; @@ -0,0 +1,126 @@<br>
&gt; +# Recipe creation tool - newappend plugin<br>
&gt; +#<br>
&gt; +# This sub-command creates a bbappend for the specified target and pr=
ints<br>
&gt; the +# path to the bbappend.<br>
&gt; +#<br>
&gt; +# Example: recipetool newappend meta-mylayer busybox<br>
&gt; +#<br>
&gt; +# Copyright (C) 2015 Christopher Larson &lt;<a href=3D"mailto:kergoth=
@gmail.com">kergoth@gmail.com</a>&gt;<br>
&gt; +#<br>
&gt; +# This program is free software; you can redistribute it and/or modif=
y<br>
&gt; +# it under the terms of the GNU General Public License version 2 as<b=
r>
&gt; +# published by the Free Software Foundation.<br>
&gt; +#<br>
&gt; +# This program is distributed in the hope that it will be useful,<br>
&gt; +# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<=
br>
&gt; +# GNU General Public License for more details.<br>
&gt; +#<br>
&gt; +# You should have received a copy of the GNU General Public License a=
long<br>
&gt; +# with this program; if not, write to the Free Software Foundation, I=
nc.,<br>
&gt; +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<br>
&gt; +<br>
&gt; +import argparse<br>
&gt; +import errno<br>
&gt; +import logging<br>
&gt; +import os<br>
&gt; +import re<br>
&gt; +<br>
&gt; +<br>
&gt; +logger =3D logging.getLogger(&#39;recipetool&#39;)<br>
&gt; +tinfoil =3D None<br>
&gt; +<br>
&gt; +<br>
&gt; +def plugin_init(pluginlist):<br>
&gt; +=C2=A0 =C2=A0 # Don&#39;t need to do anything here right now, but plu=
gins must have this<br>
&gt; function defined +=C2=A0 =C2=A0 pass<br>
&gt; +<br>
&gt; +<br>
&gt; +def tinfoil_init(instance):<br>
&gt; +=C2=A0 =C2=A0 global tinfoil<br>
&gt; +=C2=A0 =C2=A0 tinfoil =3D instance<br>
&gt; +<br>
&gt; +<br>
&gt; +def _provide_to_pn(cooker, provide):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Get the name of the preferred recipe =
for the specified provide.&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 import bb.providers<br>
&gt; +=C2=A0 =C2=A0 filenames =3D cooker.recipecache.providers[provide]<br>
&gt; +=C2=A0 =C2=A0 eligible, foundUnique =3D bb.providers.filterProviders(=
filenames,<br>
&gt; provide, cooker.expanded_data, cooker.recipecache) +=C2=A0 =C2=A0 file=
name =3D<br>
&gt; eligible[0]<br>
&gt; +=C2=A0 =C2=A0 pn =3D cooker.recipecache.pkg_fn[filename]<br>
&gt; +=C2=A0 =C2=A0 return pn<br>
&gt; +<br>
&gt; +<br>
&gt; +def _get_recipe_file(cooker, pn):<br>
&gt; +=C2=A0 =C2=A0 import oe.recipeutils<br>
&gt; +=C2=A0 =C2=A0 recipefile =3D oe.recipeutils.pn_to_recipe(cooker, pn)<=
br>
&gt; +=C2=A0 =C2=A0 if not recipefile:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 skipreasons =3D oe.recipeutils.get_unavai=
lable_reasons(cooker, pn)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if skipreasons:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&#39;\n&#39;.j=
oin(skipreasons))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot;Unable t=
o find any recipe file matching %s&quot; % pn)<br>
&gt; +=C2=A0 =C2=A0 return recipefile<br>
&gt; +<br>
&gt; +<br>
&gt; +def layer(layerpath):<br>
&gt; +=C2=A0 =C2=A0 if not os.path.exists(os.path.join(layerpath, &#39;conf=
&#39;, &#39;layer.conf&#39;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise argparse.ArgumentTypeError(&#39;{0!=
r} must be a path to a valid<br>
&gt; layer&#39;.format(layerpath)) +=C2=A0 =C2=A0 return layerpath<br>
&gt; +<br>
&gt; +<br>
&gt; +def newappend(args):<br>
&gt; +=C2=A0 =C2=A0 pn =3D _provide_to_pn(tinfoil.cooker, args.target)<br>
&gt; +=C2=A0 =C2=A0 recipe_path =3D _get_recipe_file(tinfoil.cooker, pn)<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Map recipe path to the layer it&#39;s in<br>
&gt; +=C2=A0 =C2=A0 for layerpath in tinfoil.config_data.getVar(&#39;BBLAYE=
RS&#39;, True).split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 layerconf =3D os.path.join(layerpath, &#3=
9;conf&#39;, &#39;layer.conf&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D bb.data.init()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l.setVar(&#39;LAYERDIR&#39;, layerpath)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D bb.parse.handle(layerconf, l)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l.expandVarref(&#39;LAYERDIR&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for layername in l.getVar(&#39;BBFILE_COL=
LECTIONS&#39;, True).split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattern =3D l.getVar(&#39;B=
BFILE_PATTERN_&#39; + layername, True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pattern and re.match(pat=
tern, recipe_path):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_layer_=
path =3D layerpath<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_layer_path =3D<br>
&gt; os.path.dirname(os.path.dirname(os.path.dirname(recipe_path))) +<br>
&gt; +=C2=A0 =C2=A0 recipe_relpath =3D os.path.relpath(recipe_path, recipe_=
layer_path)<br>
&gt; +=C2=A0 =C2=A0 append_relpath =3D recipe_relpath + &#39;append&#39;<br=
>
&gt; +=C2=A0 =C2=A0 append_path =3D os.path.join(args.destlayer, append_rel=
path)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if args.wildcard_version and &#39;_&#39; in os.path.bas=
ename(append_path):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, _ =3D os.path.splitext(append_path)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 base, _ =3D base.rsplit(&#39;_&#39;, 1)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 append_path =3D base + &#39;_%.bbappend&#=
39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if not os.path.exists(append_path):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(os.path.dirname=
(append_path))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as exc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if exc.errno !=3D errno.EEX=
IST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 open(append_path, &#39;a&#3=
9;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (OSError, IOError) as exc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.critical(str(exc))<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 print(append_path)<br>
&gt; +<br>
&gt; +<br>
&gt; +def register_command(subparsers):<br>
&gt; +=C2=A0 =C2=A0 parser =3D subparsers.add_parser(&#39;newappend&#39;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;Create =
a bbappend for the<br>
&gt; specified target in the specified layer&#39;) +=C2=A0 =C2=A0 parser.ad=
d_argument(&#39;-w&#39;,<br>
&gt; &#39;--wildcard-version&#39;, help=3D&#39;Use wildcard to make the bba=
ppend apply to any<br>
&gt; recipe version&#39;, action=3D&#39;store_true&#39;) +=C2=A0 =C2=A0 par=
ser.add_argument(&#39;destlayer&#39;,<br>
&gt; help=3D&#39;Base directory of the destination layer to write the bbapp=
end to&#39;,<br>
&gt; type=3Dlayer) +=C2=A0 =C2=A0 parser.add_argument(&#39;target&#39;, hel=
p=3D&#39;Target recipe/provide<br>
&gt; to append&#39;) +=C2=A0 =C2=A0 parser.set_defaults(func=3Dnewappend, p=
arserecipes=3DTrue)<br>
<br>
</div></div>So the first thing that springs to mind here is that there&#39;=
s a bunch of code to<br>
do the major part of this in recipeutils (e.g. finding the correct name and=
<br>
location for a bbappend file is done by get_bbappend_path()) - shouldn&#39;=
t we be<br>
using that here?</div></blockquote></div><br>Probably, I had no idea that f=
unction existed :) Thanks, will take a look.<br>-- <br><div class=3D"gmail_=
signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1143d7b635a5cc051fdee88b--
