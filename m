Return-Path: <ines.kchelfi@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77C7C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:00:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.52672.1747062049182822062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 08:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z/t5CDJy;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so52382415e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747062047; x=1747666847; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VjTQplolnll+dwIeMAsxLhSJxsXAODtv7aG9kYNOTsk=;
        b=z/t5CDJy6dKHfjd1w7NHgcRdY1f7r+zULH0eix+pIDEKBfRjzAmjOdbKA4C50pxB85
         MRgjSjbTz9ojogBD2Ztlu/cW1xq54KgTDNOwnfjpGyQDLTDqb19JIlTVYC0xdhSFiZJg
         mbhOq2W+rOKv7T9w5auQILFePOeLo7BXYpjyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062047; x=1747666847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjTQplolnll+dwIeMAsxLhSJxsXAODtv7aG9kYNOTsk=;
        b=TfZrS0ohQ+H3sQInmXwlxy/NT0xY90qGHpgw5i+hkgOih4wIQ8vyUAFdSRgS/K3lzw
         SlB1EaPYRIkhfrpSQmspAmNWRygFwoWwLnRL9ULRb2M+4+EXpTSQ9ndOexKVnd76PMyn
         c6BY8caM1AoQLkS6pcWptDgnRaKqqrZKTzoYz1sGIRWtiX4NOBHUFY6cwb5hmr/3GQ/E
         EjOPA5YXwhC4oZUR8Ft3JNYdRWy1c+wvBKpLpVO0TNAyj/f+/zUsOpXcv2r7KqXlyqwy
         IBURgNd6i6CaH/dW0qajy/vkwvB/Umvb9iwOIUeDqEACBUCeP6tQAOUw7Dz6dUz+Q9sJ
         vzBQ==
X-Gm-Message-State: AOJu0Ywr4eOVtD71hB7/gDiw23x0mqY2ymI97iQvBfu4h2kRdnyKCuZC
	fv46rRmXZT9GroKmEFuhQcO4F3VSC2BAiV6XgtvEWQsTRS/GRyUNX87f67aUb925o5AScUhLcKE
	zVojAffBzFg/mwA1IRXzlV9YuDNH89YQSio5jYA==
X-Gm-Gg: ASbGnctDqy8EN5zRb8TEcg/WCh1vSZUXEYjFKljzGbjj4LdTWtZ1au6odi8tGalCLT8
	RojXV6DFQSBlk46qIfqgVfSWtU/53V1z338Iv5rXZF0YWAXqjLN3y+dFRyRTzv/PUrnSv9OuGwr
	gteTco+9B27isTH7fPvOXvL0UKIhwGElOg4JI=
X-Google-Smtp-Source: AGHT+IG/HCa/Nyz2vcoazuQSU2L5SsmZOekrMmhD5RZa+jCQiwGbFQAdF037F7IJSKvJskI0IenOGWPwhD9/YhBwT74=
X-Received: by 2002:a05:6000:2502:b0:3a0:aed9:e39 with SMTP id
 ffacd0b85a97d-3a1f646c6e3mr11143173f8f.28.1747062045638; Mon, 12 May 2025
 08:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250505101642.9255-2-ines.kchelfi@smile.fr> <D9OVH2DTYGL9.1DVFL0W5QGKWH@bootlin.com>
In-Reply-To: <D9OVH2DTYGL9.1DVFL0W5QGKWH@bootlin.com>
From: Ines KCHELFI <ines.kchelfi@smile.fr>
Date: Mon, 12 May 2025 17:00:00 +0200
X-Gm-Features: AX0GCFsvvYZoKJJgbbUlql0PuOhzfKeyQMwPXP50TA8gUOAZ5b_-2TI8skgIkdE
Message-ID: <CAKR05QPxN0=N5e3dpL83m9rNFM51xNRpStWRJ-us0u5eHiOpzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm-sequoia: add ptest
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a194130634f194c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 15:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216374

--000000000000a194130634f194c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks again for reporting the bug. I was able to reproduce it, and I=E2=80=
=99ve
just submitted a second version of the patch to address it.
You can find it here:
https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_2_ptest=
_cargo/113071573
With this patch applied, the issue should be resolved as confirmed by the
following test results:

Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 624648.19

tput: No value for $TERM and no -T specified

