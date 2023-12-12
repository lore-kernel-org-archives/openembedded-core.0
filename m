Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F75C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 22:57:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.10579.1702421827768966245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 14:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pg8z4mk0;
 spf=pass (domain: linaro.org, ip: 209.85.221.49, mailfrom: alex.bennee@linaro.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33634d2e059so831243f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702421826; x=1703026626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt6tJiIM7qrIUYxhqYLddwUbjwUxr8YJALWBVfiOSD4=;
        b=pg8z4mk0cXdll8AO602PLgWDNbUMd8MKvNz4vtvRjmxDB4/Yr1fuuaK75PU5NLKueD
         bOpX7OQsN0QoTVIicEhi6Jr751zxElvuBGhGPkufYFnRvAdC0KQM6G6V5DLfQ6YH5Bv/
         gfAvm0U87QtRitk03SQzgAzJ4tEi5YtZO6iFUWl96i6JMGoGNbNhAJ9oBtO3Ug4t2xv0
         a3xk1REe8eEfykn7vRccGGz4UddrWKXuKM4WS85el5v0GX9UJxk7EkQJJxzJKhQ33Qib
         zSNTtZ0Fpgp6MgLmyB0iS2pGjaX3R/R3dyzh/xmn9BQEVzeRgDaJRdXBzs9iu1iqw82C
         uFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702421826; x=1703026626;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yt6tJiIM7qrIUYxhqYLddwUbjwUxr8YJALWBVfiOSD4=;
        b=l2rB88MWZBsOEFu7sxKlBtBT2KXY6VG+wYqDChgiXBDV7FCpMMb5yIbGtIWVzEVNw2
         rLPLf9PS0ZKY5wSbBLZMoqScZABBK206ui43tZmg8BPLoRrqbp1bg4dTIQYFd4nb9L5l
         xS0qKqSRRae3UcqC5tF+OBDcx6LbPXizQ6Ikt1PN2sQPBQXtOrvk+idam55nW4nwif1k
         Ls65wEd8pSFHIXQJW8qF5rzomh7ScnEdKDYU0MD/l0kYelOValB+ogbyYhZZVabGYxTX
         BruumnNXJlHH62ebPSObrAIigC/nA+y1jIckuprPXmdVdLNGPxWepJJmpm1IbpEdgLRw
         N9qg==
X-Gm-Message-State: AOJu0YzzxjCSE0Hswv6R/w9OUNyNBl45TJFNGMVXsYaxYKSBLRqQgx7E
	6sN++ueC07e0fadSn/R2jORcqA==
X-Google-Smtp-Source: AGHT+IHofKA6JmE/fKJGqRDpm9EN9Gi9R1JVed63QBNmbFwQC9W9IfAtnGdy7DG6tkHentWsSI8Aog==
X-Received: by 2002:a5d:6203:0:b0:333:2fd2:51d0 with SMTP id y3-20020a5d6203000000b003332fd251d0mr2910857wru.73.1702421826153;
        Tue, 12 Dec 2023 14:57:06 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e16-20020adfa450000000b003332febec90sm11912594wra.7.2023.12.12.14.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:57:05 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 68FE45F7A0;
	Tue, 12 Dec 2023 22:57:05 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
  richard.purdie@linuxfoundation.org,  alexandre.belloni@bootlin.com,
  Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [OE-core] [RFC PATCH v2] qemurunner.py: continue to drain
 stdout after login:
In-Reply-To: <CAMKF1soweYSeFZ6f-bw7RBDuXyORHOb244YsgpcqzuH47vkbTA@mail.gmail.com>
	(Khem Raj's message of "Tue, 12 Dec 2023 11:43:24 -0800")
References: <20231211155729.106010-1-alex.bennee@linaro.org>
	<CAMKF1spkcbVQj=Mvv37TRnMWEcF5BuEjUYYnOmHmfrQkOqzo1g@mail.gmail.com>
	<87fs07b6g3.fsf@draig.linaro.org>
	<CAMKF1soweYSeFZ6f-bw7RBDuXyORHOb244YsgpcqzuH47vkbTA@mail.gmail.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Tue, 12 Dec 2023 22:57:05 +0000
Message-ID: <874jgnav26.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 22:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192252

Khem Raj <raj.khem@gmail.com> writes:

> I am on arch so no py-bt with gdb out of box but here is bt
>
> #0  0x00007fa1e54ee367 in wait4 () from
> /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #1  0x00007fa1e5a858b9 in ?? () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #2  0x00007fa1e598e94a in ?? () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #3  0x00007fa1e594bf03 in PyObject_Vectorcall () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #4  0x00007fa1e5900063 in _PyEval_EvalFrameDefault () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #5  0x00007fa1e5a1da40 in ?? () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #6  0x00007fa1e5a1daf5 in PyEval_EvalCode () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #7  0x00007fa1e5a5deb3 in ?? () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #8  0x00007fa1e5a5e0d6 in ?? () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #9  0x00007fa1e5a5e1b0 in ?? () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #10 0x00007fa1e5a60b9b in _PyRun_SimpleFileObject () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #11 0x00007fa1e5a6111c in _PyRun_AnyFileObject () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #12 0x00007fa1e5a7ddf0 in Py_RunMain () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #13 0x00007fa1e5a7e32a in Py_BytesMain () from
> /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-ptest-gs=
treamer1.0/1.0/recipe-sysroot-native/usr/bin/python3-native/../../lib/libpy=
thon3.11.so.1.0
> #14 0x00007fa1e5423efb in __libc_start_call_main () from
> /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #15 0x00007fa1e5423fb9 in __libc_start_main () from
> /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #16 0x00005581e2c53075 in _start ()
>
> since its using native libs and bins there is no debug info perhaps
> due to it being stripped and not kept around as well.

No - it won't work without debug symbols to poke around in pythons
runtime. Can you share the log?

Do you see anything from:

                    self.logger.warning('Extra log data read: %s\n' % (data=
.decode('utf-8', errors=3D'backslashreplace')))
                except Exception as e:
                    self.logger.warning('Extra log data exception %s' % rep=
r(e))


maybe we should have a: self.stop_thread() once we catch the exception?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

