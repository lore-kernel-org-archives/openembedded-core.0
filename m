Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB95ACD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:41:48 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18911.1780382502105429477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aq76GLA6;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: saisneha196@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso5852357a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780382500; cv=none;
        d=google.com; s=arc-20240605;
        b=TPBds6hlaD9TNdQ5FSifoskNkVGWkh7UFpnhYmvIKqa2M1u8PXU767v4R5dj7mpryy
         MebOb8bFDOxHeL/+QzvPso6zD4vxaiBRRjc/loaS2RBN1e2K5MoF0RCBaQGCB8jJUDge
         NUq2JlGbhA5YY9zO7mfEyUrN2w7hkSq5/Rjs6gOLVkHcClRcZTedWC6Uu8DMh/Fm7B9D
         rFdPL8N2O2iHFRYod/brIB6ZhTKyVpbYJQ7KkD4GAye+quup5UR04a8NBDxUGisnlZQn
         G3HWiMa60gRzya2cEyKHgrzBrVsM8Olf+5TGeWNxOncjHh5brCfOe6rmL4i4HNt0lwOB
         aEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gSmOI/G2yzVw4r6PmZYmvDOGGlHXluZszorqgFJPGZM=;
        fh=ngUgwAb3Nb9SPOtuuDpJs4Y7dOqPOsGpeB51ymfX9Kw=;
        b=OC7xosouTHALQvWi+0m8l2nTZheilE7bdauXxGa40+auIoGjWE4q5YoJAFGyFNk3nd
         Si526RjrkAO955Tks7M85htKpbaXOkraJxs+rpQi50ZSYAfT8ZwlboJC0V/5trEtK2yS
         t8fHoD0Zy2vlHii+mVH4iUH1gWQWIx2BNSQdkVBSvAkVzIz/TtmKcDro6VovohZqn4wA
         z7WSqq8xtfTECX31DfEkZ+v/0uC7bgCGthCDrh2W3ZUJ4MiYockBgt0JAAlhmYJ6MaWg
         lTNjbMI7lcK5PIcL50/FbdYeeyESBkAOkaE6ttxdPb+J9BWecqX+qkS+jYGG2UOZmPMM
         vYBA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780382500; x=1780987300; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gSmOI/G2yzVw4r6PmZYmvDOGGlHXluZszorqgFJPGZM=;
        b=aq76GLA6tsJs1/xfDM3NeODEe4oRo/TJv9kscQVdfuaAgnXE4Z7ZBpjgGnjpUcwAuw
         bdBMMUGeg+t41VpGLkKI2U0PXCnlolCUxsEBE8CoZ255paFIPer/JFB2fNp6r0rrVtow
         UNpYBLVvlzFWAtP64FjDvQ5lqg44u04RVqOnDYRxX++PhuK4aNEazEViqDIbv1K+AJ6c
         cjBzR03ZBjjV3fKFLU4gTbUOFe4IWaejNWj3vzZ4pHAJ9/2OC6yIv/VAYWkH6vu2EBe2
         1wxaORi8aIZQC4yZORnmSxrlJNKCYY4gwmfswprM0LKmIL8BVcAKQRShjdmKjzJZgN2+
         H1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780382500; x=1780987300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSmOI/G2yzVw4r6PmZYmvDOGGlHXluZszorqgFJPGZM=;
        b=mUNc3smn5b0DFrsVizejq4vcDR6iIpkoaRGpWsBu40rH1mzziyI5/Tym7b1JXyT8lS
         E4py5HmfffeYRN2ijEkfGnCJNCzWBZWAnPdU6LqRi/6ZKaL32aaSEJ5UI9lflgihid4e
         3Z0ZqFoCody5hDc0bN1yTm0KDWrF0jnVq/w/YYZ0hS8MViTYlMpEXuJ2PvJGlIu9iT+J
         Rl+NuiKnuaL4Jt8yJrJuSbi77FJ0mxmX37DgzxpIG0yIl7kLudipH7Lm8Z5vJbB3DM8M
         1JtlR0bCGkMm0L7gYVhsgFMkSJqD66drZxsTzvCUI12Y0o6nsS1fODHBAF+VX4zyBPD0
         3uiA==
X-Gm-Message-State: AOJu0Yx1jHQHO+v6sZaIn20PhmGYtQRmpyueyoaKhBmZk2o9noGQJuB/
	3TfqZfQWMwrMfiW23Iu3a3WrjgsOBEHejcMtjh76fY8h+fTD84yVj5dccYS6cJmaYPijRP/HbaS
	BDylXaVM7dP7006YzP22vxGFWh89wxvg=
X-Gm-Gg: Acq92OFvE1GfgM+zS44xxtihUV2HHkgU+TrQEzBDLSJ1JI/Egk6TzPaQxYWYUNrFGIL
	dQWmRuJZILkvXo+hz9BynHZDjbzModUmbuic+JqV3KdzaQ4btHNWeD9b3eHMBstv2K6cC2RoErk
	IrqGgpGXTc5bpWZbHXgLq9X8HFONKnvtpAw5nGSmRLkQEkSuLguiwb72TaWUD/efjR1XAcBqJhh
	asQpfwbVtX7/JPMx4uL2gIbGR2K2tdWIcXhfcV3UFzhK33ovFT5UIpeBeOKAVwcJBrPCIDVIyfy
	YZFkyYWhEW0XQvdua6vHEs6gyHP/LmZGOKPg5jERM9bV8TNeOQ==
