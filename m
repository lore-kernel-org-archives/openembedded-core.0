Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75CAC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 10:17:10 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6770.1784024229269891134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 03:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HeueHpob;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-902fc790cd5so42329616d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 03:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784024228; cv=none;
        d=google.com; s=arc-20260327;
        b=U9u3ayolhW4LnlHlGShu4LPBq7qVBX+06lLxUKOMSnGS9FRSvOLZj8P/J5eanAW65n
         lcc3CPo7NKiMnz4z8u9tDNvIyjOXRawlA9w8PkLhTZauDOQf6BKNMooSnAMwTv0rJPW5
         HDqxpCALAIkpkrSdHXJQCMcRC+CLdE7kQA4Nh7PuOcPh18SKTI7i/jXP2UAlJbxstZYl
         sNq0tKGevs2ytQuPgSqlZSi3QYNdvpXDr/FG866/brMC5MeKBq34Bl4AOT+2yfvmMpSY
         gxznNZb0LbOwwdQCfwlYDH4unG+SayKifyBgrpNNsQ7Ogc+XF8QsVypsENkPX5edrTRO
         ZaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TvBzTLScdsMpijonDSWmGvStP20Aa2ziFAtprXIcPG0=;
        fh=j82zMame36d60jgUEju9SjP1bH+c7BTDypQ6ZcPFvGM=;
        b=K6gqcPcsftZYA7J+rzGhuvt1kIAtjlz+xjWUIdDzOnAoxNctm2xOp+zB2G3ZAEoYL/
         vSyuREdTvh3zWp0CpaFzppKIlX0ibzrv3ieM4GTqBhAvLrbHGl/cPCJ5WBuiMw0HGfxr
         B8CfCMLWCgON+L2skiH1gad52n8fbAq3Wk6HlTGRhsUuA4D+U+5MyDN9ovfBUFqX3Uyj
         ObGf/MT/TmttU9VqgpHPHeyifBQZ4kkPj/Ba6ib5j/1SUy9uxxKKgRYJ/3PzQAMRkvtG
         DKb08VvkW9OuZyriDin26DpfJAs3EViHXeUcXt9AlVyPyZaB0rCUDJT2W2WE9WABYBgK
         JIOA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024228; x=1784629028; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvBzTLScdsMpijonDSWmGvStP20Aa2ziFAtprXIcPG0=;
        b=HeueHpob9NzxSN3dbPmgVFviWz5J15VHELHtNJuZixvlkCmntuim6GRS8V885e72VE
         vCaoWorTRZYQAmv04x5VS9xWNpEuC9wCLlBMsm8s/eyTxwzVjh8chBRxvl4glVSG0t8F
         aIr/j4lfL+oxjJwxfXKn537TYMQ5ds7wo8FNMIiPl5ptG9JB3szuWkWE9YnUIJWiulwF
         D4edFphiqEs82SJLdKuS+aCcb4Qc6SImBZrNGJXqRF9fiEGKv4igfEmHzA1k22nlKnPg
         G5ApvLJ8WY2Wznd0HI12BQpdIFUwLjfiDxx8b8ZTzZOGDZfIhRkrVBBQ/css2yAWcAWW
         hQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024228; x=1784629028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TvBzTLScdsMpijonDSWmGvStP20Aa2ziFAtprXIcPG0=;
        b=DssJAxJ/g4UE2nG986ug4c+lmxv6Pmlt3YUR6ljmz6ups67jBg4rO35sTgNqf4BtlP
         ebbUu5QVzzDmBGcQa+NFbLCi+xn+YtjRA7Bm9ne+3bZwpk9ZxTno14mcEuXO4ocS4lDw
         rbc8s6vxbcd16VqRQixtDAAQiy85aMaaBqCGQvehCdAhg+39DPTPwW2e2vplZrmT42OZ
         qyEXBXHA+T+xABCi69rLo0iJwUAvJlmp8Pdh3NNCaUAD5mxbMW5eGhO1KhBW7CjPqchb
         fdGgGWS1LKbBa4da/i9r28w0AJw0uscxzd2EfIkKBRvWHPikB1mLhhbJ0vy21aZdOm7T
         Ekpw==
X-Gm-Message-State: AOJu0YzUEN2buy/dKlLumnyDQMhb9g+dsNgNqE6A6ckUcxL73tb+44YX
	u2guXE/fTCq+asJb9naj/gHADPJbjTv0k75qSAfkJ8DiqR9ypSlCWhpn6fODp2IQxJAohuJ80Vs
	A09uTJ0OL8EoVxMMgmwuKAFkfL3Dbgn8=
X-Gm-Gg: AfdE7ckxA/0PWSzy4n1WJ1gXKel/+T6arLG9mBFFg6rbBHkx+mgfYtetE5Mb3p8n0wg
	GotTKymVEvsPAub981ZvdgFOO26Wv/485bWO2oFsxxF4RMWOHPiAqp+iPVST2Dz10DpG8dTFxYA
	LDtwfa1vze7FhMYKPlyUlMvNQhiuekSp+tJWux6kvZWL0jBRp+W+CH3ayX0UvdzYzdRAq9sEcPV
	q6OmCXCy60nQJ45ui+2KXWMPYKfJjUopFtAx2nGxRhUFxFU4G5OZBOtu72TyJjD7ltH9AI=
