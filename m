Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EABC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 16:04:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.40684.1699891470745151612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 08:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cW3e8jcX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-408425c7c10so37612735e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 08:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699891469; x=1700496269; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjw/UYbD5zXp54DJIZJLnA6YDN6iqKejFt3Zned6glA=;
        b=cW3e8jcXWDQHKotwf7ZO4Jg7CxywE04KlMyfgFHsF9QkfvrblvpxDnrnHBsyofQt1B
         2wEUtHFiBLb/SXybqaUuNSuhmYWC4o0vv3OQRGt2aqUbwJmTzPtynHN5LZwQQW+S+X2n
         p5P6JeYaJf5VITEVcjI42ZV6pBx4UeUBcB+Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891469; x=1700496269;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjw/UYbD5zXp54DJIZJLnA6YDN6iqKejFt3Zned6glA=;
        b=eJvmlUGMMAAM6YRfnVe1tCACkPBJN4nDF7XRJiKoLTt8pde7zA/hwxazwe6rWtkGhw
         mS4kq6uurpMWuQoRCodlocoL5f4/qEkyIrNu2lXmMSCTqgFFEwjKuT31U74iUUkZ1ArE
         4ktaK7peay0zdQZOdThXdDRbHXMIFtfOTsZ/kIOJ5O4DuGs8eUr5G3PunxqkXnkNB6zp
         Ey5jqEiqhU6bBNT1I6k9gHK7D2BPuCFwimqaxKpjy8OXEmF0xC8S9vZD91KwL7F6kfjJ
         EN0UC8TU/7oz5Bm0I8TsPC6etFtMHWrEXV3AJxIbWOtXcaYYVi7wX9IE7Gi/Z2McM8Fy
         qsyA==
X-Gm-Message-State: AOJu0YxwH0w1X4/WamTYDEiwTslrfIk7Kdnc6X+ntDqs/Z110ihv76gx
	/bhMwNwMCCq3zi9HO61Ij7CwRw==
X-Google-Smtp-Source: AGHT+IGdKJHNQ6URcmFuJ1OsQSZvZr6N8R1mtLhe95Jb7UqCFqRRxcCzPvz0ZG/AnJutWp9jPXRqrg==
X-Received: by 2002:adf:fb06:0:b0:31a:d9bc:47a2 with SMTP id c6-20020adffb06000000b0031ad9bc47a2mr4869243wrr.53.1699891468923;
        Mon, 13 Nov 2023 08:04:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f440:7406:36f8:870a? ([2001:8b0:aba:5f3c:f440:7406:36f8:870a])
        by smtp.gmail.com with ESMTPSA id e3-20020adffd03000000b003142e438e8csm5725839wrr.26.2023.11.13.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 08:04:28 -0800 (PST)
Message-ID: <beed5830d4e06d296a36ef35d9cc3f098a56c3c0.camel@linuxfoundation.org>
Subject: vim reproducibility on dunfell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Nov 2023 16:04:27 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 16:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190479

Hi Steve,

I know ubuntu2204 has been causing concern for dunfell builds with vim
and reproducibility. Since I have a local ubuntu 22.04 machine I took a
look and sure enough, dunfell vim builds 'fail'.

The difference is that in one case, iconv runs during do_compile and in
the other it does not. The shipped ru.cp1251.po has "CP1521" but if
rebuilt, it is replaced with "cp1251". The question is therefore why
iconv runs in one case and not the other.

Comparing my master build with the dunfell one, with the same vim
versions and just "vim -c unpack":

richard@jet:/media/build/poky-dunfell/build/tmp/work/core2-64-poky-linux/vi=
m/9.0.2048-r0/git/src/po$ ls -la ru* --full-time
-rw-r--r-- 1 richard richard 415845 2023-11-13 15:25:43.623938196 +0000 ru.=
cp1251.po
-rw-r--r-- 1 richard richard 546691 2023-11-13 15:25:43.623938196 +0000 ru.=
po


richard@jet:/media/build/poky/build/tmp/work/armv5e-poky-linux-gnueabi/vim/=
9.0.2048/git/src/po$ ls -la ru* --full-time
-rw-r--r-- 1 richard richard 415845 2023-11-13 15:25:53.219945033 +0000 ru.=
cp1251.po
-rw-r--r-- 1 richard richard 546691 2023-11-13 15:25:53.223945035 +0000 ru.=
po

and again just to be sure:

richard@jet:/media/build/poky-dunfell/build/tmp/work/core2-64-poky-linux/vi=
m/9.0.2048-r0/git/src/po$ ls -la ru* --full-time
-rw-r--r-- 1 richard richard 415845 2023-11-13 15:32:03.736202888 +0000 ru.=
cp1251.po
-rw-r--r-- 1 richard richard 546691 2023-11-13 15:32:03.736202888 +0000 ru.=
po

richard@jet:/media/build/poky/build/tmp/work/armv5e-poky-linux-gnueabi/vim/=
9.0.2048/git/src/po$ ls -la ru* --full-time
-rw-r--r-- 1 richard richard 415845 2023-11-13 15:32:04.896203681 +0000 ru.=
cp1251.po
-rw-r--r-- 1 richard richard 546691 2023-11-13 15:32:04.900203684 +0000 ru.=
po

so for some reason the ru*.po files have the same timestamp. This
triggers make to rebuild it. Why? Not sure. git is from the distro in
both cases.

I did isolate the steps from do_unpack to these in dunfell and master:

DEST=3D/media/build/poky/build/tmp/work/armv5e-poky-linux-gnueabi/vim/9.0.2=
048
rm $DEST/git/ -rf
git -c gc.autoDetach=3Dfalse -c core.pager=3Dcat clone -n -s /media/sources=
//git2/github.com.vim.vim.git/ $DEST/git/
git -C $DEST/git/ -c gc.autoDetach=3Dfalse -c core.pager=3Dcat checkout -B =
master 982ef16059bd163a77271107020defde0740bbd6
ls -la $DEST/git/src/po/ru* --full-time

DEST=3D/media/build/poky-dunfell/build/tmp/work/core2-64-poky-linux/vim/9.0=
.2048-r0
rm $DEST/git/ -rf
git -c core.fsyncobjectfiles=3D0 clone -s -n /media/sources//git2/github.co=
m.vim.vim.git/ $DEST/git/
git -C $DEST/git/ -c core.fsyncobjectfiles=3D0 checkout -B master 982ef1605=
9bd163a77271107020defde0740bbd6
ls -la $DEST/git/src/po/ru* --full-time

and I was sometimes able to see the same timestamps, sometimes not in
both cases so I suspect this issue could affect master too.

Cheers,

Richard




