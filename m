Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF1BCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 13:13:52 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58130.1790601228662977121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 06:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cyVmLuMc;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15c1so396958166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790601227; x=1791206027; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5isFAW4MhLx65UUHvQD0T1D58w6rMuh+QplcABA8Fo=;
        b=cyVmLuMcTk4Gs53zsAIEHuV8VZH/tF34IUpe5NejPb5mgdAuSIoAp9Kmw7KAw8etuN
         eh4qR3sU/XCMvCDSc4uW1+f7QNivZlPIjzXI4hFqFjMXAU7BqYyhuSWolTWZipbR87Sm
         GNSP7wgo6Bd3LWYjnFw+7OpcFL/5oDwnJFmvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601227; x=1791206027;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5isFAW4MhLx65UUHvQD0T1D58w6rMuh+QplcABA8Fo=;
        b=Ui1Z4r8auO1bnMQ5F9CEo0y4X1qIEDvEa7xafRknPu2nYUfpK9u935PeCq524L72mc
         LkDD1Aoq0TIKO7xlGOHuZj4vGSuUYvASfodMUPh03gSWvB67cSfMtvpQu/sClE+Ddbu9
         YYjYX9rDUaHf5ySzFFdI9UhRwr1cjA4N1xkrx2QtjBOdynOmDqw5lKtR5h8kkGVFf3kA
         bUmZc5sf2TRJzyMI4gjZVd+aGVfrt71L4dCjXtLhAuBzuLGyoKd6XzjBzpvrRpg5Ly5Y
         pv6eJT29JuT9zcn/qF32wq6PxFAADEpWl8lQTSpvuOLYSyk9t7xVqf9KfHbYIGt5J385
         2kgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOpsZj0otp+bwc+gmJHrDa8OyQWUn6kuoXE/kdfgurbtqjW+xxU6gyoaAhAHid/+x07M4IFpk8TOO8MXAxKU4agQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++lOJt/sDePg45CW999ZAPUSYHb/Z1kv8SiY3QIpnSQIrARJ2gvH
	jTHw+uTxxtxgfLXdwWOh9BoI5B46SYUoPJLi6sXj45yefZ8e5iHy3nPTtoN+M3kQHAWqAvL7aYZ
	rFRjdG9I=
X-Gm-Gg: AYBFou2G5sz7YYDcCgXuBNXKRIopTlMcj+vkyHbFg+PEz3gvvb4LIfq/IyeVZhSBQ6j
	zglaAChmVR31mveY6FLUmwe53N9KnDgnpJltvEKYsXYZsaCpTixi6e06oi4yWlHj7Y2YPpbSoO9
	ywDgxOjuT0ERQvtN1HoWbOr/809TqgUb09R6yy0aaK4tL/owA2IZGIEv2qYRlfCkK/dyT0HVK+S
	DuYWa8CWTdufjODDA94GWyBSG7dsUs6kV9Yump6Ubu+/NOffVn985R6W2hczdQPL9KmedlgynQ9
	kRwuYnGgyVJujfaGZcXzbJTyEuQ5BFrCrE5QhJNx62IQ/8zqzNdxxkJ2gL92WbbQ98RFf16KUzW
	wf3DP6hSP3osAD0SxmL7Ni+tMSZ/1glTZiixNM7hKSUFz34Oo7uNj7dC3jWDQzsj1voMA8bcdq0
	voI/ZDbGEWe99ya4JMtWCekPo6eNgXqFnuHUmHPnjmn1hyiN6xUB/1AwvMP6Q/Pl04SQK7V3Nz+
	KbB+IRqmven225nVl8Gtp7vpGi1jLnAWS5Y5DO0J3Lv82WzshhVmrxtAi7oiIE=
X-Received: by 2002:a17:907:94cc:b0:c2a:f518:1890 with SMTP id a640c23a62f3a-c2af51835cbmr717854066b.41.1790601226074;
        Mon, 28 Sep 2026 06:13:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e53f:c6ab:eb79:60b3? ([2001:8b0:aba:5f3c:e53f:c6ab:eb79:60b3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc3e12208sm254191366b.42.2026.09.28.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:13:45 -0700 (PDT)
Message-ID: <49ae62ae244833421d9a9645099b27a3409db709.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/8] erofs-utils: Make reproducible for
 different BUILD_ARCH
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2026 14:13:44 +0100
In-Reply-To: <1008103.1790596045910735679@lists.openembedded.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
	 <1008103.1790596045910735679@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 13:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246765

On Mon, 2026-09-28 at 04:47 -0700, Dora, Sunil Kumar via lists.openembedded=
.org wrote:
> I might be missing something, but I think the aarch64 case can still leak=
.=20
> In configure.ac, right after the cached sysconf check there's:
>=20
> =C2=A0 AS_CASE([$build_cpu], [aarch64*], ... erofs_cv_max_block_size=3D16=
384 ...)
>=20
> so on an aarch64 worker building qemux86-64 the cached 4096 still gets bu=
mped to 16384.=20
> When I tried the v1.9.4 configure with --build=3Daarch64-linux --host=3Dx=
86_64-linux, config.h ended up with 16384.
>=20
> Passing MAX_BLOCK_SIZE=3D${BLOCKSIZE} instead seems to skip that whole bl=
ock.=20
> The next 119 run should show it, as long as reproducibleA picks up erofs-=
utils from x86_64 sstate.

You may well be correct. I'd isolated it to the blocksize and the patch
is in testing but might not fully work :(. I was planning to verify
before merging. I sent it as it at least points at where the issue
is...

It sounds like setting MAX_BLOCK_SIZE instead would be the thing to do
as you say.

Cheers,

Richard


