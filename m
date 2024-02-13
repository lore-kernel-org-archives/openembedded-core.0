Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760DEC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 18:41:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.21190.1707849660653578646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 10:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9+fOh0R;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-411c93e1cd8so209765e9.0;
        Tue, 13 Feb 2024 10:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707849659; x=1708454459; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3up+viFEUTsGS0fPrx5+jiYpUuMkqDrTW2f/W2hTG/Q=;
        b=D9+fOh0RhUpRExV6aSqC1/ln7pch/8qeAqGt+h1Gtify2pVXoj7uNPl8wRZ3sX2l0P
         N50PofIBcP2vYB3jcQeFKbywvwYur8jil9nDY83rlz1u1yo/urApZHYSz0/N/plESaGs
         ap9vHBVUWo5wyDT9YGiuepNEKzAD4VrBE1hoecJKbCi8aopy0voDmgX45hiKi1At7uVG
         hpIn3MmaGC19TT5MACykw3MoPgzyBY8NH8dcGEnoOjCOFVMMCeUaiJKVfkAC38KWILD+
         CBIeZ7LD60Vud/E4ikOdMieq3/N2d8bjMwMj2pebuEHimVVcxw55Yjkg3egbjr6WVd63
         j1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707849659; x=1708454459;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3up+viFEUTsGS0fPrx5+jiYpUuMkqDrTW2f/W2hTG/Q=;
        b=cBy7f7ayXTb5Q60Jds3bGvPguTMDq0EmLDP22uLGioDcFsmI2r0JwZWUV6RFz1lHZL
         GkJRlr7xe1g0RLKzl5NaRRyEDLETiW6oBhLzMaXnsIw7tKdoayVJtXKk+nnJxP9zg7SQ
         omXvIJgyYvCEAsV/lzXos9nmsrz6YyNCnUUKK+Ak8ekl3MjClKIc9mQU8Qh86guAY4Wa
         h4e9m5IjbhzW8cShuIf0hzobCZ4Dzi++yiG90KVesR7/gBWXv5a4jatCAKhUlvSh0lNi
         bxsgVwgYxu9MO8yPFjvR1ipxpQZwnFUuX0cM+ykUPxSVblKR/W6+c4Ji80lhOHYarRWZ
         nBlw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7PVV7vucv6TjZh+Q00TsHdIZ8vRjI9Cz6Z6a3yCyb58XgYLy5+fLis6b3EENOQEdDhlg1VaSoIsRfs0mc4vR5RCfjKvbWrsfkyiYDaR5+zx74zrgdO1L
X-Gm-Message-State: AOJu0YyuiCG3wGsJniVZ9YbP+blMTwzvGtwwWSb59w3tBuXFRicHAqml
	2Fr0g2TB4+Szug5QaK5VTKDj+wFg+EX0W92dhMLMfIbdskJn6jqN
X-Google-Smtp-Source: AGHT+IFWGwpeIPjrPhzksvqQ5qYbK9cmswbu+nXVzz7FkN24hvUdtxTu/kvf7Ohwo4ol1VXEwwoczQ==
X-Received: by 2002:a05:600c:1c8b:b0:411:aa3c:128d with SMTP id k11-20020a05600c1c8b00b00411aa3c128dmr3196247wms.15.1707849658698;
        Tue, 13 Feb 2024 10:40:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyMEosZoLuEmEfoVLCqyAO636LiTWZmcfNhln+GNL4XULq6WGpixYgzdnzQwpc/MNLYGirE1myN18CpD15zOuQOQpqeQiZYPDAqwBgYV0VvN8HshmxcBTzbmAws7rBJXxk9SNRwHcruTvL7g==
Received: from [10.139.5.195] ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id x5-20020a05600c21c500b00410d897765asm6410539wmj.17.2024.02.13.10.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 10:40:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ai3UGdqIusetmyIVDjUV7Rct"
Message-ID: <90a1eab2-8deb-4f6a-8f0d-e6fc910c10d7@gmail.com>
Date: Tue, 13 Feb 2024 19:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] nanbield: grpc_1.56.2 fails nativesdk build
Content-Language: en-US
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "steve@sakoman.com" <steve@sakoman.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <17B23A54B6BB5F11.15017@lists.openembedded.org>
 <5009ff89147eb81e88005c6b6f76d195bf010edb.camel@infinera.com>
 <12d6aaa8-1f7d-4da9-985a-8ebb2a51ebc0@gmail.com>
 <7b7a5dddfe76a38a74a2df0c441af7bfc4dd19af.camel@infinera.com>
 <ade3562aea69ab37a64d0bdf82a8bd95e97a3679.camel@infinera.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <ade3562aea69ab37a64d0bdf82a8bd95e97a3679.camel@infinera.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 18:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195426

