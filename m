Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF03C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 15:30:00 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13263.1790090990227503433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 08:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PTWHy+x9;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d440939efso945577b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 08:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790090989; cv=none;
        d=google.com; s=arc-20260327;
        b=qzyNUGN+zLb8gKwI1fR+9TSF3yw/b7c1N3Zy0Vw01fRu9BN5IYIPpkS2/TkIiMW3/Z
         B19xC/0jnaQm1BOjI8cBar/FSsLM39lEAR7Iy0AW+0vnT3TABUZTL6Av8VeFZGu2mQ24
         JiRR7NZl91tKrrJQC3B1uOYx0CZjqRfEONeBthL0hZMi6ZOSN4hIC33eSpR7ISOKL/xb
         ubkixlX7017W42ntEPIBOkSu0EseN9tFID3UaKSzk+PTO0T3atJoQZpBWBGVvAFWxVZl
         tchQS6nub54J4LU4RyKtqHBCqeBE4b6X6w4dTe6sMoeqOjx0eok90jc4hKM+m3cmjOOX
         4BNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mwwCpW1soRRwsZU1VSaLCsApvLIIiJTJt4hlrhiI0b0=;
        fh=CBzNg/NL21DWTHY4T0WFOKUAyqx0HIPJNzSHf+IjR2E=;
        b=Bgm7H5GtWdCYqIeyZtQkp4rD4cr5Hsfm6poDWaIm6EWtOnWQzOtcGS9yHGoaIq0FyV
         oQ3KnuKvCVNAkg57uP9Dx0N7mLTie2JEpeLULx9n2Lbvl1XAxGzqlq/fIP8qJKeUq6QM
         xYcDTRs6RhBjmb3Kk73mnxNTg9F6OcLH4Fj7bOOWdSAHdBKXnE1B85cQGnYFnlVI6FYd
         vBrYJ/+JFVdnzdBCFoqMsJS7zCN9zbBdbFDt7pdLKlJXMFO1Tx9OBbLNbY8YZ118A0Rl
         y+qnOQ2V42/XRegrYLTfa79ry9DAKKGMObiUwvV9hxHJsYghor8g/V0pxrB45XBTopYs
         pFxg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790090989; x=1790695789; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwwCpW1soRRwsZU1VSaLCsApvLIIiJTJt4hlrhiI0b0=;
        b=PTWHy+x9oyDMW6QuwPNF4tnw4FDRXE03RnNXqOGg9C8xTLjDxevfPteK3PghhIfNRU
         lwgvRNhMoSVDEXpQez/vug+/qulHuhaoMMcNI9GcoREWOHYsuDT/OKKa9QHP2FE23fwa
         YZj17CNsAKxwZZo9/5cx+yAa2w/ZH3y9jGRRBz9DanWolOEoVbafru65myFPnYOqnfoo
         ff2h0u3LeAdsuX3n8JK3QvbtsCTXv9ZxWT3m2B8qenqeA2j43oYQXJKGXuaSnBdpsn2b
         hpP4KJQjnHVQ2kfcjyMNBAiftkQ5GRheCl+gF/mmSKUU2yt/RBSw8CrImNIR2cG813Bo
         toJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090989; x=1790695789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mwwCpW1soRRwsZU1VSaLCsApvLIIiJTJt4hlrhiI0b0=;
        b=jM3qmP+z+b8QaJacaKKN1o+lYU2Le43zc3yD/0Wro4DO7tY+TYhKvV3oNb1egCb8OS
         /lyoeqm+VDNlWS7Rax0phcO6zeSM2BegRwmWzZakXfQbOucE4D6CPPYcw6sme2/lbUzz
         n3xQ8GET+XDiQQpOxM/TolfSFwucucNbJbE09qGfQft6QEJLNpsKf6sCMYTuP+Qjmqno
         TzxBk0UtOHFs75OQCAFRMi7JeKe3uMxmXs/AZ9qztc1fa+k4qWNnycI/1U0iB1U196mY
         eD7oF7L+vS2dnx6bY8avlUigubDVAOIC67ERUzH0ywnqKsttcFJ+3txwbxFyVPqWOMjI
         B48A==
X-Gm-Message-State: AFuF++nYsoroefAfPNunpBH7JJcdyUyVKNTi1dBfHFnuFZywYAQnp/gH
	iAIeQvnzboN6t+yKOs726iwmn5yo9303O5FUcxhriLibD1dr/vglQBpbjJsHUbXgb1k6GDdYqDh
	Le939x0LiCHqybBQupcdhlQTAC4+pgaESqw==
