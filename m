Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EAEC2D0A6
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 18:05:53 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3829.1792087548060238678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 11:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N+RnWOK0;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679a420b5afso1030679d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 11:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792087547; cv=none;
        d=google.com; s=arc-20260327;
        b=loH9fgxIP9V/lghFzqtxdBxbp2pwleTFicFsF1oWh1cSM8tWGgGdwABqDXcHAGIXon
         +9BXW5LnpkyeobjRuLAyee/9vBWd8PZ5EK15rOCj6Zinz2REa1+cZ20skjeC3LQrd7/F
         TVjlRQz7b2q8GyiEGdKYTCYHlqJHuzw/xh/wmlWVEGSvm5RjMGi2wbyD7WMSi0r8pt70
         b5uKgTPXEwBVKvhCCu4MPFvGLdhixW3wao4WW1ui4KupunOk3KT5oR7OCTXGlUAmP88V
         xbVkBvMh5M9DZw1Lzcfbtvg72fmlekw4BCeeTutMqAquIiE9H52zp8aiupMpEwjsIFeM
         uYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ClxEZUl6wc8GRoHypzqRJ32q7r1zOppZK9RWHfrCfXI=;
        fh=NyM4z5gZGtUQWIstickzsTYcMruWzf50y7m8W7zeb2A=;
        b=l1TEOwFi5H6auJSj+dj+IG+fcb737HtViMIclLwhqKGkyFlQwTAJT5lRQTmBj2LUbv
         OApLcKk77R1aoAobZ+bLG/OAk5vmkIIRIeKyCkF4KinccZR3Xt5WuoycPVpVao5/XR5E
         cyQ7YLQy4PlJAI+T5xzKQtP0geooltqsJTtvCq1u31HV4UrT9M9AkirdXWIonVO7hJh9
         fHrrJh4TteZjAeDSfUlrWBP9QER8n3DELntZ9zkqXZ5B7HX/f0iF6y6ZH5JWUnpOpqFr
         4Cad6LS5tIrm5BD10VmlUud1bCWaqX855/cAvjTX7H+b0AIqdYNijXFBl5Nqf48U7sUf
         pI5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792087547; x=1792692347; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClxEZUl6wc8GRoHypzqRJ32q7r1zOppZK9RWHfrCfXI=;
        b=N+RnWOK0g0lj+5hTYkghI6eyn/Mc6hTxQYv+6umA/WW5qEyOgYQSio2/OdL9Zv53tT
         sqrt4E8XLSyfpu92IXDXCRIWY2Aoc6f013kaFZkbGlT+s4cd82uw596//R3hdXbB7/O2
         iREBpfLzOuMW8rJ2qbxbsh6+zqsKZ75PWzOSoiIcLQFoAoLNyi7TwXkR8q5zWHNzcjl3
         ZiVIli8q9KRBs/EEWAWnhhxZsburcteY/Udx20KOsfsZCt424PNn0t1gp/RfNg1TexPB
         5VqAF0hisnqgxZAnRW+2C2o7HB6+7nHwhmlthGq05Y2f+zJXntDnXGeBHHq33aGqCPGP
         R5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792087547; x=1792692347;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ClxEZUl6wc8GRoHypzqRJ32q7r1zOppZK9RWHfrCfXI=;
        b=MW1Xr4fnEnJhCPFscJ4CmUSpUt1Mj5t+g82WnlrRooyuHuR0QvhADQTFlTaOKXdy1+
         2jXTjlB+CSJDOZlLFL1Z/toOMcs34d64XtD4zuZMl24AVZqNlYyL2rP0lz9ITXWXkDoR
         rv+iTixTVhQZk5NxzVXv1zRwXrnm8cKXt6RIELbIDPG53d5QSf0L9YHTGdZlBv4vxTGj
         2un/Uay7MpQPyIjoczJa4MPdGsAc5mzyKiA77CgzmwwFr7fiDlttPmUOJumna3Qn+14/
         hXgAxQaxzkpN3jdH0ppHFf5N7tWM0wNA+fEBO9r9trahr9Ddn8oKwhw1rc6nhQNDCtZn
         dPpg==
