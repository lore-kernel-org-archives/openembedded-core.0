Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0B8C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 15:31:22 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42889.1785943881646074524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 08:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eYFadgGm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81f64e8dfbcso16663867b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785943881; cv=none;
        d=google.com; s=arc-20260327;
        b=gQYPt3GSjw/CLnsHcTtCEf0EM2O7hyn0C8/OJOs+JPPq1N7BpI5qQ9EUK6Wcu/5mPY
         QQcHh5w9YnrPoDEKG6B1XG7gilhNIdKdGWntBB5BTsAvLD3DFWJteXorwSvxHr2SxRe9
         iAoaoaTiqAPBTdLAroMqdRuwVFXLIIbflfncd0PegY8IL9EZLXmBOPeNnjd3P91KgVuv
         IdUV0dQyCPNyrKmRwiRIiRDhadUINRSTkqrLB4d+DAzr7BziMyiw1LYwfeGdFCcPuCRh
         ml0tsi1UYPC94Mh55ChAlz58KhaFetDk83IPmbCNMoVm6qVh46X3+q5tX49/tt/mb/WF
         EIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PDluTpOgTni/KHHCr0y85lnKd3JUOIZr6r2qJ5J794o=;
        fh=lqdVayd46aercE8eR3/5GDs2IOHrFxOgZlbbgPzz8Y8=;
        b=JBVJi8Oe0Cikbo9cNuzcrEKGHa0BWFFIm1JNkaajcorK2ZCaZ1KGq7E0U5gnkhaI9G
         qM5+IDjrgMXvVe6G9RmuDmyuE9YU1J1Pk1FRrqPzXnZr/PCzSdzDKfX3Zoqfe94bt2j+
         b9f5ywOy41EKIAM0qS+4urqfp1n2326MAOwrCCapO1QUI9g8rcuO7RhpIl5EvdqXy64O
         Od2ms1co4GzJVMzJjurFpGWGbKlTgywXCKSU5tKms/irxwvP5yqNJmbZGSr2pA5dY05T
         h1/Jyq6BSR37niqW9/1LYP1FBtKio9YUWnaiYoN2DB3a4IA8WgbC2q9OLV0+JTh3nIY5
         QAEg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785943881; x=1786548681; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDluTpOgTni/KHHCr0y85lnKd3JUOIZr6r2qJ5J794o=;
        b=eYFadgGmqlvkCh8i3yCLR6hj4UYaR8ebYJ+4elUvJqTGfFELc1yWPLKsqTAIHTo8XB
         Jyk4qPuAU7AeWbVhMEnxNn+MC1twLUAWvwno0v4acZuVD3zDC0m4vMbifM2Y5zH6bwZ6
         U6fA2NHDBoamG9HRXOtSBrVE7BoFyPTgAJ368=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785943881; x=1786548681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PDluTpOgTni/KHHCr0y85lnKd3JUOIZr6r2qJ5J794o=;
        b=KSDMnmTSObLtIGHIwUUiiZVRdEOAe+s2M1yJ/WrY5V4LQ/NPX6eAKjy0yuBlYYmag1
         knMIEk8xsMsobKmGi9Vp4G3/aO8tJeKaUZ/q6Vx61VCh/grxddvXfyP2ud45BhFpy/9m
         QiGYiccSeLr0X2VYV0lejNI33xeTy0IDSr0W7G+xWIvkQXLSvzBM8++yDkkXnmClJCGG
         1qZna0aYxRXXEh/1u4wC0K0zyDoVwSfmmBA99D4efqtwJft/V/bxJakiLxWPTAob3kfx
         i8dnzP9wibuQY0UtDhJMK2s+ZD8UyNXMqcqFAmpUEWV8im4mM6ng48R0aW0qJQqkPN5U
         dHkw==
X-Gm-Message-State: AOJu0YxZEeYGyVmtXKLgqqAHO6KRznNLybxjbR8XdtglSAaIbQuN4kJ2
	gWZ9bMrEHwQEpYN9z4xFkn7EGDM0nomk5lIe1BL0ZeLpRs0Zg7ShoM5joVCFBWxXllKPpVuuLvV
	koxZeLznBFIB84FdK+uWsZgeQPZHUSWm1lc7M0jJ2Jw==
