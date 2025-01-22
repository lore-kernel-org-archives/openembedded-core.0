Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E260C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 13:26:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.43390.1737552377588247841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 05:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IstohMYf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso47964165e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737552376; x=1738157176; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BdyabcprhtASU+y3xyXjhY/OKlkU2HSCAZSzKKYysQ=;
        b=IstohMYfCT+8UerT9xHZkUokAO07jDJT1d7HsE0sHKO+7A+Pb3PRcMnprH2UHU5xIN
         W4EF1OCE7XcIH6Vl+LgMEPAsybHFbMfob7dcmvOlHQvSxLUuJSs7qlvS2zNEysPzzLa8
         fA280rQJjZ38tkHB/WY9jhbAuyv8KBL4FZ2j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552376; x=1738157176;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3BdyabcprhtASU+y3xyXjhY/OKlkU2HSCAZSzKKYysQ=;
        b=gCgcrdb4V13fHyen+oZDoiFc9/X98+39x2yHVr1SkfVIEEfikMz5tqnQmWrms7L/P/
         bjkDbUXXNaRQikCu6Kwhxfa0CpJCNGO5VbZXfvnQTI4XFubTvGq0Zk7b5/Be6lqBycQN
         mQE/Skkli2ShfYTN4lS85p/WpZZwsnuT1p8CgQGkmtCOdFHTdDfogyLHBSi0gHSaV20P
         WMbwRXreakic8aUZEfe4/X+GRat10+UjDpEHvmVMG4WdBXxphm6zuHmBdAo5hL/mprnN
         t9K083Emg0IQ7wVLCLs6H5ewM05wMsLaNq1OkG+hUq67OkLaFZCDkXM4rw5RSjBDsJHU
         Ql9g==
X-Forwarded-Encrypted: i=1; AJvYcCV/AjGl296bjN+hpjWOTNnzO9kghuxnBO/n9Srhsu/TLwFcM23BepPoVc8W0RaI/E9RhJx9RNkXKEUCffhD2sMaxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7Dwma4gwVK02ikd75phmAJQ/ZCNdTbZHVsjuhkE6cQTxXTCij
	qw3GHU3XFm6FuWABgPy84q1zyT3R0shO9IhQaLWxYdnoYbvxG63Y/q5tMjDSnTJsp2O826B7CVq
	IHDc=
X-Gm-Gg: ASbGncsXVVpkMqBxtFblnRKK8MLfbt7HVVndT/MSPfmhrqD48hILd1F2J0iJsvPG3Fe
	KS/lvDMevKD8wYGAPaZI6naaMaFPwra0uVY4UD12kH7Lsa8fgDnqvYEYTMfrEhI+Xxo3jQa20LE
	Ow7UODOkchvQrkJt2xlsMGEFTHlJDlShOYW0rYYp7JM6v5/uNxvR2L7gaXekd7uYqE/VZlqYoKi
	D0iyMsazJRzS9+00t7c8EEhmMLxOnxWY28sO37nwUvDgo6GmxFMUeSwkjkQMonBYuY+eCZdAD53
	kv8+4MWTVXrimSFRsVmii/idgBwr/CgAYBknvIK6xMoyDRBLgYB+oA==
X-Google-Smtp-Source: AGHT+IHlev5PFMKxGtGlKTXgEnrODTeEcu6qOTBGbyomdbYjeUxCxsqeQMeO8XPVPaXVSa7xRjrEew==
X-Received: by 2002:a5d:6d86:0:b0:38a:518d:97b with SMTP id ffacd0b85a97d-38bf564d0c7mr19366089f8f.11.1737552375955;
        Wed, 22 Jan 2025 05:26:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd38:1d:73cc:d341? ([2001:8b0:aba:5f3c:bd38:1d:73cc:d341])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221be1sm16472006f8f.31.2025.01.22.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:26:15 -0800 (PST)
Message-ID: <9c98a7d0304062e884e35823af9a97f30bff75b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes/spdx-common: Fix patch error for
 recipes that inherit dos2unix.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2025 13:26:14 +0000
In-Reply-To: <20250122044245.3463096-1-hongxu.jia@windriver.com>
References: <20250122044245.3463096-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 13:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210149

On Wed, 2025-01-22 at 12:42 +0800, hongxu via lists.openembedded.org
wrote:
> While SPDX_INCLUDE_SOURCES =3D "1", do_create_spdx error happens for
> these recipes inherit dos2unix
>=20
> Refer [1] to fix the issue
>=20
> [1]
> https://git.openembedded.org/openembedded-core/commit/?id=3D2ceda7c90c008=
7f52693c54d5ccab143b27f4d21
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> =C2=A0meta/lib/oe/spdx_common.py | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index ff18d91780..23a17271d6 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -187,6 +187,8 @@ def get_patched_src(d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bb.build.exec_func("do_unpack", d)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if d.getVar("SRC_URI") !=3D "":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if bb.data.inherits_class('dos2unix', d):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_func('do_convert_c=
rlf_to_lf', d)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_func("do_patch", d)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy source from work-=
share to spdx_workdir

https://lists.openembedded.org/g/openembedded-core/message/209423

Cheers,

Richard