X-Gm-Gg: AYBFou08SkP+LgdP+rZDa9CqEPiujtcaz0mYiSitz6JsURvxzpDsKi+5XY6KxNpeTYN
	XuYY68R15dsfR3CkR6skDxkkqtBft15bu7yowrF4b0gFSaqJqafx+L9WAiBY9vmNr9ZaJOuf3To
	ux1s6y7rWMG7x2RsdGic+LZDLV1I981GU/c6jSeBKB/0PxG8f7Rpir4e4UxOKqwkV27f6/TSPWk
	JZ9raw7X5/YhswIqZb7xL/ug6LcWN584yIHZAxHlIIw3vFVRbtA91UZNqvCoUQtBGZcRYf35jqk
	QTK3aKW0WLu9byAqoGc+yxllPE/DK1d13BniFx/5Fx7RdGlGXYTjGkbS9fUFvyjPDQji/vEPYHS
	goIQMMZgXkZ/jjfI=
X-Received: by 2002:a05:690c:e244:20b0:871:62a7:9e00 with SMTP id
 00721157ae682-89731b9f8d1mr39893417b3.24.1790090988889; Tue, 22 Sep 2026
 08:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260922144329.3703514-1-daniel.turull@ericsson.com>
In-Reply-To: <20260922144329.3703514-1-daniel.turull@ericsson.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 22 Sep 2026 09:29:36 -0600
X-Gm-Features: AcwNN1XKrg6QMrWNEGIvU33HmeWA_LeQT-_iWPrZPewFEMPpHnlDTPRb_8vJcC8
Message-ID: <CAJdd5GagG_v4k+Kuuo2uJ6W_key6e0UwEUY_UUuum+1h+fvznw@mail.gmail.com>
Subject: Re: [PATCH] create-spdx-3.0: record component release date in SPDX output
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000822c97065c1409b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 15:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246423

--000000000000822c97065c1409b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:43=E2=80=AFAM <daniel.turull@ericsson.com> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Add SPDX_INCLUDE_RELEASE_DATE (default enabled), which records each
> recipe's release date in the releaseTime property of its
> software_Package object, using the SOURCE_DATE_EPOCH already computed
> for reproducible builds. SPDX_RELEASE_DATE_INCLUDE_PATCHES (default
> disabled) additionally considers the Date: header of applied patches,
> using the newest of SOURCE_DATE_EPOCH and all patch dates found;
> SPDX_COMPONENT_RELEASE_DATE overrides both.
>
> Tested with oe-selftest -r spdx (full suite, including the new
> release-date cases) with no regressions.
>
> AI-Generated: Uses Kiro with Claude Sonnet 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  20 +++-
>  meta/lib/oe/spdx30_tasks.py          |  65 ++++++++++++
>  meta/lib/oeqa/selftest/cases/spdx.py | 142 +++++++++++++++++++++++++++
>  3 files changed, 226 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass
> b/meta/classes/create-spdx-3.0.bbclass
> index 56fd01fd53..9955ffad85 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -163,6 +163,23 @@ SPDX_GIT_PURL_MAPPINGS[doc] =3D "A space separated l=
ist
> of domain:purl_type \
>      on gitlab.example.com to the pkg:gitlab PURL type. \
>      github.com is always mapped to pkg:github by default."
>
> +SPDX_INCLUDE_RELEASE_DATE ??=3D "1"
> +SPDX_INCLUDE_RELEASE_DATE[doc] =3D "If set to '1', record the release da=
te
> of \
> +    each recipe in the software_Package releaseTime property, derived
> from \
> +    SOURCE_DATE_EPOCH. Set to '0' to omit the property entirely."
>

There's little value in making this optional. The stuff that is optional is
so because it's slow to calculate or makes the SBoM output much larger;
this does neither.


> +
> +SPDX_RELEASE_DATE_INCLUDE_PATCHES ??=3D "0"
>

Is this necessary? I don't feel that patches should really affect the
"release date"


> +SPDX_RELEASE_DATE_INCLUDE_PATCHES[doc] =3D "If set to '1', also consider
> the \
> +    Date: header of applied patches in SRC_URI when determining the
> release \
> +    date recorded in releaseTime, using the newest of SOURCE_DATE_EPOCH
> and \
> +    all patch dates found. Has no effect if SPDX_INCLUDE_RELEASE_DATE is
> '0'."
> +
> +SPDX_COMPONENT_RELEASE_DATE ??=3D ""

+SPDX_COMPONENT_RELEASE_DATE[doc] =3D "Overrides the release date recorded =
in
> the \
> +    releaseTime property for this component. Expected format is full ISO
> 8601 \
> +    UTC (YYYY-MM-DDTHH:MM:SSZ). Takes precedence over
> SPDX_INCLUDE_RELEASE_DATE \
> +    and SPDX_RELEASE_DATE_INCLUDE_PATCHES."
>

