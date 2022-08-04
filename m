Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F275C19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 09:04:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.2640.1659603881928748409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 02:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gY7qAzyu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z16so24396010wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc;
        bh=edQieauit3909sVDk+XHiPDJ/9set5xL/lZkmN+ZPu0=;
        b=gY7qAzyucQc+ezTJug+GVZ5WkfdgDxZu7EX12XJSge6baiaKUedrREVOt0GvopPqTE
         ZKzP4hwEDYmCm4D95VMDBjj6bKRjJKTU3aW9okyZL/DufGDMzZemdvZCvSS+qkm6dVTI
         5GmU1uCZFTFHgaNkU8Id9nWHuuuemIrnEYScE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc;
        bh=edQieauit3909sVDk+XHiPDJ/9set5xL/lZkmN+ZPu0=;
        b=uAxYH9J4PRuEnfrsWT+5yQehRM9vLgfGM9/mBt22b0EQSKbe8pCHsO8I5sxHvUq6yp
         B10WvuUpuUaUCAV5CRVR32EVaeKFc5AH7zmdW3BVRBq0zixwjLJFkN0gtATCLLgqEwZz
         GbMHTfUl68ILypWTBW29KAfOcCqVmqc2hY2QnJ/O4828vB7DmRoJuHmRJprP1ZzwWMkC
         Qol5thu/yCpX8fg9sVfwFh0rYIQq4sGCsVV1lH9WQTnmhFPLr4oqDDuQC5jOzZvEGxg2
         L4ZrK4kvxQcTbwnwKmNvv7yhyt+2pzOWNiYj6GZF3kebBriPTCydPEX6uMjO+EGqDNSA
         dzdw==
X-Gm-Message-State: ACgBeo1A7cx2TYRNrahZj4eCEcTb7uvcTE0vIai2/E4+LR1VrSRd3gea
	KEy4soMf/H9JHWUgfhUhFm9SQjZ+LZIFbg==
X-Google-Smtp-Source: 
 AA6agR6vHLrT37bm6CtyTC5GZDt/9Dj0dQeAj0FzEIh5+N8F+ZdNkp9O9/My98J3CicODHz1OVxC0w==
X-Received: by 2002:a05:6000:1888:b0:21d:beeb:785c with SMTP id
 a8-20020a056000188800b0021dbeeb785cmr738151wri.34.1659603879751;
        Thu, 04 Aug 2022 02:04:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3?
 ([2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3])
        by smtp.gmail.com with ESMTPSA id
 t28-20020adfa2dc000000b0021f17542fe2sm494461wra.84.2022.08.04.02.04.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 02:04:38 -0700 (PDT)
Message-ID: 
 <f870b8169472e6737c99c74779e5680b935d57ed.camel@linuxfoundation.org>
Subject: pseudo deadlock in rust via malloc backtrace
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2022 10:04:38 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 09:04:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168839

Just to note that where we've been seeing pseudo hangs in rust, it
seems jemalloc calls obtain_malloc_conf() which calls readlink() which
pseudo intercepts and then calls malloc() which loops back to jemalloc
which deadlocks. What fun.

#0  0x00007f3806c84bcf in __lll_lock_wait () from /home/pokybuild/yocto-wor=
ker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.=
6
#1  0x00007f3806c8aec2 in pthread_mutex_lock () from /home/pokybuild/yocto-=
worker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.=
so.6
#2  0x00005629da227a0e in malloc_mutex_lock_final (mutex=3D0x5629da45a288 <=
init_lock>) at include/jemalloc/internal/mutex.h:155
#3  _rjem_je_malloc_mutex_lock_slow (mutex=3D0x5629da45a288 <init_lock>) at=
 src/mutex.c:85
#4  0x00005629da1ffddb in malloc_mutex_lock (tsdn=3D0x0, mutex=3D<optimized=
 out>) at include/jemalloc/internal/mutex.h:221
#5  malloc_init_hard () at src/jemalloc.c:1739
#6  0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223
#7  imalloc_init_check (sopts=3D<optimized out>, dopts=3D<optimized out>) a=
t src/jemalloc.c:2229
#8  imalloc (sopts=3D<optimized out>, dopts=3D<optimized out>) at src/jemal=
loc.c:2260
#9  _rjem_je_malloc_default (size=3D101) at src/jemalloc.c:2289
#10 0x00007f3806c998fe in strdup () from /home/pokybuild/yocto-worker/qemum=
ips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
#11 0x00007f380b19da1b in pseudo_set_value () from /home/pokybuild/yocto-wo=
rker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/us=
r/lib/pseudo/lib64/libpseudo.so
#12 0x00007f380b19dbb9 in pseudo_init_util () from /home/pokybuild/yocto-wo=
rker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/us=
r/lib/pseudo/lib64/libpseudo.so
#13 0x00007f380b16bd01 in ?? () from /home/pokybuild/yocto-worker/qemumips6=
4/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/l=
ib64/libpseudo.so
#14 0x00007f380b19125d in readlink () from /home/pokybuild/yocto-worker/qem=
umips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/ps=
eudo/lib64/libpseudo.so
#15 0x00005629da1fe07b in obtain_malloc_conf (which_source=3D2, buf=3D0x7ff=
ca80e7cc0 "\320~\016\250\374\177") at src/jemalloc.c:980
#16 malloc_conf_init_helper (sc_data=3Dsc_data@entry=3D0x0, bin_shard_sizes=
=3Dbin_shard_sizes@entry=3D0x0, initial_call=3Dtrue, opts_cache=3Dopts_cach=
e@entry=3D0x7ffca80e6260, buf=3D<optimized out>,=20
    buf@entry=3D0x7ffca80e7cc0 "\320~\016\250\374\177") at src/jemalloc.c:1=
038
#17 0x00005629da1fdcac in malloc_conf_init (sc_data=3D0x7ffca80e6310, bin_s=
hard_sizes=3D0x7ffca80e6280) at src/jemalloc.c:1445
#18 malloc_init_hard_a0_locked () at src/jemalloc.c:1505
#19 0x00005629da1fff46 in malloc_init_hard () at src/jemalloc.c:1750
#20 0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223

Cheers,

Richard

