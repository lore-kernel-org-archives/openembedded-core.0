Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C400D29C35
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 14:39:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35964.1768833578738440238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 06:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ujud5/VX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso39970405e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 06:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768833577; x=1769438377; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x9LIQUM5ia8FatoV8Wv8T/JJaem6SigKuPppiCVF+js=;
        b=Ujud5/VXhxNoJs9Tid6RklnLwVixZuw0doZlORfOgIQheZolUxFN5KQ9DTdlaoezGY
         8Zq4iwRMEd3kwv77kpMlauGNiwTpZ8N9kj18D39MIoynjDH5qyVNHrKJ8V+/1soyvdO9
         2N8lebu3pNkufaYIlBrAzud5mcDuNI2cTbadE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833577; x=1769438377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9LIQUM5ia8FatoV8Wv8T/JJaem6SigKuPppiCVF+js=;
        b=JXL/Nae8Bq2oCfx2QQg7go7DAtJxk33ABex9BtzyI5/0Waqnmw1x1dgkUKP9dsKtjK
         4atlkr0HpXyZd1GV0Id8/Pv2NnYbuazDdZU6YJdRuhx3mtZow/XmT1kYtPpTbzT53JaB
         vN39dLc7jIda0O13tz5OYVJjLHjmmjZTC7dwc4Qtk5hSoXdm+JIzfbHytxlOEuLU7uqU
         CKFV+do2GSolhuRMenwlAYDvnGZtF9oki0ITIbwOGQmZ1gp46xpOlX7tzOgHFftq+vfw
         zKOMRX3uEfw0JeX1MmDaVZ8F9wBJ+D0kDl/THICVXraz6GtkdJcQj64ECr3mwrgqcv2V
         NLmA==
X-Forwarded-Encrypted: i=1; AJvYcCXmhORaNGwVGOo2Vhc91sHnXKRUAOf66ShvtpK7ShBszzgfRvlpDaSOrSOcqKBlyRxCVcGdRAKSIfTBqwnoF0Kgyw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyOwlPyMqh8gXS1pIayAS518e2TGe3LTvAcpEH9XmFYZCx5VcSk
	/CRqED5sTwM2IkS9fV8nnfB+7oA4sBKd8hmJazTg1wF5dQeLq9op0b6TJoHhx7O/GCoc+96fuu4
	ejWa3i+4=
X-Gm-Gg: AY/fxX5PwOLr5xx6/CZ1jLmD1qEh+0Zb14Z7/MQJztjhoCkE+N2a4Gaa0lfxDgyF20/
	KdqsmC0bxUpThHoS0PU6ZKfkSOKqT6tFyYUvi9k8l5d2PnR3uBO/0/RmZAwX1KwE7btj05dpVzr
	DQmUm+u47tAfAZYFcQjAP1ruE+ZnXrgZCX0/DIp62g3ttOUpW/9tBPvs69QWaEjN2jVTa4uOf3L
	+fTXnDBwkm8fpERRIIOsy0kzmYZ5WQfIfhrxZa033hPnML6OE1gDc8B9OAXFaEuxaBPtH4+tbDq
	QNY1H8FZmgSUSJgR755b51okpYCBjBvbSmuMgBlCtxgsewWr+jqJK3L+5dyhPp7JbwC0HwSJGjF
	NLowoyebuOBIKYsNt33KYZooGS4Jw9aBznKYZk33m3EkgJU379Swfi1BDXqFpeR/tPTmXnkT61S
	PUpSIP0DrAJ1yCmErmWX/2JzKTzwhoABhdx2hK4bdAm1QELxy3UBnjsB5dsNJz6us4zXK7DGFsU
	P0=