X-Gm-Message-State: AFq9FYLoLTQ/XME9tFW4VlGvd/6s5XfOuRoonluDiow/DsN96Grp098F
	Q67dNbyFuJbx2sYWfCXECTUua/RV1sLL8nAzyaLFiwBVg8ds3FPIasKsHVZfBLPeOBX417ZNnkN
	2bQCrXbbJIkGCJQ0/H+6P2cfDiLf1Cg4=
X-Gm-Gg: AYBFou2Vv9WlDU/1HUuf1VkpdKNi04Wp1hZDzbQbvZ8FtNQG8zkR1fVs3X5Pl58Orts
	4Jgu2ANJh2W/0IYkxc3vs0c8Nvvdg/XqbBl4RVpqvKDn10dbSBZqMSQA27S0wZR76RRQdQuIIHj
	ZMgz/wkB1qF9lq8GaPOqNHYdNu3fueDoCuspJpSFKHWzhlssONGMmHgUgNKb5EWtbxHLGF2NCSu
	rbDkl5OP3KuywzCHuamJHDwU4kc4RNi4tclqK9MVzQ9YEadoaUcf+u3HuyuXte201k28MC8dSNF
	q7H43CzaYW+ocYyYo4AsB0zmdNhXKKa0BjyY+RhoQE1P7L3F4McCBZg=
X-Received: by 2002:a05:690e:c48:b0:679:ab13:553a with SMTP id
 956f58d0204a3-679ab1393f6mr346089d50.19.1792087546892; Thu, 15 Oct 2026
 11:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261012115319.1704048-1-daniel.turull@ericsson.com> <20261012115319.1704048-3-daniel.turull@ericsson.com>
In-Reply-To: <20261012115319.1704048-3-daniel.turull@ericsson.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 15 Oct 2026 12:05:35 -0600
X-Gm-Features: AclHuK_ubUMGixZdYra7upqaw07GvmoCJWQHTm7pEDq5AB7yjDhSdwAOuVVB19s
Message-ID: <CAJdd5GYC2mCkNyiiCJnQZX52ObnuBgGWUsSY0UW5p=AaVZv-KA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] create-spdx-3.0: record component release date in
 SPDX output
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000a39758065de4e584"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 18:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247891

--000000000000a39758065de4e584
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:53=E2=80=AFAM <daniel.turull@ericsson.com> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Record each package's release date in the releaseTime property of its
> software_Package object, using the SOURCE_DATE_EPOCH already computed
> for reproducible builds.
>
> Accuracy depends on how SOURCE_DATE_EPOCH was derived: exact for
> git-tagged recipes, best-effort for tarball/http(s) sources. Some
> Python sdists (e.g. cryptography, hypothesis, maturin) normalize all
> file mtimes to a fixed placeholder, so their releaseTime reflects
> packaging-tool behavior, not the real release date.
>

This one is tricky to me. I understand why this data is useful, but there
are also projects like https://release-monitoring.org/ that likely provide
this information (and are more flexible in how they provide it); Ideally,
you could post-annotate a SBoM with this information. The problem is really
that we don't have any way to correlate our SRC_URI files to that data. You
_could_ perhaps use PN and PV, but if that doesn't match their database, it
doesn't do any good (and, as stated earlier, you really care about the
release date of the SRC_URI artifact).

So, in reality this is probably the best option we have, unless we are
willing to somehow annotate our SRC_URI files to something that can
positively cross-reference https://release-monitoring.org/ and make sure it
stays up to date.


