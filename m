Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D8BCD5BDE
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 05:57:13 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13884.1779861429208313724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 22:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QpUVRvx3;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45edc09f51bso138339f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779861427; x=1780466227; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPYf6wLquTYdXrnang7mIfbE6Ti4ESwVHsL+UDFwsaE=;
        b=QpUVRvx3QOe1/gaeJ/yl7cTv3wri9OnnZ+hB5UFfzBSh0cuxmadzO1oQXNAmB+0XR1
         RuBTl+YDwA7ZkUjOxq2uFC70D1DfDKG02ZiGawNYzQ5qs1eXYYpYDthj55lVNSnIHxMC
         qwMO+0pjLcQUQWm5TmNb/8lq0Ubi1TMacNdN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861427; x=1780466227;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPYf6wLquTYdXrnang7mIfbE6Ti4ESwVHsL+UDFwsaE=;
        b=p6M8VuhuwDop2JwH7FZomYAznt6Otj1xpP0FdaqBWBZkrwh06bd3xhodYgpOdo92TH
         2DT5AxhMC2/scNRXyuX0s0+aDBzHys+1w/YkQ5vNMe9wv6xBA10v3sMNkWJGakNUPfXS
         FhzMQsSfbVCMNVI3bbcGoGk1VPDKlAfdkY0+uIMFA3+Bl4TAe6mITAaT+oSbWc0zgqJ2
         RjNubVQVgyHu/Mr13SpMLq/xI5MZtTfGIaJPWjhbFyab949SS+8TFbasgO6nwUn062j5
         +qJPwcdArAn0+BiLN8mKD/WaKpXRZ/AKPVFzwb/75niahNzSzEdrd86x9GI6mlkXnGut
         Y8Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/yOq76HPnycOIqx0iDs1QSJGwdrpbFCNfhZx3r0NtT7TtOKpvvUvggARw9ifjWRX3dzVAIV0cyHVcQ3O7A+vpNkg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgDqBhfdGD4mq5EANHEwQa+akkrZkEaX75rAqB6fiEPoViNvf9
	huex20LR0YhUkMst0ChY5RDE9XfIMmxBDoA+8c1oPZ5fs0W9m7Qy+WgpYAkTdu8dhkE=
X-Gm-Gg: Acq92OEuKnL5tVt5xQfh3Tl+8vzET3krpubgdW31+7hLERxmf48P7v7QzcD8uo71ifA
	HL0wXfmqdMxi23oe8SMj6OD5Sd7FOp1DSgPl098FY0xnPyl5aqXlodr2D7S4Wss3LvpCAIo5v/o
	ZfxqT16MRDc+OmrW3mTlIR5ktA9X6d2xg7KiUY4YkkVP2q3q7wZyyUnnc67b5daQUIfQG/ZLlY3
	n84icwVJICgr5NOeAOcGPQRpy3vqgCotNQ74tAaChb7WvV4eboPYtBQn2G6w0rYu4MDwXROBgQJ
	VfD22gIkmLXQjCGIT42BqA4cQ6cSB35WCMIF8mQUjxJ/zwyacuwkunA8FtRSqFEogleu3umWxC0
	TqIJ+lL9RLHaO09THFmOklFt9v56GXTBVC3S/dF9q1PxHIn6WzFasJZcP3m27h6UrHOtB1qoxWX
	SjjU9Xny2ELc4K8WT7KM7fBsw/ZaJDIEbfCn0DJYZLEV6XSERjVflKfGsMvd8346aZ2snezdc9u
	YGh1WtX3xt0
X-Received: by 2002:a05:6000:1ac7:b0:43d:67d1:2022 with SMTP id ffacd0b85a97d-45eb36890ccmr37974964f8f.19.1779861427425;
        Tue, 26 May 2026 22:57:07 -0700 (PDT)