This is a multi-part message in MIME format.
--------------ai3UGdqIusetmyIVDjUV7Rct
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.02.2024 16:19, Joakim Tjernlund wrote:
> Tested and works too, but I see this patch was reverted:
>
>
> Revert "protobuf: stage protoc binary to sysroot"
>
>      This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.
>
>      As said by Ross[Ø]:
>      "Putting the _target_ protoc into the sysroot for executation at _build_
>      time isn't useful because even if it has the right architecture, the
>      tune might be incompatible.  Recipes which want protoc should just depend
>      on protobuf-native."
>
>      This has been reverted recently by Samuli[1]:
>      "If protoc is enabled for the build, recipes using protobuf will
>      fail when protoc is not available in the recipe sysroot"
>
>      Be the revert is incorret as This is an issue coming from qtgrpc
>      other recipes that use protobuf or gRPC compiler, proplery looks for
>      the binary in the correct sysroot folder.
>
>      Qtgrpc recipe should fix this issue at the recipe level, for example this
>      is what I've done for "etcd-cpp-apiv3" recipe[2] that doesn't need this
>      patch to properly compile.
>
>      So keeping this hack doesn't seems to be a correct fix.
>
>      Note that qtgrpc recipe isn't available on meta-oe nor any other public
>      layers.
>
>      0:https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
>      1:https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.3088498-1-samuli.piippo@qt.io/
>      2:https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c801a0ecf7312d1049ece3e
>
>      CC: Samuli Piippo<samuli.piippo@gmail.com>
>      CC: Ross Burton<ross.burton@arm.com>
>      Signed-off-by: Clément Péron<peron.clem@gmail.com>
>      Signed-off-by: Khem Raj<raj.khem@gmail.com>
>      (cherry picked from commit bfb626a23022d871ce3c0c64cb9e5d1cc17c737e)
>      Signed-off-by: Armin Kuster<akuster808@gmail.com>
>
> So then what is the correct fix for grpc ?
>
>   Joakim
>

Reverted and then applied again :)

If you are interested, see the full discussion here 
https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284

Slava
--------------ai3UGdqIusetmyIVDjUV7Rct
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 13.02.2024 16:19, Joakim Tjernlund
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:ade3562aea69ab37a64d0bdf82a8bd95e97a3679.camel@infinera.com"><span
      style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">
Tested and works too, but I see this patch was reverted:


Revert "protobuf: stage protoc binary to sysroot"

    This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.

    As said by Ross[Ø]:
    "Putting the _target_ protoc into the sysroot for executation at _build_
    time isn't useful because even if it has the right architecture, the
    tune might be incompatible.  Recipes which want protoc should just depend
    on protobuf-native."

    This has been reverted recently by Samuli[1]:
    "If protoc is enabled for the build, recipes using protobuf will
    fail when protoc is not available in the recipe sysroot"

    Be the revert is incorret as This is an issue coming from qtgrpc
    other recipes that use protobuf or gRPC compiler, proplery looks for
    the binary in the correct sysroot folder.

    Qtgrpc recipe should fix this issue at the recipe level, for example this
    is what I've done for "etcd-cpp-apiv3" recipe[2] that doesn't need this
    patch to properly compile.

    So keeping this hack doesn't seems to be a correct fix.

    Note that qtgrpc recipe isn't available on meta-oe nor any other public
    layers.

    0: <a class="moz-txt-link-freetext" href="https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/">https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/</a>
    1: <a class="moz-txt-link-freetext" href="https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.3088498-1-samuli.piippo@qt.io/">https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.3088498-1-samuli.piippo@qt.io/</a>
    2: <a class="moz-txt-link-freetext" href="https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c801a0ecf7312d1049ece3e">https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c801a0ecf7312d1049ece3e</a>

    CC: Samuli Piippo <a class="moz-txt-link-rfc2396E" href="mailto:samuli.piippo@gmail.com">&lt;samuli.piippo@gmail.com&gt;</a>
    CC: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
    Signed-off-by: Clément Péron <a class="moz-txt-link-rfc2396E" href="mailto:peron.clem@gmail.com">&lt;peron.clem@gmail.com&gt;</a>
    Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
    (cherry picked from commit bfb626a23022d871ce3c0c64cb9e5d1cc17c737e)
    Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>

So then what is the correct fix for grpc ?

 Joakim

</pre>
    </blockquote>
    <br>
    Reverted and then applied again :)<br>
    <br>
    If you are interested, see the full discussion here
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284">https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284</a><br>
    <br>
    Slava<br>
  </body>
</html>

--------------ai3UGdqIusetmyIVDjUV7Rct--

