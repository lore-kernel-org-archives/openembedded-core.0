Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF17CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 15:55:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.291.1792166142625199299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 08:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z1pw+rYj;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so963505e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792166141; x=1792770941; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e0orYXaVpO3SDhXlVT4PYP4qTfQzQzOU4yZJlhBGS8A=;
        b=z1pw+rYjGICHRN9fBPT2nMKRFbKqbE7A3gckyQyYJ5fJcdpVzngQrJmRya0rtxdkm3
         bMoIHMEYvYwzsZwYRvHWgI4bui6cn+lwfG5cRI1ZptHOeB9lde6bxKnWzIpvhuyEIgvI
         4eFDCSFdkDwL1uorkEmxaVJiOed8LvttD37vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166141; x=1792770941;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0orYXaVpO3SDhXlVT4PYP4qTfQzQzOU4yZJlhBGS8A=;
        b=1ChvzmQ7rw8HHc/RbZ85Z6buuv52UwAGjMMY2iV5Ehrtlnae16a4NNtQ0xMXPaNSAA
         aRWLjJmAABb85pB/rPdvyx1X8yF2oJE6EGm5YTj7TibriSC+W2ztZ5pArpCgRyfSsbCe
         JSoaNA6CG1TJ3uE0Xk92FkRGUFG8JriH1IYmsRF8mgVCaf8sjGTIk+B4mJNUfLxiQnkz
         eHR+yuRzklZowGdmTAKu/yVgwoZ+cEF5nXDVpJlDkmKCyq/MlDb4ZfheTMLtXqRlSlOM
         oeQiG0E4BgMWQk28AeJg3DcMnND9k908FycBYGGRQ8e1jzjmYOvxEPvlnYv0zQa/Dgjv
         kw9w==
X-Gm-Message-State: AFq9FYIBuX7QIfg3UqHoBoaWwC8SvifHWjjT19AwveDeK1f3L6Ju31/s
	ylMjlwtG1pJJJDiMmta+wl0RR9QC2VPfE2AJv0ZTIH7+CLoVsJ+7SJPZWSFtwMCceIA=
X-Gm-Gg: AYBFou0hu4Idbv3wxUYZ/KkhLQrgiVd+DXW8DSHwTkwCeV7y9qILvkikyp8Fm8wpY4i
	IgagDKj5s7RQoChIeibT+1f29WQtakshCmGRoxFOBf/c6cekJQuJLJOYwg72Fnv/6RDq15YIu6G
	2WoRI5fKlcTLJT9PDtGOlhexkTXTc7Ud5cQPVGZL0ZJLrf5rvxh0L0x5Gn1CEfP6BtJFdV/d2Cm
	TRjAxtb8DD+FAUwHf5sS7NZb6BPbklBe8JMJRC+k4MWCOXeUkSfZe5MMjbgNENY5akR66K9L3Sx
	d8yvXjkam9xJtP7599z5UbCvn/mNtuZ4IYbZeAex1C/M60ajKOxR9SaoLC/jtIqMEZrFbHWLVsv
	kIjcj3hUr7VZ9tKlW4D1MOHPUaC0TDe2CWVotjNcLqN02QeNuSkRRz52I2RYuNI7olWysZf41XK
	KVtBXmNWLLBPaJgrJMNIy/R4YM0LJOqkjybsDyyLLAsMybXmA6KwbGuM3apH/qWUU9Qe2a96EDw
	zQ4NOJtcI/aV6+wsRM//3/4PSxnOvRVqvj4B6x4xeuvsUiB7nJ/1T0uf/HM4A==
X-Received: by 2002:a05:600c:1389:b0:4a1:d2e5:aa35 with SMTP id 5b1f17b1804b1-4a1d76057d6mr4769235e9.19.1792166140693;
        Fri, 16 Oct 2026 08:55:40 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm44799525e9.3.2026.10.16.08.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:55:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 17:55:40 +0200
Message-Id: <DM6DVIU6PCS7.5796QI5VSNGG@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
Subject: Re: [OE-core][wrynose][patch] python3-git: Fix CVE-2026-67326
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261016053344.103696-1-vanusuri@mvista.com>
 <DM62KASB5RK9.HMFQ0TUDPVCD@smile.fr>
 <CANQUz18joQXzbyvYMpGeEvuq5s04rJcnUM_k06+jC0tOJon+Bw@mail.gmail.com>
In-Reply-To: <CANQUz18joQXzbyvYMpGeEvuq5s04rJcnUM_k06+jC0tOJon+Bw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248039

On Fri Oct 16, 2026 at 1:48 PM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> I reviewed the fix for CVE-2026-67326 and confirmed that it is identical =
to
> the fix in the larger patch series.
>
> I haven't reviewed the remaining patches in the series.
>
> You can ignore my patch.

Thanks Vijay!

>
>
> Thanks & Regards,
> Vijay
--=20
Yoann Congal
Smile ECS


