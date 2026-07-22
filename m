Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051B4C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:31:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43348.1784709092522107700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GYahOYk7;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49546c690ffso38645115e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784709091; x=1785313891; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6qiovBbes5XZdSMx5rcGvIhQvcjahZCSDuK6I6BbT8=;
        b=GYahOYk7x75TWRrkCgU5xUSVyPcHmMUzruBuoWyjIRe/gEuurHw3IikC/wEBLI7R02
         QjbwWUjAI3baDQsFFzIvBdJQ0PPJAEAhZv6WYGtuz5S0Zjz/wWkD/HPPYQy2zzVD/Q1Z
         HubshnWivlFD7ZNu30IRFAFwGHHN68nyMB9u2uBoFw5oGTQDTCZoQtFtinz4ySKg9v5E
         JbuGa0MioYnhFkXwg8UQlXmozDRjD7vdq6bLZz5RCJVtZv6Y3VnyFkuBc+b4ho/Rc4ln
         Nsqu3mmq6HeEgHbvnVLDecnUmWKiP+DdA02wCC4l0SIVa32YwlXoF8zBkbWuVg28R+JR
         NOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709091; x=1785313891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6qiovBbes5XZdSMx5rcGvIhQvcjahZCSDuK6I6BbT8=;
        b=QVHuODnEihpv2VcFk+yVyjolcOBnwrela4sPqSu9u8K9GaoDeXUakYWpEv/fOpooVs
         KKz5vsU1yJAY9Uy1THHW+j2jU4HrILHT1acs9r5EwLb3Nb2mimFvZ83G4SHF3eLml2uy
         d1iVVXSGr81gzIgd2PKqbM5+kQxR5x/kiimU5TwN9WqxiurWeHFcYD6gxo8ixsvRwfcN
         6zvgwiOCX8l10cotYllhBP76e6hhVFStwZ750arhoj2Fak/HPFC5l/nlCTrP2wn5lwOY
         fqz+ZWcUlx55vcZNfT5XpeyDNDbTqcK9LRL0Vc7v/unRMvfC7oAmoquiTWMYhhOrQ4B6
         lH6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqUfryTvzAo2h1Iytvx1yvQ3UmRT7CSX245oVem7E5iWF/bUdouAe3f1zpiMtX5p4SWBymj+rXP7lw6luAqE/81LA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4nkRs0HQ61LfftdnFeOoouLR63toC9FD/H9MY0lGhhJeEFMc5
	+DaYbv/W7mAWxW5gFstb6Svf8v7WXUhcyXVKivzyCWlGrKQ4fS2Qa+uL
X-Gm-Gg: AR+sD11qkNfKmbowZ0ZYzZ0r1shtef8anC+bQgG7XfV08iFbSf3nBkXKBmDdS/8JG/C
	GackXwYWPn2kZIEhI/05y0AKHDwjiYN40IFntG1k6oLrM4QUTanzcnCtf0QiQVGjmpHrJNhVPnr
	VzBJEO7yfu95SWKgkR38N44DiTFo49TMZEGZx5RdBHDCXf8s+Rib++BL2dpTlXuUvU+pqacT7P2
	6lzQaJVO926blJSb7l7H7xzXjLdGci3ObjRvJaBz1IS8Du2HQl+sXoBx5DBishQrz7PRKKWe1Aq
	tymtdlX3x7okdKge6PDSeFYIlTqcpHcEZFX8rQKP+b3DG6cJMrMOuqzbi/kmvqrQvwJZyTLo/pA
	6F4YRcXa+rNxAmda480ZcNojKtj5aoTSApQD/j7PSZYZVKdYH+2Pdfpbi20WvN31RsfPYFIO+7/
	/qAgWU4XoS77JmjYfCYbg=
X-Received: by 2002:a05:600c:4743:b0:495:406c:81d5 with SMTP id 5b1f17b1804b1-4954a50b8b8mr239350515e9.28.1784709051626;
        Wed, 22 Jul 2026 01:30:51 -0700 (PDT)
Received: from [10.43.60.203] ([185.94.190.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b01a758sm43421785e9.4.2026.07.22.01.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:30:49 -0700 (PDT)
Message-ID: <8b558fbf-4f10-4cff-b181-8c60b8d68a1c@gmail.com>
Date: Wed, 22 Jul 2026 10:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta][PATCH v3 1/3] go-vendor.bbclass: Fix test file
 exclusion and license propagation
To: john.ripple@keysight.com, openembedded-core@lists.openembedded.org
References: <20260717213253.3454786-1-john.ripple@keysight.com>
 <20260717213253.3454786-2-john.ripple@keysight.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260717213253.3454786-2-john.ripple@keysight.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241627

Hi John,
Thanks for your contribution.

Let me know if any changes are needed in the test repository as well.

Slava

On 17.07.2026 23:32, John Ripple via lists.openembedded.org wrote:
> Two bugs in do_go_vendor:
>
> 1. The shutil.ignore_patterns glob was "*._test.go" (with an extra dot),
>     which never matches standard Go test files (*_test.go). Remove the
>     extra dot.
>
> 2. The license-propagation block used os.path.join(src, "LICENSE") as the
>     copy destination, writing into the already-processed vendor.fetch source
>     tree rather than into the vendor destination directory.  Switch to
>     os.path.join(dst, "LICENSE") so the LICENSE lands in vendor/ where go
>     tools and licence scanners expect it.  Also fix the guard condition from
>     not os.path.exists(subdir) (checking an unrelated relative name) to
>     not os.path.exists(subdirLicense) (checking the actual target).
>
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---
>   meta/classes/go-vendor.bbclass | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
> index e879d629a8..85a3c1b586 100644
> --- a/meta/classes/go-vendor.bbclass
> +++ b/meta/classes/go-vendor.bbclass
> @@ -141,7 +141,7 @@ python do_go_vendor() {
>           shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True, \
>               ignore=shutil.ignore_patterns(".git", \
>                                               "vendor", \
> -                                            "*._test.go"))
> +                                            "*_test.go"))
>   
>           # If the root directory has a LICENSE file but not the subdir
>           # we copy the root license to the sub module since the license
> @@ -149,9 +149,9 @@ python do_go_vendor() {
>           # see https://go.dev/ref/mod#vcs-license
>           if subdir:
>               rootdirLicese = os.path.join(rootdir, "LICENSE")
> -            subdirLicense = os.path.join(src, "LICENSE")
> +            subdirLicense = os.path.join(dst, "LICENSE")
>   
> -            if not os.path.exists(subdir) and \
> +            if not os.path.exists(subdirLicense) and \
>                   os.path.exists(rootdirLicese):
>                   shutil.copy2(rootdirLicese, subdirLicense)
>   
>


