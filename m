Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB25E6781A
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:33:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87108.1766432002123990940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EbFtNJHB;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8bc53dae8c2so644843085a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766432001; x=1767036801; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nciOqWpoeaeL/1GUg/xG77u/HjoE9GnVbWgsow4S8tk=;
        b=EbFtNJHB0kBYJMDqjhoEgoLXlxTFKtA04GXyVMs66Al4BbFWg2kuAkpLPK2wIJP7y7
         aZ3u/SgBeVs+GgQeABOuG0f8Jk+Pf1HbpqGmACDb+rQX+ZkPYekrEDxKejYjP6b+x2Fu
         ir9euf2rAb3YFXKBVMFXPMdIgw0mhqVtp0O0Vtu7URqwsFEHfBhQH45VLdO6Fwb6CoaO
         SCX3NWfzwgDZRWImAxrGl6ljT1gDbjk1JKUZ5wi1S9sOi8FG7ba50AKlZIFgMunWthF5
         MY2/sWeBDb6/OZExl7SPRBiBfglsTBxFUJxknqPD54a5xSJ1etEOWBpWWXqjjBfkaaVn
         I9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766432001; x=1767036801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nciOqWpoeaeL/1GUg/xG77u/HjoE9GnVbWgsow4S8tk=;
        b=bC1FesL9dWnbA6EoWftm8k4ZHu3LEDMHidOpkILzWFCsN7XSOXe6TMilLqRsrLiBp4
         DZyaozxMua4QbKbyknhZrxuO1XSKOSyFPYwUE+lkKiMRjnUTYg51AhRJfFgzYuiP2lwX
         pFg4mEv2Ju5Wom6+mMfhC/eOUw7wuIC7ikqOnzKbJdwncyzBmF21Ux1hSgEBLgdqCIVy
         MEmzyvFQL65s/lF1QirQTxoSgzgotm1lsDAFfYHcv36chFmwh8CEVeKw6DzgYH8uuV4w
         /We0vSqDb4Eo30haaLG2TlG+66pJ2+4ir9Tnlq3T0NTANI1vEL9TAnrUPHBhzlL7ZuXr
         BHVw==
X-Forwarded-Encrypted: i=1; AJvYcCUj8z1apKAVmCNqAyHTEAvRjYerXRs8L6Vp9jjIWJO68JnmHrIN8blUh+0Os0SkWPL+A0QyU8usRkoltj/aYG7V+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YweTILMyJOSq036bpuKV1Cg76JJGO3dqJbKjVppN8lyK+ISMcEE
	JQLhxUJWia397XViDvmvzlLP00IsZN2Qs+/0Zb58kmTANaD5JNngLSEUY85qKFY/KVweMWyTYgS
	XYkR+5ThyDCVkchjK9YW7Iin/2FUfkEQ=
X-Gm-Gg: AY/fxX7sUEYeFoTB/J6N2UgK23Q6fOlZ0H5F5vuXinghAk0frxJPCFYakfLr+XbB5VN
	noxcdGt71Xiet/Ixx0jFUEHdLYvKOavEFKY7JF9TvgqRbanY4WvUjzSGCcImD/pbjAaW1algHmM
	4O8RQ2lTXKyEBpuVjjtza/ifLJxa0JTzaWHq8WzrRrDkrLI5dWu/srF0FrItkoRldfM2Gy6o46E
	mYV0zuCOe6rDRyx3e8wNXN2zuZt0fVVwzI1HerJH2XfeX6T2ubFQEwDo1VpPORIJMFXpms5DSsr
	PUY3
X-Google-Smtp-Source: AGHT+IEBqo/mTw8og8AfogABCpNrjA33/blEZlmLyrIqdHx8tnPNqg3k9DACr6OUMGDYYVYyxzyuccs/lbB7mXbSdIQ=
X-Received: by 2002:a05:620a:1901:b0:8b2:6ac7:aa4f with SMTP id
 af79cd13be357-8c08fd048a8mr1825268285a.68.1766432001080; Mon, 22 Dec 2025
 11:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20251219134734.842422-1-tgamblin@baylibre.com>
 <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com> <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
In-Reply-To: <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Dec 2025 20:33:09 +0100
X-Gm-Features: AQt7F2pm36BNtu7uiqqtli-RENiUnXyVYzYZDzMULkdBkXu0sMhxNYVaBFmlvHM
Message-ID: <CANNYZj9+DPHLoWUsNngX12JwA1ZntaVrRmyyOMqiH7mN_5_E6Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
To: tgamblin@baylibre.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 19:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228323

On Mon, 22 Dec 2025 at 19:36, Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
> > Testing 'maturin develop' requires Rust cross-canadian in the SDK
> > Traceback (most recent call last):
> >    File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-=
core/meta/lib/oeqa/sdk/cases/maturin.py", line 30, in test_maturin_list_pyt=
hon
> >      self.assertIn(expected, output)
> >      ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
> > AssertionError: '3.14 at /srv/pokybuild/yocto-worker/qemux86/build/buil=
d/tmp/work/qemux86-poky-linux/core-image-minimal/1.0/testsdkext/buildtools/=
sysroots/x86_64-pokysdk-linux/usr/bin/python3' not found in '=F0=9F=90=8D 1=
 python interpreter found:\n - CPython 3.13 at /srv/pokybuild/yocto-worker/=
qemux86/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3.13\n=
'
> > ...
> > RESULTS - maturin.MaturinTest.test_maturin_list_python: FAILED (3.57s)
> I'm not sure how to address this one - it looks like the problem is that
> the buildtools tarball has a 3.13.4 binary in it (at least when I try
> locally). Where does that get updated?

I think the problem is not in the buildtools. This is the test:

    def test_maturin_list_python(self):
        out =3D self._run(r"""python3 -c 'import sys;
print(f"{sys.executable}\n{sys.version_info.major}.{sys.version_info.minor}=
")'""")
        executable, version =3D out.splitlines()

        output =3D self._run("maturin list-python")
        # The output looks like this:
        # - CPython 3.13 at /usr/bin/python3
        # We don't want to assume CPython so just check for the
version and path.
        expected =3D f"{version} at {executable}"
        self.assertIn(expected, output)

So first 'python3' executable from the SDK reports its version (which
says 3.14 as it should be). Then 'maturin list-python' runs, and for
some reason it falls through to (or is executed with) earlier python3
from the buildtools on the host, which doesn't seem correct, as
maturin should be run by python3 from the SDK, and report that.

I also wonder why this hasn't been seen previously, as build hosts
have all kinds of python versions installed. CC Ross, Tim.

Alex

