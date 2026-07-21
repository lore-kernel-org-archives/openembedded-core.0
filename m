Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5082CC44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 15:22:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25595.1784647330067873392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 08:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fx1Sz5bw;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472326ca506so8856664f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784647328; x=1785252128; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zJdFTedyxi39N/W2O1NjtJghpIEkfNBNQgwlsnIL2Qk=;
        b=Fx1Sz5bwSZgqznFOankU/pJufRwOLzZjQamRfZqS2iHt/Y6nuTguBH3+JnLVuCGlN8
         tIwHPvwLF5RNoJSNXXV+wd52g3bncqB9osJGBw9E1tUD9n14CEWf76cSXC2MXliQiW4V
         1w3teScBRAGCYVCjGfYwMNWs0bP2AdhzqgQY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647328; x=1785252128;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJdFTedyxi39N/W2O1NjtJghpIEkfNBNQgwlsnIL2Qk=;
        b=D53eHN5gQFEfX1WaLkX+4BZwtOiklCYxZUVHd2izkF+31GnLYn/C6cCr0YccOMIvd4
         zvrXkqW4FlKx+Tk4R2CqY4VOP2yDEg6SNr+nU0mAV/ic/jnpKrHcEbLN/BRGB3IWK8ZM
         NV0ZQsteZuip8IyofvJ3WlsyrKxxsp51/4i1gRFpisxuHhZ8mkBlxlDyY+/pJlKHLstN
         iyHy/VI7Sf52r/cPSX3ZHpFcpBPWCaun8xhuADC5XBfFM71d9XcIPNFacOwty4Jb5WIk
         rfVxknZBmKkxVJNCbIg+QfOdtH/ZsSnymPYT2+HvCHR2O9Yq8RC/hUzacLMMAz4l1Wv3
         Co+A==
X-Gm-Message-State: AOJu0Yy/zxC4b3hMOyfjQQra2QyHZMuq+0wIzDGwhPdwo6Zut8M7KbPU
	0vkU8cPL6EwD8B+bg1wMutx++WMFJLQWzNo6c2acziQNaGdJ58BtAXTqOLCZFUWSNe8=
X-Gm-Gg: AR+sD12kNFg9ODo2ZJuMPOcc36q2/Vv/Iw1IaVfP1TPWCtrZCipu8tn6+/w6KLVgsMl
	IWwXJ67T50/rQmbGONkLkfUGMNnwVm5j9lH5tgXRX1+Gca8ogeHHF8017PyFNb9g5NDH2JLKzNf
	rWsYSswliSLnPQAKYIZLsR7ziduFfT2gpBGDqBjKukaJrzK0uuD7ri7XtgMI5DadAu5eUBLJ35e
	BRDo4ElPRsvyADCujNFssZ8ydclHI+cwLlLlkcV9yn1ihISNQSHuaJ68RVVDGedfUUHtw0JJcNc
	mssslv+W95Jmx/AiMnCtHFsS+4eCnFW49BLnjVIPtjQ7Qnrqe0ZxYOABRxpeEspm++brBxAcct4
	uwKiTR+AWzUcoi/pVzqLJkhhOD+0XkUg/rzOVi6fswwE8RcSd1HSnsWxw7Uy/TdZ3r1GejTZAe5
	oAf6ZJrmD/fefR/9MxZeVuQiX+p2uGtl/QCIK1dCfW064S8/z+Rpvvw4ojTKSwgw==
X-Received: by 2002:a05:6000:27db:20b0:47f:4602:66e9 with SMTP id ffacd0b85a97d-47f6232e29dmr16352889f8f.40.1784647328207;
        Tue, 21 Jul 2026 08:22:08 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496ffsm39110748f8f.3.2026.07.21.08.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:22:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 17:22:07 +0200
Message-Id: <DK4COG1KCNY7.2W0J6NA3E3SHA@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
To: <jaipaul.cheernam@est.tech>, "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>
Subject: Re: [OE-core] Patchtest results for [PATCH] perl: upgrade 5.42.2 ->
 5.44.0
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260721134339.16175-1-jaipaul.cheernam@est.tech>
 <0101019f84fcfd69-e7f239c8-b0a7-4bdb-ad3c-47ef5f97611e-000000@us-west-2.amazonses.com> <DU7PPF66507B2D7D882E1A2BFD540A22936F3C22@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU7PPF66507B2D7D882E1A2BFD540A22936F3C22@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 15:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241551

On Tue Jul 21, 2026 at 4:37 PM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> HI,
>
> This is a version upgrade (5.42.2 =E2=86=92 5.44.0), not a CVE backport p=
atch.
>
> The CVE tag format check is triggering because the commit removes existin=
g CVE patch files that are now included upstream.
>
> Should I extract all CVEs fixed between 5.42.2 and 5.44.0 from the upstre=
am changelog and add formal CVE: CVE-YYYY-XXXX tags for each in the commit =
message?

No, this is a patchtest false-positive. You can ignore it.

Regards,

> Regards,
> Jaipaul Cheernam
>
> =F0=9F=94=97 EST Website<https://www.est.tech/>
> =F0=9F=94=97 EST LinkedIn<https://www.linkedin.com/company/ericsson-softw=
are-technology/>
>
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Patchtest via lists.openembedded.org <patchte=
st=3Dautomation.yoctoproject.org@lists.openembedded.org>
> Date: Tuesday, 21 July 2026 at 16:03
> To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: [OE-core] Patchtest results for [PATCH] perl: upgrade 5.42.2 -> =
5.44.0
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/perl-upgrade-5.42.2---5.44.0.p=
atch
>
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in pa=
tch file. Correct or include the CVE tag in the patch with format: "CVE: CV=
E-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)


--=20
Yoann Congal
Smile ECS


