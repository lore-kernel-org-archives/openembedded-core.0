Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.7688.1611316377733076699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 03:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=QXQEr/qm;
 spf=pass (domain: burtonini.com, ip: 209.85.208.171, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f171.google.com with SMTP id p13so6220451ljg.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 03:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qErB00OvZnT0akqb51Dkt8O/SynOOp6LJEav4uTu5ls=;
        b=QXQEr/qmTKKsy379sdgL7LnxJNaBA1EqG2tUcWKjD6HCPFf7N42I5rhSI4DWQc2mTz
         BmYF7IeInG3WMZdDGsU4YKLGozelj077xhlDu6rBEcbCDX2gJAepplRIENJdxu6X55FC
         E8PtBmJExVKJ7eyK8ZZeuJJo1Ri2ohwtPRqmk4tIOEBLewpb6P5JnKOmrF2e6zZuqMHp
         Pw6daijVnYbH7EQ7/I/2TXhJkM+RqMuC5TpBTdmumt0y8kqfJwoi5UFOZbxCQb3ZPLor
         EDk08Fqcnaryngzh73IyWwkeFBqQVxW/Nz6ee741aUmIR4IqDUCKjg7nkicHKwqPJvoa
         mHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qErB00OvZnT0akqb51Dkt8O/SynOOp6LJEav4uTu5ls=;
        b=OkQ17whnvQ/lJpctet6l9TsXwFzoRorUSBWNDaFs79xaXF035Rn3cCFrKxJctBe4Wn
         29azNU4ILzjRZTm2I3ulmO8f9KPAdWowk+WYMqCFna4CDI7OBumG5pne2iF1QzHuqUi3
         OJwi9UGwVcDHyeaX9PfSzPdIjcN+7T8Evb3tswFVa0k+RRZ4cKRIxEWpsXC6rKkVE5G4
         FCUN9G5QLk+Yl2S/mTGUmYCGoHFMtDsNRVE53zQYWTjQ/A4tFZrYS43z0cX1HZpSrvXk
         RAO+vQ00me3f0yyxV5oD3C+ENEaFdTH76/NLD2s292F+OPpJAVw14ojnCZnqr3COB1pv
         pxeA==
X-Gm-Message-State: AOAM533Jz5YNOgZ63qfMeI/Z//JXr6396dXax8TplPtBk5C4GYqMm/+z
	7Rm5Qp/vx6ztIj6HW3MoxMU7X7xt/sdMTtJni1Pxvg==
X-Google-Smtp-Source: ABdhPJxRJAV6ayJHga4tzXXumaAK2TStyt/2Ty59PrZyJLyX5FhDyZpAPlmfcGNXM3MKyAmuCQ2HCyRnQlXR7MLYcas=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr1156602lja.24.1611316375882;
 Fri, 22 Jan 2021 03:52:55 -0800 (PST)
MIME-Version: 1.0
References: <20210122100719.38378-1-chee.yang.lee@intel.com>
In-Reply-To: <20210122100719.38378-1-chee.yang.lee@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 22 Jan 2021 11:52:44 +0000
Message-ID: <CAAnfSTtR7VVDZmhqkvA7FHrQ4rk1H4ce7cWEio9es4hjr1s1nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: replace Looseversion with custom version class
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Jan 2021 at 10:07, Lee Chee Yang <chee.yang.lee@intel.com> wrote:
> +    def __le__(self, other):
> +        if not isinstance(other, Version):
> +            return NotImplemented
> +        return self._key <= other._key
> +
> +    def __lt__(self, other):
> +        if not isinstance(other, Version):
> +            return NotImplemented
> +        return self._key < other._key
> +
> +    def __ge__(self, other):
> +        if not isinstance(other, Version):
> +            return NotImplemented
> +        return self._key >= other._key
> +
> +    def __gt__(self, other):
> +        if not isinstance(other, Version):
> +            return NotImplemented
> +        return self._key > other._key

You might want to look at the total_ordering decorator to make this a
lot less code:

https://docs.python.org/3/library/functools.html#functools.total_ordering

Great to see a test case though!

Ross
