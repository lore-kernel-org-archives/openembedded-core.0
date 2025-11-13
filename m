Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1964ACD98D3
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 19:32:53 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1238.1763062366480481013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 11:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8aH5kSz;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78665368a5cso12110087b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 11:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763062365; x=1763667165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGhmVRMIJJ6L4xDHgcmhfIAEg/33gNY2nyROnxXHx0E=;
        b=E8aH5kSzEFb0PMB5uX6WhKddHXE/iwtujHquMG2tHrjO9v2QV+NhkssH4VAYJRjmZ8
         6NnM8vpwU4EIGWxNOvAgkfDGqwZfdly7F4h25qViOf7byKhYnwSoPsAcpKgUB2cDt+tQ
         ykyYpUO/ERBqAubzXpOVB3D//4RovvxCmHOFGdi7Rg2ejILXR0wkSSWtibtiw5bXDo6W
         t8zGRv7HHv/lo9Y7et3ZqlCdgJxBnzoEk2x7PUlOXOt7VKd58CDFab36871gdz6+sS7h
         ThwBc4BN2DEmQPgCP50MMbiQ2ee89Kmg9icfznVmtqxzA0v1w6LSqQSwqTcFe8CTTDRb
         /EbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062365; x=1763667165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UGhmVRMIJJ6L4xDHgcmhfIAEg/33gNY2nyROnxXHx0E=;
        b=FFm5cht868ablfN3uaxJILAfu9PPDMYj1qKvJh7AKBUfOb4OrYoZr/gJh894YI9iso
         Rvxb/ONNZyyuMXQDFT/u8vSmQ1ylVjTyXLdPkl8dv3reSaqJRdOfXARt30Mb/SzLPgYX
         MkMz4MQofyMDJrjgv5TdsQO08PcGi/eag4XVNa6vMzloErdxBe+7rzUQJAMoXM8OkMS8
         W1lKbq0nrCkmsHgnU0MRYTqYmzKvV0uC+Ps88csXVYAOwbEBs5GUKaNgHM1tbNZ10lzB
         lGG22/ZfZFf9lddlFrZxxB4viB9GH2mhM7+4GOPNYU/MivNjBZYPQIl5nipx/AOALi+k
         RIIQ==
X-Gm-Message-State: AOJu0YyE6tcxuUhV1sglYgBaqyHWCbPPX7iOX7a+ARiRtVhlktNgtSvj
	+nBD81VDNTWI6TTrPIWfc1ixZc3xqADu/bD5QREIMYvL8DoOm+PTaGllkyD7dw6v5WIR+visIZE
	4JDGzwGVUfJDXshJK8IHXbnzTq1l0ePo=
X-Gm-Gg: ASbGnctzHSZAwXJxecdxzNrUF55+8CNzTcFpodyxiBOoHR2EkDIKdO78YwFmEZ7T1+8
	PiNaF12wkYGI0bkbmai9roGnghOmggeqN/BzIpu1f0xoztrKI5uJ/BaavPs8jnxz91XHwqHPJ0B
	0nMA+l9lvSH3DCkaaktOAGQqKCkbm59/bMPA9N2726w6j4aScDBGR+I3kbVnYtFhHjwTXwzG/Jf
	ohID51g5HuCDeFPDe0iydv5snrdLBoRTBQMgkdjLxZbQtlNzvGHkcXHKIzcrn6KoFsKMWQ6eWg=
X-Google-Smtp-Source: AGHT+IEb+2v1utMkBxw1l09GPqXyLvQ/O2APZ50Z4iLyOhhqUtyvwI6FBEh4nLLc4LYXskrlUwrXIsGqFI4Bk+yK6f8=
X-Received: by 2002:a05:690c:c13:b0:787:c607:94c with SMTP id
 00721157ae682-78929eeda37mr5147037b3.36.1763062365519; Thu, 13 Nov 2025
 11:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20251113184151.511039-1-stondo@gmail.com> <20251113184151.511039-2-stondo@gmail.com>
In-Reply-To: <20251113184151.511039-2-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 13 Nov 2025 12:32:34 -0700
X-Gm-Features: AWmQ_bmOWtTDhmp9A_9zM0t23hUWp90jrPSs_-PDujM1r8-pThd9bIrWlgN9_-I
Message-ID: <CAJdd5GazgVx9Bq_qu3FmDp0cykT4AannJ=T_oLsZ_z9jRUirTQ@mail.gmail.com>
Subject: Re: [OE-core] [OE-core 1/2] spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS
 implementation
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 19:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226263

