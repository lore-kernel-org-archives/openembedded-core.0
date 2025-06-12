Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1956C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 20:52:27 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.5288.1749761544882254907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 13:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+LaIcYE;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a6f3f88613so14774921cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749761544; x=1750366344; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fGjiIKy/Z2ixr8Sa9PIaWOc1c2xrxyIl29h5Evz7avs=;
        b=V+LaIcYEaORSKaw5WkIDGtoP+VrB0qwbY3J7rZKUmQ70hF0BP6gKWB3G7DOA4oYrtM
         d9QMfwWmzo6kz6eniy236XXFcysDee7sN1Zx7bZIy6ycQlau1wYdQVl3IdOD6ZtkvEBF
         xcGcqunwabd3EJxjLbHLb+rdvgZTFLlHOqpZGubrW0WXiNpA4GdW8YLjUqkF3tGytPEE
         6h8gBUTYSvl5w3hY8eIxOLv6fVOpiAIPC3S8L9PSHKzF5ElTnw9t3qmSMjGZQiV9Abw0
         W+sg0WyjLjo52QsodVoavRSMovwLP6uEPGRKoQuIZqPMahNjUp/XU0gEN24Ksjh4T0/L
         F71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749761544; x=1750366344;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGjiIKy/Z2ixr8Sa9PIaWOc1c2xrxyIl29h5Evz7avs=;
        b=V1m+9wd+Uldl1Q03D+FigFxTejM/mVNskUWmCGRsckbaLykQHgFiq92zlNqrviZAdx
         VMM6kGQB3sjK8pS+7JIMO2uN1/h2MfCZNtZYfC5EhFyYxpVjr92NZ5bsjVs4bV44efYH
         B3IM6q2qGhL4KaqMWyNKXen0aCmzTyVvu9Yp8l1WgU+N9ARaWM41y4TdTCIxxAnEoPK9
         4cy5TdTT78kcfkQQgo4/5nQ1tVF6+MmJTMBboxDuv4sXCmGXu+/JN4EoBXBPDN7w858N
         S8SK7Smk9aooZKvRZFR0v1yvTISoe12vJrCgPj2Mq+3j2QWf0Xa9tE1TBSwzY7TBGb3X
         42qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZBp0GB+MDpCTGjtQxSwBT6ACuCi4mS+jd8/6SJqy/8RV+LxwxxbPK4ZROQZYKW+RlsE9gvfHCTG14qdnPEaL8vA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4T2e+RSO2dTq12TVLwHB3LzVF1K9RWlp8wLPYqNow0gUXdKlH
	suPM2ltOIB9o7oZFvtkwD97FKPk66ylsLD+BbLs81N1gnoj1NT5/7XJj
X-Gm-Gg: ASbGncsXfy4lH/5L380uifhkB8Vuf9VT5KvaQlzBE61bX9CkpV62NokVU0RcJQ3Oo5E
	ya5FBsrp4OOwddPbzvu2RaCO7sDEk/cSxCnVBf8Cj1dGhqqiOXWD+9TksdjQ52cUcJ0r9dZZ+CA
	p/B0+ib9vh2zJ/JWOzlF/l0SMp0qEMUoiMD7e1TIzK8cibn82C24ki19Z+VGPsry76zL+ZPUAmh
	l42Js2eSsiJ7cmpsDjkqO38svW/965bsNUggHAr+7XzddjjWAugxGzvtEBu5MZCm5kLmxZQrXWF
	hLLEx/JocqphLX7woxfASdbhy69ZS/RvTK/u7KmOnovvuGXLSDGU+68x9LTbDU2FqHurhh+J2eB
	XdOZg0SE6kkYnxg==
X-Google-Smtp-Source: AGHT+IE51NFCGc3HboixFy+zJLJKXFWkuksijUP35NKuOq+oSZbSlA6ZQm+FUKWMIGxBzHPgswifhQ==
X-Received: by 2002:a05:622a:90d:b0:494:993d:ec2f with SMTP id d75a77b69052e-4a72fe91774mr9758911cf.12.1749761543838;
        Thu, 12 Jun 2025 13:52:23 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a50f1d1sm8173271cf.74.2025.06.12.13.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:52:22 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:52:20 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: anibal@limonsoftware.com
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] wic: plugins source bootimage/isoimage
 rename to have valid indentifier
Message-ID: <20250612205220.GA11395@localhost>
References: <20250611153319.54778-1-anibal@limonsoftware.com>
 <20250611153319.54778-3-anibal@limonsoftware.com>
 <CAOU5ZMs1DZM-3-h=_5-9m7nqFuU7i4VwH6ZcbzAwD2uByNt3=w@mail.gmail.com>
 <BB304894-22E7-438B-A97A-C689712E1473@arm.com>
 <CAOU5ZMvJMc8HvB-dD43nJsixHEi4iQWWRuKEwu9u-tUd4K_KeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOU5ZMvJMc8HvB-dD43nJsixHEi4iQWWRuKEwu9u-tUd4K_KeA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218536

On Thu 2025-06-12 @ 09:21:12 AM, Anibal Limon via lists.openembedded.org wrote:
> On Thu, Jun 12, 2025 at 9:02 AM Ross Burton <Ross.Burton@arm.com> wrote:
> 
> > On 12 Jun 2025, at 00:36, Anibal Limon <anibal@limonsoftware.com> wrote:
> > > This patch is the previous one, only sent to note is part of the series
> > and can
> > > be integrated later after layers fix plugin filenames.
> >
> > We don’t need to make everyone change their wic files though:
> >
> > 1) change wic to warn if the plugins have invalid filenames
> > 2) rename plugins to be valid
> > 3) when parsing wic files, transform the plugin name  with s/-/_.  This
> > means we don’t need to alter any existing wic files.
> >
> > You have 1 and 2 already. 3 is a quick .replace() call.
> 
> 
> Yeah ack, we do not need 3 at this stage only give time to fix later.

I assume this patch is referring to (roughly):
https://packaging.python.org/en/latest/discussions/distribution-package-vs-import-package/#how-do-distribution-package-names-and-import-package-names-compare
?

The name normalization section provides an example:
https://packaging.python.org/en/latest/specifications/name-normalization/#name-normalization

