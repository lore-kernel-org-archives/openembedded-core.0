Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390F5C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 10:05:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26511.1786356313304797183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 03:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sualvy28;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-481412f1828so230212f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786356311; x=1786961111; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h6+l3yzPHVG9KnmpMf9TdgvuSBhycI+oalvRToDQvaQ=;
        b=Sualvy28fooV0EoNVH3rcBppmFqJ2e+3AcG5Dk9nUhEzu1lBosU5M8hwQWxlj4whXE
         JC0DoFUyowNLqXJCAdnt83C2W5L3vfwwsQuwqo3oslbv2F8dtNSUiUtkLvoB9prvOu6w
         rgiGcghfllGbZQz20hcbejndclPM36xeeAy4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356311; x=1786961111;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6+l3yzPHVG9KnmpMf9TdgvuSBhycI+oalvRToDQvaQ=;
        b=W8wCtX5RGXbjoeonDK9UZKlYcSoFSQHncI/DL/37gjUcD5pS47ai45tL3bhmXxPv0Q
         RedI6I9sJJkX2ZO4eiSA6o5x+r73c9zLLksO/Kw/id7FbSK1vj+w+G+rzHmIK3npFuTV
         uyu1SNq2UR5dz/OGcpa3U03g4AYJY75zffoMW9/rRjeHIWDkW16NeKLSD2ymwhzKExS3
         vivFLFUI9dUmPy05JfPQvcHXx9GNGbD7wXGGeKVlvUzhYfRB5cEYz+MHnXl0pe7NO+1Q
         G84iKnzho8Y27ruksNQ4fDaFwugOZQD3BIapQiU2EnBr9QXVFtWSCUrNXRlHYDShISvj
         Powg==
X-Gm-Message-State: AOJu0YzODcLckx/tgQ3dOPcS49rcX1AXbx7l+KK738bb27N98s+SynAT
	iBFRsuiU2tn+62P65x10xROqBgDHjBswyqyaR1ZeVBSoAUExB94Ve32Chmtd9E1+wbI=
X-Gm-Gg: AR+sD10Yw3V4ktApnOSDjlzcSxmygFBpekM4FHDzMAXr7bSeP2DXDNGJpJFXR8Sd+MB
	JO/1vAVzOP0kEsGqYavz30po34GlGk8IJOvHx9Iv8gkmU8VnYMxaFgwVJ87D3QMkYJ88muTnwjl
	2JWDDoSf9Memol7dg8tCRGlOij6ABDXzbiG08xp0S4QAjVvkFHxmu35HFeGMag1JVHpqOWBTkHK
	n+9FyNVBDP2Qq+RqRAY5d/o+g4GkVGMefl8aReMJOt+p5rLcSuy6qhPrhesrVEKEUAfKgBOoaMK
	+8C5qX2+lpOhIsWeWqJrqxqEvkeRr07Zujhr72xLJTUj4lKblE44FMj+wilFfswM7RzO1s98KcG
	saxPVWA8n+h6aYRl52ffircKRXAAA9HWYF4ko37mO5dgkotu+fVGp8FJKt76hgmpulU3ZKoUVDj
	HjwYORFpdDgfPq/yDvR1oyfQZI1i3/diTAjlq7Jt11crVz/1KOFS5pgtZ0MZPIfD7++4F+UFj3Y
	7tX5Fa38slKvv54L0bcNlPkRqHf9sexmx/KsQzWVdgOP94NY/d+ow==
X-Received: by 2002:a05:600c:4fc3:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-4996194cf28mr202061515e9.8.1786356311208;
        Mon, 10 Aug 2026 03:05:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:96ae:4423:ae88:ca02? ([2001:8b0:aba:5f3c:96ae:4423:ae88:ca02])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a404sm402572725e9.9.2026.08.10.03.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:05:10 -0700 (PDT)
Message-ID: <537a934c1130dd2b7e9f9adc834e23c6e1ed1ad9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add timeout to HOSTTOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Date: Mon, 10 Aug 2026 11:05:09 +0100
In-Reply-To: <CANNYZj80mFKe+=1_6j5j+kFG1WC1xX46WwCx=EVWU7re820Qzg@mail.gmail.com>
References: <20260807100237.1218728-1-Hemanth.KumarMD@windriver.com>
	 <CANNYZj80mFKe+=1_6j5j+kFG1WC1xX46WwCx=EVWU7re820Qzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 10:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243124

On Mon, 2026-08-10 at 11:27 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Fri, 7 Aug 2026 at 12:03, Hemanth Kumar M D via
> lists.openembedded.org
> <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
> > The glibc iconv/tst-iconv_prog test uses timeout(1) on the host to
> > guard against hangs during charset conversion testing. Since timeout
> > is not listed in HOSTTOOLS, it is unavailable in the Yocto build
> > environment, causing the test to fail with exit code 127 (command not
> > found) instead of the expected conversion error code.
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -533,7 +533,7 @@ HOSTTOOLS +=3D " \
> > =C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch perl pr =
printf pwd \
> > =C2=A0=C2=A0=C2=A0=C2=A0 python3 pzstd ranlib readelf readlink realpath=
 rm rmdir rpcgen sed seq sh \
> > =C2=A0=C2=A0=C2=A0=C2=A0 sha1sum sha224sum sha256sum sha384sum sha512su=
m \
> > -=C2=A0=C2=A0=C2=A0 sleep sort split stat strings strip tail tar tee te=
st touch tr true truncate uname \
> > +=C2=A0=C2=A0=C2=A0 sleep sort split stat strings strip tail tar tee te=
st timeout touch tr true truncate uname \
> > =C2=A0=C2=A0=C2=A0=C2=A0 uniq unzstd wc wget which xargs zstd xz \
> > =C2=A0"
>=20
> Adding to hosttools just to fix a single test is very excessive.
> Rather make it depend on coreutils-native.

I'm a bit torn on this. Since timeout is part of coreutils, the host
dependencies are basically unchanged by the patch since we already
require a good chunk of coreutils.

I do wish we could make "per recipe" markup of things like this work in
a reasonable way though as it is sad to mark this as needed
everywhere...

Cheers,

Richard

