Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28881C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 19:08:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.53863.1671736099803574126
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 11:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MZcXfxaH;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id y16so2605443wrm.2
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 11:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ouCQ3fZzKSmEOcU9pSMkHLmFnZV05Tj4IwIsjdIUjZE=;
        b=MZcXfxaHccLU/WQyGoeBQM66g+eUGq2sFVG0qLNNcwNyHGFHEa/jlO1wXDz0XBe5/M
         ou9SoRz1R5RXsBlQ/locqsRDuy2S6Sb2tUc9VGZ65mHgIhefMjqEE01jhgVTdnBCtwBo
         HjLCHjebfVYPT8B2VL/iKmjX6ughjzbDwNEXzCrpAB4v92xzOqKeY5sU8YMkH/ttRfDL
         JaCnaXXn3yaobD2PVdoLcGn6jUahKnhcsor16KorzlkYT8nkaFsorpvKjornCojgiQjx
         yZC7IvjnEdznMLHEImoYtYUp1GtRqtZmebHQfYd2pn6S0uptiTNSJNBtdCkBCT18tFWP
         p9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouCQ3fZzKSmEOcU9pSMkHLmFnZV05Tj4IwIsjdIUjZE=;
        b=taULrHBR1XCVwp/sXNqXT0nqUaAeMGASYfpFcoafE2LSiN5C/J/YAWfBNJC7Cq4Fu2
         jD0IPSjS5VPbZxW3VcgUmb9Ul16RKWpyUL+hILjTx7Ct9IKoN4Jm66PJ5OzzUh7z5UXp
         lUDN2aLdbg2HssU0BWYl+wdET+AJ6Gfn2rkeeCvWOzIGUjNWncV53Qt4mwRNtL9bN3Yz
         /2DMW9iTd9yR2fktQFfV8olgnEGwnd+mkilk4i2W3skuCLBmj7l8n9wgNRKZp9wRixQC
         fF8Nxj9T/WB1Dd80FUL7Oig1t85pk1JR68Hnz06V9q3eSBhTjmOBc2L4cdms+VLc3hzv
         D14g==
X-Gm-Message-State: AFqh2kqpGeYVNdY9BiVZTD8lQl25WcUJBgwLIvOMddh4Qm/PtgfR5VK5
	N+rIZkek0+8ivYTKolxrogvW0CDTd3SOF9mo8Vo=
X-Google-Smtp-Source: AMrXdXvFxAk/ofLUY/VDILnmgumEl/FiydWpMoZSRx0CwphcNgdNWKyqUDW1UV14yJ9xjPExjGiWACwse3nDa6TL/JQ=
X-Received: by 2002:a05:6000:617:b0:272:6459:5f54 with SMTP id
 bn23-20020a056000061700b0027264595f54mr34579wrb.548.1671736098080; Thu, 22
 Dec 2022 11:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20221222150246.91423-1-uvv.mail@gmail.com> <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com> <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
In-Reply-To: <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Dec 2022 20:08:05 +0100
Message-ID: <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, lukas.funke@weidmueller.com, 
	stefan.herbrechtsmeier@weidmueller.com, wonsang.ryu@lge.co, 
	=?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000048cb0405f06f649f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 19:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174971

--00000000000048cb0405f06f649f
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 22, 2022 at 7:39 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
wrote:

> On 22.12.2022 17:48, Bruce Ashfield wrote:
> > On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> This patch is not in master and is not a backport therefore not
> >> eligible for kirkstone/langdale.
>
> My bad, the intention was to have it in all three branches: master,
> kirkstone, and langdale.
>
> > 'nor should it go to master.
> >
> > If someone wants to allow go to fetch sources during builds, it needs
> > to be done in their own layers.
> >
> > Bruce
>
> Probably I misunderstood the outcome of the discussion in my first link.
> Bruce and Richard, you both suggested to have it in go-mod with the
> warning. I agree that it breaks reproducibility, and is considered a bad
> practice in general (I'm aware of a few more build systems with the same
> shortcoming).
>
> My point is, until a proper solution is in place, it should be at least
> documented somewhere that this should be done in own layer/recipe. Any
> suggestions where this can be documented if not in OE-Core?
>

Have you tried the changes submitted by Lukas/Stefan in:
https://lists.openembedded.org/g/openembedded-architecture/message/1539
?

It's not perfect, I was testing it on
https://github.com/influxdata/telegraf/blob/master/go.mod and I've found
some corner cases where it failed.

But it seems like very good start and we should work with Lukas/Stefan to
get it merged in master. Then all branches could consume recipes created in
master and only the exceptions would need to have network access (instead
of the bbclass enabling it for every go-mod user - go-vendor inherits
go-mod as well).

Lukas/Stefan: is there something we can do to help with v2 of your patches?

I wanted to submit better review on submitted patches after more debugging,
but here it is:

1) to resolve 2 deps:
{'Path': 'gonum.org/v1/gonum', 'Version': 'v0.12.0'} due to 404 "ERROR:
Error while fetching redirect page: HTTP Error 404: Not Found"

