Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2F4C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 08:39:26 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.9504.1660034359641995101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 01:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pBM3x4Nh;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id t1so16043721lft.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4UafRWv0mZyw+lqX/0iLEpkfeoi2KesswJZmmnQ1N0=;
        b=pBM3x4Nhkgs6mnAZnYf6W76/xC5NMyGjOJBGyyaBKfoCAaFaWUL8QP4UPtLDiJSLhg
         18DysAZakATE73yoEHpjkHDB/s0hg/WYdHIKt2tFliB+WhqiPzTJPbv+oTfeROGYXVNa
         smxaxOwXVKhDGNMssLWwGl3GazwC20QvG54CaNSkfn1gz/zxWNfzpsIV/+Zi5oun+Zt5
         IM5AMUvNRF12mnWBQwFJjWrLcHFe2Yx78r7rvxKupxHOHIi1p5gQGl/2Cgom+IemJj2w
         03Dy/qQfNLJNt+gcqdtKKwLfZabvLjrm+VkcA45g8Ilr51UG/iSSFcDthooZcBjdRuEI
         3oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4UafRWv0mZyw+lqX/0iLEpkfeoi2KesswJZmmnQ1N0=;
        b=75XJXYVqFmytEtjB+ZT8JCrR9rgIbBI8dyoMYVw+eIbznknEO1ZC3hiekAOqPkmfRb
         YpClJfmpCFAshgxaDsCN0rO+7wh6Lcuo6unAEJ+yWNeRbQbvNb1j/4ILRdq5+B0JGNzU
         1i5IAPb9F17IyyGreb37LzIUpDxzTPe3CAJSBXKFU3Vn/tHnewHzP+xMQveVmZYBuYfW
         JBe1Xg4wyjJ1Z/0VxTY3QlZjbZtSoqGAta1He+Y0U4/uhWxh9l52e6J0WwG8thbXslpd
         VD2pZnrHUFZlqQ+U7Ef8eCM+0Up45rZRp+ljvl8KOBPfWieRR+I+r3F6cpK5OHDqw11a
         daMQ==
X-Gm-Message-State: ACgBeo3/NsIcWUVGzkVNdMvVwaqP7fDbT+BC86EXv0Pa8+ulLV/cCk3Y
	ykbmhudbbopxl4gq4M0Dge88FtqkKbThc1RWiSM=
X-Google-Smtp-Source: 
 AA6agR4JLBEJhXfbm5O/mwUVD0W0yrFjAZXmnuvfb9LYrHvdPSMlmcgfbQ9+G5NYtUb06gkNFA8DRydt8g+p8U8ekk0=
X-Received: by 2002:a05:6512:33d4:b0:48b:3a5f:e6e7 with SMTP id
 d20-20020a05651233d400b0048b3a5fe6e7mr6816725lfg.665.1660034357558; Tue, 09
 Aug 2022 01:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220809083527.1221635-1-alban.bedel@aerq.com>
In-Reply-To: <20220809083527.1221635-1-alban.bedel@aerq.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Aug 2022 10:39:05 +0200
Message-ID: 
 <CANNYZj_Wwnnr6gShfTcr42LzfZS=YxOBRfcnNAdgDVoRMeXsZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: Don't abort if installing a sstate
 package fails
To: alban.bedel@aerq.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 08:39:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169141

Apologies, but no. This fixes the symptoms, not the problem, which is
that your infrastructure is malfunctioning. Why does it supply broken
artifacts?

Alex

On Tue, 9 Aug 2022 at 10:36, Alban Bedel via lists.openembedded.org
<alban.bedel=aerq.com@lists.openembedded.org> wrote:
>
> Currently if the installation of a sstate package fails the whole
> build is aborted although bitbake could just fallback on running the
> real task.
>
> To fix this issue we replace the call to bb.fatal() in
> sstate_setscene() with a simple sys.exit() to pass the error to bitbake
> without aborting the build. The error message that was passed to
> bb.fatal() is just removed as all error path already contains a
> warning or note.
>
> Then to further improve the build resilience we add a try block around
> the sstate package unpacking. If it fails, for example because the
> package was corrupted, we now print a warning and optionally remove
> the broken package to allow it to be rebuilt. The cleaning of broken
> packages can be disabled be setting the SSTATE_CLEAN_BROKEN_PACKAGES
> variable to 0.
>
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>  meta/classes/sstate.bbclass | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index de6e7fa9608a..069901483bb2 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -108,6 +108,9 @@ SSTATE_SIG_PASSPHRASE ?= ""
>  # Whether to verify the GnUPG signatures when extracting sstate archives
>  SSTATE_VERIFY_SIG ?= "0"
>
> +# Whether to remove broken sstate packages
> +SSTATE_CLEAN_BROKEN_PACKAGES ?= "1"
> +
>  SSTATE_HASHEQUIV_METHOD ?= "oe.sstatesig.OEOuthashBasic"
>  SSTATE_HASHEQUIV_METHOD[doc] = "The fully-qualified function used to calculate \
>      the output hash for a task, which in turn is used to determine equivalency. \
> @@ -375,9 +378,18 @@ def sstate_installpkg(ss, d):
>      sstateinst = d.getVar("SSTATE_INSTDIR")
>      d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>
> -    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_unpack_package']:
> -        # All hooks should run in the SSTATE_INSTDIR
> -        bb.build.exec_func(f, d, (sstateinst,))
> +    try:
> +        for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_unpack_package']:
> +            # All hooks should run in the SSTATE_INSTDIR
> +            bb.build.exec_func(f, d, (sstateinst,))
> +    except bb.process.ExecutionError:
> +        bb.warn("Failed to install sstate package %s, skipping acceleration..." % sstatepkg)
> +        oe.path.remove(sstateinst)
> +        if bb.utils.to_boolean(d.getVar("SSTATE_CLEAN_BROKEN_PACKAGES"), True):
> +            bb.warn("Removing broken sstate package %s" % sstatepkg)
> +            oe.path.remove(sstatepkg)
> +            oe.path.remove(sstatepkg + '.*')
> +        return False
>
>      return sstate_installpkgdir(ss, d)
>
> @@ -763,7 +775,7 @@ def sstate_setscene(d):
>      shared_state = sstate_state_fromvars(d)
>      accelerate = sstate_installpkg(shared_state, d)
>      if not accelerate:
> -        bb.fatal("No suitable staging package found")
> +        sys.exit(1)
>
>  python sstate_task_prefunc () {
>      shared_state = sstate_state_fromvars(d)
> --
> 2.34.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169140): https://lists.openembedded.org/g/openembedded-core/message/169140
> Mute This Topic: https://lists.openembedded.org/mt/92911047/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

