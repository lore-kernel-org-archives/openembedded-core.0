Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685FFE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:35:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.41828.1736850922335758504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 02:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T1bSntuD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso37805335e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 02:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736850921; x=1737455721; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xVu2Tr+h42qtbFcyrXBB38bFPhqXWNpAoEgHPvsiLss=;
        b=T1bSntuDVWk+Cx1PjjZWzKrDa11wJZusi1SwFCEZ9x4oEqQ0Wq2cJK+zRfXH844Qor
         l+2PbistZzdIoszXB9+u5DD49TVbCFRsdWldM+XIuKb2pddvVDteibZ818Z5WMegyAVi
         3wHXrGgkOgJ8SdCDW1OWhumkQ4WM1Z9Yl6uKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850921; x=1737455721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVu2Tr+h42qtbFcyrXBB38bFPhqXWNpAoEgHPvsiLss=;
        b=E9Okhe9G9eXtzCorIymNjRoJx5LNNRA7w13tR1IDXoDPKIYWVrjZUfyLBny+MDMMds
         MItwR2SDhA6hKzq/YgAY8i/koB1Pl4/MajC2sQEz9irJWfH8qWTzBtLalC/GONXyD7kq
         PkqWFn2POb2eiy6gBB8adeopKup1qjdslUkYterm2jzAuGSaPz128UP1ZBc3nV40UrDl
         LtyvakxrzfmLvnt6O5oroPBOakkCNQUAGx8wSem9TitpAHKa8xh0WMOuS4yq22Ts9tIQ
         twVwJ64VJ/PHWA+XG253nzaP/xLNkwXWkvzwddrf6WXyfV+no28iTjTm/UPUXy8jd85k
         43tQ==
X-Gm-Message-State: AOJu0YySIjiGKSRmSxpJaWnJj+pcY1yfRoi7tLVL9odqRAjNsuFooFpt
	pJmkhz7eDyQTpg9lHQOYCGZk54IVANfzMCUeOqDHEQE6j6sgbT0cP6fvcCLnSDw=
X-Gm-Gg: ASbGncuxFzJ1BpwULyxissJf69WShbw3Quh7f4faNnDK2jNW8w58Lc2cxNq49hcaTfk
	MOJjYyXd0vHmv5EQw+56rLuJIC2j7xFDhIc2twiqNVD+4mZjmmkNqe6+KK+t5Piz1RbMduAGKGx
	BBmZQ9Vatse+O8spc7h2irmj6UAX+PuLliN+xnYWdIEpv5aV+Sa9YxvnlyudgTDcwm3HjTashCq
	z/15DCs3phUfusIitmTSNF24n1gSpH05CTJ4RH5M+hXcNZ9nIfcA5FbhEL18wroCNyxAa1hxHCg
	r6dlY/MpTLiAbmr5a0Vp4h3vOujTYFLfAscWPqEdq2dMMA==
X-Google-Smtp-Source: AGHT+IEw2KyHQ4egvctFwsLcSAb3aoDK/fv+/ePBTIQsndS6MJD889ZB/4uozyFRZWMRjalf/J0sIA==
X-Received: by 2002:a05:600c:3b94:b0:434:e2ea:fc94 with SMTP id 5b1f17b1804b1-436e2696cb8mr241546065e9.11.1736850920715;
        Tue, 14 Jan 2025 02:35:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:682b:98f8:ba86:ec04? ([2001:8b0:aba:5f3c:682b:98f8:ba86:ec04])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddc5f5sm204934965e9.18.2025.01.14.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:35:20 -0800 (PST)
Message-ID: <f389aa26db3303d50bcc88fe31c5434163394719.camel@linuxfoundation.org>
Subject: Re: [yocto] [yocto-status] Yocto Project Status 7 Jan. 2025 (WW02)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org, wminer@linuxfoundation.org, 
	yocto-status@lists.yoctoproject.org
Cc: ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2025 10:35:19 +0000
In-Reply-To: <CAC_dYdrbwJPe8YQqvFpnpDU+Wq6NxMcj5sj2SSWRqao0zcZc0A@mail.gmail.com>
References: 
	<CAK5yBb8dbPpVqDweeU0xsWAZ07k1x29MMtzvWWDtJesqinKE-g@mail.gmail.com>
	 <CAC_dYdrbwJPe8YQqvFpnpDU+Wq6NxMcj5sj2SSWRqao0zcZc0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 10:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209786

On Mon, 2025-01-13 at 10:32 -0500, Walt Miner via lists.yoctoproject.org wr=
ote:
> What is happening with the 5.0.6 release? =C2=A0

The TSC met and approved it last week, I sent the email to the release
people on Thursday. It should therefore be in the process of being
released.

Cheers,

Richard

