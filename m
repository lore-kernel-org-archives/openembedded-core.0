Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 152C06B519
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 23:44:22 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id p197so6830303itp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 15:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mbPxLfvrYPyMvegoVorlSogp1Ds4jOJpjom5X6+RW8s=;
	b=BC7v+8/9WjkDDLlZfSJlNZMGe8/MkexMytj4RDaqqxUj9rhhne7Hta5VLToYprVxYz
	NKp97TYKLix+UeYHAjTT/d1HaQoBQmcmrbDv64fyPyU+HbFNOEMI3fPHn57BbP6nQ8Mc
	5E6esOIG+Wvu9JvJpj+DFCS+iCQllJiAli62bM1f4TZVhlPmbdcH93uKcAfe8Kx41qom
	7cUOAohkHSurkymA0e0XTBgpLy18XbCqLb/JFMV0+kGowGlWIPHNcgqjD7y77yPimxr7
	NjIESPXgOaaUUpbnGmJpXYHFw0R+jHwfSwDdIkbaDjELNIlgh+UgIl/r8C+CTxcUMA4e
	5A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mbPxLfvrYPyMvegoVorlSogp1Ds4jOJpjom5X6+RW8s=;
	b=KPegYjkG2A5ZpcKTAAsA77iVSsfegoUmay6a0DZHRqdKvyTUJI2H9JoZZOhqqWk7Wi
	Ktkkdt4HKDqcnwVfYLeDrU58M3ykZ8rrsKHLNXvPrgwAUznLItXR2UWUZfC/7xKWgSa7
	xn1CRpdTQTNk95WOyexhleLFY1DKq0OHYzYbgtyLmY97zqtj0lecx1CUtxd741KLXyWn
	tHlhMl87UMfOij4wwvEBk8H67I4r5iocsC4gV+ToOeUO/lqC9+s5e9rEenU+oPHGMcSN
	fKD2Q4+OfwrhTkQdQNl+0cXNLwJWI7jFv119ii5fV8nNnH3sEl+BnThLW+MMQfCYQURt
	WXEg==
X-Gm-Message-State: AA+aEWYZrSNo59pgf+XPxzHUvfGNP5s2mlPr2yWk143ZsPxQIoAHXDfC
	iEqvckAG+LikCk9/AEueVeDR994579K5RmgZMVUF5+/lEEw=
X-Google-Smtp-Source: AFSGD/WPDY3COx9c1OnYy9XpfD11Bv40m4nU2YjseNfPnnit8YY0kbJHsqnQIJGhZQjQ9t/xLVm/fUZxszSfJo4ZstE=
X-Received: by 2002:a02:57c4:: with SMTP id b65mr17927933jad.79.1545176664116; 
	Tue, 18 Dec 2018 15:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20181218232911.10855-1-richard@nod.at>
In-Reply-To: <20181218232911.10855-1-richard@nod.at>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2018 23:43:55 +0000
Message-ID: <CAJTo0LagVp00--ZNk4vj3_o6HnVJ=2BGS-vycEcb8HeNjn3vMQ@mail.gmail.com>
To: richard@nod.at
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sdk: Fix SDKIMAGE_LINGUAS handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2018 23:44:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Dec 2018 at 23:38, Richard Weinberger <richard@nod.at> wrote:
>                  for lang in linguas.split():
> -                    pm.install("nativesdk-glibc-binary-localedata-%s.utf-8" % lang)
> +                    pm.install(["nativesdk-glibc-binary-localedata-%s.utf-8" % lang])

Or something like
pm.install(("nativesdk-glibc-binary-localedata-%s.utf-8" % lang for
lang in linguas.split()))? Should be faster as we invoke the package
manager once.

Ross

