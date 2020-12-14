Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1908.1607986734403297626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 14:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oIIbBLvf;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y8so9792613plp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GWfXpDIQMVdKHyf/ZYuH5NzZesVUsDJlGzFxi3GrXdc=;
        b=oIIbBLvfIZ8ny0sUDbactw4z2l216gHiL1Qy/C+kfr4Pufp5tfkeWcNsOpE2/UHNdF
         6PKxvRC0eQfsVxpMgPFEb+OgabQk6WIZF+NkfpdoS01CV7qp7Ya9mK5WvuPwGhR85Bsp
         W/x5uJ7rjZNGB5/wgnoTQQKmNF68VmCQrqAk/lNXYClHglmf5cmSx741ErwyY+sCzIeR
         JoEQ0JSz+ZTfbi5fVJ4gJuOTgjTyTwav/RXE809RdtVUeLbyYUfVuIDO06v+8L9pUHvf
         jqt7d+MCgb8uFDJXj561PJi7Li7EiT8gqkV77LlYBLXNB+6a/5rWHASs6/n42rreMsrp
         iBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GWfXpDIQMVdKHyf/ZYuH5NzZesVUsDJlGzFxi3GrXdc=;
        b=eMV1rTKbZTv85DRduFyk9+PURs/T+x7miUJA7elARWsUWn8RgaEWsyfvsAJjpPXdSI
         CLFXxcKTsNXfd5bNl3tN54IKQJUtnXEd9cWVZVtg6COQW0reQmlTNI2lhm9GISUuUeYI
         xtWbbksXWeHwITV0lxxwbsTVFQyzv54NETOc7QYNb4BF49Gave5dk2Ps30Lfom9E5x9Q
         i8r6i4yapPhzWdj/uH4ReLC2efL2RMxP9FwEmwYGu0mTu+nvSWnSyouRiXsMgC+6K3nE
         4GdU2cjnvAFKZ3I4Awdr1fdbxsO+UUvhiXF0pG1FLY16HNDhNwttX6zBgxU3Dd/i3A4r
         eP3A==
X-Gm-Message-State: AOAM5308cPwkj6INmMrYPYusuudLOJMKc6zcdyGYV6dvfRSVr0umnnLI
	lpVFiRBBhUAUcL9pvIyb2ZI=
X-Google-Smtp-Source: ABdhPJwp236wg/T4tII2CjedEmjR4nwZiXASppFKF7Uj8JyJaCo7Bl+8WL6xwM7oDbLh6M+4HykgxA==
X-Received: by 2002:a17:90b:68d:: with SMTP id m13mr27197007pjz.164.1607986733862;
        Mon, 14 Dec 2020 14:58:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.localdomain ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id z12sm20871070pfn.186.2020.12.14.14.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:58:53 -0800 (PST)
Date: Mon, 14 Dec 2020 14:58:51 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Strange segfault on native Go binaries
Message-ID: <20201214225851.yqscuyms4pwihtfy@apollo.localdomain>
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 12, 2020 at 08:52:34PM -0300, Otavio Salvador wrote:
> Hello all,
> 
> I am trying to debug a strange issue on native Go binaries. We're
> seeing it on 'glide' for example.
> 
> If I build 'glide-native' and I go to its tmp/work/.../image/bin/glide
> it works just fine. For example, running it we see the expected error
> as I am running inside a clean environment without any extra tools:
> 
> otavio@yocto-env ~/.../build %
> ./tmp/work/x86_64-linux/glide-native/0.13.3-r0/build/bin/glide
> [ERROR] Error getting version: exec: "go": executable file not found in $PATH.
> 
> Now, if we run it from the sysroot-native, it segfaults:
> 
> otavio@yocto-env ~/.../build %
> ./tmp/work/cortexa9hf-neon-oel-linux-gnueabi/updatehub/1.1.1-r0/recipe-sysroot-native/usr/bin/glide
> [1]    26085 segmentation fault (core dumped)
> 
> And this segfault is also happening inside the build. I ran the
> readelf on them and it seems to have been modified to use the
> uninative libc loader but I am in doubt how if this is the culprit.
> Can someone shed any light on this?
> 

It looks like a known regression in 1.15.5

There was a linker regression which crept into go compiler in 1.15.5
which was immediately patched and we also backported that to OE-core
however, recently we have switched to using go-binary-native to
bootstrap the toolchain which means the bug was still not plugged in the
native version even though we patched our go versions, we cant help the
prebuilts.

Luckily we now have .6 release which came out last week, which means we
can upgrade to it and that should take care of the segfault, I have
improvised on the patch which was sent for upgrades and sent a v2 [1]

Please try it out and let me know.

[1] https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_go_update_1_15_5/78964072?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,78964072

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

> 
> 
> 

