Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9E5C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 10:15:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3231.1787912110066040317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 03:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TSfFVCQ9;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fd66a094eso295773f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787912108; x=1788516908; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqMg2WDA6tK7e9FRUYhtvjIRGlykKBodwFn8fziO3fA=;
        b=TSfFVCQ9LAzT+KSjs27q03lw+QJHhg1XzIG+4mEzTki+iLeFVGNzqR1lfyn4I37fRT
         1UCuaQXOQWNgjQpJU1wGTTmfh97z2aQJBIBbDQKjdT2Cz2wTKpVpsYAzmao05MbITDyw
         ZDJXxQkwPXmaUstHxLZXppI3daJste5Ur0th8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912108; x=1788516908;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqMg2WDA6tK7e9FRUYhtvjIRGlykKBodwFn8fziO3fA=;
        b=aDB78mbzL3MQ4dIsdIAMg/KynlC1T+h+x7CRJzxmgMo81+3tfn8OgyLi0zYsgjPkwM
         UdNJgL46IXd0F6PwM95qZB22o7WECO19npTQ9+Ri+EjM7Sq+wRbfGxQV0Tefwe1AYWEr
         ErN7mRumEEF7eiwcpGR4q+JZvFAQmQ//fadqGCnGG0JyNs8AuyoIXsY5UZvsDOGf01TX
         APnBOd4/AwM3oSxSa5yfgMrYJQl3jXnXrfqDUuQNxatYQFv4kCbzqUuOzSHeafJvMqrf
         P97O9OFqyC3o1FFVRz40nGc91lWEQsa9bpX587gJuwPSBRXIMJKxj6+FWFuZfhG6qmGt
         ha3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpeXnqMhYSbFafJCdB/z23LLe6F7o6nFLJtCMqdl0YlU0RD5XSULDIW9S+eEjtqfhErD7SNOUBd0HGjALJCUM3xBg==@lists.openembedded.org
X-Gm-Message-State: AFuF++n5+ZE7NPpfhTG3RpmAd5nPyHBpPHmj1PLloM0bRJKkmeSjKlne
	W7R28jxijKR4qMb7SQby/3Ir6u3MmK+Jcok7NOJK/Qa5dEIhF495/0RyAOPdri8nAeM=
X-Gm-Gg: AR+sD10ucdabTPbtStC0Re+95INIvfzQ3G+XMG4oAgoKZFtMfpQgZng+ej8kB1tT8AG
	NmdOOH3503YE8ioQn51OrEosSiEun23vcgOPPolKj8VNiS2NaL6On1aaJjmwBXcSshnp2X3lP1p
	oLuzrmc+uYXyOwPGJKb0QdW7QCLdMqTXr1OdnewCGO1sbOozZmNqBlnOxCH6iqrFMGYw3OgC5Di
	ALiAQHdBscsKXScV2n6LEDAkuvHld2K8KbIHNK0qfdqAazO+0mQ/wn6VybHuNgRoMa8vfQUypCH
	Pduir4PKSoe+7uycLKCEliMx/ycqkccc86UZkEH4VHV7I7v+cHtyLAl3hY00wZIs6sX2TCNdMfh
	h1BTk869aJXRGxNsvGB8FXeskW1vUS5Fq+FHd+JnOoUqcA0iRZcvVUnzje/K/6sqaU+63f2hwzz
	P3Z9pd1cgEoAtV8W/m56Bn7wrQcvZ74VT/flmajqR1bYEh+Az5ZSpKwt0SnxFV+d379UTprTQsM
	cmwmZtqsNhBej2MCSg9IlReH4euppuvAlFp1zMnhBqISMB6HPhh
X-Received: by 2002:a05:600c:a47:b0:499:be9e:49c8 with SMTP id 5b1f17b1804b1-49b91c50957mr68418845e9.13.1787912107914;
        Fri, 28 Aug 2026 03:15:07 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm41182425e9.9.2026.08.28.03.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:15:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 12:15:06 +0200
Message-Id: <DL0HY2YT9WGM.3ACOQJL408XKI@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 05/15] rsync: upgrade 3.4.1 -> 3.4.2
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260803220157.1520377-1-peter.marko@siemens.com>
 <20260803220157.1520377-5-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-5-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 10:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244529

On Tue Aug 4, 2026 at 12:01 AM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Drop backported CVE patch included in this release.
>
> Parts of the prototypes patch were fixed upstream (in zlib) but some sect=
ions
> were not, drop the merged sections of the patch.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (From OE-Core rev: 7ae818a6c3635bff7701c339174b6d281a507462)
>

Hello,

> Release notes:
> * https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
This URL does not match the upgrade (3.4.2 vs 3.4.3).

> * packaging: remove old release system
> * runtests.py: error early when test helper programs are missing
> * ci: add OpenBSD and NetBSD build jobs
> * testsuite/xattrs: ignore SUNWattr_* in the Solaris xls helper
> * use openat2 RESOLVE_BENEATH for secure_relative_open when available
>   (this is a regression fix)
> * Start 3.4.3dev going.
> * testsuite: run protected-regular test as non-root using unshare
> * ci: add Ubuntu 22.04 and AlmaLinux 8 workflows for backporting
> * combined security fixes for 3.4.3 release
>   * https://www.cve.org/CVERecord?id=3DCVE-2026-43617
>   * https://www.cve.org/CVERecord?id=3DCVE-2026-43618
>   * https://www.cve.org/CVERecord?id=3DCVE-2026-43619
>   * https://www.cve.org/CVERecord?id=3DCVE-2026-43620
>   * https://www.cve.org/CVERecord?id=3DCVE-2026-45232
>   * https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...-prototypes-to-function-declarations.patch | 68 +++----------------
>  .../rsync/files/CVE-2025-10158.patch          | 36 ----------
>  .../rsync/files/determism.patch               |  4 +-
>  .../rsync/files/makefile-no-rebuild.patch     |  6 +-
>  .../rsync/{rsync_3.4.1.bb =3D> rsync_3.4.2.bb}  |  3 +-
>  5 files changed, 16 insertions(+), 101 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patc=
h
>  rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb =3D> rsync_3.4.2.bb} =
(95%)

Also, this upgrade contains some feature changes:
* feat: add threads to zstd compression by @eshaz in #424
* rsync: Add missing dirs long option by @nebkat in #826

I'll hold the rsync upgrades for now and review the rest of the series.

FYI, a previous attemps at fixing these rsync CVEs was ultimately
rejected:
https://lore.kernel.org/all/DKXW8UOQZO4F.2HWCHAX1B3QG5@smile.fr/

There was the idea of using the "v3.4.1-sec-patches1" from the project
but I don't remember if that was tried or not:
https://github.com/RsyncProject/rsync/releases/tag/v3.4.1-sec-patches1

Regards,
--=20
Yoann Congal
Smile ECS