X-Received: by 2002:a17:907:a2c5:b0:bed:9a7:5ed1 with SMTP id
 a640c23a62f3a-bed09a768a4mr505490166b.5.1780382499748; Mon, 01 Jun 2026
 23:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260527111756.1306022-1-saisneha196@gmail.com> <DIUC0PZ04O4R.Z6A4SM69JD8H@bootlin.com>
In-Reply-To: <DIUC0PZ04O4R.Z6A4SM69JD8H@bootlin.com>
From: Sai Sneha <saisneha196@gmail.com>
Date: Tue, 2 Jun 2026 12:11:26 +0530
X-Gm-Features: AVHnY4KDymSKVtkf8JHVR6RoqftcPGLEYNP20tlh5dImIatkUYTatj99J0aVqPY
Message-ID: <CANcU11cVP5aceLGzV5+Awm8vghrqLPxRTExopG2XCKWZc0A2kQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/4] Add missing SRCREV check for SCM URIs
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev
Content-Type: multipart/alternative; boundary="000000000000763f6506533f9a03"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238006

--000000000000763f6506533f9a03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thank you for running the selftests and catching this.

The root cause was that recipes using tag=3D in SRC_URI (like the
gitunpackoffline selftest recipe) intentionally set SRCREV to empty,
but my check incorrectly treated empty SRCREV as missing when tag=3D
was present.

The fix skips the SRCREV check when tag=3D is present in the URI,
similar to the existing rev=3D handling. I verified locally:

oe-selftest -r bbtests.BitbakeTests.test_git_unpack_nonetwork
PASSED

I have sent v5 with this fix.

Best regards,
Sai Sneha


On Thu, 28 May 2026 at 6:38=E2=80=AFPM, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed May 27, 2026 at 1:17 PM CEST, Sai Sneha via lists.openembedded.org
> wrote:
> > This patch series adds a check for git:// (and other SCM) URIs in
> > SRC_URI that are missing a corresponding SRCREV, addressing
> > Bugzilla #16051 [1] and referencing Corentin Guillevic's RFC series [2]=
.
> >
>
> Hi,
>
> Thanks for your patch.
>
> It looks like this is breaking the test_git_unpack_nonetwork selftest:
>
> 2026-05-28 09:51:08,030 - oe-selftest - INFO -
> bbtests.BitbakeTests.test_git_unpack_nonetwork (subunit.RemotedTestCase)
> 2026-05-28 09:51:08,030 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: gitunpackoffline-0.0+git-r0 do_fetch: Bitbake Fetcher Error:
> FetchError("Recipe uses a floating tag/branch '2.11' for repo '
> git.yoctoproject.org/matchbox-panel-2' without a fixed SRCREV yet doesn't
> call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4009
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3916
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000763f6506533f9a03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit">Hi Mathieu,<br style=3D"font-size:inh=
erit"><br style=3D"font-size:inherit">Thank you for running the selftests a=
nd catching this.<br style=3D"font-size:inherit"><br style=3D"font-size:inh=
erit">The root cause was that recipes using tag=3D in SRC_URI (like the<br =
style=3D"font-size:inherit">gitunpackoffline selftest recipe) intentionally=
 set SRCREV to empty,<br style=3D"font-size:inherit">but my check incorrect=
ly treated empty SRCREV as missing when tag=3D<br style=3D"font-size:inheri=
t">was present.<br style=3D"font-size:inherit"><br style=3D"font-size:inher=
it">The fix skips the SRCREV check when tag=3D is present in the URI,<br st=
yle=3D"font-size:inherit">similar to the existing rev=3D handling. I verifi=
ed locally:<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">=
  oe-selftest -r bbtests.BitbakeTests.test_git_unpack_nonetwork<br style=3D=
"font-size:inherit">  PASSED<br style=3D"font-size:inherit"><br style=3D"fo=
nt-size:inherit">I have sent v5 with this fix.<br style=3D"font-size:inheri=
t"><br style=3D"font-size:inherit">Best regards,<br style=3D"font-size:inhe=
rit">Sai Sneha<br style=3D"font-size:inherit"></div><br></div><div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, 28 May 2026 at 6:38=E2=80=AFPM, Mathieu Dubois-Briand &lt;<=
a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dubois-briand@b=
ootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed May 27, 2026 at 1:17 PM CEST, Sai Sneha via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
&gt; This patch series adds a check for git:// (and other SCM) URIs in<br>
&gt; SRC_URI that are missing a corresponding SRCREV, addressing<br>
&gt; Bugzilla #16051 [1] and referencing Corentin Guillevic&#39;s RFC serie=
s [2].<br>
&gt;<br>
<br>
Hi,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like this is breaking the test_git_unpack_nonetwork selftest:<br>
<br>
2026-05-28 09:51:08,030 - oe-selftest - INFO - bbtests.BitbakeTests.test_gi=
t_unpack_nonetwork (subunit.RemotedTestCase)<br>
2026-05-28 09:51:08,030 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
ERROR: gitunpackoffline-0.0+git-r0 do_fetch: Bitbake Fetcher Error: FetchEr=
ror(&quot;Recipe uses a floating tag/branch &#39;2.11&#39; for repo &#39;<a=
 href=3D"http://git.yoctoproject.org/matchbox-panel-2" rel=3D"noreferrer" t=
arget=3D"_blank">git.yoctoproject.org/matchbox-panel-2</a>&#39; without a f=
ixed SRCREV yet doesn&#39;t call bb.fetch2.get_srcrev() (use SRCPV in PV fo=
r OE).&quot;, None)<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/4009" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/23/builds/4009</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/3916" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/35/builds/3916</a><br>
<br>
Can you have a look at the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000763f6506533f9a03--