RESULTS:
RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.69s)
RESULTS - ping.PingTest.test_ping: PASSED (0.02s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (0.56s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (0.59s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED
(0.00s)
SUMMARY:
core-image-ptest-rpm-sequoia () - Ran 6 tests in 3.870s
core-image-ptest-rpm-sequoia - OK - All required tests passed (successes=3D=
4,
skipped=3D1, failures=3D0, errors=3D0)
NOTE: Tasks Summary: Attempted 1442 tasks of which 1441 didn't need to be
rerun and all succeeded.

Best regards
Ines

On Tue, May 6, 2025 at 8:43=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Mon May 5, 2025 at 12:16 PM CEST, ines.kchelfi via
> lists.openembedded.org wrote:
> > From: Ines KCHELFI <ines.kchelfi@smile.fr>
> >
> > In rpm-sequoia, some default paths in test code (OUT_DIR,
> > CARGO_MANIFEST_DIR) are invalid at runtime and cause test failures.
> >
> > To fix this, patch the test code (symbols.rs) to support overriding
> these
> > paths via optional environment variables: FORCE_RUNTIME_PATH_LIB and
> > FORCE_RUNTIME_PATH_SRC.
> >
> > Also patch the libray name to match what is installed.
> >
> > Tests take less than a second so this is added to PTEST_FAST.
> >
> > ptest result:
> > |root@qemux86-64:~# ptest-runner rpm-sequoia
> > |START: ptest-runner
> > |2025-05-02T15:57
> > |BEGIN: /usr/lib/rpm-sequoia/ptest
> > |
> > |running 1 test
> > |test symbols ... ok
> > |
> > |test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered
> out; finished in 0.00s
> > |
> > |
> > |running 2 tests
> > |test tests::merge_certs_mismatch ... ok
> > |test tests::merge_certs ... ok
> > |
> > |test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered
> out; finished in 0.01s
> > |
> > |DURATION: 0
> > |END: /usr/lib/rpm-sequoia/ptest
> > |2025-05-02T15:57
> > |STOP: ptest-runner
> > |TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
> > ---
>
> Hi Ines,
>
> Thanks for your patch.
>
> It looks like some of these ptests are not running correctly on the
> autobuilder:
>
> WARNING: core-image-ptest-rpm-sequoia-1.0-r0 do_testimage: There were
> failing ptests.
> Traceback (most recent call last):
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/core/dec=
orator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/core/dec=
orator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/core/dec=
orator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/runtime/=
cases/ptest.py",
> line 27, in test_ptestrunner_expectfail
>     self.do_ptestrunner()
>   File
> "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/runtime/=
cases/ptest.py",
> line 120, in do_ptestrunner
>     self.fail(failmsg)
> AssertionError:
> ptests which had no test results:
> ['rpm-sequoia']
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1434
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1437
>
> Details about the ptests can be found in:
>
>
> https://valkyrie.yocto.io/pub/non-release/20250505-91/testresults/qemuarm=
64-ptest/core-image-ptest-rpm-sequoia/
>
> https://valkyrie.yocto.io/pub/non-release/20250505-91/testresults/qemux86=
-64-ptest/core-image-ptest-rpm-sequoia/
>
> Can you have a look at the issue please?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000a194130634f194c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mathieu,<br><br>Thanks again for reporting the bug. I w=
as able to reproduce it, and I=E2=80=99ve just submitted a second version o=
f the patch to address it.<br>You can find it here:=C2=A0<a href=3D"https:/=
/lists.openembedded.org/g/openembedded-core/topic/patch_v2_2_2_ptest_cargo/=
113071573">https://lists.openembedded.org/g/openembedded-core/topic/patch_v=
2_2_2_ptest_cargo/113071573</a><br>With this patch applied, the issue shoul=
d be resolved as confirmed by the following test results:<br><br>Output fro=
m runqemu:<br>runqemu - INFO - Received signal: 15<br>runqemu - INFO - Clea=
ning up<br>runqemu - INFO - Host uptime: 624648.19<br><br>tput: No value fo=
r $TERM and no -T specified<br><br>RESULTS:<br>RESULTS - parselogs.ParseLog=
sTest.test_get_context: PASSED (0.00s)<br>RESULTS - parselogs.ParseLogsTest=
.test_parselogs: PASSED (2.69s)<br>RESULTS - ping.PingTest.test_ping: PASSE=
D (0.02s)<br>RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: P=
ASSED (0.56s)<br>RESULTS - ssh.SSHTest.test_ssh: PASSED (0.59s)<br>RESULTS =
- ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)<br>=
SUMMARY:<br>core-image-ptest-rpm-sequoia () - Ran 6 tests in 3.870s<br>core=
-image-ptest-rpm-sequoia - OK - All required tests passed (successes=3D4, s=
kipped=3D1, failures=3D0, errors=3D0)<br>NOTE: Tasks Summary: Attempted 144=
2 tasks of which 1441 didn&#39;t need to be rerun and all succeeded.<br><br=
>Best regards<br>Ines</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 6, 2025 at 8:43=E2=
=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@=
bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Mon May 5, 2025 at 12:16 P=
M CEST, ines.kchelfi via <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Ines KCHELFI &lt;<a href=3D"mailto:ines.kchelfi@smile.fr" target=
=3D"_blank">ines.kchelfi@smile.fr</a>&gt;<br>
&gt;<br>
&gt; In rpm-sequoia, some default paths in test code (OUT_DIR,<br>
&gt; CARGO_MANIFEST_DIR) are invalid at runtime and cause test failures.<br=
>
&gt;<br>
&gt; To fix this, patch the test code (<a href=3D"http://symbols.rs" rel=3D=
"noreferrer" target=3D"_blank">symbols.rs</a>) to support overriding these<=
br>
&gt; paths via optional environment variables: FORCE_RUNTIME_PATH_LIB and<b=
r>
&gt; FORCE_RUNTIME_PATH_SRC.<br>
&gt;<br>
&gt; Also patch the libray name to match what is installed.<br>
&gt;<br>
&gt; Tests take less than a second so this is added to PTEST_FAST.<br>
&gt;<br>
&gt; ptest result:<br>
&gt; |root@qemux86-64:~# ptest-runner rpm-sequoia<br>
&gt; |START: ptest-runner<br>
&gt; |2025-05-02T15:57<br>
&gt; |BEGIN: /usr/lib/rpm-sequoia/ptest<br>
&gt; |<br>
&gt; |running 1 test<br>
&gt; |test symbols ... ok<br>
&gt; |<br>
&gt; |test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtere=
d out; finished in 0.00s<br>
&gt; |<br>
&gt; |<br>
&gt; |running 2 tests<br>
&gt; |test tests::merge_certs_mismatch ... ok<br>
&gt; |test tests::merge_certs ... ok<br>
&gt; |<br>
&gt; |test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtere=
d out; finished in 0.01s<br>
&gt; |<br>
&gt; |DURATION: 0<br>
&gt; |END: /usr/lib/rpm-sequoia/ptest<br>
&gt; |2025-05-02T15:57<br>
&gt; |STOP: ptest-runner<br>
&gt; |TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; Signed-off-by: Ines KCHELFI &lt;<a href=3D"mailto:ines.kchelfi@smile.f=
r" target=3D"_blank">ines.kchelfi@smile.fr</a>&gt;<br>
&gt; ---<br>
<br>
Hi Ines,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like some of these ptests are not running correctly on the autobui=
lder:<br>
<br>
WARNING: core-image-ptest-rpm-sequoia-1.0-r0 do_testimage: There were faili=
ng ptests.<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/runtime/cases/ptest.py&quot;, line 27, in test_ptestrunner_expectfai=
l<br>
=C2=A0 =C2=A0 self.do_ptestrunner()<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/li=
b/oeqa/runtime/cases/ptest.py&quot;, line 120, in do_ptestrunner<br>
=C2=A0 =C2=A0 self.fail(failmsg)<br>
AssertionError:<br>
ptests which had no test results:<br>
[&#39;rpm-sequoia&#39;]<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/1434" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/61/builds/1434</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/1437" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/73/builds/1437</a><br>
<br>
Details about the ptests can be found in:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20250505-91/testresult=
s/qemuarm64-ptest/core-image-ptest-rpm-sequoia/" rel=3D"noreferrer" target=
=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20250505-91/testresul=
ts/qemuarm64-ptest/core-image-ptest-rpm-sequoia/</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20250505-91/testresult=
s/qemux86-64-ptest/core-image-ptest-rpm-sequoia/" rel=3D"noreferrer" target=
=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20250505-91/testresul=
ts/qemux86-64-ptest/core-image-ptest-rpm-sequoia/</a><br>
<br>
Can you have a look at the issue please?<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000a194130634f194c9--

