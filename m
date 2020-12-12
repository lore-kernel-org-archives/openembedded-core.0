Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.12061.1607817169059374396
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Dec 2020 15:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=huallZfT;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.173, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f173.google.com with SMTP id f14so9364193qto.12
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Dec 2020 15:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:date:message-id:subject:to;
        bh=wotx2+NPIoaB1Di6tbevAvn+vbG5UTfK8tlap6CV+Ng=;
        b=huallZfT0MJCW1hAOJRbbWVez10atN3eWN0bwCj5zZ0HyCAdV0Lmb81f6vOFTlOIMi
         IHyBNxBEuJd3A1WZs9vuf/8yby5GLldeJQrG7qWMEWIyi2ShOPxZk4wwFtfmQtAkG3h3
         unJUBqPfYNJQsS505aR1xKNHs8tNftOfWUD71T4i1+/3WLiCb2UDN9logpdscEseuDU9
         k3+xa7XWqXYXZwJYeb+82m8ByPvsk5D4AUij1Gwwt/8sfe6oBOC/AYgpSN+kvrxda0t8
         2aH7T9Zc6slkavzgy4Ex4+xbdUDWY3NJ7FDtdZLzjs26jyVdn+uT0CVpsyc0MXQGDSxd
         JQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
        bh=wotx2+NPIoaB1Di6tbevAvn+vbG5UTfK8tlap6CV+Ng=;
        b=t7kqQov7PSDE64LJVWJTwE3joLqux/GYzdisBzFMTnRfsUjPdg3i3kPJkMUsSGO4Pe
         oAC1FFei4v56+gcBP3RwD+oD0XEt7dHZAMde/R74pS13QoMHI9zabnpIldNyGrJpAH6L
         YcMBhrkUNPAdSWrSBA3NE/W1eKw329/8jcSrTBohFkf3ZzKzf51VBf7dLSBoFjxzlzeO
         wp3X3dG5Cd97fzXvOZs33RjoejEV4eGB9ISjMV3Wq8YQc3OGOjbe0KJqtkO8678UEKp9
         oZPl5byP5CDAIBUt8LUrYtTKtUILY4SmTrfz6qxSx+qf6wtWhT/bYJ+h6kPo05E63DjG
         J6OA==
X-Gm-Message-State: AOAM530vp1qli6p+s+n/SphxTPBPfcZviBfMjtEzWqtSXQxG1QdG0PNO
	jeL8WyP2+i/qpTd+y98YCnLA4EYX8963x9w3
X-Google-Smtp-Source: ABdhPJwuAhlistK0C+mVPMGPKZzdhKRRWZmSFxbQWjfRbr5DZcAhQvL13FPMhMppGqpatBtaClJetA==
X-Received: by 2002:aed:30d1:: with SMTP id 75mr24603373qtf.61.1607817167914;
        Sat, 12 Dec 2020 15:52:47 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id l24sm1829964qkl.46.2020.12.12.15.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Dec 2020 15:52:47 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f179.google.com with SMTP id h4so7438139qkk.4
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Dec 2020 15:52:47 -0800 (PST)
X-Received: by 2002:a37:498b:: with SMTP id w133mr24498166qka.383.1607817166506;
 Sat, 12 Dec 2020 15:52:46 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 12 Dec 2020 20:52:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
Message-ID: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
Subject: Strange segfault on native Go binaries
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am trying to debug a strange issue on native Go binaries. We're
seeing it on 'glide' for example.

If I build 'glide-native' and I go to its tmp/work/.../image/bin/glide
it works just fine. For example, running it we see the expected error
as I am running inside a clean environment without any extra tools:

otavio@yocto-env ~/.../build %
./tmp/work/x86_64-linux/glide-native/0.13.3-r0/build/bin/glide
[ERROR] Error getting version: exec: "go": executable file not found in $PATH.

Now, if we run it from the sysroot-native, it segfaults:

otavio@yocto-env ~/.../build %
./tmp/work/cortexa9hf-neon-oel-linux-gnueabi/updatehub/1.1.1-r0/recipe-sysroot-native/usr/bin/glide
[1]    26085 segmentation fault (core dumped)

And this segfault is also happening inside the build. I ran the
readelf on them and it seems to have been modified to use the
uninative libc loader but I am in doubt how if this is the culprit.
Can someone shed any light on this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
