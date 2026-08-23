Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B15C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 09:25:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11726.1787477096246831608
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 02:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDQNWABS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1338164f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 02:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787477094; x=1788081894; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s2kSx/HEQZXB2XhRe9DKhUI5qDUmFdYrjOqmnnYqdZI=;
        b=gDQNWABSMA/v22dbQk8yNYyNj5BEvov3IAklOgr2Mi2Udzf1Bi4DvqoNEBCXnzfdfm
         SOMwrBEuKua+6p/BUBYSUGa3F+kZ63r8cYJTbfEGZcbN934LNnh8Qo56zNuFln9ef9Pm
         bdewwgynlxkLHOWXaSL4cdOM5//X62SDkDxFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787477094; x=1788081894;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2kSx/HEQZXB2XhRe9DKhUI5qDUmFdYrjOqmnnYqdZI=;
        b=ejXeYygtW0nOVlaCI+q3YzdVAv1izi7KeZAinx4kjb3eGwKQBu6TLoXQPxVQag8ePY
         KYwAsr2eRBgZ2ANqkOkpNVdc+cW6ckxrYq+qOUob/VV6wNMt27THhE2Z0NU4uxZA91Q5
         mTul+uaM781kyStn3HVNHqEZ8T3e8UHCIh4HAczZwzH7V6xiHVZ8yljz1jCsuTwqCBF6
         huiJ5cFDXlDknaBV9prydbH3xb/uouzx57Jq9uQ5iA+u+de+VYzWVlUooHFFkZHR2SA1
         pKnrO3yeZDSXL6rPjnlcpVA0hmVTt93uU5MZ73bEgYJZZA0KxLPwtQ1vIvf8jrq19x8H
         7ydA==
X-Gm-Message-State: AFuF++miuIkQVFbmgLtLOxmnLGYy7ur0d8nwNkmBOYzIvLHSaPF5AWtz
	HIwULuVPw6SIFzknVwdy9ke/iEoRd8yELWF1hKp6iPgdQrBRhtlepUP1/UXkQ8XR8oc=
X-Gm-Gg: AR+sD11Gnp/wYjaBL8CWbp7E0JlmT2Vc4wy6u0lc2l4bxNFLks18fDWj9gYIpFLf5z2
	UAbEgIamRWNR3yGuF8Rv0hNi0Cy+yhn/1TmtaV43V4TRzqDGOY9gL/RRprcQMVWcCuTqZ2rR1Xs
	e+fp2IThAIpnpd9SMzBSDpRBXgQvXngvkBF4cfQ9XCCJTUvZxSexqxOEKqZO8Nontxue6BglZR5
	y6euq7dDwgEY4Myn4IXfu3mnd0gFdpBK65h/989YihHyVu9itZ8GFTSVxxUJwoxXN9dxswXA8kQ
	GW8/FdOfAlQFOUoNNzMDo+PQqF4v1FgQ+aZ3Yq58dV+YXd+r+TKQ719uDZZblLxU0Bybzb37Nrs
	hmcbIESj8PpAz96fx/OjDoonA4NZI6aIsJgToVmuPjQ5c0zV9V4110lTidei8/0mte3+tPVda/8
	MDSDkPUw5ykosIQUUCehVARRGPEBFsCxkwP+e8VdTk5MPmZH6KDKZZhiW/Y3h1I4GYK2rzCqfq0
	Hh6ugWTCc/SOvf9ubN/XZKBgwG5iO76V4G6rW9/XEyyT7sSacc0HYg=
X-Received: by 2002:a05:600c:468f:b0:499:7ce1:d8a2 with SMTP id 5b1f17b1804b1-499c19d0541mr81919855e9.8.1787477094469;
        Sun, 23 Aug 2026 02:24:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8601:39db:494d:605c? ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35a1e35sm43568685e9.13.2026.08.23.02.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 02:24:52 -0700 (PDT)
Message-ID: <2e1517dc9a705b4e36ffe73a9ccdecb05a1b77f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] python3-cython: upgrading to 3.3.0 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org, Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 23 Aug 2026 10:24:51 +0100
In-Reply-To: <010101a02d0dccd6-b1ae7cff-ddcc-42b6-bc42-d87fcdbc23f9-000000@us-west-2.amazonses.com>
References: 
	<010101a02d0dccd6-b1ae7cff-ddcc-42b6-bc42-d87fcdbc23f9-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244026

On Sun, 2026-08-23 at 05:17 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
> ep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Sun, 23 Aug 2026 05:15:55 +0000
> Subject: [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.0
>=20
> Source: CHANGES.rst
>=20
> 3.3.0 (2026-08-22)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> (Complete changelog for the 3.3.0 release, including pre-releases.)

I did try this but it doesn't compile:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/99/builds/4427
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4446
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4485

Cheers,

Richard

