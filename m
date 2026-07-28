Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF78C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 13:17:01 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11004.1785244616951777123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 06:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k+4/bfJb;
 spf=pass (domain: smile.fr, ip: 209.85.208.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so3082550a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785244615; x=1785849415; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KposiqX60v4vZhtLeAUkyKmvpmkSspJmTf6v7arn56c=;
        b=k+4/bfJbPohlX79IFRa/HxEM452oj3B92wpd2oGTPQ8EtDeQdDIPvcXA27G9Ht/zMQ
         ID6nWrudIaGslyXilBAnGJht4MbFJuCLsNakZAYeGUpkujRtGg9OeJPxT0myh8AdQ43Q
         VVGrCFNPr/Zrd+4Bhw+Xy8xl7wIfzPO4CVJsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244615; x=1785849415;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KposiqX60v4vZhtLeAUkyKmvpmkSspJmTf6v7arn56c=;
        b=gInnIngucFDBvHiE8A5hQXaumNrCsPdlD/fkcZz+T4JKr0uI12mQgWTaAKVtn8X8Ti
         7xpp8ET/dug6ciAPQfXwuuwOOECw9WdwmgzU2L+C85HsdpYv7HYLYY4j46TKRvnhRGqT
         5YXKbAg6FWTHv727Vo4Od7O8e11qGo+Ce460MJLZBv28C/3Vznp5If4AWZgZHTA95q2F
         S3dy8oT8dHFICdwwmfPBCJPWv7cidIxU9OuJKnsIDv6yi51TJAF8xeb4ghROkkYj9jq2
         2KsBMun4K/pHWy7snxjGglMiCbTl3Z/S7ZplrM5XmQm1LML/u1jKFiPKMZvvVrX4KQFn
         FfiA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/kkZRmE3VpIE/Y74+xCS5X1YX7cS1iAdsRWYPaMqfjLh6wOVpwLdIPR6wfAcLPf+gZEstttUf1zwcgF9lKIBmkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjcE2sZaDlx+4jQ/kdouUanzXmk1GUq0UbG5B/UsGPwwRW1ob8
	oBVhxP8oRRkcHAD6W+Ti7B6c1tNg+cnQOOIeY7H1MmuDHPPmeqSMUBZhb9IpT4aqqjA=
X-Gm-Gg: AR+sD114Bq6MJRye9Au794+u7+l0sfiKohz9GoUQHMEqNnpsoPbev42wKDmosPuxN4g
	5ob3EZRrOmGiG8iMtdZfHnG2jTuNsInXm7XfPj0eaJzpDNLs97fI94nWfeW20OJfC3uKlLzM5v5
	cfY6RWInflmf6HBfdDLnw4P5P+7TF+wq3rDiPs7dkAwfI3vrJtQOnRvv7/CNmEpKJw5o1mqyQDG
	wAU8YiC3G6tRjM82a+RHLFBS81KgK/haOvwgu5E6cjHbUWWJ8Y9L+Ql5MdHJDVWqBx1mZkc3rdS
	ntOh9VGE+kt4wLoCYRSUsbTJQnbZY1aNpjBO+ZjD3SzpvhO7UlgXc/ZsoLpEM/9mydBaOM5DMm5
	wU/jd0Q3LgAXZIGbBeg7xSptq53WDa5D3vdU6lHKWfMGjm05UCftaBN+GP1FEyGgNLkYwJKJxjd
	bp8lowVlnNb4tEHo7ZJUnY80Jba0BUbx3GWtC8rz16tdjHR5C3cUpamC8P2he83g==
X-Received: by 2002:a05:6402:24c8:b0:698:de64:6aa1 with SMTP id 4fb4d7f45d1cf-6a0349ec6famr969793a12.10.1785244614958;
        Tue, 28 Jul 2026 06:16:54 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c9691sm4073934a12.7.2026.07.28.06.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 06:16:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 15:16:53 +0200
Message-Id: <DKA8EDJ6USH4.2QWN8732Z6OV8@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260612121514.2282121-1-asparmar@cisco.com>
In-Reply-To: <20260612121514.2282121-1-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 13:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242191

On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
> where a non-chrooted rsync daemon could be exposed to a parent path
> TOCTOU race that allowed file access outside the module.
>
> Also include the dependent upstream fix that followed the CVE fix:
> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>   opening files from the module root, closing the same race on the
>   read side.
>
> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba8=
41b94ffe19cd2505
> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a=
525a1f5566f10c85
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>  3 files changed, 405 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.p=
atch

Hello,

Something in this series made the test fail on debian 11:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4395/st=
eps/15/logs/stdio
|   399	ERROR: rsync-native-3.2.7-r0 do_compile: oe_runmake failed
|   400	ERROR: rsync-native-3.2.7-r0 do_compile: ExecutionError('/srv/pokyb=
uild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tmp/work/x86_64=
-linux/rsync-native/3.2.7/temp/run.do_compile.2977888', 1, None, None)
|   401	NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_patch: Succeeded
|   402	NOTE: Running task 392 of 412 (/srv/pokybuild/yocto-worker/oe-selft=
est-debian/build/meta/recipes-devtools/gcc/gcc-source_13.4.bb:do_preconfigu=
re)
|   403	NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_preconfigure: Sta=
rted
|   404	NOTE: recipe gcc-source-13.4.0-13.4.0-r0: task do_preconfigure: Suc=
ceeded
|   405	ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe=
-selftest-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/=
3.2.7/temp/log.do_compile.2977888
|   406	Log data follows:
|   407	| DEBUG: Executing python function autotools_aclocals
|   408	| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc=
', 'bit-64', 'x86_64-linux', 'common']
|   409	| DEBUG: Python function autotools_aclocals finished
|   410	| DEBUG: Executing shell function do_compile
|   411	| NOTE: make -j 16 -l 75 STRIP=3D
|   412	| gawk -f ./daemon-parm.awk ./daemon-parm.txt
|   413	| sed 's;\@bindir\@;/srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7/recipe-sysr=
oot-native/usr/bin;g' <./stunnel-rsyncd.conf.in >stunnel-rsyncd.conf
|   414	| gawk -f ./mkproto.awk ./*.c ./lib/compat.c daemon-parm.h
|   415	| gawk -f ./define-from-md.awk -v hfile=3Ddefault-dont-compress.h .=
/rsync.1.md
|   416	| gawk -f ./define-from-md.awk -v hfile=3Ddefault-cvsignore.h ./rsy=
nc.1.md
|   417	| gcc  -I. -I. -I./zlib -isystem/srv/pokybuild/yocto-worker/oe-self=
test-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7=
/recipe-sysroot-native/usr/include -O2 -pipe -DHAVE_CONFIG_H -Wall -W -isys=
tem/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tm=
p/work/x86_64-linux/rsync-native/3.2.7/recipe-sysroot-native/usr/include -c=
 match.c -o match.o
|   418	| gcc  -I. -I. -I./zlib -isystem/srv/pokybuild/yocto-worker/oe-self=
test-debian/build/build-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7=
/recipe-sysroot-native/usr/include -O2 -pipe -DHAVE_CONFIG_H -Wall -W -isys=
tem/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2690503/tm=
p/work/x86_64-linux/rsync-native/3.2.7/recipe-sysroot-native/usr/include -c=
 syscall.c -o syscall.o
|   419	| syscall.c: In function 'secure_relative_open_linux':
|   420	| syscall.c:1723:19: error: 'SYS_openat2' undeclared (first use in =
this function); did you mean 'SYS_openat'?
|   421	|  1723 |   dirfd =3D syscall(SYS_openat2, AT_FDCWD, basedir, &bhow=
, sizeof bhow);
|   422	|       |                   ^~~~~~~~~~~
|   423	|       |                   SYS_openat
|   424	| syscall.c:1723:19: note: each undeclared identifier is reported o=
nly once for each function it appears in
|   425	| make: *** [Makefile:76: syscall.o] Error 1
|   426	| ERROR: oe_runmake failed
|   427	| WARNING: exit code 1 from a shell command.
|   428	NOTE: recipe rsync-native-3.2.7-r0: task do_compile: Failed
|   429	ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/oe-selftest=
-debian/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_compile) failed=
 with exit code '1'
|   430	NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
|   431	NOTE: Tasks Summary: Attempted 394 tasks of which 381 didn't need t=
o be rerun and 1 failed.
|   432	NOTE: The errors for this build are stored in /srv/pokybuild/yocto-=
worker/oe-selftest-debian/build/build-st-2690503/tmp/log/error-report/error=
_report_20260728100237.txt
|   433	You can send the errors to a reports server by running:
|   434	  send-error-report /srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-2690503/tmp/log/error-report/error_report_20260728100237.txt=
 [-s server]
|   435	NOTE: The contents of these logs will be posted in public if you us=
e the above command with the default server. Please ensure you remove any i=
dentifying or proprietary information when prompted before sending.
|   436=09
|   437	Summary: 1 task failed:
|   438	  virtual:native:/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_compile
|   439	    log: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build=
-st-2690503/tmp/work/x86_64-linux/rsync-native/3.2.7/temp/log.do_compile.29=
77888
|   440	Summary: There was 1 WARNING message.
|   441	Summary: There were 2 ERROR messages, returning a non-zero exit cod=
e.

Can you look into this? My guess is the newly introduced openat2 syscall
is not compatible with debian11.

FYI, same goes for the wrynose series, I'll answer there.

Regards,
--=20
Yoann Congal
Smile ECS