I don't really like having a variable for this; it feels like it's too easy
to bit-rot or just not get updated when a recipe is updated. I also don't
think falling back to Source Date Epoch necessarily makes sense for this;
it's better to have no release date than SDE (IMHO). Also, the way you are
calling this means that it will always use the fallback (see below).

I think we *could* use the SDE library code to get the release time
(calling get_source_date_epoch_from_*), but instead of falling back to the
SDE fallback, just omit the releaseTime property


> +
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
>
> @@ -192,7 +209,7 @@ python do_create_recipe_spdx() {
>      import oe.spdx30_tasks
>      oe.spdx30_tasks.create_recipe_spdx(d)
>  }
> -addtask do_create_recipe_spdx
> +addtask do_create_recipe_spdx after do_deploy_source_date_epoch
>
>  SSTATETASKS +=3D "do_create_recipe_spdx"
>  do_create_recipe_spdx[sstate-inputdirs] =3D "${SPDXRECIPEDEPLOY}"
> @@ -201,6 +218,7 @@ do_create_recipe_spdx[file-checksums] +=3D
> "${SPDX3_DEP_FILES}"
>  do_create_recipe_spdx[cleandirs] =3D "${SPDXRECIPEDEPLOY}"
>  do_create_recipe_spdx[deptask] +=3D "do_create_recipe_spdx"
>  do_create_recipe_spdx[vardeps] +=3D "${SPDX3_VAR_DEPS}"
> +do_create_recipe_spdx[vardeps] +=3D "SPDX_INCLUDE_RELEASE_DATE
> SPDX_RELEASE_DATE_INCLUDE_PATCHES SPDX_COMPONENT_RELEASE_DATE"
>  do_create_recipe_spdx[file-checksums] =3D
> "${@bb.fetch.get_checksum_file_list(d)}"
>
>  python do_create_recipe_spdx_setscene () {
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 9978ae731c..e6340c3678 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -36,6 +36,65 @@ def set_timestamp_now(d, o, prop):
>          delattr(o, prop)
>
>
> +def get_release_date(d):
> +    """Resolve the release date to record in a recipe's releaseTime
> property.
> +
> +    Returns a datetime, or None if no release date should be recorded.
> +    """
> +    override =3D d.getVar("SPDX_COMPONENT_RELEASE_DATE")
> +    if override:
> +        try:
> +            return datetime.strptime(override,
> "%Y-%m-%dT%H:%M:%SZ").replace(tzinfo=3Dtimezone.utc)
> +        except ValueError:
> +            bb.fatal(
> +                "SPDX_COMPONENT_RELEASE_DATE value '%s' is not valid. "
> +                "Expected format: YYYY-MM-DDTHH:MM:SSZ (e.g.
> 2024-03-15T12:00:00Z)" % override
> +            )
> +
> +    if d.getVar("SPDX_INCLUDE_RELEASE_DATE") !=3D "1":
> +        return None
> +
> +    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
> +    if not source_date_epoch:
> +        return None
> +
> +    release_date =3D datetime.fromtimestamp(int(source_date_epoch),
> tz=3Dtimezone.utc)
> +
> +    if d.getVar("SPDX_RELEASE_DATE_INCLUDE_PATCHES") =3D=3D "1":
> +        # Only the static Date: header is used, never "git log" on the
> +        # layer's repo, since that varies with clone depth/history.
> +        for url in oe.patch.src_patches(d):
> +            patch_path =3D bb.fetch.decodeurl(url)[2]
> +            patch_date =3D _get_patch_date_header(patch_path)
> +            if patch_date and patch_date > release_date:
> +                release_date =3D patch_date
> +
> +    return release_date
> +
> +
> +def _get_patch_date_header(patch_path):
> +    """Parse the 'Date:' header from a git-format-patch style file, if
> +    present, and return it as a timezone-aware datetime, or None."""
> +    from email.utils import parsedate_to_datetime
> +
> +    try:
> +        with open(patch_path, errors=3D"replace") as f:
> +            for line in f:
> +                if line.startswith("Date:"):
> +                    try:
> +                        parsed =3D
> parsedate_to_datetime(line[len("Date:"):].strip())
> +                    except (ValueError, TypeError):
> +                        return None
> +                    if parsed.tzinfo is None:
> +                        return None
> +                    return parsed.astimezone(timezone.utc)
> +                if line.startswith("---") or line.startswith("diff
> --git"):
> +                    break
> +    except OSError:
> +        return None
> +    return None
> +
> +
>  def add_license_expression(
>      d, objset, license_expression, license_data, search_objsets=3D[]
>  ):
> @@ -631,6 +690,12 @@ def create_recipe_spdx(d):
>      if val :=3D d.getVar("DESCRIPTION"):
>          recipe.description =3D val
>
> +    release_date =3D get_release_date(d)
> +    if release_date is not None:
> +        recipe.releaseTime =3D release_date
> +    else:
> +        delattr(recipe, "releaseTime")
> +
>

This can't really function here as expected; do_create_recipe_spdx runs
before do_unpack so it will never have access to sources. I think this
means it will only use the fallback source date epoch.



>      for cpe_id in oe.cve_check.get_cpe_ids(
>          d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION")
>      ):
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py
> b/meta/lib/oeqa/selftest/cases/spdx.py
> index 8285189382 <(828)%20518-9382>..3b6d02d38c 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -6,8 +6,11 @@
>
>  import textwrap
>  import hashlib
> +import os
> +from datetime import datetime, timezone
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
> +import oeqa.utils.ftools as ftools
>  import oe.spdx30
>
>
> @@ -443,3 +446,142 @@ class SPDX30Check(SPDX3CheckBase,
> OESelftestTestCase):
>                  r'\d',
>                  f"Version '{version}' for package '{name}' should contai=
n
> digits"
>              )
> +
> +    def test_release_date_source_date_epoch(self):
> +        """releaseTime should be derived from SOURCE_DATE_EPOCH by
> default."""
> +        objset =3D self.check_recipe_spdx(
> +            "base-files",
> +
> "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spdx.json",
> +            task=3D"create_recipe_spdx",
> +        )
> +
> +        # Query after the build so the do_unpack stamp file exists.
> +        source_date_epoch =3D get_bb_var("SOURCE_DATE_EPOCH", "base-file=
s")
> +        expected =3D datetime.fromtimestamp(int(source_date_epoch),
> tz=3Dtimezone.utc)
> +
> +        recipe =3D None
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.name =3D=3D "base-files":
> +                recipe =3D pkg
> +                break
> +
> +        self.assertIsNotNone(recipe, "Unable to find base-files
> software_Package")
> +        self.assertEqual(recipe.releaseTime, expected)
> +
> +    def test_release_date_disabled(self):
> +        """SPDX_INCLUDE_RELEASE_DATE =3D "0" should omit releaseTime
> entirely."""
> +        objset =3D self.check_recipe_spdx(
> +            "base-files",
> +
> "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spdx.json",
> +            task=3D"create_recipe_spdx",
> +            extraconf=3D"""\
> +                SPDX_INCLUDE_RELEASE_DATE =3D "0"
> +                """,
> +        )
> +
> +        recipe =3D None
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.name =3D=3D "base-files":
> +                recipe =3D pkg
> +                break
> +
> +        self.assertIsNotNone(recipe, "Unable to find base-files
> software_Package")
> +        self.assertIsNone(
> +            recipe.releaseTime,
> +            "releaseTime should not be set when SPDX_INCLUDE_RELEASE_DAT=
E
> is '0'",
> +        )
> +
> +    def test_release_date_override(self):
> +        """SPDX_COMPONENT_RELEASE_DATE overrides the resolved date."""
> +        override_date =3D "2020-01-01T00:00:00Z"
> +
> +        objset =3D self.check_recipe_spdx(
> +            "base-files",
> +
> "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spdx.json",
> +            task=3D"create_recipe_spdx",
> +            extraconf=3Df"""\
> +                SPDX_COMPONENT_RELEASE_DATE =3D "{override_date}"
> +                """,
> +        )
> +
> +        recipe =3D None
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.name =3D=3D "base-files":
> +                recipe =3D pkg
> +                break
> +
> +        self.assertIsNotNone(recipe, "Unable to find base-files
> software_Package")
> +        self.assertEqual(
> +            recipe.releaseTime,
> +            datetime(2020, 1, 1, tzinfo=3Dtimezone.utc),
> +        )
> +
> +    def _write_test_patch(self, recipe, date_header):
> +        """Write a no-op patch against a fixture file (not part of the
> +        recipe's real source, so it isn't coupled to its content) with t=
he
> +        given Date: header, and point FILESEXTRAPATHS at it."""
> +        inc_file =3D self.write_recipeinc(
> +            recipe,
> +            textwrap.dedent(
> +                """\
> +                FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> +                SRC_URI +=3D "file://release-date-test-file"
> +                SRC_URI +=3D "file://release-date-test.patch"
> +                """
> +            ),
> +        )
> +        patch_dir =3D os.path.join(os.path.dirname(inc_file), "files")
> +        os.makedirs(patch_dir, exist_ok=3DTrue)
> +        ftools.write_file(
> +            os.path.join(patch_dir, "release-date-test-file"),
> +            "original content\n",
> +        )
> +        patch_path =3D os.path.join(patch_dir, "release-date-test.patch"=
)
> +        ftools.write_file(
> +            patch_path,
> +            textwrap.dedent(
> +                f"""\
> +                From: Test Author <test@example.com>
> +                Date: {date_header}
> +                Subject: [PATCH] modify release-date-test-file
> +
> +                Upstream-Status: Inappropriate [test patch, not intended
> for upstream]
> +
> +                ---
> +                --- a/release-date-test-file
> +                +++ b/release-date-test-file
> +                @@ -1 +1 @@
> +                -original content
> +                +patched content
> +                """
> +            ),
> +        )
> +        self.track_for_cleanup(patch_dir)
> +        return patch_path
> +
> +    def test_release_date_include_patches(self):
> +        """SPDX_RELEASE_DATE_INCLUDE_PATCHES =3D "1" makes a newer patch
> +        Date: header win over SOURCE_DATE_EPOCH."""
> +        newer_patch_date =3D "Mon, 15 Jun 2099 00:00:00 +0000"
> +
> +        self._write_test_patch("base-files", newer_patch_date)
> +        self.add_command_to_tearDown("bitbake -c clean base-files")
> +
> +        objset =3D self.check_recipe_spdx(
> +            "base-files",
> +
> "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spdx.json",
> +            task=3D"create_recipe_spdx",
> +            extraconf=3D"""\
> +                SPDX_RELEASE_DATE_INCLUDE_PATCHES =3D "1"
> +                """,
> +        )
> +        recipe =3D None
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.name =3D=3D "base-files":
> +                recipe =3D pkg
> +                break
> +        self.assertIsNotNone(recipe, "Unable to find base-files
> software_Package")
> +        self.assertEqual(
> +            recipe.releaseTime,
> +            datetime(2099, 6, 15, tzinfo=3Dtimezone.utc),
> +        )
>

--000000000000822c97065c1409b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 22,=
 2026 at 8:43=E2=80=AFAM &lt;<a href=3D"mailto:daniel.turull@ericsson.com">=
daniel.turull@ericsson.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Daniel Turull &lt;<a href=3D"mailto:daniel.=
turull@ericsson.com" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<b=
r>
<br>
Add SPDX_INCLUDE_RELEASE_DATE (default enabled), which records each<br>
recipe&#39;s release date in the releaseTime property of its<br>
software_Package object, using the SOURCE_DATE_EPOCH already computed<br>
for reproducible builds. SPDX_RELEASE_DATE_INCLUDE_PATCHES (default<br>
disabled) additionally considers the Date: header of applied patches,<br>
using the newest of SOURCE_DATE_EPOCH and all patch dates found;<br>
SPDX_COMPONENT_RELEASE_DATE overrides both.<br>
<br>
Tested with oe-selftest -r spdx (full suite, including the new<br>
release-date cases) with no regressions.<br>
<br>
AI-Generated: Uses Kiro with Claude Sonnet 5<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 20 +++-<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 65 ++++++++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 142 ++++++++++++++++++++++++++=
+<br>
=C2=A03 files changed, 226 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass<br>
index 56fd01fd53..9955ffad85 100644<br>
--- a/meta/classes/create-spdx-3.0.bbclass<br>
+++ b/meta/classes/create-spdx-3.0.bbclass<br>
@@ -163,6 +163,23 @@ SPDX_GIT_PURL_MAPPINGS[doc] =3D &quot;A space separate=
d list of domain:purl_type \<br>
=C2=A0 =C2=A0 =C2=A0on <a href=3D"http://gitlab.example.com" rel=3D"norefer=
rer" target=3D"_blank">gitlab.example.com</a> to the pkg:gitlab PURL type. =
\<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com" rel=3D"noreferrer" target=
=3D"_blank">github.com</a> is always mapped to pkg:github by default.&quot;=
<br>
<br>
+SPDX_INCLUDE_RELEASE_DATE ??=3D &quot;1&quot;<br>
+SPDX_INCLUDE_RELEASE_DATE[doc] =3D &quot;If set to &#39;1&#39;, record the=
 release date of \<br>
+=C2=A0 =C2=A0 each recipe in the software_Package releaseTime property, de=
rived from \<br>
+=C2=A0 =C2=A0 SOURCE_DATE_EPOCH. Set to &#39;0&#39; to omit the property e=
ntirely.&quot;<br></blockquote><div><br></div><div>There&#39;s little value=
 in making this optional. The stuff that is optional is so because it&#39;s=
 slow to calculate or makes the SBoM output much larger; this does neither.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+SPDX_RELEASE_DATE_INCLUDE_PATCHES ??=3D &quot;0&quot;<br></blockquote><div=
><br></div><div>Is this necessary? I don&#39;t feel that patches should rea=
lly affect the &quot;release date&quot;</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+SPDX_RELEASE_DATE_INCLUDE_PATCHES[doc] =3D &quot;If set to &#39;1&#39;, al=
so consider the \<br>
+=C2=A0 =C2=A0 Date: header of applied patches in SRC_URI when determining =
the release \<br>
+=C2=A0 =C2=A0 date recorded in releaseTime, using the newest of SOURCE_DAT=
E_EPOCH and \<br>
+=C2=A0 =C2=A0 all patch dates found. Has no effect if SPDX_INCLUDE_RELEASE=
_DATE is &#39;0&#39;.&quot;<br>
+<br>
+SPDX_COMPONENT_RELEASE_DATE ??=3D &quot;&quot;</blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+SPDX_COMPONENT_RELEASE_DATE[doc] =3D &quot;Overrides the release date reco=
rded in the \<br>
+=C2=A0 =C2=A0 releaseTime property for this component. Expected format is =
full ISO 8601 \<br>
+=C2=A0 =C2=A0 UTC (YYYY-MM-DDTHH:MM:SSZ). Takes precedence over SPDX_INCLU=
DE_RELEASE_DATE \<br>
+=C2=A0 =C2=A0 and SPDX_RELEASE_DATE_INCLUDE_PATCHES.&quot;<br></blockquote=
><div><br></div><div>I don&#39;t really like having a variable for this; it=
 feels like it&#39;s too easy to bit-rot or just not get updated when a rec=
ipe is updated.=C2=A0<span style=3D"background-color:transparent">I also do=
n&#39;t think falling back=C2=A0to Source Date Epoch necessarily makes sens=
e for this; it&#39;s better to have no release date than SDE (IMHO).=C2=A0<=
/span><span style=3D"background-color:transparent">Also, the way you=C2=A0a=
re calling this means that it will always use the fallback (see below).</sp=
an></div><div><br></div><div>I think we *could* use the SDE library code to=
 get the release time (calling get_source_date_epoch_from_*), but instead o=
f falling back to the SDE=C2=A0fallback, just omit the releaseTime property=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0IMAGE_CLASSES:append =3D &quot; create-spdx-image-3.0&quot;<br>
=C2=A0SDK_CLASSES +=3D &quot;create-spdx-sdk-3.0&quot;<br>
<br>
@@ -192,7 +209,7 @@ python do_create_recipe_spdx() {<br>
=C2=A0 =C2=A0 =C2=A0import oe.spdx30_tasks<br>
=C2=A0 =C2=A0 =C2=A0oe.spdx30_tasks.create_recipe_spdx(d)<br>
=C2=A0}<br>
-addtask do_create_recipe_spdx<br>
+addtask do_create_recipe_spdx after do_deploy_source_date_epoch<br>
<br>
=C2=A0SSTATETASKS +=3D &quot;do_create_recipe_spdx&quot;<br>
=C2=A0do_create_recipe_spdx[sstate-inputdirs] =3D &quot;${SPDXRECIPEDEPLOY}=
&quot;<br>
@@ -201,6 +218,7 @@ do_create_recipe_spdx[file-checksums] +=3D &quot;${SPDX=
3_DEP_FILES}&quot;<br>
=C2=A0do_create_recipe_spdx[cleandirs] =3D &quot;${SPDXRECIPEDEPLOY}&quot;<=
br>
=C2=A0do_create_recipe_spdx[deptask] +=3D &quot;do_create_recipe_spdx&quot;=
<br>
=C2=A0do_create_recipe_spdx[vardeps] +=3D &quot;${SPDX3_VAR_DEPS}&quot;<br>
+do_create_recipe_spdx[vardeps] +=3D &quot;SPDX_INCLUDE_RELEASE_DATE SPDX_R=
ELEASE_DATE_INCLUDE_PATCHES SPDX_COMPONENT_RELEASE_DATE&quot;<br>
=C2=A0do_create_recipe_spdx[file-checksums] =3D &quot;${@bb.fetch.get_check=
sum_file_list(d)}&quot;<br>
<br>
=C2=A0python do_create_recipe_spdx_setscene () {<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index 9978ae731c..e6340c3678 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -36,6 +36,65 @@ def set_timestamp_now(d, o, prop):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delattr(o, prop)<br>
<br>
<br>
+def get_release_date(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Resolve the release date to record in a re=
cipe&#39;s releaseTime property.<br>
+<br>
+=C2=A0 =C2=A0 Returns a datetime, or None if no release date should be rec=
orded.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 override =3D d.getVar(&quot;SPDX_COMPONENT_RELEASE_DATE&quot=
;)<br>
+=C2=A0 =C2=A0 if override:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return datetime.strptime(overrid=
e, &quot;%Y-%m-%dT%H:%M:%SZ&quot;).replace(tzinfo=3Dtimezone.utc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SPDX_COMPONE=
NT_RELEASE_DATE value &#39;%s&#39; is not valid. &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Expected for=
mat: YYYY-MM-DDTHH:MM:SSZ (e.g. 2024-03-15T12:00:00Z)&quot; % override<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;SPDX_INCLUDE_RELEASE_DATE&quot;) !=3D &quo=
t;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 source_date_epoch =3D d.getVar(&quot;SOURCE_DATE_EPOCH&quot;=
)<br>
+=C2=A0 =C2=A0 if not source_date_epoch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 release_date =3D datetime.fromtimestamp(int(source_date_epoc=
h), tz=3Dtimezone.utc)<br>
+<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;SPDX_RELEASE_DATE_INCLUDE_PATCHES&quot;) =
=3D=3D &quot;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Only the static Date: header is used, never =
&quot;git log&quot; on the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # layer&#39;s repo, since that varies with clo=
ne depth/history.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for url in oe.patch.src_patches(d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_path =3D bb.fetch.decodeur=
l(url)[2]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_date =3D _get_patch_date_h=
eader(patch_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if patch_date and patch_date &gt=
; release_date:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 release_date =3D p=
atch_date<br>
+<br>
+=C2=A0 =C2=A0 return release_date<br>
+<br>
+<br>
+def _get_patch_date_header(patch_path):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Parse the &#39;Date:&#39; header from a gi=
t-format-patch style file, if<br>
+=C2=A0 =C2=A0 present, and return it as a timezone-aware datetime, or None=
.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 from email.utils import parsedate_to_datetime<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(patch_path, errors=3D&quot;replace&q=
uot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&quot;Date:&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 parsed =3D parsedate_to_datetime(line[len(&quot;Date:&quot;):].s=
trip())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt (ValueError, TypeError):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p=
arsed.tzinfo is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn parsed.astimezone(timezone.utc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&quot;---&quot;) or line.startswith(&quot;diff --git&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
+=C2=A0 =C2=A0 except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 return None<br>
+<br>
+<br>
=C2=A0def add_license_expression(<br>
=C2=A0 =C2=A0 =C2=A0d, objset, license_expression, license_data, search_obj=
sets=3D[]<br>
=C2=A0):<br>
@@ -631,6 +690,12 @@ def create_recipe_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0if val :=3D d.getVar(&quot;DESCRIPTION&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe.description =3D val<br>
<br>
+=C2=A0 =C2=A0 release_date =3D get_release_date(d)<br>
+=C2=A0 =C2=A0 if release_date is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe.releaseTime =3D release_date<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 delattr(recipe, &quot;releaseTime&quot;)<br>
+<br></blockquote><div><br></div><div>This can&#39;t really function here a=
s expected; do_create_recipe_spdx runs before do_unpack so it will never ha=
ve access to sources. I think this means it will only use the fallback sour=
ce date epoch.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0for cpe_id in oe.cve_check.get_cpe_ids(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&quot;CVE_PRODUCT&quot;), d.getV=
ar(&quot;CVE_VERSION&quot;)<br>
=C2=A0 =C2=A0 =C2=A0):<br>
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py<br>
index <a href=3D"tel:(828)%20518-9382" value=3D"+18285189382" target=3D"_bl=
ank">8285189382</a>..3b6d02d38c 100644<br>
--- a/meta/lib/oeqa/selftest/cases/spdx.py<br>
+++ b/meta/lib/oeqa/selftest/cases/spdx.py<br>
@@ -6,8 +6,11 @@<br>
<br>
=C2=A0import textwrap<br>
=C2=A0import hashlib<br>
+import os<br>
+from datetime import datetime, timezone<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
=C2=A0from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars<br>
+import oeqa.utils.ftools as ftools<br>
=C2=A0import oe.spdx30<br>
<br>
<br>
@@ -443,3 +446,142 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r&#39;\d&#39;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f&quot;Versio=
n &#39;{version}&#39; for package &#39;{name}&#39; should contain digits&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+<br>
+=C2=A0 =C2=A0 def test_release_date_source_date_epoch(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;releaseTime should be derive=
d from SOURCE_DATE_EPOCH by default.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objset =3D self.check_recipe_spdx(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;base-files&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/static/static-base-files.spdx.json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task=3D&quot;create_recipe_spdx&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Query after the build so the do_unpack stamp=
 file exists.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 source_date_epoch =3D get_bb_var(&quot;SOURCE_=
DATE_EPOCH&quot;, &quot;base-files&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected =3D datetime.fromtimestamp(int(source=
_date_epoch), tz=3Dtimezone.utc)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in objset.foreach_type(oe.spdx30.softw=
are_Package):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://pkg.name" r=
el=3D"noreferrer" target=3D"_blank">pkg.name</a> =3D=3D &quot;base-files&qu=
ot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D pkg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(recipe, &quot;Unable to f=
ind base-files software_Package&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(recipe.releaseTime, expected)=
<br>
+<br>
+=C2=A0 =C2=A0 def test_release_date_disabled(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;SPDX_INCLUDE_RELEASE_DATE =
=3D &quot;0&quot; should omit releaseTime entirely.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objset =3D self.check_recipe_spdx(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;base-files&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/static/static-base-files.spdx.json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task=3D&quot;create_recipe_spdx&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extraconf=3D&quot;&quot;&quot;\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPDX_INCLUDE_RELEA=
SE_DATE =3D &quot;0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in objset.foreach_type(oe.spdx30.softw=
are_Package):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://pkg.name" r=
el=3D"noreferrer" target=3D"_blank">pkg.name</a> =3D=3D &quot;base-files&qu=
ot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D pkg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(recipe, &quot;Unable to f=
ind base-files software_Package&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNone(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe.releaseTime,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;releaseTime should not be =
set when SPDX_INCLUDE_RELEASE_DATE is &#39;0&#39;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 def test_release_date_override(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;SPDX_COMPONENT_RELEASE_DATE =
overrides the resolved date.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 override_date =3D &quot;2020-01-01T00:00:00Z&q=
uot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objset =3D self.check_recipe_spdx(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;base-files&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/static/static-base-files.spdx.json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task=3D&quot;create_recipe_spdx&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extraconf=3Df&quot;&quot;&quot;\=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPDX_COMPONENT_REL=
EASE_DATE =3D &quot;{override_date}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in objset.foreach_type(oe.spdx30.softw=
are_Package):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://pkg.name" r=
el=3D"noreferrer" target=3D"_blank">pkg.name</a> =3D=3D &quot;base-files&qu=
ot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D pkg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(recipe, &quot;Unable to f=
ind base-files software_Package&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe.releaseTime,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 datetime(2020, 1, 1, tzinfo=3Dti=
mezone.utc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 def _write_test_patch(self, recipe, date_header):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Write a no-op patch against =
a fixture file (not part of the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe&#39;s real source, so it isn&#39;t coup=
led to its content) with the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 given Date: header, and point FILESEXTRAPATHS =
at it.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 inc_file =3D self.write_recipeinc(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 textwrap.dedent(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;=
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FILESEXTRAPATHS:pr=
epend :=3D &quot;${THISDIR}/files:&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SRC_URI +=3D &quot=
;file://release-date-test-file&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SRC_URI +=3D &quot=
;file://release-date-test.patch&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_dir =3D os.path.join(os.path.dirname(inc=
_file), &quot;files&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(patch_dir, exist_ok=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.write_file(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(patch_dir, &quot;re=
lease-date-test-file&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;original content\n&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_path =3D os.path.join(patch_dir, &quot;r=
elease-date-test.patch&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.write_file(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 textwrap.dedent(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;&quot;&quot=
;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 From: Test Author =
&lt;<a href=3D"mailto:test@example.com" target=3D"_blank">test@example.com<=
/a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Date: {date_header=
}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Subject: [PATCH] m=
odify release-date-test-file<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: I=
nappropriate [test patch, not intended for upstream]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/release-date=
-test-file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ b/release-date=
-test-file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -1 +1 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -original content<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +patched content<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(patch_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return patch_path<br>
+<br>
+=C2=A0 =C2=A0 def test_release_date_include_patches(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;SPDX_RELEASE_DATE_INCLUDE_PA=
TCHES =3D &quot;1&quot; makes a newer patch<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Date: header win over SOURCE_DATE_EPOCH.&quot;=
&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newer_patch_date =3D &quot;Mon, 15 Jun 2099 00=
:00:00 +0000&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._write_test_patch(&quot;base-files&quot;,=
 newer_patch_date)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_command_to_tearDown(&quot;bitbake -c =
clean base-files&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objset =3D self.check_recipe_spdx(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;base-files&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{DEPLOY_DIR_SPDX}/{MACHINE=
_ARCH}/static/static-base-files.spdx.json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task=3D&quot;create_recipe_spdx&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extraconf=3D&quot;&quot;&quot;\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPDX_RELEASE_DATE_=
INCLUDE_PATCHES =3D &quot;1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in objset.foreach_type(oe.spdx30.softw=
are_Package):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://pkg.name" r=
el=3D"noreferrer" target=3D"_blank">pkg.name</a> =3D=3D &quot;base-files&qu=
ot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D pkg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(recipe, &quot;Unable to f=
ind base-files software_Package&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe.releaseTime,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 datetime(2099, 6, 15, tzinfo=3Dt=
imezone.utc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
</blockquote></div></div>

--000000000000822c97065c1409b8--

