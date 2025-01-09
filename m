Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16555E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 13:41:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.47788.1736430067311967225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 05:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YlusiW+B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4362f61757fso9795975e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736430066; x=1737034866; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qBL82LMeZ215/TwlCmQ+CXgeOOCLCKXAk+Mui+He1Ic=;
        b=YlusiW+BhjbSbZBNe8bGl19PX+HKRXAidPXKy2HG2rPkNO6O/l6s24AqE5g9Zk88LN
         hSmPEZiD3LKaiebTnYW7ZMCea/sm/UwSVlF1vZ3Ey4Nx0FaOY5/fQhceq/a3Sei3QSsI
         X60fpXDWXP0Dv7JOUY6bIhCRjgNpXNyrv0qK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430066; x=1737034866;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBL82LMeZ215/TwlCmQ+CXgeOOCLCKXAk+Mui+He1Ic=;
        b=MBA5vCnAQmW0JqIizZ5Q5uX4VtmTeGzqKzwazMEeEmYT+6C/F53/Un42C2t6kEZ05i
         +NZaptT/C3dmJWMy017Y32esZe8FMDbQVCYCc1FzkU5NSeYhBjRt7AmBOVMlsZhdzdQW
         5qd6V3yx7zC7JqRT7i9LMbYtC8jY1W0EwFu86+oOX+4lSNrcsGJD2/ELGGh+gSC/xYPV
         eA1ajU1v2FU0xAJGq7n5phX+cSEvZn66Hipukz3O6x92V9TfRb5e/SFxVj8kcd1ivtwk
         WO+ANDgt/qQyZVINHch9z2jdR4IvptbLstKTN0sxY4Cs0evRiRmx/woj3OOp39xmvjWl
         3Zmw==
X-Forwarded-Encrypted: i=1; AJvYcCVI5E4cx8SK5Eeq4sKeBmv/4zP1/AYMSdd3QlP8PG8GQRgWf0+6azuTWZMexSholi2994Am3vo16Wa6YVjc77ootQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPs99hnXlygpcOUowGWnr+UtwLyfEvnpYyrrYjJmbvrQZcZ7YG
	xlN2YBbASaWG5wW6M1hHDq6iKDLhhygZyqq6rgIXtC7OS+5yTacsMFysT3ugWghSTmy69lyXQa8
	mC4w=
X-Gm-Gg: ASbGncth5Uu0Calyl4CPK+6gMvkKZ0ICaS7aq0l4zHyHclZ8wDrMKmn+9c0+VDqhHoy
	Ma0syivCOOdK9Ro7/jMW+j+xG3o3vbXdHYG0V6O5B7IZNo88CJd2ulSp5Fk+WaOg/OkZxel2cpK
	ae8WLke9Rq9f0ROdARcILvzGS+b9B1w2BuVlrUrAkiz5+H3q+k5PvoLkvkOiDpjPqNybt2guWKq
	KSaGYdaOQhfQIfULMIFVkk0cBV4tnYLJJe2DkKm/BO2VxMzqhi+pA+Bs1Pi/H8BN6mgijDXzvhU
	dayyzAlDtiJuDLrhDxzwrm/qvczT5YAra1TeqR4wkDoVgw==
X-Google-Smtp-Source: AGHT+IEPnQSE7NyvOkrqlQ7YTeC9S5gycBkNY8xNzOBfDHXurhNVMM+jQ6YMmnitTSh0gH7fd4jjGQ==
X-Received: by 2002:a05:600c:3544:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-436e26ae55bmr60326305e9.4.1736430065618;
        Thu, 09 Jan 2025 05:41:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dd3:3af3:9d4c:53d4? ([2001:8b0:aba:5f3c:6dd3:3af3:9d4c:53d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fb99sm21676275e9.3.2025.01.09.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:41:05 -0800 (PST)
Message-ID: <6d0d537cdd4f22156612f8928be0348f6047747b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 3/3] rust: Upgrade 1.80.1->1.81.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Date: Thu, 09 Jan 2025 13:41:04 +0000
In-Reply-To: <20250109092521.3921275-3-Deepesh.Varatharajan@windriver.com>
References: <20250109092521.3921275-1-Deepesh.Varatharajan@windriver.com>
	 <20250109092521.3921275-3-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209626

On Thu, 2025-01-09 at 01:25 -0800, Varatharajan, Deepesh via
lists.openembedded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> https://blog.rust-lang.org/2024/09/05/Rust-1.81.0.html
>=20
> Drop the following backported patches which is addressed
> with rust v1.81.0 upgrade.
>=20
> 0001-cargo-do-not-write-host-information-into-compilation.patch
> https://github.com/rust-lang/cargo/commit/2db0bab16139d094f689587b73539aa=
e386a1919
>=20
> hardcodepaths.patch
> https://github.com/rust-lang/rust/commit/28503d69ac204ff208d115aea30dc09d=
6fca8728

I put this into a build for testing. Unfortunately there was one
failure so far, on x32:

https://valkyrie.yoctoproject.org/#/builders/11/builds/761/steps/11/logs/st=
dio

:(

Cheers,

Richard

