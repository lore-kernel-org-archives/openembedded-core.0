Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AFDC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:44:51 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.19609.1739886289926603482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MgxGMXZo;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e65a00556aso44417456d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739886289; x=1740491089; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1OXzmxw0AP/VOdxpxoVRuGKj0/K+sIHbP1+GP9QORp0=;
        b=MgxGMXZolArmCJfoLF9yf9BOXX0SYugqJkjI/ebBfI0/qy1mxEAvS2cssCnaAQ2iyb
         OTdxiROGdvuiUq7i4KoVQBNro20Mi7AOmi25k0+p6GFVvkqtReZ5kcOSy7+4gxQWCusA
         Lyg4Sx0O8rZ1nwWIZp3JzQ3hZZUuHcVxVeImN/etSWXzWiFRFlZrmRfdZEK2zhO9iF2e
         zhAw1zHmuqXS/ID6BSafo/bwa9hIhPpyeysn6QhcluDXp6+SQNiCr0KuDcZIA78m77eE
         +OV2KxcqLg1+CPK8VlnL56NLBrpdcPiD0F3BjakQKjLcjVfJhdacs2aV/2yZfGrzjeHF
         uDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886289; x=1740491089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OXzmxw0AP/VOdxpxoVRuGKj0/K+sIHbP1+GP9QORp0=;
        b=fnrdcBwiydxDXpsr6Y5+rMMWSqyez9arlh7a3ZQKINSQ1959tzlAS2rslecYTD23ae
         +/ODqHUIOZ+cMLgM6CZQnF6XJCURHmlYoltItaeLTsbkWF5hb9N9dI6+8rVqq+EiccmJ
         pwnyTfrl76dNWYxjp725YRV3eNv7h0BVgOdqgYoWMM4wPMz7PlLjDwkGewARm6DXc+kV
         yz1/G1UXxr8mPjlBLzFNk6m/uhI/U4bKTbDy5tSl80ShgV3+q1hYqKgo2FerNb0Q7ceg
         iOSfdZoLdEHH5Bo35p4dsSNH1rC37x/oSy1wf5hgn7h1upDyyJ+IJtjhgVeZfRC2PLcN
         4FKg==
X-Gm-Message-State: AOJu0YyTfpgMP2gpTd6FMX8dTxNmSA0OmcBsyyQj4r0FpzIX+J9Osqce
	sDEI7FTeA4fTd+DBa/2jJDPbD8lGp14P/oj/sYr1t2XXCrMkVpMrtX7oJ1RIBM18pZX5LN6JaKX
	v/4D8NjnxQMcQANchc/3Mk/n0GPI=
X-Gm-Gg: ASbGncuuiSJ2yBT2YZygjqulYrzgSVRMQU0zum8aZxZTCXYiWcmB+j68AFbfG4J2W0e
	i0999KEuXPf9PhUnUNA3rBaFatQe5o/vVgqH/p/QnCn4uwPQWw/QcAmkmgFpCtpQZ9m4KQY+kyF
	n1IMOgX8oBb9eFMTwBycfCl5JtpkjfUxA=
X-Google-Smtp-Source: AGHT+IFXlS8OidA4+Up24H5916qP8pMi93Xz1ZulyYRfI3yY858OK1FbW9r7lFwJ/xj+sDn74KoAsb42MT7i91YUhqA=
X-Received: by 2002:a05:6214:f08:b0:6e4:269f:60fe with SMTP id
 6a1803df08f44-6e66cc8fe0emr217822176d6.10.1739886289002; Tue, 18 Feb 2025
 05:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2025 14:44:37 +0100
X-Gm-Features: AWEUYZl-FlrmUbkGJuohXsuY9BPENTfPsDtYifu4TkATBqvQHqQJHyObsDwbXy0
Message-ID: <CANNYZj_BrGJn5nkQd5CuBwwd3Hga531f6XLdc4esO8=GQemtAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.81.0->1.82.0
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211619

On Tue, 18 Feb 2025 at 14:34, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> Rust stable version updated to 1.82.0.
> https://blog.rust-lang.org/2024/10/17/Rust-1.82.0.html

Thanks. While it's good to have working recipes for each major rust
release, we're kind of falling behind upstream. Should we just jump
directly to latest rust?

> --- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.patch
> +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.patch
> @@ -1,4 +1,4 @@
> -rust: reproducibility issue fix with v1.81
> +rust: reproducibility issue fix with v1.82
>
>  A few crates are using the updated version of the 'cc' crate and this is causing the generated object file names containing a unique hashmap id.
>  By the following changes same hash values will be genarted even for diffrent build paths.
> @@ -65,6 +65,92 @@ index fe919a5239..2b1f442019 100644
>               })?
>               .to_string_lossy();
>
> ++        // Function to find the position of the first occurrence of the target substring
> ++        fn find_target_position(s: &str, targets: &[&str]) -> Option<usize> {
> ++            let mut pos = None;
> ++            for target in targets {
> ++                if let Some(index) = s.rfind(target) {
> ++                    //If a target is found and pos is None, set it
> ++                        if pos.is_none() || index < pos.unwrap() {
> ++                            pos = Some(index);
> ++                        }
> ++                }
> ++            }
> ++            pos
> ++        }
> ++
> ++        let filtered_dirname = if let Some(pos) = find_target_position(&dirname, &target_substring) {
> ++            dirname[pos..].to_string()  //Keep everything from the target substring onwards
> ++        }  else {
> ++            dirname.to_string()  //If target substring is not found, keep the original dirname
> ++        };
> +         // Hash the dirname. This should prevent conflicts if we have multiple
> +         // object files with the same filename in different subfolders.
> +         let mut hasher = hash_map::DefaultHasher::new();
> +-        hasher.write(dirname.to_string().as_bytes());
> ++        hasher.write(filtered_dirname.as_bytes());
> +         let obj = dst
> +             .join(format!("{:016x}-{}", hasher.finish(), basename))
> +             .with_extension("o");

repro-issue-fix-with-cc-crate-hashmap.patch header/commit message
should be updated to explain what this new code (added to the patch)
is for. There's presumably a problem with dirnames, what the code is
doing to address it?

Alex

