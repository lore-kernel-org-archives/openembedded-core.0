Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2415EB26ED
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:04:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24729.1770743090601374109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 09:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rZ2FMIwL;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48068127f00so10596405e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770743085; x=1771347885; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afHydWvN8a4MXojH4EJ2TAoLBKTC1Z3kDvH9Cygf1yg=;
        b=rZ2FMIwLJSAVdg1RF0qoCTbKowQkoYQDGHOz5vLE7c4NPO78L9AioRrtAcWU5hAYdp
         2BG5/7dEwSrZDt894XWLfQPM8ShoDaodGIZCLQBo9qn3Rg29NMeHh+uX2XUTG7/WIpOO
         xIzRBCfPEx6/JgHNjmIsR8X/HcnoEGpZC29IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770743085; x=1771347885;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afHydWvN8a4MXojH4EJ2TAoLBKTC1Z3kDvH9Cygf1yg=;
        b=oxnQm1DUX3sCFUX8pDpEVnoE0wwvlset/vMaA8FlGBBCEunhFjhinz1Iu2NGOZttAD
         eqkydM1jtGLG23BIyCaBERgvXSi/IcFEt/P1glEqrVUHQwoyA/oNivO2A8Hw0VOWRqmm
         aufQ6jgcBSPRwgx1RnVADbQJON0sKmGwsWgYlGcHc+aR6AQEfSF9IBLyv/q0aWnUWiIj
         DHRTf0PwEFesJZ3uHIOSCZ43pDBMZDSLbULK05mMYMz06DfHH6qP1dABu5q25+pEdblH
         Eaq9TG99edqq4Nfhidua1pDkdiOgJ4QxNL2aKZXxDfpBvFLbAeIcfeS7+JuMJs4Ogevt
         n63Q==
X-Gm-Message-State: AOJu0YwmtL5svvBV1yhKKiSsddqBA9HlG7dvlKq7STDCsYutwQoP7WEw
	JgSf/IkxS1QMQudorkROlBQXEiA2D5hkGO6xUkxOiJePNEATSjAPyfDvAbDiF3RogaE=
X-Gm-Gg: AZuq6aLhqVLyJqCfksyuwAc+sNPezPmUqlOTe1nTWF9BuHF6p+xhtz24eWFBalU7GVn
	obsLhvxx3NBuDMZ3I1xAToYkQVBJFFrygpmjFY+C4/E6RX4xSEV9uwUgECG2mDuX5Pd51wgeV+W
	YnoS36jqOtC+mVJ0xk63QLjX4EkE2rRjdjvYzYlt4ymXCyQOPNInLahPNqBnWTZiot27LnsMkkk
	ABiGGlu4OnTENi++MsB7VfmTxxciLocu2GGld4HhTEMyWmb8ij7AJCTsyoIyVup1s4vW2+z9Z6y
	MC1ZOBmlD1yw1CscX5Nb/2QAXeDj6UDCxVbhOyl2n71cwvpVr82El5M3ovxw97FemlSlF0qSbcl
	s3+9KqqCdMdyI2zoBSKH1Xo1EHg6Jk7qbyKPGlgaj0gqZYonC5kKdGyVWo7dKoBXFUX4hlkVPND
	eVEh2ffFFMkKYy5dOHjbkg18zzFMdChTd3bUVRfExmvfeXMRXLy5f0VClEDZYKhek3HYJAgmeB8
	Zzf0dgd4zFVaXEy
X-Received: by 2002:a05:6000:24c6:b0:437:6efe:94cf with SMTP id ffacd0b85a97d-4376efe9a35mr9881345f8f.1.1770743080041;
        Tue, 10 Feb 2026 09:04:40 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362974b230sm39014414f8f.36.2026.02.10.09.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 09:04:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 18:04:39 +0100
Message-Id: <DGBG18MCXMLV.11SNSFR77NI2Y@smile.fr>
Subject: Re: [OE-core] Patchtest results for [meta][whinlatter][PATCH 01/02]
 linux-yocto/6.12: update to v6.12.69
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <patchtest@automation.yoctoproject.org>, <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260210031722.1347242-1-bruce.ashfield@gmail.com>
 <0101019c459a67ac-7a7642b7-51cc-4f2e-9261-7dc8d609e403-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019c459a67ac-7a7642b7-51cc-4f2e-9261-7dc8d609e403-000000@us-west-2.amazonses.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 17:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230921

On Tue Feb 10, 2026 at 4:31 AM CET, Patchtest via lists.openembedded.org wr=
ote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/meta-whinlatter-01-02-linux-yo=
cto-6.12-update-to-v6.12.69.patch
>
> FAIL: test commit message user tags: Mbox includes one or more GitHub-sty=
le username tags. Ensure that any "@" symbols are stripped out of usernames=
 (test_mbox.TestMbox.test_commit_message_user_tags)

Bruce, this error is caused by those lines:
>     a1bf8ea50cbc4 mm, kfence: describe @slab parameter in __kfence_obj_in=
fo()
>     d11475ea5c2a5 textsearch: describe @list member in ts_ops search
>     7a01b91ad6327 mm: describe @flags parameter in memalloc_flags_save()
>     18b6574d4c647 net: bridge: Describe @tunnel_hash member in net_bridge=
_vlan_group struct
Do you plan to send a v2 with a fix?

Alternatively, If you are OK with it, I can simply remove the '@' when
importing the patch in my branch.

Thanks!

> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_=
presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_messag=
e_presence)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_li=
st)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_pyth=
on_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.Test=
Patch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_pa=
tch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_=
patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.tes=
t_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test (test_python_=
pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbo=
x.TestMbox.test_series_merge_on_head)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!


--=20
Yoann Congal
Smile ECS