{'Path': 'code.cloudfoundry.org/clock', 'Version': 'v1.0.0', 'Indirect':
True} due to this being redirect to github.com and failing with "ERROR:
Error while fetching redirect page: <urlopen error [SSL:
CERTIFICATE_VERIFY_FAILED] certificate verify failed: Hostname mismatch,
certificate is not valid for 'code.cloudfoundry.org'. (_ssl.c:996)>"
parse

2) some issues with LICENSEs:
INFO: Please add the following line for 'docs/LICENSE_OF_DEPENDENCIES.md'
to a 'lib/recipetool/licenses.csv' and replace `Unknown` with the license:
c4807c5b058a56c02f592207b4e056b1,Unknown
Traceback (most recent call last):
  File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line 111,
in <module>
    ret = main()
          ^^^^^^
  File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line 100,
in main
    ret = args.func(args)
          ^^^^^^^^^^^^^^^
  File "/OE/layers/openembedded-core/scripts/lib/recipetool/create.py",
line 746, in create_recipe
    handler.process(srctree_use, classes, lines_before, lines_after,
handled, extravalues)
  File "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
line 349, in process
    self._rewrite_lic_uri(lines_before)
  File "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
line 380, in _rewrite_lic_uri
    updated, newlines = bb.utils.edit_metadata(lines_before,
['LIC_FILES_CHKSUM'], varfunc)

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1382, in
edit_metadata
    if handle_var_end():
       ^^^^^^^^^^^^^^^^
  File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1280, in
handle_var_end
    (newvalue, newop, indent, minbreak) = varfunc(in_var, full_value, op,
newlines)

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
line 372, in varfunc
    uri, chksum = license.split(';', 1)
    ^^^^^^^^^^^
ValueError: not enough values to unpack (expected 2, got 1)

(the license was just '/')

3) some SRCREVs set to None leading to parsing failure:

  File "/OE/layers/bitbake/lib/bb/fetch2/git.py", line 762, in
_latest_revision
    raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git
repository in git ls-remote output for %s" % \
bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression
was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
Fetcher failure: Unable to resolve 'None' in upstream git repository in git
ls-remote output for github.com/googleapis/google-cloud-go
The variable dependency chain for the failure is: SRCPV -> PV -> BP ->
FILESPATH

ERROR: Parsing newly created recipe failed, moving recipe to
/OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefailed
for reference. If this looks to be caused by the recipe itself, please
report this error.

It takes long time to fetch all telegraf dependencies, so I'll create some
test recipe to more easily debug these 3 issues in isolation.

