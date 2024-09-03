Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D573CD342D
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 12:51:00 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.22347.1725367857618722096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 05:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mdg9jewa;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d4f1d9951fso26872877b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725367857; x=1725972657; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a41DEC8Lj5fpcU46N+SqQpUcQZkKQoJWkOyLEgQarE=;
        b=mdg9jewamlIQQhStGcZlPCyG4SV7nZteEjZFudkydoJzOajqE/zQbAH3r6AnU7C1go
         SrYM4hiB7wh7IzU3+k6HLbSdxzJMElhv/gJGMiDpnJSi4hGg7weS48GUTvTvNLiUfEGD
         JASol7oPhckF6jvYcgBAkAeqzDix7l+M8EjhQeZ6uE30ZwrOdnCzXQCSYufu9Kao37ZP
         Xszij5y1nNFaThGG1IKZcxN3syJIv4j2KdO7+IcQpkgJ8PBMSwOQWFTPWFvahbf3x4HV
         j/d7ABBJGUDY9CKDcHhlTwq6gSluQK1fULtDCntg2Go+7W1yFMs6zA9EqnBZ/WWoNDmw
         ONHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367857; x=1725972657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a41DEC8Lj5fpcU46N+SqQpUcQZkKQoJWkOyLEgQarE=;
        b=Ctht2w59sipbdCi4/styF9aCynwjEg+2vqrhQBJRBs1m9Z8ghWuXHYbuyWIcykCT3j
         DyOlK2fNf330+3Y94sWr69f0hZVKgJuF9whnFxwkwx7wD8HDfVwt2W+lhDpOencWi6uy
         VSwwzl8oUglCmCyIyqevkQSfG/V2hS/4j0px2oZ5OVyNBReRSpLVohtvJdtgT9LuhAJs
         NR8KXlvYlWGyOQtrxbx0sB0uufFXI8VdfQKTqKCybqqUDPaZTNjQgDZN1Z6i3L42odS4
         FtyFMDEyBSCA+uJpOhsA0X+bvsYT33steucvbEMNlj8KbqVcLYxiO2e9SZVE2ihyXyz+
         7JGA==
X-Gm-Message-State: AOJu0Yw1ouBozc0bIgCNJhD8xxemx3YDa8AHnyouoSo+Uyp5/doSs8lO
	9HAqfrCgirdtjNFb/G6P4GFwbjdJR86ghiXpcAynwuEvf1sb+ZpwtTiv3t/oUA+gxOMxo398UpD
	hYuH/8DUKVc5Aj6ulGgYodw5j+S8lx9v8tmtJ7pqL8wNw+6tc5Rg=
X-Google-Smtp-Source: AGHT+IGUsjifkTD7WXZJVsUygrfK8h0NqN6LfWw47oYkgdhNrqlaD4mB45BDpt/SxFm24mr+7+cjtQn21J4L23fmGgA=
X-Received: by 2002:a05:690c:660b:b0:643:aef1:fb9d with SMTP id
 00721157ae682-6d40ea72140mr158577637b3.4.1725367856653; Tue, 03 Sep 2024
 05:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240830104218.1610412-1-vanusuri@mvista.com> <CANQUz1-Spp0rJ2oYkt4VjF-O+v_SK_=fxVd85E4y0gsQs5kKuQ@mail.gmail.com>
In-Reply-To: <CANQUz1-Spp0rJ2oYkt4VjF-O+v_SK_=fxVd85E4y0gsQs5kKuQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 Sep 2024 05:50:45 -0700
Message-ID: <CAOSpxdYRvbAM4TETEAZdpaysMhBuANTaK91g8MWX0rDr2oNrqA@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] apr: upgrade 1.7.4 -> 1.7.5
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 12:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204161

On Sun, Sep 1, 2024 at 5:52=E2=80=AFAM Vijay Anusuri <vanusuri@mvista.com> =
wrote:
>
> Hi Steve,
>
> Could you please merge this patch also to scathgap branch along with belo=
w commit
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dc041932f14cf5=
52b0446732ce0cca6537f3286ab

OK, both are in my test queue.

Thanks,

Steve

> On Fri, Aug 30, 2024 at 4:12=E2=80=AFPM <vanusuri@mvista.com> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Refreshed patch 0001-configure-Remove-runtime-test-for-mmap-that-can-map=
-.patch
>>
>> Includes security fix
>> CVE-2023-49582
>>
>> changelog:
>> https://downloads.apache.org/apr/CHANGES-APR-1.7
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  ...1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch | 2 +-
>>  meta/recipes-support/apr/{apr_1.7.4.bb =3D> apr_1.7.5.bb}         | 2 +=
-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/apr/{apr_1.7.4.bb =3D> apr_1.7.5.bb} (98%)
>>
>> diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-=
test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-confi=
gure-Remove-runtime-test-for-mmap-that-can-map-.patch
>> index a78b16284f..3480deaa4d 100644
>> --- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-fo=
r-mmap-that-can-map-.patch
>> +++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-fo=
r-mmap-that-can-map-.patch
>> @@ -34,7 +34,7 @@ index 3663220..dce9789 100644
>>  -#ifdef HAVE_SYS_MMAN_H
>>  -#include <sys/mman.h>
>>  -#endif
>> --    int main()
>> +-    int main(int argc, const char *argv[])
>>  -    {
>>  -        int fd;
>>  -        void *m;
>> diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-suppor=
t/apr/apr_1.7.5.bb
>> similarity index 98%
>> rename from meta/recipes-support/apr/apr_1.7.4.bb
>> rename to meta/recipes-support/apr/apr_1.7.5.bb
>> index 4df741c766..78796476e2 100644
>> --- a/meta/recipes-support/apr/apr_1.7.4.bb
>> +++ b/meta/recipes-support/apr/apr_1.7.5.bb
>> @@ -25,7 +25,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2=
 \
>>             file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
>>             "
>>
>> -SRC_URI[sha256sum] =3D "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d=
4367a701fe5c35577"
>> +SRC_URI[sha256sum] =3D "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab5=
64e3cb352b67232f2"
>>
>>  inherit autotools-brokensep lib_package binconfig multilib_header ptest=
 multilib_script
>>
>> --
>> 2.25.1
>>