X-Received: by 2002:a05:6214:440b:b0:8ee:7c26:8bb8 with SMTP id
 6a1803df08f44-90747c2d5a2mr33194246d6.9.1784024228197; Tue, 14 Jul 2026
 03:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260713060444.7-1-bbnpreetsingh@gmail.com> <20260714032029.7-1-bbnpreetsingh@gmail.com>
 <20260714032029.7-2-bbnpreetsingh@gmail.com>
In-Reply-To: <20260714032029.7-2-bbnpreetsingh@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jul 2026 12:16:57 +0200
X-Gm-Features: AUfX_mwW5Gc78UhhhdCs9Cwpjdm97GdnsoNuRhOXpP7QbyKOENLvLYuRpqdOJk8
Message-ID: <CANNYZj8dJ9gy5tW+QqrAiNoFAr5fP0SCn9Oj64KNortk8=f0hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] oeqa/selftest/devtool: exercise devtool finish on
 an AUTOREV recipe
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Gyorgy Sarvari <skandigraun@gmail.com>, 
	Chris Laplante <chris.laplante@agilent.com>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>, Peter Kjellerstedt <pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 10:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240872

Thanks, I think this is good.

Alex

On Tue, 14 Jul 2026 at 05:20, Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:
>
> Adjust test_devtool_add_fetch_git() so that the recipe it creates with
> SRCREV = "${AUTOREV}" is finished into a temporary layer instead of
> just being reset: check that devtool finish succeeds (before the
> previous commit srcrev mode failed with "fatal: bad revision
> 'AUTOINC'"), that the finished recipe still uses SRCREV = "${AUTOREV}",
> and that no spurious patch files are generated. The reset it replaces
> is covered by many other devtool tests.
>
> srcrev mode is forced with --mode srcrev: update-mode guessing only
> considers git:// URLs, so for this gitsm:// recipe auto mode would
> select patch mode and never reach the code path being tested.
>
> [YOCTO #16354]
>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> AI-Generated: Uses Claude (claude-sonnet-5)
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> changes in v2:
> - extend the existing test_devtool_add_fetch_git() instead of
>   adding a new test (Alexander Kanavin)
> - force --mode srcrev in the test: update-mode guessing never
>   selects srcrev for the gitsm:// URL used there (verified the
>   adjusted test passes with the fix reverted if the mode is not
>   forced, i.e. it would not catch the bug)
>  meta/lib/oeqa/selftest/cases/devtool.py | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index b2cd13e9a5..51f9d6f8b7 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -613,8 +613,27 @@ class DevtoolAddTests(DevtoolBase):
>          checkvars['SRC_URI'] = url_branch
>          checkvars['SRCREV'] = '${AUTOREV}'
>          self._test_recipe_contents(recipefile, checkvars, [])
> +        # Finish into a temporary layer instead of resetting; srcrev mode
> +        # used to fail with "fatal: bad revision 'AUTOINC'" because the
> +        # unresolved AUTOREV placeholder was used as the git revision to
> +        # export patches from [YOCTO #16354]. srcrev mode has to be forced
> +        # because update-mode guessing never selects it for gitsm:// URLs.
> +        templayerdir = tempfile.mkdtemp(prefix='devtoolqa')
> +        self.track_for_cleanup(templayerdir)
> +        self._create_temp_layer(templayerdir, False, 'selftestautorev')
> +        result = runCmd('devtool finish --mode srcrev %s %s' % (testrecipe, templayerdir))
> +        result = runCmd('devtool status')
> +        self.assertNotIn(testrecipe, result.output, 'Recipe should have been removed from workspace by devtool finish')
> +        newrecipefiles = glob.glob(os.path.join(templayerdir, 'recipes-*', testrecipe, '%s_git.bb' % testrecipe))
> +        self.assertEqual(len(newrecipefiles), 1, 'Recipe not moved into destination layer by devtool finish')
> +        # The finished recipe should still use a floating revision and no
> +        # patch files should have been created
> +        checkvars = {}
> +        checkvars['SRCREV'] = '${AUTOREV}'
> +        self._test_recipe_contents(newrecipefiles[0], checkvars, [])
> +        patchfiles = glob.glob(os.path.join(templayerdir, 'recipes-*', testrecipe, '*', '*.patch'))
> +        self.assertEqual(patchfiles, [], 'Unexpected patch files generated by devtool finish')
>          # Try with revision and version specified
> -        result = runCmd('devtool reset -n %s' % testrecipe)
>          shutil.rmtree(srcdir)
>          url_rev = '%s;rev=%s' % (url, checkrev)
>          result = runCmd('devtool add %s %s -f "%s" -V 1.5' % (testrecipe, srcdir, url_rev))
> --
> 2.43.0
>

