Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB06BC3271E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 15:15:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.12594.1720106141205817332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 08:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CaxrmRNA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4256788e13bso4907125e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720106140; x=1720710940; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qGk3q/BMaOxl2b0zDE/J7SI4ZVD2F6TSOdm84KQ2S/g=;
        b=CaxrmRNAMjZNhRIHpJSixlE6R7B4eq1oCV5bM0h+8Cm8EBxDW+cCD+RU5JutbDLSTs
         6vn/z0OrBSxVrRpqq/NoTnlqhQr64WdzF5n0SpTSWrY2jNs5ludpAzd8q/GYCR8bPjc2
         1MEdr3RBO4KBUYKkFPo8NQdpFdGFuOHLasMog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106140; x=1720710940;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGk3q/BMaOxl2b0zDE/J7SI4ZVD2F6TSOdm84KQ2S/g=;
        b=a6zM6TreAeCZzAf6SzhxX4wokDjL4JnoSdHPOeL9G6gZLl9DNyOtC4X66cSy/VONd1
         qGR30E4AY3l14TFNXytN0dFsVQCzQEhutqU0F7zP+l5riR20p2I9smOh1BLSwASUwdE6
         N7SCAQ2FhQdC79I4ydrOqGbzDPFggJTVANmB8XeLzp4BgKaQ+pfZy/wioYG5MRxyvX29
         31SUCpQmI/KqyxMX650VnFUznyRRuVbSqKiDA8H29rn32y6lbZ/ExjBz3j4AMYti8HSk
         GDaLv1HWcqeCOmoZQ1TcqtvcTGh7N3QV29jvzyueLK7JBsOX7A382mLDThHed45DhF+x
         px2A==
X-Forwarded-Encrypted: i=1; AJvYcCXjPIOfV3i4kbFwFGFp3ioM7oydTA7OImr/N8UfGK7+HfFcQ9Tt0/KkEpKmOtwe1DQse7USsNQLSWzXDwg69yDzbDvVek9Z4xYfDMmaTNC6kYKCNhAXQdrs
X-Gm-Message-State: AOJu0YyKPl9vvL8JEVs6h/nXQ6VuS9znnCwDAT/VuSzPalEqlNtsNJ9E
	spuyBJqAxMBtet6/pFh5YaLypIkPq3Ob42O/PlxhFVGSc8lQAkL9g507vRKHGoo=
X-Google-Smtp-Source: AGHT+IE295tGxU7PHYwE77YDA0LGtDP3acBvNhQTZOdug349O1FH6/CotwZer8EarDXhEwNS3N0XcA==
X-Received: by 2002:a05:600c:6b13:b0:424:a779:b5bf with SMTP id 5b1f17b1804b1-4264a3e7bd6mr14112005e9.20.1720106139653;
        Thu, 04 Jul 2024 08:15:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be20:56c3:ce73:d7de? ([2001:8b0:aba:5f3c:be20:56c3:ce73:d7de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6677sm28011675e9.17.2024.07.04.08.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:15:36 -0700 (PDT)
Message-ID: <6b8ba5a42a03dc0e04e89989584fb313411d0783.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testexport: fallback for empty IMAGE_LINK_NAME
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kweihmann@outlook.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Thu, 04 Jul 2024 16:15:34 +0100
In-Reply-To: <GV1PR07MB91207447D621EE3962C6802EA8DD2@GV1PR07MB9120.eurprd07.prod.outlook.com>
References: 
	<GV1PR07MB91207447D621EE3962C6802EA8DD2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 15:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201579

On Wed, 2024-07-03 at 04:47 +0000, Konrad Weihmann via
lists.openembedded.org wrote:
> if IMAGE_LINK_NAME is set empty to disable the symlinking
> for image artifacts in deploy, testexport fails, as the path assembly
> is incorrect.
> In that case fallback to IMAGE_NAME
>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
> =C2=A0meta/classes-recipe/testexport.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

Are you using the test export code? There has been discussion about
removing that which is why I ask...

Cheers,

Richard

