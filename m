Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAE4C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:43:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148285.1783334598795294850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rjl87CYt;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c7902f47so16771205e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783334597; x=1783939397; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rh2HYfiLL7A0+QKRn+0BJldlxt4GW8NFliuJvx0Lv4=;
        b=rjl87CYtBYt/15H6Sl7Li/S786T0kWghFmXX2NKTsOHFOJi43pRHcWijI+rQbPvIIg
         TiGZUDg1IPTtg5e6REZYZO7N2T1Iwg4Rwu5Ui/+DCriB11IDwZznwZrTFhQUfUrr9kVw
         yHqppnqbEAQLbRK4eFL+NM9jny8IuoviRcmlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334597; x=1783939397;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rh2HYfiLL7A0+QKRn+0BJldlxt4GW8NFliuJvx0Lv4=;
        b=jD8RTeaMjDzYBxQNwd3+978u9k/of/LC6P9vI+dii31YtlyxI2xTmH5e/rJKFeiybm
         3fygo9unNtpk+UtXiIqTOjNDmC+wvGFWl2LknCMuFakVyjDV9frXmx8sOosiTL2NSuD0
         BuvbYGRmh1CjOafMiCqDNgIBf5obqswPoq0jTpfeSMjcB6t6WJ76EKFm3CybQ5vchjTf
         BzDMhnU63O79zMlt1KO3xRom9Lc6YkYUdC5flcdt6laIMMT45t1vDsSDpt86q+HxXY/o
         FETjf6GfE+rw235Yicv4QK5EQ8+jggbmf1VLc/2xOY0rye9P/McnIl+rTqFYXy3SuwOC
         4uXg==
X-Forwarded-Encrypted: i=1; AHgh+RqlKWvdOLVhhGF1f4TceiZ0KHYUVdKXCadukTk2hu1DyTC/pWoacLB6Sqx4RLBOqlotrqcNRwHtOfDrbc79CLcMUw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9jlj+nfBgNH9uR1TSt818iWLA5HHZXD2D70kJvbozR4fxkKuE
	NMzcZ0KpMRxu9Ahztt4q1TZstbcTdlZ8vdfSvt0hTZ8tKCBxBLIYmtACQWgvnbdZQZQ=
X-Gm-Gg: AfdE7cmRSzdDiFwgxAp47FNsSWYgBaTkmyZwB4labdgXO0Wfvkg+fGFwPp9A2zVHc1r
	ixQV5hYbtTRO8VddxZfSIPtbIaAlLaxJ9rSjG3fJADpDAfH9O4r4Lm+ozqOSf2Q2dM0YOe56iEL
	xhML30EB9yS61Ux040I8JVOqNE3n8meWN5PZ2yx7Tpy4wO/lFDpoBlQ9qSmIsmelNCVTuUoRE9h
	uF2cGuU69S6BJqI1y/yK6LoY4fKXxQOkmQe1RXj9JnuJ/ul2j4gSQHJKeVmGY71zfXwwLcslqp6
	V8VjUJPiVwQy//sFVF7lpV+gGtIspi7ZfG9cgVSO2f6meu5q8SwxcFymr0r0UeG1xuzwH8Nk7O+
	HGGW7ntYUeKhI7WwdIHHgQs0y56gvx1poSket3e3/+MzMx/NC0Vr64d218fu59UHYpjCIrOka6D
	Qb/bQrjshRSJ7mfD0=
X-Received: by 2002:a05:600c:4ec7:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-493d11d9562mr109114105e9.14.1783334596824;
        Mon, 06 Jul 2026 03:43:16 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm600690425e9.13.2026.07.06.03.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:43:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:43:16 +0200
Message-Id: <DJRFCRJIMZNZ.3NT5QJ0BLOY9H@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Sudhir Dumbhare -X (sudumbha -
 E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2 2/2] binutils: fix CVE-2026-4647
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
 <20260513172734.3995341-1-sudumbha@cisco.com>
 <20260513172734.3995341-2-sudumbha@cisco.com>
 <DIZQ028FNO2G.2274D51E2O012@smile.fr>
In-Reply-To: <DIZQ028FNO2G.2274D51E2O012@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240240

On Wed Jun 3, 2026 at 11:09 PM CEST, Yoann Congal wrote:
> On Wed May 13, 2026 at 7:27 PM CEST, Sudhir Dumbhare -X (sudumbha - E INF=
OCHIPS PRIVATE LIMITED at Cisco) wrote:
>> From: Sudhir Dumbhare <sudumbha@cisco.com>
>>
>> This patch applies the upstream fix [1], which addresses an out-of-bound=
s
>> read issue in XCOFF relocation processing, as described in [2].
>>
>> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D9e99d=
bc1f19ffaf18d0250788951706066ebe7f2
>> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D33919
>>
>> Reference:
>> https://bugzilla.suse.com/show_bug.cgi?id=3D1260338
>> https://www.suse.com/security/cve/CVE-2026-4647.html
>> https://nvd.nist.gov/vuln/detail/CVE-2026-4647
>>
>> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> ---
>
> Hello,
>
> Same as 1/2, this look like it's needed on master/wrynose. Can you send
> the fix there and ping back here?
>
> Thanks!

Hello,

I will now drop this patch. If the above situation changes, please send
a new patch.

Regards,
--=20
Yoann Congal
Smile ECS


