Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3733FC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 19:36:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3267.1784230584747469157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 12:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tTKyC869;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f75f7172so51784655e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784230583; x=1784835383; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G/5iQkhvRj/SBV/qZG7XZ9n6lz7HeIK4h/2HmWWv/sY=;
        b=tTKyC869mfjyHmbtSisi4/XiVUkjCmkgxN5kLBD1fcOTUh/vQY9ELIXezAUqq+CKLl
         /YzIpOYWuEXBQjtvsqwU/uDmovIMjD+e9+oxbHs2oph258yNyxpde6+tGH6oR9vT8ucy
         eK1Lw+wj7hCYZia4mx5Xea4qIzCUTQN4cwzFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784230583; x=1784835383;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/5iQkhvRj/SBV/qZG7XZ9n6lz7HeIK4h/2HmWWv/sY=;
        b=GTug7koVzRAdG69s7pkzYPe0R39wyFFYqJHobQQAtbXBmzERKpW6bT2nd5D6nA0zKO
         2WNPM70GJJLqvflIZ5bjefd1JhpJFHKeWn3rcZPogH53j3VLzRj1fAcW9SCYD5IS1kzr
         8BdUmmeyS46HSIqZoICeyvkwLV0m3ZtwK5/iIHD9b0qIsJIWyN6dCHMkF1nu6iPFE811
         9bPvRzNltOSYrwRlgBjKjGjBST9no7zb6elDGHGoH1yyawWh4OdLpTZVLd1g/gEoR0Jy
         1989B3nVMgtcA9pn51h3qtqREQ+YU0rqHJKkHbzvfflKma/ItbyhQngHKweaBBx4mw8E
         ZWEA==
X-Gm-Message-State: AOJu0YyFdyc1GnlTq3P1BNj7n6sRrEa0PY3M5nfgkwv5b1iH0/I0lxxQ
	JkEE8+7IDFcPKLJUshTK8Sato9Xip9XHCSujYisQy73+qMntm2RoTFN4QS+qKP5D4zM=
X-Gm-Gg: AfdE7cnJzR9VFeyzzaj74JBUI9/7MDrZqL6HZh5RSIDB7ye/i2bMIRuPuh/0Etk0HmX
	dNifKa2eCfCUygyeH7yNRkYp1Yb3gFb5ZGYLNcd1nrjcuwFFhqRTMAo5YQEsxG6ogjYVV84oYAr
	1s00xvumaaYjatzlmeiaKXLeT/dPdEzAsFU/US32+iKz2Zc+oQuMipiBNbuNlT/vWwSCLUhWS3c
	Ha3qOkdQLy4cjbsIsM0mQHbleQOqUR6iBLpTsFeAsWujn97eoj+gT1aqdFm+f+zzOQ4lAGZGhDf
	CY3RYDR/XG+zTUDD8/SAQ2iI3NZjWfQX4Tk41J2GfTWqQ+GgYZEnlJtpJTYJ7zF7C8jUgQzHWcZ
	q0mjt5NZWg9twwt0qJormTBTC33tmZ1m4dTiXJ2qo1F4e+hSPbVns/mgrGrrpPtms8UVNtGPsNV
	cU
X-Received: by 2002:a05:600c:a08e:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-4953c390347mr97722455e9.39.1784230582960;
        Thu, 16 Jul 2026 12:36:22 -0700 (PDT)
Received: from localhost ([212.133.41.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49547988756sm13655445e9.6.2026.07.16.12.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 12:36:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 21:36:21 +0200
Message-Id: <DK08YDP0HG03.1YUY01SIYRENG@smile.fr>
Subject: Re: [OE-core] [PATCH] lib/oe/patch: avoid duplicated "From:" in
 generated patches
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260710185207.3999639-2-yoann.congal@smile.fr>
 <CANNYZj8SEdTeTZDr5dyQfMxQ5cm_3CcXEc_5Vs22tYMP5Tb8Og@mail.gmail.com>
 <DK05T1YBIVAY.6B2L4BKB3HAF@smile.fr>
 <CANNYZj_q-EHN+GxGT0--7BcnpYWptBT-8DC8Mi6CvGnXaMQfNg@mail.gmail.com>
In-Reply-To: <CANNYZj_q-EHN+GxGT0--7BcnpYWptBT-8DC8Mi6CvGnXaMQfNg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241104

On Thu Jul 16, 2026 at 8:56 PM CEST, Alexander Kanavin wrote:
> On Thu, 16 Jul 2026 at 19:08, Yoann Congal <yoann.congal@smile.fr> wrote:
>> >> To fix the double "From:" header, use the --no-from option for
>> >> git-format-patch to override this configuration and generate only one
>> >> "From: Original Author <...>" header.
>> >
>> > I don't understand. Why is the above problematic and why does it need =
fixing?
>> >
>> I really don't like this double "From:" header and I manually remove it
>> every time I (re)generate a patch with devtool.
>>
>> I admit this is a matter of taste and that the problem only appears in
>> my configuration (it seems).
>>
>> I won't mind is this patch is dropped, but, on the other hand it only
>> does force the default (--no-from)
>
> Can you provide a reproducer? What is the sequence of steps where this ha=
ppens?
>
> Alex

Sure, I can reproduce this from a pristine CROPS:debian-11:
  $ git config --global user.name 'Yoann Congal'
  $ git config --global user.email yoann.congal@smile.fr

  # Config to avoid groups.io "From:" rewrites issues
  $ git config --global format.from true
  $ git config --global format.forceInBodyFrom true

  # Basic poky-master setup with bitbake-setup

  $ devtool modify bash
  $ cd workspace/sources/bash

  # Emulate cherry-picking a commit from the upstream git tree
  $ echo TEST >> README
  $ git commit -a --author 'Original Author <author@example.org>' -s -m "Th=
is is a test"

  $ devtool update-recipe bash
  $ head ../../../../layers/openembedded-core/meta/recipes-extended/bash/ba=
sh/0001-This-is-a-test.patch
  From 8bbac77f0b749fc62e5ca5d924066d311e29c963 Mon Sep 17 00:00:00 2001
  From: Yoann Congal <yoann.congal@smile.fr>
  Date: Thu, 16 Jul 2026 19:31:55 +0000
  Subject: [PATCH] This is a test
 =20
  From: Original Author <author@example.org>
 =20
  Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
  ---
   README | 1 +
  # Notice the double "From:" header above

Here, I usually edit the patch to replace my "From:" with the original
author's one.

Regards,
--=20
Yoann Congal
Smile ECS