--00000000000048cb0405f06f649f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 22, 2022 at 7:39 PM Vyachesla=
v Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 22.12.2022 17:48, Bruce Ashfield wrote:<br>
&gt; On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt; This patch is not in master and is not a backport therefore not<br=
>
&gt;&gt; eligible for kirkstone/langdale.<br>
<br>
My bad, the intention was to have it in all three branches: master, <br>
kirkstone, and langdale.<br>
<br>
&gt; &#39;nor should it go to master.<br>
&gt;<br>
&gt; If someone wants to allow go to fetch sources during builds, it needs<=
br>
&gt; to be done in their own layers.<br>
&gt;<br>
&gt; Bruce<br>
<br>
Probably I misunderstood the outcome of the discussion in my first link. <b=
r>
Bruce and Richard, you both suggested to have it in go-mod with the <br>
warning. I agree that it breaks reproducibility, and is considered a bad <b=
r>
practice in general (I&#39;m aware of a few more build systems with the sam=
e <br>
shortcoming).<br>
<br>
My point is, until a proper solution is in place, it should be at least <br=
>
documented somewhere that this should be done in own layer/recipe. Any <br>
suggestions where this can be documented if not in OE-Core?<br></blockquote=
><div><br></div><div>Have you tried the changes submitted by Lukas/Stefan i=
n:</div><div><a href=3D"https://lists.openembedded.org/g/openembedded-archi=
tecture/message/1539">https://lists.openembedded.org/g/openembedded-archite=
cture/message/1539</a></div><div>?</div><div><br></div><div>It&#39;s not pe=
rfect, I was testing it on <a href=3D"https://github.com/influxdata/telegra=
f/blob/master/go.mod">https://github.com/influxdata/telegraf/blob/master/go=
.mod</a> and I&#39;ve found some corner cases where it failed.</div><div><b=
r></div><div>But it seems like very good start and we should work with Luka=
s/Stefan to get it merged in master. Then all branches could consume recipe=
s created in master and only the exceptions would need to have network acce=
ss (instead of the bbclass enabling it for every go-mod user - go-vendor in=
herits go-mod as well).</div><div><br></div><div>Lukas/Stefan: is there som=
ething we can do to help with v2 of your patches?</div><div><br></div><div>=
I wanted to submit better review on submitted patches after more debugging,=
 but here it is:</div><div><br></div><div>1) to resolve 2 deps:</div><div>{=
&#39;Path&#39;: &#39;<a href=3D"http://gonum.org/v1/gonum">gonum.org/v1/gon=
um</a>&#39;, &#39;Version&#39;: &#39;v0.12.0&#39;} due to 404 &quot;ERROR: =
Error while fetching redirect page: HTTP Error 404: Not Found&quot;<br></di=
v><div><br></div><div>{&#39;Path&#39;: &#39;<a href=3D"http://code.cloudfou=
ndry.org/clock">code.cloudfoundry.org/clock</a>&#39;, &#39;Version&#39;: &#=
39;v1.0.0&#39;, &#39;Indirect&#39;: True} due to this being redirect to <a =
href=3D"http://github.com">github.com</a> and failing with &quot;ERROR: Err=
or while fetching redirect page: &lt;urlopen error [SSL: CERTIFICATE_VERIFY=
_FAILED] certificate verify failed: Hostname mismatch, certificate is not v=
alid for &#39;<a href=3D"http://code.cloudfoundry.org">code.cloudfoundry.or=
g</a>&#39;. (_ssl.c:996)&gt;&quot;<br></div><div>parse</div><div><br></div>=
<div>2) some issues with LICENSEs:</div><div>INFO: Please add the following=
 line for &#39;docs/LICENSE_OF_DEPENDENCIES.md&#39; to a &#39;lib/recipetoo=
l/licenses.csv&#39; and replace `Unknown` with the license:<br>c4807c5b058a=
56c02f592207b4e056b1,Unknown<br>Traceback (most recent call last):<br>=C2=
=A0 File &quot;/OE/build/oe-core/openembedded-core/scripts/recipetool&quot;=
, line 111, in &lt;module&gt;<br>=C2=A0 =C2=A0 ret =3D main()<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^<br>=C2=A0 File &quot;/OE/build/oe-core/open=
embedded-core/scripts/recipetool&quot;, line 100, in main<br>=C2=A0 =C2=A0 =
ret =3D args.func(args)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^=
^^<br>=C2=A0 File &quot;/OE/layers/openembedded-core/scripts/lib/recipetool=
/create.py&quot;, line 746, in create_recipe<br>=C2=A0 =C2=A0 handler.proce=
ss(srctree_use, classes, lines_before, lines_after, handled, extravalues)<b=
r>=C2=A0 File &quot;/OE/layers/openembedded-core/scripts/lib/recipetool/cre=
ate_go.py&quot;, line 349, in process<br>=C2=A0 =C2=A0 self._rewrite_lic_ur=
i(lines_before)<br>=C2=A0 File &quot;/OE/layers/openembedded-core/scripts/l=
ib/recipetool/create_go.py&quot;, line 380, in _rewrite_lic_uri<br>=C2=A0 =
=C2=A0 updated, newlines =3D bb.utils.edit_metadata(lines_before, [&#39;LIC=
_FILES_CHKSUM&#39;], varfunc)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>=C2=A0 File &quot;/OE/build/oe-core/b=
itbake/lib/bb/utils.py&quot;, line 1382, in edit_metadata<br>=C2=A0 =C2=A0 =
if handle_var_end():<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^<br>=C2=
=A0 File &quot;/OE/build/oe-core/bitbake/lib/bb/utils.py&quot;, line 1280, =
in handle_var_end<br>=C2=A0 =C2=A0 (newvalue, newop, indent, minbreak) =3D =
varfunc(in_var, full_value, op, newlines)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^<br>=C2=A0 File &quot;/OE/layers/openembedded-core/scripts/lib/=
recipetool/create_go.py&quot;, line 372, in varfunc<br>=C2=A0 =C2=A0 uri, c=
hksum =3D license.split(&#39;;&#39;, 1)<br>=C2=A0 =C2=A0 ^^^^^^^^^^^<br>Val=
ueError: not enough values to unpack (expected 2, got 1)<br></div><div><br>=
</div><div>(the license was just &#39;/&#39;)</div><div><br></div><div>3) s=
ome SRCREVs set to None leading to parsing failure:</div><div><br></div><di=
v>=C2=A0 File &quot;/OE/layers/bitbake/lib/bb/fetch2/git.py&quot;, line 762=
, in _latest_revision<br>=C2=A0 =C2=A0 raise bb.fetch2.FetchError(&quot;Una=
ble to resolve &#39;%s&#39; in upstream git repository in git ls-remote out=
put for %s&quot; % \<br>bb.data_smart.ExpansionError: Failure expanding var=
iable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exc=
eption FetchError: Fetcher failure: Unable to resolve &#39;None&#39; in ups=
tream git repository in git ls-remote output for <a href=3D"http://github.c=
om/googleapis/google-cloud-go">github.com/googleapis/google-cloud-go</a><br=
>The variable dependency chain for the failure is: SRCPV -&gt; PV -&gt; BP =
-&gt; FILESPATH<br><br>ERROR: Parsing newly created recipe failed, moving r=
ecipe to /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parse=
failed for reference. If this looks to be caused by the recipe itself, plea=
se report this error.</div><div><br></div><div>It takes long time to fetch =
all telegraf dependencies, so I&#39;ll create some test recipe to more easi=
ly debug these 3 issues in isolation.</div><div><br></div></div></div>

--00000000000048cb0405f06f649f--

