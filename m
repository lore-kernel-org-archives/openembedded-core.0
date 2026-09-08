Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6713BC79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:25:47 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8648.1788877536886329176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 07:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rtINIYSE;
 spf=pass (domain: smile.fr, ip: 209.85.218.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so552665866b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788877535; x=1789482335; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6hFPN47qaKaN7lnEGx+121W8gdquhRxIx5rx/pZiaY=;
        b=rtINIYSEFnU+jw+rWhF9NUI4HYDY8R5WdMaUUQDBePSvxhR20O4HZxg3gMmymG7Tuw
         AoYPBc/Q2kfVD5pLBMdqlEdb8IacsQkiU+LdLSdGpSVEwZSfGvqelCZ9F0BBFJ4KSUSS
         vnjdt1r5Jk0Fo6HR3ieFzNaRejvZ13mXfpp+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877535; x=1789482335;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6hFPN47qaKaN7lnEGx+121W8gdquhRxIx5rx/pZiaY=;
        b=G3oBY/uuln8Z8GcdoskhqM0zHCyVQM384KVuS/i5uR0fQjadP2egmLM56rZuCHUYuw
         cvJ/tLy3ktZZaWOI9Wi7I5ACO9mvpfJK5ohi7Rz3ESfHlQ023y2rzXjcTK9eGPf3ygIW
         Lg0TsyZCurvRNiR31DW5wuvuH1LRzhBoP0U2kBGlksN7BchRFKhuI9KY9b8AC9XfM31X
         cXb7ebbLe+xGkSh+MF5oKJsqAMnh60JiL6Xpg2sxu4eW7hfkZB8HXIF24i3Mv52l4jW5
         wKshv0/Vx5U4KPx+D50g4yLVSCKGftFpaGY+9iq9E/NULrsMMMftjeHYiQBJUf8x6aYY
         siMw==
X-Forwarded-Encrypted: i=1; AKwUvBypPegXy0sMt3zeM8MmG1RCVt35JWbKwXHP0cyPYv8a5SE/QJOuRLJjiC2+82zbv+2Hq8NG6e2jOxyqKxwk//gmaA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nUqY6sxAnnr40/YuO2h9+lku8imalOsIV8FqZmRnMkB+XuCOc2
	no7O3SqrVsS+h0n1qkFFXjv4bd+82GpBrvmiCyoKxfOscXg0FYqYnTSD5+n5Cs8wc4xrdXpJ9N0
	8TiHPXi0=
X-Gm-Gg: AYBFou12eS1X3TEm6BooIoTZu6x3ILo3N4tXa3HwBWg0Ng+WUJF0hMnxCFGwser8BAq
	7+hsNhBvBeZ/CgscvmlSHpumLGVya/MgTicJBXU5wvDRW8by2pXMVU/rKRh0bkmgA5Wl92sap+E
	s86iqxgGD2Z8YSestkC3LovCPcP6Yhz5qpt9QWI1rFl8SIZ75VOYQtM+RrkDbSROYO4re+toqKK
	Jx2dXJxJI2Wgjp1PU0y9rV5O1FCEonSZ3pa2ha3asfLfbnsZFx/UtJ+O+ogXKBwcyBg1IXoiwVW
	9jQRnRVXuLlg+KsRkIv9lMCNxJfZJ9jHn0bzHT7FWxl5jBRhaOGQLETAYbFmPje2ZnC1RDXKbQn
	aN8VtFtJ6/K2RD0+ektru6Zm+/89w7UOZQFfaFz7ZIPLJFfM0a5NlbeSr+KtSbEHeoeWgl78ckm
	nzuucG+LunfhxmGqOS3T7rD34NXSeZmGL4G7Xg/qEJLIVS/yZsR67U4h0FvZsYc06SLsme/+abX
	5JXptKnq3os29Fe/5qJmswdYC4/ZvXO2SHS80JhmlllMX6U
X-Received: by 2002:a17:907:3c92:b0:c25:9102:ed with SMTP id a640c23a62f3a-c260c65c166mr1123085466b.5.1788877534771;
        Tue, 08 Sep 2026 07:25:34 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb33619sm1150076985a.22.2026.09.08.07.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 07:25:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 16:25:31 +0200
Message-Id: <DLA05T4FXBZA.XQMLIGWXGB2D@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] cmake-native: use bundled nghttp2
 with bundled curl
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260827062638.2141533-1-deeratho@cisco.com>
In-Reply-To: <20260827062638.2141533-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245367

On Thu Aug 27, 2026 at 8:26 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Himanshu Jadon <hjadon@cisco.com>
>
> cmake.inc enables system library lookup through
> CMAKE_USE_SYSTEM_LIBRARIES=3D1. cmake-native already keeps curl bundled,
> but it did not also disable system nghttp2 lookup. With CMake 4.4.x,
> the bundled cmcurl configure can enable nghttp2 when headers are found
> on the host. The later compile uses only the OE native sysroot, so the
> build can fail with:
>
>   fatal error: nghttp2/nghttp2.h: No such file or directory

Hello,

Wrynose is in 4.3.1, not 4.4.x. Do we still need this patch? If so, can
you add a backport note (below the "cherry picked" line) explaining why,
in a v2?

Thanks!

>
> Disable system nghttp2 lookup for cmake-native also. This keeps it
> consistent with the existing bundled curl setting instead of adding a
> new native dependency because the host happened to expose nghttp2
> during configure.
>
> Add the bundled cmnghttp2 license checksum because the native build now
> uses that copy explicitly.
>
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 0b20ba549d6f17af40b9877eb9ab0c52ca62a18c)
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 2 ++
>  1 file changed, 2 insertions(+)

Regards,
--=20
Yoann Congal
Smile ECS


