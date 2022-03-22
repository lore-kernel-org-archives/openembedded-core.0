Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5C5C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 07:12:05 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web08.6919.1647933124466657543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oAW1TMIM;
 spf=pass (domain: gmail.com, ip: 209.85.219.181,
 mailfrom: vvavrychuk@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id l2so32059089ybe.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=wB6PNDiYaY6khPtT0G/WSODoIynFZpfykdoFhy/Qynw=;
        b=oAW1TMIMqyoYCzczFtch7I6zw5JsnggI2FCgftjAygcAs9M1sZOggNDkTgH9oZdkzt
         v6FjVgT5GtOob4vrs7sZz7bC1ojEe+P4tqlMtmPJCjXFC2qNFrvbUZf1vSvsWDoyUoUJ
         E/c0V53+ccQs5a7sUw+gInODQHAawPP3Wd9mM5NvnFnhrx/80ETxZd8UodlcXHSPT6ke
         wLr0swYRfPC7zUET7enNbJRHKJD096LnUzr1u6ZkSdRvys/8X43ol+872vVeYT5cbwF5
         qexGiEGhbQMyNDMlXjB7Ydm8cKp48s4N1988F/mzDz39Fp0kzMoKcwTT68Po+T/CL19H
         EngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wB6PNDiYaY6khPtT0G/WSODoIynFZpfykdoFhy/Qynw=;
        b=OCeWABKp4UNNUXNqCaspVokQ8J2ufY7b0n2qqimuwb5594kGpgm6Ycu6ewa5Io0JRN
         iM6fQzn3xPomLXWVD+K6EYZWHd5NK9clFLkjitlZuAWTDkFgItBQFqNiKbJi4rPnvk/r
         jWZjcpy8PrZEVx5ZMDw0ECmxqydsLc3UaOAF+bbdL6ZWWKH/3d5YODPQNBbvdILAS8YR
         CHT7zOje3c3UOCcQiJxR66zLqQDOc8vrrCNkPAuL+iwh9Tq59sBBQGxF+rvHZC/pBYwc
         FSph8la/bN+KtsAHrZ2/SZ4gvhaETar+JJia04hnBODbG1HHCPC2wwuVnPjEnxTaFfS2
         q/IA==
X-Gm-Message-State: AOAM531GEs/fVs87wRdIJz4b/i3U+M3wQrC7L0VQCOkL+MMdwQsqeBrR
	BeuaXq8+rSx5H5BAcbO+bm/aF3SNsxV+4boIK/QCdOmrmZg=
X-Google-Smtp-Source: 
 ABdhPJzdE3IENqg93+AHvgq66kQ7c2ILUL1/tfrXb6qnBZBOg9z539XPZIKjBydTWH0yUrG3KECCbHNohq29Vf6LzrE=
X-Received: by 2002:a25:cf82:0:b0:62c:a9a:9654 with SMTP id
 f124-20020a25cf82000000b0062c0a9a9654mr26376219ybg.15.1647933123366; Tue, 22
 Mar 2022 00:12:03 -0700 (PDT)
MIME-Version: 1.0
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Date: Tue, 22 Mar 2022 09:11:52 +0200
Message-ID: 
 <CAGj4m+4etSVywEpwnW++ehSJKTikBoNwvTDCu-s8jSQ5CCigpw@mail.gmail.com>
Subject: abort()ing pseudo client by server request
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 07:12:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163531

I run

    bitbake hello -c clean && \
        bitbake hello && \
        echo >> meta/recipes-example/hello/files/main.c && \
        bitbake hello

but it fails with

    abort()ing pseudo client by server request

pseudo.log contains

    path mismatch [3 links]: ino 764030498 db
'.../hello/1.0-r0/package/usr/src/debug/hello/1.0-r0/hello.h' req
'.../hello/1.0-r0/hello.h'.

Tested on honister, recipe and sources are below, would be grateful for help.

meta/recipes-example/hello/hello.bb:

LICENSE = "CLOSED"

SRC_URI = " \
    file://hello.h \
    file://main.c \
    file://Makefile \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 hello ${D}${bindir}

    install -d ${D}${includedir}
    install -m 0644 ${S}/hello.h ${D}${includedir}
}

SSTATE_SKIP_CREATION = "1"

--------------------------------------------------------------------------------
meta/recipes-example/hello/files/Makefile:

CFLAGS += -O0

hello: main.o
        $(CC) $(LDFLAGS) $^ -o $@ $(LOADLIBES) $(LDLIBS)

clean:
        rm -f hello *.o

--------------------------------------------------------------------------------
meta/recipes-example/hello/files/hello.h:

#ifndef _HELLO_H
#define _HELLO_H

struct hello {
        int dummy;
};

#endif /* _HELLO_H */

--------------------------------------------------------------------------------
meta/recipes-example/hello/files/main.c:

#include "hello.h"

int main(int argc, char *argv[])
{
        struct hello hello;
        memset(&hello, 0, sizeof(hello));
        return 0;

