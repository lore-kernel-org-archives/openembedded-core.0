Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8488D7F00D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 00:48:45 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id t8so24622253qkt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 17:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OPvHW5tqb3jARqnupBbSeXkczcfT+5aZejw0ZBtJQ8A=;
	b=TrVuz4B63SE16X7fQzSRMXngxS81Ov/lGGEvbTlplzO22djzTBkgVkCHYIjbuRjPyF
	ldgpuq4Ge7ibRwUFGfaQdaBc3DxNl+4ywusLLKFQxV0NWcbxARm1oLNzG95tPbu6fPXv
	9azHh2ESF3EBBnhaJZB2eFnQsDb646OboZ9qdW/ujyydwiz+ppJR6V6O89FsHNwNY3eo
	VpUMsebR3cwssboppsXfQsEmUiyx/SLCbyEtv6DVllbHhhiECy2g2oUvN2G4rzK/j11u
	vxrKyeFquM3TcxFpGCpBJFlg2DlRx4hWdIl/qf5gdLzpoPaE6TdWKp07cxEKROdq1LWz
	jU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OPvHW5tqb3jARqnupBbSeXkczcfT+5aZejw0ZBtJQ8A=;
	b=Gkv+mPmlqe6/ZHzqwmrAMjtjac+7bof1rhVs5y4CgTyz77yZ/EkZl9T1GvQaYqJNHQ
	JNmC3Pl9PJVIm3fM4+wqqbhPXSZGMvt0sffXGguQoHqv23Ozwqe3obkErJkHUSy2pMGH
	C3BO9zGSNcDiThuT7gbEvnGb+OT1QhFwkBVWjcw2/z/vn0/DO+4DwGEY0l1v5hLy7Ilj
	4WhqGRf7vkGzAt6rqIi0ZmozomWAPdsoQvDZWdZvCzH8BNBmtnmT49kXfAUOQUqw4Vt3
	BY93J0NxiwkrG6m+iO/H40r6927Mm+fDatird9BMWNOcZcSj+i7mDlV+pnIXOqbGm+r1
	cyTg==
X-Gm-Message-State: APjAAAUKG6tPN0LWqJ8aOVOnniBTN3nKdJVHsDnrC+Er6ykGoYIDDtdV
	LPPMed3aIpC0ndOI5/AUfX0O6OapVh956IsLNi6ikdqd
X-Google-Smtp-Source: APXvYqz1fpYXVhaX74cDb0z9zwX+eY9aoVrmpltz9pQi/FGB9LKzy3nvAzE+IyY+ZE8J9nwcuIu3QuIV6SqygWv/+qE=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr37405326qke.212.1563583725865;
	Fri, 19 Jul 2019 17:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190719201958.19700-1-ross.burton@intel.com>
In-Reply-To: <20190719201958.19700-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Jul 2019 17:48:29 -0700
Message-ID: <CAMKF1srXVcvcM+yPEzKoFj7=LqxfvbZbMHgmCArdurSwGsbmHQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ffmpeg: don't use hardcoded lookup tables
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
X-List-Received-Date: Sat, 20 Jul 2019 00:48:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 19, 2019 at 1:20 PM Ross Burton <ross.burton@intel.com> wrote:
>
> ffmpeg can generate lookup tables at build time instead of runtime, but this is
> no longer a recommended option.  The size impact is significant (12% of the
> total libavcodec size, nearly 2MB), the runtime impact of dynamic tables isn't
> too costly, and only a few codecs actually use the pre-generated tables (MP3,
> notably).

I think it will be good to understand the performance impact with some
low end non-x86 device
as for now, it will be better to turn this into a packageconfig knob
instead of just removing the
option

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
> index 147388d9b7c..6d230c33169 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
> @@ -106,7 +106,6 @@ EXTRA_OECONF = " \
>      --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
>      --extra-ldflags="${TARGET_LDFLAGS}" \
>      --sysroot="${STAGING_DIR_TARGET}" \
> -    --enable-hardcoded-tables \
>      ${EXTRA_FFCONF} \
>      --libdir=${libdir} \
>      --shlibdir=${libdir} \
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