Received: from localhost (2a02-8440-2508-6193-ca54-7de6-0c29-9a85.rev.sfr.net. [2a02:8440:2508:6193:ca54:7de6:c29:9a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b2a2asm3710338f8f.28.2026.05.26.22.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 22:57:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 07:57:06 +0200
Message-Id: <DIT87V9GV9SJ.2MPLHA1PVBZTY@smile.fr>
Subject: Re: [OE-core][PATCH][walnascar] cve-update-nvd2-native:
 re-introduce CVE_SOCKET_TIMEOUT to bound urlopen()
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Ross Burton" <ross.burton@arm.com>, "Steve Sakoman"
 <steve@sakoman.com>, "Peter Marko" <peter.marko@siemens.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
To: <mehmet.fide@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260526080554.674948-1-mehmet.fide@gmail.com>
In-Reply-To: <20260526080554.674948-1-mehmet.fide@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 05:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237628

On Tue May 26, 2026 at 10:05 AM CEST, Mehmet Fide via lists.openembedded.or=
g wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The fetch task calls urllib.request.urlopen() with no timeout argument, s=
o
> when an NVD endpoint accepts the TCP connection but stops sending data,
> the call blocks forever and the existing retry loop driven by
> CVE_DB_UPDATE_ATTEMPTS never gets a chance to run. We observed worker
> processes wedged for over an hour on a single recv() syscall before the
> build was killed manually.
>
> Re-introduce the CVE_SOCKET_TIMEOUT variable (removed in commit
> d6d94eed1e "cve-update-nvd2-native: remove unused variable
> CVE_SOCKET_TIMEOUT" as it was a leftover from the JSON 1.1 feed) and
> plumb it through update_db_file() and nvd_request_next() so it is
> actually honoured by urlopen(). The default of 60 seconds matches the
> prior historical default; users behind slow proxies may raise it.
>
> With the timeout in place, a stalled NVD endpoint produces a clean
> exception, the retry loop runs, and after CVE_DB_UPDATE_ATTEMPTS
> failures the task returns False and the build falls back to the
> previously cached database (bb.warn, not a hard error).
>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hello,

Walnascar is EOL so we can't really take this patch, sorry.

That said, given the recent NVD API glitches, it does look desirable on
the last supported stable using the NVD API: scarthgap. Can you please
rebase & send your patch there?

Thanks!

> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
> index 32a14a932b..271679b7bd 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -34,6 +34,12 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>  # Number of attempts for each http query to nvd server before giving up
>  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
> =20
> +# Per-request socket timeout (seconds) for HTTP queries to the NVD serve=
r.
> +# Without this, urllib uses the global default (None) and a stalled conn=
ection
> +# can block the do_fetch task indefinitely, preventing the retry loop dr=
iven
> +# by CVE_DB_UPDATE_ATTEMPTS from ever running.
> +CVE_SOCKET_TIMEOUT ?=3D "60"
> +
>  CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENA=
ME}"
>  CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
>  CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
> @@ -134,7 +140,7 @@ def cleanup_db_download(db_file, db_tmp_file):
>  def nvd_request_wait(attempt, min_wait):
>      return min ( ( (2 * attempt) + min_wait ) , 30)
> =20
> -def nvd_request_next(url, attempts, api_key, args, min_wait):
> +def nvd_request_next(url, attempts, api_key, args, min_wait, timeout):
>      """
>      Request next part of the NVD database
>      NVD API documentation: https://nvd.nist.gov/developers/vulnerabiliti=
es
> @@ -153,7 +159,7 @@ def nvd_request_next(url, attempts, api_key, args, mi=
n_wait):
> =20
>      for attempt in range(attempts):
>          try:
> -            r =3D urllib.request.urlopen(request)
> +            r =3D urllib.request.urlopen(request, timeout=3Dtimeout)
> =20
>              if (r.headers['content-encoding'] =3D=3D 'gzip'):
>                  buf =3D r.read()
> @@ -216,6 +222,7 @@ def update_db_file(db_tmp_file, d, database_time):
>          url =3D d.getVar("NVDCVE_URL")
>          api_key =3D d.getVar("NVDCVE_API_KEY") or None
>          attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
> +        timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
> =20
>          # Recommended by NVD
>          wait_time =3D 6
> @@ -224,7 +231,7 @@ def update_db_file(db_tmp_file, d, database_time):
> =20
>          while True:
>              req_args['startIndex'] =3D index
> -            raw_data =3D nvd_request_next(url, attempts, api_key, req_ar=
gs, wait_time)
> +            raw_data =3D nvd_request_next(url, attempts, api_key, req_ar=
gs, wait_time, timeout)
>              if raw_data is None:
>                  # We haven't managed to download data
>                  return False


--=20
Yoann Congal
Smile ECS


