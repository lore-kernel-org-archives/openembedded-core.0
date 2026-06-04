Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3C1CD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 11:51:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9535.1780573901745824134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 04:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sv1JOCcz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so5410165e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 04:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780573900; x=1781178700; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V69ubSR4+POiPsX8X0lRSNs2E3EONg2vArT+ZKBeDB0=;
        b=Sv1JOCczuRupX5Dvl1CFhgG1MOOx6XnXmmXZaVJOhUeUvytzv0biZuaCTC/IPx196b
         pKym1rKMOk4hlJM8K91IPW/OxJpIx0YQUIBUFsIXCf0O3N9jKacsVcyznrSF4T+jWp4q
         +mcv5qS42CJuWbWAUVWmCgLZIQhCzsw8i31mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573900; x=1781178700;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V69ubSR4+POiPsX8X0lRSNs2E3EONg2vArT+ZKBeDB0=;
        b=WaKB8G8eBQ7mQkIue7GgmxFMDRe1flXshADi9UcotF2RpzmxBzbOZllyKLrIhduMJn
         lnih4koHUTgDS3R6ISg1AVTREC+OPi8q1X7lWyq/qVqxwbJFjBIROPNdE3tLBMHNYZUf
         6VXXgkzRS0xnGVpS5cHcmp6CnrHIgU3u834CURTvgW8jeNzpRAx4TkFZoY9Lg3W//v/c
         Fbj8kdDa6yoNQv9WCbOpcgDiZqt4US76+As/lfwdkCN8X+8kC5CVtwZ82mpvclFcqI25
         hGnlf0Z2N6vWxjWfqVFnX1H12IIy5YT2Po0bxcZHxoO96hvS7NCQ8h299qWhWLodxwzL
         zAYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Cx2EVUk1BHMkgvcEyOFy7KigU5qqHTtRwy56x7bEJQ+U46Zp/aykrGJJoaZEuLK1NQUdE+jlEOqvkN4P1+Vf5LA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxpZ6efpVis93FPZ9bopWz/GR7Wum5nM2o1JEQOzlT+xmqoc3mi
	ig+953isB8Yb7P4tqzDl7TCnA5ukd5ayu6oEhrfUgC3j+adBF3HI+eum7JJUM3pXnT0=
X-Gm-Gg: Acq92OHkCLsb8i4vF4n7sWK0t/UHzExBQXYUC4I1Q2orA2GHu8Uob6WUtio7maWR+9D
	a/xOMMKLcksmEebdwYsfBSgAXwza4yeCQmJdDuKltH//E54bULy4SDKrMENGQa8eXVP5nDzgqRC
	Bw3OpgaYxDLu9fhL3E4VjngKQvfFgQyOY0zzn8Bq5xOHOV0KdHG0lxnncTKCKYU3Hdw52XTGcHp
	Xz0f28Ukjl6yf9CgW7c53GUoRsWcLzc8E+zYq7RDG7lfrHCqh7oEM4XUNkmtrDDOeK54K+jcFEt
	gz3mrMrOGSR02fvXtfLPEXUkvbzJMHuNSsXSiQ1kVUPm8uh6Qe2QzveMTB2V+7dVr8wRygTlVrE
	jJDOFAmbiorA/3ScXfjgHeBEPw4Lr0ubfkdXKwkNQdrqMelFGpIW7i9ywyJur3cXW7Jzxrl59rn
	OsV03b6YOJfxhI1cRgoNbZbXzYCJZqT2gsg7rArryvN8rkKz0xoLVBI7zhhSb6JSejdNnBf+w46
	DNaKp7to6nKsnU6cB12FSxF748=
X-Received: by 2002:a05:600c:190e:b0:490:5321:2466 with SMTP id 5b1f17b1804b1-490b5ecd81bmr121000885e9.20.1780573900012;
        Thu, 04 Jun 2026 04:51:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eed3:d0ae:8f44:9e49? ([2001:8b0:aba:5f3c:eed3:d0ae:8f44:9e49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm71972255e9.9.2026.06.04.04.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 04:51:39 -0700 (PDT)
Message-ID: <1c7bf23761ea003b4029b3271a7dbb5e877d7246.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] oe/package: add unit tests for kernel
 module detection helpers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sam.john.kent@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 04 Jun 2026 12:51:37 +0100
In-Reply-To: <20260428081046.1660101-3-sam.john.kent@gmail.com>
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
	 <20260428081046.1660101-3-sam.john.kent@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 11:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238129

On Tue, 2026-04-28 at 09:10 +0100, Sam Kent via lists.openembedded.org wrot=
e:
> Add unit tests for the filename pre-filter logic, is_kernel_module(),
> and the is_kernel_module_signed() detection.
>=20
> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> ---
> =C2=A0meta/lib/oe/tests/__init__.py=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 0
> =C2=A0meta/lib/oe/tests/test_package.py | 121 +++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 121 insertions(+)
> =C2=A0create mode 100644 meta/lib/oe/tests/__init__.py
> =C2=A0create mode 100644 meta/lib/oe/tests/test_package.py
>=20
> +class TestIsKernelModule(unittest.TestCase):
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 is_kernel_module() detects kernel modules by searchin=
g for the
> +=C2=A0=C2=A0=C2=A0 "vermagic=3D" string, which is always present in genu=
ine .ko files.
> +=C2=A0=C2=A0=C2=A0 """
> +
> +=C2=A0=C2=A0=C2=A0 def _make_tmp(self, content: bytes) -> str:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f =3D tempfile.NamedTemporary=
File(delete=3DFalse, suffix=3D".ko")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.write(content)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.close()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return f.name
> +
> +=C2=A0=C2=A0=C2=A0 def tearDown(self):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Clean up any temp files cre=
ated during the test.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for attr in ("_tmpfile",):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path =
=3D getattr(self, attr, None)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if pa=
th and os.path.exists(path):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 os.unlink(path)
> +
> +=C2=A0=C2=A0=C2=A0 def test_detects_vermagic(self):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._tmpfile =3D self._make_=
tmp(b"\x7fELF\x00" * 10 + b"vermagic=3D5.15.0" + b"\x00" * 10)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertTrue(is_kernel_mod=
ule(self._tmpfile))
> +
> +=C2=A0=C2=A0=C2=A0 def test_rejects_plain_elf(self):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._tmpfile =3D self._make_=
tmp(b"\x7fELF\x00" * 50)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertFalse(is_kernel_mo=
dule(self._tmpfile))

Sorry about the delay in replying to this, I think we were all confused
about who was going to do it!

The code above is a little bit more complex than it needs to be. It can
be simplified to something like:

with NamedTemporaryFile(suffix=3D".ko") as f:
    f.write(b"\x7fELF\x00" * 10 + b"vermagic=3D5.15.0" + b"\x00" * 10)
    self.assertTrue(is_kernel_module(f.name))

which will self clean up. Could you make that tweak, then we should be
able to merge, thanks!

Cheers,

Richard


