Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.1020.1613689518257866211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 15:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ItcqdkUy;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: mcroce@linux.microsoft.com)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	by linux.microsoft.com (Postfix) with ESMTPSA id 77915209F5A2
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 15:05:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 77915209F5A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1613689517;
	bh=96BjnpaA48vY1OG6bbnXXy+2yZqgVmA42Lpbl1Q1iPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ItcqdkUyEyVHC9OXCGT1es3mUrKz1d37UPlBWurF0J13uFLwONjsugXd51o/vHRY2
	 8DptWSNFS3mVToaBw+0zJjsr0Iqg9hmJ32+sfS7bbDr9eBINY0wjhq0YS4DybU9kpx
	 1211pm4lQpyP4SumBkL/cMAY21WSkcr4bh2gjx9o=
Received: by mail-pj1-f48.google.com with SMTP id my11so3535497pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 15:05:17 -0800 (PST)
X-Gm-Message-State: AOAM530qTWHrYliVeAn1hF6quoiLF+XXXFxCI0mbUr/Mb391dkWj3gbP
	kCb3rgex0G+gLURvmM+2wizaQmsymyidS2R+0h4=
X-Google-Smtp-Source: ABdhPJwIO9YgvBBMcOeSTRnGGP1lkw5bEopTp8q1MZeEbuB4hxvWOFbmjb6mwZwTsQqfJfda3KmanAglfQQ3Y7Bnr6M=
X-Received: by 2002:a17:902:ac82:b029:e3:bca2:cca7 with SMTP id
 h2-20020a170902ac82b02900e3bca2cca7mr1214057plr.43.1613689517061; Thu, 18 Feb
 2021 15:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com>
 <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
 <CAFnufp1BS2mZxJ5TAu6bVX7h76_k2vrnbrLDj6o83UbOCb5M_w@mail.gmail.com> <CADkTA4OsXBJk-a29_=Sx6-FBOgRAR7M3X+=RdVqju7PDLBFnmw@mail.gmail.com>
In-Reply-To: <CADkTA4OsXBJk-a29_=Sx6-FBOgRAR7M3X+=RdVqju7PDLBFnmw@mail.gmail.com>
From: "Matteo Croce" <mcroce@linux.microsoft.com>
Date: Fri, 19 Feb 2021 00:04:41 +0100
X-Gmail-Original-Message-ID: <CAFnufp1JF5te_Jq6HqYkvOT8rDJhEHKfn2V954X17gvH4p9eyA@mail.gmail.com>
Message-ID: <CAFnufp1JF5te_Jq6HqYkvOT8rDJhEHKfn2V954X17gvH4p9eyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Okay, I've addressed all comments but the test one.

I pushed it to a local fork of meta-oe here:
https://github.com/teknoraver/meta-openembedded/commit/679944b06ffc564b4b99eae5d934f742bb2a9c09

Which kind of test needs to be done here?
A selftest to be run with oe-selftest? A ptest? A tool copied into the image?

If we just need to check if the bpf() syscall is supported, there is
bpftool packaged already, which can list the loaded programs like:

# bpftool prog
3: cgroup_device  tag 3a32ccd9e03ea87a  gpl
       loaded_at 2021-02-17T11:50:08+0100  uid 0
       xlated 504B  jited 309B  memlock 4096B
4: cgroup_skb  tag 6deef7357e7b4530  gpl
       loaded_at 2021-02-17T11:50:08+0100  uid 0
       xlated 64B  jited 54B  memlock 4096B
...

Regards,
-- 
per aspera ad upstream
