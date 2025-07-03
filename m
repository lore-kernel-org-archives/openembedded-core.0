Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD0FC83F03
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 15:15:27 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.25405.1751555723468696544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 08:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X8Hfv0Tg;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so2462414a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555722; x=1752160522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC2mmqP0ZfQVrQZnP+zTprwCUA2hDA+7Mn+1SkggfJg=;
        b=X8Hfv0Tgejs8uZAeVIvt1z/gPPiOETaqgfSaFGhP9a3n6G9xQMBz1x3Yxnq1JyWkBm
         4oQaL9ZwLmdGFOXboBs4xrCN/DqKRca3s7i3VkwlJocpMQ3jLVj27RK2kegNw9HHReVg
         k7MUj898T/E3WvtixyfhGF6ZGus6vLWknmSLPOYSP/djJ61gzV1IuIq2SXzx5bK6r1fe
         ytVox+Ya+gbyEzhdmoeWtcQm5Kf0IeOlRA10W+q9oe1oYUitB9T6tyYlax4lTu0YDo1u
         WgWYhC6SKLEMW+IZkj/8MujfOP7eN7/qsl2VYYNyJjvkdm1OApsoaYS+JE6kybtxLwRn
         bO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555722; x=1752160522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qC2mmqP0ZfQVrQZnP+zTprwCUA2hDA+7Mn+1SkggfJg=;
        b=EwGpC9iCMnvq2MlcM9HglBT9oMIr+2gTn66Pq+yWUN8Enn6C3p/6PGnsT/JZLBjww8
         8Hf/TMg4ZQxlot0Vs4DzLGJETixTysb5QLRuiyFJIwibDaQeCP0lSYbKlYP2KmTKzfS7
         LIx1CA9X1T5RUqoyE8ImMT5YIFcU2MLhrycZL4X4OpywOiuUlz3ylxQUW2m+ACG49gMu
         vxGgoHWKdpqJd9zPG5BeqP95PFbRzB3vKR39ay2Wflgz8FWi4L3hwr7prUOmN/+0smql
         YN65G/oOjIYWl1NM+kjEjokWfuEDpoaWz8ZiSJlEExoGa0z5fo5AkFwpzK6Cxnf7LdUU
         JuQw==
X-Forwarded-Encrypted: i=1; AJvYcCUmHvCT7DOJwlgiV9c9Y3cumDT3ojn475j/wWkDuYvRFKxS92qBMmOEDCuV4/jEGfu5/eukqRpmbez0Z4Z/BS2A6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2Kj111HGsb74EOli3ygDQZETj6WnALVFz330SMcCSNzSDl1gw
	9mKaiiIHNtE6KhMHzvccy07J+w6GGqhs/ioNGs9aPiQstYMMzGOrOGDh
X-Gm-Gg: ASbGncuzqX49C2DHiPIbPpf2xrXh4hkXA671clxgWsJUnTrD+8VMX2ZMIi6cBcuLLxC
	ic8RJ213FjWLbxGVBxUYEr4Pz/6XXfuj5r7KBuc9o57S4JH0lT4RY6dUs5t3NNRD/V2z33XCc8R
	7+xG+lvPuw36bpua0gAkb/qZGak607QOe3VS8fSUviISYjJdqoAHgNILYKe/HXYvvhDvbl+lDkq
	DAcvc7FjLbYXHhw5yqzL2ftBfnhBIQ8SyjC+fMBTFSzB85o9DFqou/m88NeqAQEpHHFh3kIH1y6
	f3GRMQ5oPTgmbiUeKBbUWi7oyl1G6dKDKCNw9HKyBm3rIazBx9GbcqyoUrb3
X-Google-Smtp-Source: AGHT+IFzQmdBu0u7Hw/fwG3Ma0Mxu/9F2PO671ZjGp2zHGSvxznLDbO0jK8BZn9PDczXd46GotmNEQ==
X-Received: by 2002:a17:907:6d0b:b0:ad8:91e4:a92b with SMTP id a640c23a62f3a-ae3dd5f1f11mr323693166b.30.1751555721473;
        Thu, 03 Jul 2025 08:15:21 -0700 (PDT)
Received: from elitebook ([93.159.20.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bcd7sm1245431666b.121.2025.07.03.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:15:21 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: michalwsieron@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Add relative path from B to S to
 DEBUG_PREFIX_MAP
Date: Thu,  3 Jul 2025 17:14:51 +0200
Message-ID: <20250703151450.196797-2-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <873ee72d2286c43d56fae9b6de218c9c4a472bd5.camel@linuxfoundation.org>
References: <873ee72d2286c43d56fae9b6de218c9c4a472bd5.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 15:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219890

> This worries me a bit since going from memory when we originally=0D
> implemented this, the use of relative paths shouldn't matter, gcc and=0D
> other users of file-prefix-map should canonicalise paths before making=0D
> comparisons. If it doesn't do that, there are so many combinations, it=0D
> doesn't make sense. As such, I think the bug is elsewhere and we=0D
> shouldn't apply this patch but root cause it...=0D
=0D
I did a test build outside of Yocto to make sure I am not imagining=0D
things.=0D
=0D
meson.build:=0D
    project('hello', 'c')=0D
=0D
    map_to =3D '/usr/src/debug/hello/1.0'=0D
=0D
    executable('hello', 'hello.c', c_args: [=0D
      '-fmacro-prefix-map=3D' + meson.project_source_root() + '=3D' + map_t=
o,=0D
      '-fdebug-prefix-map=3D' + meson.project_source_root() + '=3D' + map_t=
o,=0D
      '-ffile-prefix-map=3D'  + meson.project_source_root() + '=3D' + map_t=
o,=0D
      '-fmacro-prefix-map=3D' + meson.project_build_root()  + '=3D' + map_t=
o,=0D
      '-fdebug-prefix-map=3D' + meson.project_build_root()  + '=3D' + map_t=
o,=0D
      '-ffile-prefix-map=3D'  + meson.project_build_root()  + '=3D' + map_t=
o,=0D
    ])=0D
=0D
hello.c:=0D
    #include <stdio.h>=0D
=0D
    int main() {=0D
        printf("Hello, world!\n");=0D
        return 0;=0D
    }=0D
=0D
Running dwarfsrcfiles on it I get:=0D
    $ dwarfsrcfiles build/hello=0D
    /usr/src/debug/hello/1.0/../hello.c=0D
        /usr/src/debug/hello/1.0/../hello.c=0D
=0D
Best regards,=0D
Michal=0D