>
> Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> AI-Generated: Uses Kiro with Claude Sonnet 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> v2:
> - Dropped all options per Joshua's feedback; read SDE_FILE directly.
> - Dropped the redundant else: delattr(recipe, "releaseTime") branch.
> - Selftest compares against SDE_FILE content directly instead of
>   SOURCE_DATE_EPOCH, which can diverge from it.
> - Fixed a leak: recipes with no git checkout and no fetched source
>   had SDE_FILE holding only SOURCE_DATE_EPOCH_FALLBACK, showing a
>   bogus 2011-04-05T23:00:00Z releaseTime instead of none.
> v3:
> - Also run after do_unpack: do_deploy_source_date_epoch's setscene
>   shortcut can skip it, leaving SOURCE_DATE_EPOCH unset.
> - get_release_date() reads SOURCE_DATE_EPOCH again instead of
>   SDE_FILE, now that they're guaranteed equivalent.
> - test_release_date_source_date_epoch: switched to tar (base-files
>   has S =3D=3D UNPACKDIR and never gets a real SOURCE_DATE_EPOCH).
> - Added test_release_date_omitted_for_fallback_value.
> v4:
> - Per Richard's feedback, moved releaseTime from do_create_recipe_spdx
>   to do_create_spdx to keep the recipe-only task fetch-free.
> - Per Joshua's suggestion added into each downloaded source
> software_Package
> - Updated selftests accordingly.
> v5:
> - test_release_date_source_date_epoch: force do_unpack before reading
>   SOURCE_DATE_EPOCH. Mathieu hit this on the autobuilder: with all tasks
>   restored from sstate do_unpack never runs, so SDE_FILE is missing and
>   SOURCE_DATE_EPOCH falls back, making the test compare the correct
>   releaseTime against the fallback date.
> ---
>  meta/lib/oe/spdx30_tasks.py          | 22 ++++++++++++++
>  meta/lib/oeqa/selftest/cases/spdx.py | 44 ++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index b6456a214a..dc82f21fb0 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -36,6 +36,24 @@ def set_timestamp_now(d, o, prop):
>          delattr(o, prop)
>
>
> +def get_release_date(d):
> +    """Resolve the release date to record in a package's releaseTime
> property.
> +
> +    Uses SOURCE_DATE_EPOCH, which by this point (do_create_spdx runs aft=
er
> +    do_unpack and do_deploy_source_date_epoch) reflects the source mtime=
s.
> +    Omits the fallback value since it is not a meaningful release date.
> +
> +    Returns a datetime, or None if no release date should be recorded.
> +    """
> +    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
> +    if not source_date_epoch or source_date_epoch =3D=3D d.getVar(
> +        "SOURCE_DATE_EPOCH_FALLBACK"
> +    ):
> +        return None
>