On Thu, Nov 13, 2025 at 11:42=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Fix incorrect function call when processing SPDX_CUSTOM_ANNOTATION_VARS.
> The code was calling new_annotation() as a standalone function, but it
> should be called as a method on the build_objset object.
>
> Error:
>     new_annotation(d, build_objset, build, ...)
>
> Corrected to:
>     build_objset.new_annotation(d, build_objset, build, ...)
>
> This bug would cause a NameError at runtime if SPDX_CUSTOM_ANNOTATION_VAR=
S
> was set to a non-empty value, preventing SPDX document generation.
>
> The fix aligns with how new_annotation() is called elsewhere in the
> codebase and matches the SBOMObjset class method signature.

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py          |  4 +-
>  meta/lib/oeqa/selftest/cases/spdx.py | 74 ++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index f2f133005d..4d11b3c289 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -498,9 +498,7 @@ def create_spdx(d):
>      build_objset.set_is_native(is_native)
>
>      for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
> -        new_annotation(
> -            d,
> -            build_objset,
> +        build_objset.new_annotation(
>              build,
>              "%s=3D%s" % (var, d.getVar(var)),
>              oe.spdx30.AnnotationType.other,
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 8cd4e83ca2..eda41cf952 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -286,3 +286,77 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
>                  break
>          else:
>              self.assertTrue(False, "Unable to find imported Host SpdxID"=
)
> +
> +    def test_custom_annotation_vars(self):
> +        """
> +        Test that SPDX_CUSTOM_ANNOTATION_VARS properly creates annotatio=
ns
> +        without runtime errors. This is a regression test for the bug wh=
ere
> +        new_annotation() was called as a standalone function instead of =
as
> +        a method on build_objset, causing a NameError.
> +
> +        The test verifies:
> +        1. The build completes successfully (no NameError)
> +        2. Each configured annotation variable appears exactly once
> +        3. The annotation values match the configured variables
> +
> +        We check for exact equality (not >=3D) to prevent regressions wh=
ere
> +        one annotation might appear multiple times while another is miss=
ing.
> +        """
> +        ANNOTATION_VAR1 =3D "TestAnnotation1"
> +        ANNOTATION_VAR2 =3D "TestAnnotation2"
> +
> +        # This will fail with NameError if new_annotation() is called in=
correctly
> +        objset =3D self.check_recipe_spdx(
> +            "base-files",
> +            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-file=
s.spdx.json",
> +            extraconf=3Dtextwrap.dedent(
> +                f"""\
> +                ANNOTATION1 =3D "{ANNOTATION_VAR1}"
> +                ANNOTATION2 =3D "{ANNOTATION_VAR2}"
> +                SPDX_CUSTOM_ANNOTATION_VARS =3D "ANNOTATION1 ANNOTATION2=
"
> +                """
> +            ),
> +        )
> +
> +        # If we got here, the build succeeded (no NameError)
> +        # Now verify the annotations were actually created
> +
> +        # Find the build element
> +        build =3D None
> +        for o in objset.foreach_type(oe.spdx30.build_Build):
> +            build =3D o
> +            break
> +
> +        self.assertIsNotNone(build, "Unable to find Build element")
> +
> +        # Find annotation objects that reference our build
> +        found_annotations =3D []
> +        for obj in objset.objects():
> +            if isinstance(obj, oe.spdx30.Annotation):
> +                if hasattr(obj, "subject") and build._id =3D=3D obj.subj=
ect._id:
> +                    found_annotations.append(obj)
> +
> +        # Check each annotation separately to ensure exactly one occurre=
nce of each
> +        annotation1_count =3D 0
> +        annotation2_count =3D 0
> +
> +        for annotation in found_annotations:
> +            if hasattr(annotation, "statement"):
> +                if f"ANNOTATION1=3D{ANNOTATION_VAR1}" in annotation.stat=
ement:
> +                    annotation1_count +=3D 1
> +                    self.logger.info(f"Found ANNOTATION1: {annotation.st=
atement}")
> +                if f"ANNOTATION2=3D{ANNOTATION_VAR2}" in annotation.stat=
ement:
> +                    annotation2_count +=3D 1
> +                    self.logger.info(f"Found ANNOTATION2: {annotation.st=
atement}")
> +
> +        # Each annotation should appear exactly once
> +        self.assertEqual(
> +            annotation1_count,
> +            1,
> +            f"Expected exactly 1 occurrence of ANNOTATION1, found {annot=
ation1_count}",
> +        )
> +        self.assertEqual(
> +            annotation2_count,
> +            1,
> +            f"Expected exactly 1 occurrence of ANNOTATION2, found {annot=
ation2_count}",
> +        )
> --
> 2.51.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226259): https://lists.openembedded.org/g/openembedde=
d-core/message/226259
> Mute This Topic: https://lists.openembedded.org/mt/116279440/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

