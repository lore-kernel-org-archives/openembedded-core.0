Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.11414.1610039420726883989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 09:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ue1zgU7j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id w5so6334926wrm.11
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JFDSngeErmYx6393p8v0ARdVfG8jyD5TYWBFWc3/DqQ=;
        b=Ue1zgU7jww2huiukE7PUSRa965SfMyrjgaFADgmSXa4V2XnxXjAY1fguy2RBAxZKQw
         QKvaJJBFH9RPCE78cwiIgwrQoasZ5VPxTYRgKc5F+H23EuY+NKlXKGBc0UxRCNVSANFh
         +/vP31OIKPnWNQx6QuJIVaIDO/yFkjLUPSco4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JFDSngeErmYx6393p8v0ARdVfG8jyD5TYWBFWc3/DqQ=;
        b=ftmOg6V2CfalQU4teju+8T+GFhsvMVwE7zh5m9GP9ABFCFcrsywcV/VhQat2Jv81oS
         5yiJvGdzG4n3R2wUff1/Zb00J+x8osGrEEk1WCQ+TBBRsb6CsjcsmGyk9RB2gNxcE4qo
         1HPA36QkhmU2Wr6TMS4WHSC3sEbUT1aT8b9ytQ/bO7RoqQVPNBxW5tHkmqhXFUutsic9
         RIK4ca9n68Sa/8Wok6wScsPANwv2HJNZBO0CcGNlUfU/gOuwugCGIx9KCISdrMsxsgzw
         hdAsTTZPQFQUfGN8e1QZNMlviciIVfZ1qG/QPzP48QFyG29JhS3ON8FB1kS6BBZOQIFE
         81Wg==
X-Gm-Message-State: AOAM531mc7IS2mFM/R+s/9qwBR++zyZbdDM9Yc1Fv+ez1OH1nYh3OZdC
	tTPZo1S1RmnpwlHTfmJsCXo3kg==
X-Google-Smtp-Source: ABdhPJx0ZLuXks6AeKAovHz2ziO95p6wGT6GvPEKlR3vzr+PeUwp2stHQEy0H2gzpBsacguEZPqGCg==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr10009747wrv.132.1610039419208;
        Thu, 07 Jan 2021 09:10:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f082:51:8822:ee14? ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id h184sm8707591wmh.23.2021.01.07.09.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:10:18 -0800 (PST)
Message-ID: <180e76098a5349241c44436e0a146dbbd2fbdf46.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2021 17:10:17 +0000
In-Reply-To: <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
	 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
	 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
	 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
	 <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
	 <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-07 at 18:59 +0800, Robert Yang wrote:
> There are two problems to use cache-native now:
> * ccache-native depends on cmake-native and zstd-native which makes it requires
>    more time to build, so it might be a bottleneck for the build
> 
> * We need disable ccache-native for about 20 native recipes to resolve the 
> circular dependency.
> 
> It seems that there isn't a good way to fix the problem, or we have to disable
> ccache for native recipes, only make other recipes (cross, target and nativesdk)
> use ccache-native.
> 
> Host's ccache isn't reliable from the history.

Thanks for the analysis. I think I'd be inclined to disable ccache for
native recipes then. If anyone does want to use it for native recipes,
they can build a buildtools tarball of their own that contains it but I
don't want to default to that.

Cheers,

Richard

