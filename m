Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE79C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 17:00:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1385.1724432444738203816
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 10:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMhfphqq;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso3577215e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724432443; x=1725037243; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0bET7DiYejZ3KRmVrChisfSt24ANlJwpq6/SHTgDivk=;
        b=cMhfphqq231SoOZ2z33DflLVbEi76ZJtLb9gObwY7+v/ibw1DpLazVKIQKUS/YaNyP
         nmjuoFUdKXATckD+t/snJlCidS7jrWvsicOMOhhRCUHNv+YhJVVM9o4Y1KjP3gPvqVwZ
         eGXcSOshN6T5avoSUizdQH3WLhYY4DZZQWlUEIWutZYw/8sB1HNb9VOT8P0jMPXZ7uHm
         1XQ/Xs7pTrzoKS7rWu/kZE3Q0E6TrFkvXlxVy/1Ufj2NZUrUKw0OlH7xlTl5V/RGGPta
         do48rtDwanEV6K5AqWyhn6MCgElsNY/rq5imb1HSpI/1HPJMVqu7KFlWyI3tk6Ab5tU2
         dpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432443; x=1725037243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bET7DiYejZ3KRmVrChisfSt24ANlJwpq6/SHTgDivk=;
        b=ruVR7/MHG583JMltfE5q7t2zp3ZmYAG4JFG6BOxiy5DH+gmdlkiL+svveNfKTsNMjy
         /2ZRznQcz/Ett5lvgZdSo3gHifH5uM4/iYbLOv7S3IYUR3DJBqduAlqHi6nXN5/yqSr7
         6yHKkRjVoI3qwC+QzdYTYKlVasJJHOSiWNhwn3x2GUDy//TUBN+eRkoqNRJlE7BwvxQC
         EAkFaAFRi+FrQg++FWa5IJLwy1HAZnrg0Gcfu3zVLBhoFOcAHgYFKQcm6W1yuHEdTHLp
         npqQYlcZKRqaAfM/gs/Uw28ZSP8jU81t+T9CJOg8158GnPm5L8iBNk9zAqEnIiqoAaCz
         ivGQ==
X-Gm-Message-State: AOJu0YyLmAl51FMxjoqNcMIipiAnXYoBcbA2E7vgsOA23mKYXY0FEE4r
	QVAN2MthYiEbgLTMJDxziRQyzXoZPju8exWsf5yq26OsdJH+RCS8HPHydo9XWJyjK2BSd+a0C+z
	DCADmFCHzCy6Prq8MyORjpAytLCk=
X-Google-Smtp-Source: AGHT+IEb8iaL4oF6U7cW7pTZ4LqCiOy281N6+48KVeDsftneL30EsR8nh0k2qqUu5NdzMKFNmZiWDSdu3Lfcl5iyRhU=
X-Received: by 2002:a05:6512:2209:b0:533:4522:7409 with SMTP id
 2adb3069b0e04-534387c1a92mr2031829e87.53.1724432442179; Fri, 23 Aug 2024
 10:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240823135024.699680-1-alex.kanavin@gmail.com> <bd1ef278fd375a6f5e819bad5eabc6b81071089c.camel@linuxfoundation.org>
In-Reply-To: <bd1ef278fd375a6f5e819bad5eabc6b81071089c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Aug 2024 19:00:31 +0200
Message-ID: <CANNYZj-H0T4S9m5iWUdq+RLqm3+RmVCEs_5f=5VvmxT3Rsmhhg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] piglit: add a patch to address host
 contamination for wayland-scanner
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 17:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203700

On Fri, 23 Aug 2024 at 18:55, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Is there any notion of cross compiling in cmake? This might be
> upstreamable if you could make "wayland-scanner" conditional upon cross
> compiling?

The correct fix would be to use the output from 'native' pkg-config
(set via cmake class to point to pkg-config-native executable) for
finding this particular piece, but I couldn't find such a notion in
cmake. It does exist in meson, and we use it, sending fixes upstream
where they get native vs 'regular' pkg-config wrong.

Another option would be to actually send the patch as it is - simply
use 'wayland-scanner' from PATH always. There's little reason for it
to be called something else, or supplied from a non-standard location
which is not in PATH.

Alex