X-Received: by 2002:a05:600c:3495:b0:477:639d:bca2 with SMTP id 5b1f17b1804b1-4801eaadbd9mr126735915e9.4.1768833577028;
        Mon, 19 Jan 2026 06:39:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cb0:ccc0:c4cf:d0a1? ([2001:8b0:aba:5f3c:7cb0:ccc0:c4cf:d0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9434d9sm89413835e9.0.2026.01.19.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:39:36 -0800 (PST)
Message-ID: <2e9127c0edb3ddf367f31776094ca23042687212.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: skip flaky test_default_timeout test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jan 2026 14:39:35 +0000
In-Reply-To: <20260119-skip-python3-test-default-timeout-v1-1-e15fce4cb867@bootlin.com>
References: 
	<20260119-skip-python3-test-default-timeout-v1-1-e15fce4cb867@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 14:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229623

On Mon, 2026-01-19 at 15:21 +0100, Antonin Godard via lists.openembedded.or=
g wrote:
> We have been observing intermittent issues with this test on the Autobuil=
der:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15885
>=20
> This is probably due to the Autobuilder being heavily loaded at the time
> of the test.
>=20
> The logs on the ticket above do not allow us to know which of the two
> "test_default_timeout" tests is failing, so disable both with
> self.skipTest().
>=20
> Excerpt from `ptest-runner python3`:
>=20
> =C2=A0 test_default_timeout (test.test_multiprocessing_fork.test_manager.=
WithManagerTestBarrier.test_default_timeout)
> =C2=A0 SKIP: Test the barrier's default timeout 'skip flaky timeout test'
>=20
> [YOCTO #15885]
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> =C2=A0...001-Skip-flaky-test_default_timeout-tests.patch | 49 +++++++++++=
+++++++++++
> =C2=A0meta/recipes-devtools/python/python3_3.13.11.bb=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A02 files changed, 50 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_de=
fault_timeout-tests.patch b/meta/recipes-devtools/python/python3/0001-Skip-=
flaky-test_default_timeout-tests.patch
> new file mode 100644
> index 0000000000..4e1bd833b4
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_t=
imeout-tests.patch
> @@ -0,0 +1,49 @@
> +From baf2dda48e51fcb17a716e52cc5c4e162a6bb7d3 Mon Sep 17 00:00:00 2001
> +From: Antonin Godard <antonin.godard@bootlin.com>
> +Date: Mon, 19 Jan 2026 11:38:36 +0100
> +Subject: [PATCH] Skip flaky test_default_timeout tests
> +
> +We have been observing issues with this test on the Autobuilder:
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15885
> +
> +The logs on the ticket above do not allow us to know which of the two
> +"test_default_timeout" tests is failing, so disable both with
> +self.skipTest().
> +
> +Excerpt from `ptest-runner python3`:
> +
> +=C2=A0 test_default_timeout (test.test_multiprocessing_fork.test_manager=
.WithManagerTestBarrier.test_default_timeout)
> +=C2=A0 SKIP: Test the barrier's default timeout 'skip flaky timeout test=
'
> +
> +Upstream-Status: Inappropriate [OE specific, but might be related to htt=
ps://github.com/python/cpython/issues/129266#issuecomment-2613058866]
> +
> +Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> +---
> + Lib/test/_test_multiprocessing.py | 1 +
> + Lib/test/lock_tests.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multipro=
cessing.py
> +index e8064e7..9ab1f9e 100644
> +--- a/Lib/test/_test_multiprocessing.py
> ++++ b/Lib/test/_test_multiprocessing.py
> +@@ -2259,6 +2259,7 @@ class _TestBarrier(BaseTestCase):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Test the barrier's defa=
ult timeout
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.skipTest('skip flaky ti=
meout test')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 barrier =3D self.Barrie=
r(self.N, timeout=3D0.5)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 results =3D self.DummyL=
ist()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.run_threads(self._=
test_default_timeout_f, (barrier, results))
> +diff --git a/Lib/test/lock_tests.py b/Lib/test/lock_tests.py
> +index 8c8f890..43e9b90 100644
> +--- a/Lib/test/lock_tests.py
> ++++ b/Lib/test/lock_tests.py
> +@@ -1165,6 +1165,7 @@ class BarrierTests(BaseTestCase):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Test the barrier's defa=
ult timeout
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.skipTest('skip flaky ti=
meout test')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeout =3D 0.100
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 barrier =3D self.barrie=
rtype(2, timeout=3Dtimeout)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def f():
> diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recip=
es-devtools/python/python3_3.13.11.bb
> index 2fcfd4aba1..2bc2389b7e 100644
> --- a/meta/recipes-devtools/python/python3_3.13.11.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.11.bb
> @@ -30,6 +30,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-test_active_children-skip-problematic-test.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-test_readline-skip-limited-history-test.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-Skip-flaky-test_default_timeout-tests.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0SRC_URI:append:class-native =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch=C2=A0\

I have the python3.14 upgrade queued in master-next for review so we
may need to test this with the new python version?

Cheers,

Richard