X-Gm-Gg: AR+sD13/FIl2ZIft2rrYhWQ5dKJwCNEnCioi7R274fdKHul941wM6VA+jGKH9MZEzUz
	urjjWuVbbYdPkneSLhEbdP0G/pAOgzZUFli9G8JKjnIL1MhbUFvdzuU84+7OPEizHgzTxkSiTM0
	6xNLqyIXrczdnI1u4zn7XeOeCdnbk/9NZSkXlVlzYSWv6d7v5/EnuEFO6VgyK224CdyjETz+4cG
	XrLD4D5PE65/N5cjaNIX67DsyC+p8YCGG2SmnBTTMF8e7nbQJ6RmX5MW7Ltrb2M1tnNcfGBOvV3
	kZq1Ogp/B1qCb3bdhgbrMbywQZ4HJHxOBvM41K3qu0M=
X-Received: by 2002:a05:690c:316:b0:81e:45a6:bd4c with SMTP id
 00721157ae682-82022325f16mr49040097b3.14.1785943880421; Wed, 05 Aug 2026
 08:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <0101019fd0766ffe-d5e0ac69-362b-441d-838b-ea7141881f91-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019fd0766ffe-d5e0ac69-362b-441d-838b-ea7141881f91-000000@us-west-2.amazonses.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 5 Aug 2026 08:31:09 -0700
X-Gm-Features: AUfX_mx7Fu_iHztZPRV81E6Cto_TMUVuMZk6eL2rdFcLgTpDTdX7b6sjhwaQmTo
Message-ID: <CAOyo-86ZM7wu8Dd6h9sj=RQQ4swwV3DEbX3PfYujuTP5bttnbQ@mail.gmail.com>
Subject: Re: [AUH] python3-flit-core: upgrading to 4.0.2 FAILED
To: auh@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000094fb4906584e76ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 15:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242871

--00000000000094fb4906584e76ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Several consumers are not yet ready for flit_core 4.x (range is
limited to < 4 in pyproject.toml etc.):

python3-pyparsing_3.3.2.bb
python3-typing-extensions_4.16.0.bb
python3-jinja2_3.1.6.bb
python3-wheel_0.47.0.bb