Recipes can also directly set SOURCE_DATE_EPOCH, in which case it should be
ignored. This is why I originally suggested using the same functions that
SOURCE_DATE_EPOCH uses (when it's not overridden) instead of using the
variable.


> +
> +    return datetime.fromtimestamp(int(source_date_epoch), tz=3Dtimezone.=
utc)
> +
> +
>  def add_license_expression(
>      d, objset, license_expression, license_data, search_objsets=3D[]
>  ):
> @@ -441,6 +459,7 @@ def _enrich_source_package(d, dl, fd, file_name,
> primary_purpose):
>
>  def add_download_files(d, objset):
>      inputs =3D set()
> +    release_date =3D get_release_date(d)
>
>      urls =3D d.getVar("SRC_URI").split()
>      fetch =3D bb.fetch.Fetch(urls, d)
> @@ -504,6 +523,9 @@ def add_download_files(d, objset):
>
>              _enrich_source_package(d, dl, fd, file_name, primary_purpose=
)
>
> +            if release_date is not None:
> +                dl.releaseTime =3D release_date
> +

             if fd.method.supports_checksum(fd):
>                  for checksum_id in bb.fetch.CHECKSUM_LIST:
>                      if checksum_id not in
> oe.spdx30.HashAlgorithm.NAMED_INDIVIDUALS:
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py
> b/meta/lib/oeqa/selftest/cases/spdx.py
> index 8285189382 <(828)%20518-9382>..fb1176fe66 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -6,6 +6,7 @@
>
>  import textwrap
>  import hashlib
> +from datetime import datetime, timezone
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
>  import oe.spdx30
> @@ -443,3 +444,46 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
>                  r'\d',
>                  f"Version '{version}' for package '{name}' should contai=
n
> digits"
>              )
> +
> +    def test_release_date_source_date_epoch(self):
> +        """releaseTime should be derived from SOURCE_DATE_EPOCH.
> +
> +        This is recorded on the downloaded source software_Package objec=
ts
> +        produced by do_create_spdx (not the recipe-only
> do_create_recipe_spdx
> +        task), since the release date can only be known once sources are
> +        available and SOURCE_DATE_EPOCH has been computed.
> +        """
> +        # base-files has S =3D=3D UNPACKDIR and never gets a real
> +        # SOURCE_DATE_EPOCH, so use tar, which unpacks a real tarball.
> +        objset =3D self.check_recipe_spdx(
> +            "tar",
> +
> "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-tar.spdx.json",
> +        )
> +
> +        # With all tasks restored from sstate do_unpack never runs,
> leaving
> +        # SDE_FILE missing and SOURCE_DATE_EPOCH at its fallback value.
> +        bitbake("tar -c unpack -f")
> +        source_date_epoch =3D get_bb_var("SOURCE_DATE_EPOCH", "tar")
> +        expected =3D datetime.fromtimestamp(int(source_date_epoch),
> tz=3Dtimezone.utc)
> +
> +        pkg =3D None
> +        for candidate in objset.foreach_type(oe.spdx30.software_Package)=
:
> +            if candidate.software_downloadLocation:
> +                pkg =3D candidate
> +                break
> +
> +        self.assertIsNotNone(pkg, "Unable to find downloaded source
> software_Package")
> +        self.assertEqual(pkg.releaseTime, expected)
> +
> +    def test_release_date_omitted_without_downloaded_source(self):
> +        """releaseTime only applies to downloaded source packages; recip=
es
> +        with only local file:// sources have none, and get no
> releaseTime."""
> +        # base-files only has file:// sources, so it has no downloaded
> +        # source software_Package and thus no releaseTime anywhere.
> +        objset =3D self.check_recipe_spdx(
> +            "base-files",
> +
> "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/builds/build-base-files.spdx.json",
> +        )
> +
> +        for candidate in objset.foreach_type(oe.spdx30.software_Package)=
:
> +            self.assertIsNone(candidate.releaseTime)
>

--000000000000a39758065de4e584
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 12,=
 2026 at 5:53=E2=80=AFAM &lt;<a href=3D"mailto:daniel.turull@ericsson.com">=
daniel.turull@ericsson.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Daniel Turull &lt;<a href=3D"mailto:daniel.=
turull@ericsson.com" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<b=
r>
<br>
Record each package&#39;s release date in the releaseTime property of its<b=
r>
software_Package object, using the SOURCE_DATE_EPOCH already computed<br>
for reproducible builds.<br>
<br>
Accuracy depends on how SOURCE_DATE_EPOCH was derived: exact for<br>
git-tagged recipes, best-effort for tarball/http(s) sources. Some<br>
Python sdists (e.g. cryptography, hypothesis, maturin) normalize all<br>
file mtimes to a fixed placeholder, so their releaseTime reflects<br>
packaging-tool behavior, not the real release date.<br></blockquote><div><b=
r></div><div>This one is tricky to me. I understand why this data is useful=
, but there are also projects like=C2=A0<a href=3D"https://release-monitori=
ng.org/">https://release-monitoring.org/</a> that likely provide this infor=
mation (and are more flexible in how they provide it); Ideally, you could p=
ost-annotate a SBoM with this information. The problem is really that we do=
n&#39;t have any way to correlate our SRC_URI files to that data. You _coul=
d_ perhaps use PN and PV, but if that doesn&#39;t match their database, it =
doesn&#39;t do any good (and, as stated earlier, you really care about the =
release date of the SRC_URI artifact).</div><div><br></div><div>So, in real=
ity this is probably the best option we have, unless we are willing to some=
how annotate our SRC_URI files to something that can positively cross-refer=
ence=C2=A0<span style=3D"background-color:transparent"><a href=3D"https://r=
elease-monitoring.org/">https://release-monitoring.org/</a> and make sure i=
t stays up to date.</span></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Reported-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bri=
and@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt=
;<br>
AI-Generated: Uses Kiro with Claude Sonnet 5<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
---<br>
v2:<br>
- Dropped all options per Joshua&#39;s feedback; read SDE_FILE directly.<br=
>
- Dropped the redundant else: delattr(recipe, &quot;releaseTime&quot;) bran=
ch.<br>
- Selftest compares against SDE_FILE content directly instead of<br>
=C2=A0 SOURCE_DATE_EPOCH, which can diverge from it.<br>
- Fixed a leak: recipes with no git checkout and no fetched source<br>
=C2=A0 had SDE_FILE holding only SOURCE_DATE_EPOCH_FALLBACK, showing a<br>
=C2=A0 bogus 2011-04-05T23:00:00Z releaseTime instead of none.<br>
v3:<br>
- Also run after do_unpack: do_deploy_source_date_epoch&#39;s setscene<br>
=C2=A0 shortcut can skip it, leaving SOURCE_DATE_EPOCH unset.<br>
- get_release_date() reads SOURCE_DATE_EPOCH again instead of<br>
=C2=A0 SDE_FILE, now that they&#39;re guaranteed equivalent.<br>
- test_release_date_source_date_epoch: switched to tar (base-files<br>
=C2=A0 has S =3D=3D UNPACKDIR and never gets a real SOURCE_DATE_EPOCH).<br>
- Added test_release_date_omitted_for_fallback_value.<br>
v4:<br>
- Per Richard&#39;s feedback, moved releaseTime from do_create_recipe_spdx<=
br>
=C2=A0 to do_create_spdx to keep the recipe-only task fetch-free.<br>
- Per Joshua&#39;s suggestion added into each downloaded source software_Pa=
ckage<br>
- Updated selftests accordingly.<br>
v5:<br>
- test_release_date_source_date_epoch: force do_unpack before reading<br>
=C2=A0 SOURCE_DATE_EPOCH. Mathieu hit this on the autobuilder: with all tas=
ks<br>
=C2=A0 restored from sstate do_unpack never runs, so SDE_FILE is missing an=
d<br>
=C2=A0 SOURCE_DATE_EPOCH falls back, making the test compare the correct<br=
>
=C2=A0 releaseTime against the fallback date.<br>
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 ++=
++++++++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 44 +++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 66 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index b6456a214a..dc82f21fb0 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -36,6 +36,24 @@ def set_timestamp_now(d, o, prop):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delattr(o, prop)<br>
<br>
<br>
+def get_release_date(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Resolve the release date to record in a pa=
ckage&#39;s releaseTime property.<br>
+<br>
+=C2=A0 =C2=A0 Uses SOURCE_DATE_EPOCH, which by this point (do_create_spdx =
runs after<br>
+=C2=A0 =C2=A0 do_unpack and do_deploy_source_date_epoch) reflects the sour=
ce mtimes.<br>
+=C2=A0 =C2=A0 Omits the fallback value since it is not a meaningful releas=
e date.<br>
+<br>
+=C2=A0 =C2=A0 Returns a datetime, or None if no release date should be rec=
orded.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 source_date_epoch =3D d.getVar(&quot;SOURCE_DATE_EPOCH&quot;=
)<br>
+=C2=A0 =C2=A0 if not source_date_epoch or source_date_epoch =3D=3D d.getVa=
r(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SOURCE_DATE_EPOCH_FALLBACK&quot;<br>
+=C2=A0 =C2=A0 ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br></blockquote><div><br></div><di=
v>Recipes can also directly set SOURCE_DATE_EPOCH, in which case it should =
be ignored. This is why I originally suggested using the same functions tha=
t SOURCE_DATE_EPOCH uses (when it&#39;s not overridden) instead of using th=
e variable.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
+=C2=A0 =C2=A0 return datetime.fromtimestamp(int(source_date_epoch), tz=3Dt=
imezone.utc)<br>
+<br>
+<br>
=C2=A0def add_license_expression(<br>
=C2=A0 =C2=A0 =C2=A0d, objset, license_expression, license_data, search_obj=
sets=3D[]<br>
=C2=A0):<br>
@@ -441,6 +459,7 @@ def _enrich_source_package(d, dl, fd, file_name, primar=
y_purpose):<br>
<br>
=C2=A0def add_download_files(d, objset):<br>
=C2=A0 =C2=A0 =C2=A0inputs =3D set()<br>
+=C2=A0 =C2=A0 release_date =3D get_release_date(d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0urls =3D d.getVar(&quot;SRC_URI&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0fetch =3D bb.fetch.Fetch(urls, d)<br>
@@ -504,6 +523,9 @@ def add_download_files(d, objset):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_enrich_source_package(d, d=
l, fd, file_name, primary_purpose)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if release_date is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dl.releaseTime =3D=
 release_date<br>
+</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if fd.method.supports_check=
sum(fd):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for checksum_=
id in bb.fetch.CHECKSUM_LIST:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if checksum_id not in oe.spdx30.HashAlgorithm.NAMED_INDIVIDUALS:<br>
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py<br>
index <a href=3D"tel:(828)%20518-9382" value=3D"+18285189382" target=3D"_bl=
ank">8285189382</a>..fb1176fe66 100644<br>
--- a/meta/lib/oeqa/selftest/cases/spdx.py<br>
+++ b/meta/lib/oeqa/selftest/cases/spdx.py<br>
@@ -6,6 +6,7 @@<br>
<br>
=C2=A0import textwrap<br>
=C2=A0import hashlib<br>
+from datetime import datetime, timezone<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
=C2=A0from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars<br>
=C2=A0import oe.spdx30<br>
@@ -443,3 +444,46 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r&#39;\d&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f&quot;Versio=
n &#39;{version}&#39; for package &#39;{name}&#39; should contain digits&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+<br>
+=C2=A0 =C2=A0 def test_release_date_source_date_epoch(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;releaseTime should be derive=
d from SOURCE_DATE_EPOCH.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is recorded on the downloaded source soft=
ware_Package objects<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 produced by do_create_spdx (not the recipe-onl=
y do_create_recipe_spdx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 task), since the release date can only be know=
n once sources are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 available and SOURCE_DATE_EPOCH has been compu=
ted.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # base-files has S =3D=3D UNPACKDIR and never =
gets a real<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # SOURCE_DATE_EPOCH, so use tar, which unpacks=
 a real tarball.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objset =3D self.check_recipe_spdx(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tar&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{DEPLOY_DIR_SPDX}/{SSTATE_=
PKGARCH}/builds/build-tar.spdx.json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # With all tasks restored from sstate do_unpac=
k never runs, leaving<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # SDE_FILE missing and SOURCE_DATE_EPOCH at it=
s fallback value.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;tar -c unpack -f&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 source_date_epoch =3D get_bb_var(&quot;SOURCE_=
DATE_EPOCH&quot;, &quot;tar&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected =3D datetime.fromtimestamp(int(source=
_date_epoch), tz=3Dtimezone.utc)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for candidate in objset.foreach_type(oe.spdx30=
.software_Package):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if candidate.software_downloadLo=
cation:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg =3D candidate<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(pkg, &quot;Unable to find=
 downloaded source software_Package&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(pkg.releaseTime, expected)<br=
>
+<br>
+=C2=A0 =C2=A0 def test_release_date_omitted_without_downloaded_source(self=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;releaseTime only applies to =
downloaded source packages; recipes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with only local file:// sources have none, and=
 get no releaseTime.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # base-files only has file:// sources, so it h=
as no downloaded<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # source software_Package and thus no releaseT=
ime anywhere.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objset =3D self.check_recipe_spdx(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;base-files&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/builds/build-base-files.spdx.json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for candidate in objset.foreach_type(oe.spdx30=
.software_Package):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNone(candidate.rele=
aseTime)<br>
</blockquote></div></div>

--000000000000a39758065de4e584--

