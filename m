Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83238D41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 09:46:43 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44810.1765791998541010828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 01:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QCzqsp5C;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a3d2f3299so2573566d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791997; x=1766396797; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/PqyeQ1ITLIWtjpwac6RlA+29G1xq0zrSIbkCYKOCUE=;
        b=QCzqsp5CSB9QfhBUr7Oj7Ebbm/9sYP7Uwa2v0Dva2TUe8igqCSUbOi/Av+y863wlxC
         HlE1nK6Stk8edu2CTa/m5GHs5aebigs5YsdtVruwbec4xS4uqL7kHV2QSM2VPPUkd7pt
         goGy1apL+mUQof7TquTZW1uR/MWaDenLixS0q3+NK02oMN29qn1HFOmNU41B3kk0RJt8
         oyoaSbVWketPBe91dpfGQ+/4AhGBw78Vk2tK6dIo/5xFNvlsvjsERPln0+i4L/TTUZ0T
         wfONvPRhKEGw24IYAgM2Cga0kzDRE6hMeBBx1A6F0/qfIE5A3eHV6QLXS3vi1CODfV4u
         XgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791997; x=1766396797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PqyeQ1ITLIWtjpwac6RlA+29G1xq0zrSIbkCYKOCUE=;
        b=ibyBiydolMK0E7zZb8aIKTPBBy6TMEJL0w6wbD8iw3vm7nOXcAZv8HkFE8HGlklolT
         LFNu1Z5pJM5gKVEGdIc6GRSB+Fs0Y2KJ4+NWY2Hcw78TXWAU6V5wfu+WsH8wRGUWvnv3
         dB3Gv6hlZfaHDjEkep8/NC75NUxtX8b8NMKhp5vJdRuKLKzxBgHmK1Lg9SBziAMYn0K9
         /WgBiS8/N9FRLXH1sV6EZOSJhQhNVLVEvso6eRMYJIchcJgwoBmYkNvSGjwZLF4c8f3c
         NP2nTeEsqUEA2j8B4s7RA+VwDCirE6l/r3zmyVhzk9DblOqkePzc9NNTLa/mwN3rLgXd
         98Hw==
X-Gm-Message-State: AOJu0YyMnuqRwaJQIWtJ1AtAbZoaTUzBmODmxsN1sfds6xx45+q78HUm
	WyP82UC/ftk018S769v7enVtT4zvZ5SAYW0RG018+wFsUHxS8uj17C70cZe+why3nB3eLHymUtk
	Y9x+c5d3e7qk5xNkEgvcup5UBUUC6hnM=
X-Gm-Gg: AY/fxX5zHhLAzw4iDYvs39G0PyfJHM78NX0QjQgtcaksrriNiBesqNsoUXBv06tb9BE
	SMMmNz/qNTcxsnWaCXMA8eKNd39+Fk+1GggJSiv/SmbofCflUutlWHKux9nMcZHaMDZy7pGqy3b
	/VGmeVBxNzLY/NiSeVGTmvdzHXcsjPCa5zyCczZ0M8YCyY6nb9+LVUvwKD8DLDc6UwlqCCpO9Qu
	w0SNl2ptZ1dA+gL3JpXtN2Xs5LXMjFGk2WLz1Ej408h44Ap3LIj2eBjQXvMW4fd0OzCgFulOYCb
	YBDXAm5uRiKPzAVncxEHsF2aozgeaQ==
X-Google-Smtp-Source: AGHT+IH3rBYu0cZ6fcJoQP6aMcgc2HpKe4G3AUNH4Aj8BETH9OYvtyDu5ase0Yeeh3pB7OWlMcqCVlBP037ycH9fKtY=
X-Received: by 2002:a05:6214:da3:b0:882:4f53:ed3d with SMTP id
 6a1803df08f44-888801a0ddcmr144873276d6.36.1765791997350; Mon, 15 Dec 2025
 01:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com> <20251213031200.2619204-4-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251213031200.2619204-4-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Dec 2025 10:46:25 +0100
X-Gm-Features: AQt7F2rPbcaN0cKClJa_ZfBglX0MPsKLjebwHheniqR-TJWBog4LlknXEh0Q0Wo
Message-ID: <CANNYZj98r2YKBoL-f+i+H5Y=xfgz-ag_UPsu1treWwA2vMmqNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 4/4] mesa: upgrade 25.2.5 -> 25.3.1
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 09:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227704

On Sat, 13 Dec 2025 at 04:12, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> index 136ed8623bcb..6948abe43952 100644
> --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
> @@ -84,27 +84,6 @@ index 98e49b8fcf0e..145e72597eb9 100644
>
>   dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
>   dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
> -diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen_header.py
> ---- a/src/freedreno/registers/gen_header.py
> -+++ b/src/freedreno/registers/gen_header.py
> -@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
> - """)
> -       maxlen = 0
> -       for filepath in p.xml_files:
> --              maxlen = max(maxlen, len(filepath))
> -+              maxlen = max(maxlen, len(os.path.basename(filepath)))
> -       for filepath in p.xml_files:
> --              pad = " " * (maxlen - len(filepath))
> -+              filename = os.path.basename(filepath)
> -+              pad = " " * (maxlen - len(filename))
> -               filesize = str(os.path.getsize(filepath))
> -               filesize = " " * (7 - len(filesize)) + filesize
> -               filetime = time.ctime(os.path.getmtime(filepath))
> --              print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
> -+              print("- " + filename + pad + " (" + filesize + " bytes, from " + filetime + ")")
> -       if p.copyright_year:
> -               current_year = str(datetime.date.today().year)
> -               print()

This sort of tweak needs a mention in the commit message. Has the
patched file been removed? Has the issue been addressed? Why is only
one part of the patch removed?

Alex