On Tue, Aug 4, 2026 at 10:47=E2=80=AFPM <auh@yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *python3-flit-core* t=
o
> *4.0.2* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>     - apply the patch: git am
> 0001-python3-flit-core-upgrade-3.12.0-4.0.2.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From cb3320ee18367f0609f7640100a8951159c3e75e Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Wed, 5 Aug 2026 05:12:58 +0000
> Subject: [PATCH] python3-flit-core: upgrade 3.12.0 -> 4.0.2
>
> Source: doc/history.rst
>
> Version 4.0.2
> -------------
>
> - Fix invalid metadata files with ``Import-Name`` (:ghissue:`813`).
>
> Version 4.0.1
> -------------
>
> No changes, but a new tag to trigger an upload to PyPI now that twine wil=
l
> accept it.
>
> Version 4.0
> -----------
>
> This version contains breaking changes, but most projects which are alrea=
dy
> using the ``[project]`` table for metadata shouldn't be affected, and can
> simply
> change the ``flit_core <4`` constraint to ``<5``.
>
> - The ``[tool.flit.metadata]`` table is no longer used for project metada=
ta
>   (:ghpull:`771`). Use the newer :ref:`[project] table
> <pyproject_toml_project>`
>   instead (or if that is not possible, build with ``flit_core <4``).
> - :ref:`build_cmd` and :ref:`publish_cmd` no longer include files in the
> sdist
>   based on what is committed in git or Mercurial (:ghpull:`772`). These
> commands
>   now build packages more like Flit does when called as a backend by e.g.
>   ``python -m build``. Specify :ref:`sdist include & exclude patterns
>   <pyproject_toml_sdist>` instead (Flit can help to generate these), or
> pass
>   the ``--use-vcs`` option to get the old behaviour back.
> - ``flit_core`` now requires Python 3.8 or above (:ghpull:`738`)
> - The ``--setup-py`` option to generate sdists containing a ``setup.py``
> file
>   is no longer available (:ghpull:`776`).
> - Making typing stubs packages with a ``-stubs`` suffix will now work
>   (:ghpull:`742`).
> - The default glob patterns for license files have been extended to inclu=
de
>   ``NOTICE*`` and ``AUTHORS*`` (:ghpull:`758`).
> - ``license-files`` glob patterns can contain spaces (:ghpull:`797`).
> - Fix a bug where license files could be found twice on Windows
> (:ghpull:`752`).
> - The new ``Import-Name`` and ``Import-Namespace`` metadata fields
> (metadata 2.5)
>   are now supported (:ghpull:`774`). In most cases no new input is
> required,
>   as Flit will create this metadata automatically.
> - Fix creating RECORD files when file names include commas (:ghpull:`744`=
).
> - The ``--use-vcs`` option now correctly recognises git from inside a git
>   worktree folder (:ghpull:`799`).
> - On Python 3.12 and above, ``flit build`` now uses the 'data' filter whe=
n
>   extracting the just-created sdist prior to building a wheel
> (:ghpull:`775`).
>   This restricts some special features of tar files, but sdists are
> unlikely
>   to use these features, and they would probably break in other scenarios
> if
>   you did.
> - The vendorised ``readme_renderer`` package was updated to version 44.0
>   (:ghpull:`760`).
>
> - Flit will work with current development versions of Python again
> (:ghpull:`684`).
> - The ``flit`` command line package now requires Python 3.8 or above
> (:ghpull:`660`).
> - Flit now has a ``SECURITY.md`` file in the GitHub repository
> (:ghpull:`665`).
>   new ``[tool.flit.metadata.urls]`` section of
>   archive, such as from GitHub.
> ---
>  .../{python3-flit-core_3.12.0.bb =3D> python3-flit-core_4.0.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-flit-core_3.12.0.bb =3D>
> python3-flit-core_4.0.2.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
> b/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
> rename to meta/recipes-devtools/python/python3-flit-core_4.0.2.bb
> index e40ffd0d0f..27aaae085d 100644
> --- a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
> +++ b/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb
> @@ -8,7 +8,7 @@ BUGTRACKER =3D "https://github.com/pypa/flit/issues"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41eb78fa8a872983a882c694a8305=
f08"
>
> -SRC_URI[sha256sum] =3D
> "1c80f34dd96992e7758b40423d2809f48f640ca285d0b7821825e50745ec3740"
> +SRC_URI[sha256sum] =3D
> "232bc4317279e8952eca9fb3f5e000d8395d693b39c105b99f619ce461e1da85"
>
>  inherit pypi python_flit_core
>
> --
> 2.47.1
>
>

--00000000000094fb4906584e76ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Several consumers are not yet ready for flit_core 4.x (ran=
ge is<div>limited to &lt; 4 in pyproject.toml etc.):<div><span style=3D"bac=
kground-color:transparent"><br></span></div><div><span style=3D"background-=
color:transparent"><a href=3D"http://python3-pyparsing_3.3.2.bb">python3-py=
parsing_3.3.2.bb</a></span></div><div><a href=3D"http://python3-typing-exte=
nsions_4.16.0.bb">python3-typing-extensions_4.16.0.bb</a><br><a href=3D"htt=
p://python3-jinja2_3.1.6.bb">python3-jinja2_3.1.6.bb</a><br><a href=3D"http=
://python3-wheel_0.47.0.bb">python3-wheel_0.47.0.bb</a><br><br></div></div>=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Aug 4, 2026 at 10:47=E2=80=AFPM &lt;<a href=
=3D"mailto:auh@yoctoproject.org">auh@yoctoproject.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe(s) *python3-flit-core* to =
*4.0.2* has Failed(do_compile).<br>
<br>
Detailed error information:<br>
<br>
do_compile failed<br>
<br>
<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-flit-core-upgrade-3.12=
.0-4.0.2.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-- &gt;8 --<br>
From cb3320ee18367f0609f7640100a8951159c3e75e Mon Sep 17 00:00:00 2001<br>
From: Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org" target=3D"=
_blank">auh@yoctoproject.org</a>&gt;<br>
Date: Wed, 5 Aug 2026 05:12:58 +0000<br>
Subject: [PATCH] python3-flit-core: upgrade 3.12.0 -&gt; 4.0.2<br>
<br>
Source: doc/history.rst<br>
<br>
Version 4.0.2<br>
-------------<br>
<br>
- Fix invalid metadata files with ``Import-Name`` (:ghissue:`813`).<br>
<br>
Version 4.0.1<br>
-------------<br>
<br>
No changes, but a new tag to trigger an upload to PyPI now that twine will<=
br>
accept it.<br>
<br>
Version 4.0<br>
-----------<br>
<br>
This version contains breaking changes, but most projects which are already=
<br>
using the ``[project]`` table for metadata shouldn&#39;t be affected, and c=
an simply<br>
change the ``flit_core &lt;4`` constraint to ``&lt;5``.<br>
<br>
- The ``[tool.flit.metadata]`` table is no longer used for project metadata=
<br>
=C2=A0 (:ghpull:`771`). Use the newer :ref:`[project] table &lt;pyproject_t=
oml_project&gt;`<br>
=C2=A0 instead (or if that is not possible, build with ``flit_core &lt;4``)=
.<br>
- :ref:`build_cmd` and :ref:`publish_cmd` no longer include files in the sd=
ist<br>
=C2=A0 based on what is committed in git or Mercurial (:ghpull:`772`). Thes=
e commands<br>
=C2=A0 now build packages more like Flit does when called as a backend by e=
.g.<br>
=C2=A0 ``python -m build``. Specify :ref:`sdist include &amp; exclude patte=
rns<br>
=C2=A0 &lt;pyproject_toml_sdist&gt;` instead (Flit can help to generate the=
se), or pass<br>
=C2=A0 the ``--use-vcs`` option to get the old behaviour back.<br>
- ``flit_core`` now requires Python 3.8 or above (:ghpull:`738`)<br>
- The ``--setup-py`` option to generate sdists containing a ``setup.py`` fi=
le<br>
=C2=A0 is no longer available (:ghpull:`776`).<br>
- Making typing stubs packages with a ``-stubs`` suffix will now work<br>
=C2=A0 (:ghpull:`742`).<br>
- The default glob patterns for license files have been extended to include=
<br>
=C2=A0 ``NOTICE*`` and ``AUTHORS*`` (:ghpull:`758`).<br>
- ``license-files`` glob patterns can contain spaces (:ghpull:`797`).<br>
- Fix a bug where license files could be found twice on Windows (:ghpull:`7=
52`).<br>
- The new ``Import-Name`` and ``Import-Namespace`` metadata fields (metadat=
a 2.5)<br>
=C2=A0 are now supported (:ghpull:`774`). In most cases no new input is req=
uired,<br>
=C2=A0 as Flit will create this metadata automatically.<br>
- Fix creating RECORD files when file names include commas (:ghpull:`744`).=
<br>
- The ``--use-vcs`` option now correctly recognises git from inside a git<b=
r>
=C2=A0 worktree folder (:ghpull:`799`).<br>
- On Python 3.12 and above, ``flit build`` now uses the &#39;data&#39; filt=
er when<br>
=C2=A0 extracting the just-created sdist prior to building a wheel (:ghpull=
:`775`).<br>
=C2=A0 This restricts some special features of tar files, but sdists are un=
likely<br>
=C2=A0 to use these features, and they would probably break in other scenar=
ios if<br>
=C2=A0 you did.<br>
- The vendorised ``readme_renderer`` package was updated to version 44.0<br=
>
=C2=A0 (:ghpull:`760`).<br>
<br>
- Flit will work with current development versions of Python again (:ghpull=
:`684`).<br>
- The ``flit`` command line package now requires Python 3.8 or above (:ghpu=
ll:`660`).<br>
- Flit now has a ``SECURITY.md`` file in the GitHub repository (:ghpull:`66=
5`).<br>
=C2=A0 new ``[tool.flit.metadata.urls]`` section of<br>
=C2=A0 archive, such as from GitHub.<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-flit-core_3.12.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-flit-core_3.12.0.bb</a> =3D&gt; <a href=3D"http=
://python3-flit-core_4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-flit-core_4.0.2.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-flit-c=
ore_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_3.12.=
0.bb</a> =3D&gt; <a href=3D"http://python3-flit-core_4.0.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3-flit-core_4.0.2.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-flit-co=
re_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_3.12.0=
.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-flit-core_=
4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_4.0.2.bb</=
a><br>
similarity index 91%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-flit-cor=
e_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_3.12.0.=
bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-flit-core_=
4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_4.0.2.bb</=
a><br>
index e40ffd0d0f..27aaae085d 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-flit-core_3.12=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_3.12.0.bb</a>=
<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-flit-core_4.0.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_4.0.2.bb</a><b=
r>
@@ -8,7 +8,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://github.com/pypa/fli=
t/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/pypa/flit=
/issues</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D41eb78fa8a872983a882c=
694a8305f08&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;1c80f34dd96992e7758b40423d2809f48f640ca285d0b=
7821825e50745ec3740&quot;<br>
+SRC_URI[sha256sum] =3D &quot;232bc4317279e8952eca9fb3f5e000d8395d693b39c10=
5b99f619ce461e1da85&quot;<br>
<br>
=C2=A0inherit pypi python_flit_core<br>
<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div>

--00000000000094fb4906584e76ab--

