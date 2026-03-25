Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C56106B52E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:58:55 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21929.1774443531626766636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HGTAHfAn;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad8435f46so5794696d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774443531; cv=none;
        d=google.com; s=arc-20240605;
        b=g9sjWoTuLg7+YJ/cT2J4jZtspAuIOvR3WAIYaGXSTehq3iWwa6UOgy4UIEsl0+peBE
         0qCgCVTvVpBeW6dSdntnJkLVohfWDaj5LbDhyL3D6HfTsWFlIvGLzUtGv99HIXXkhCXU
         waVj1yDWBfOe8inhGkJfwk/WrYVLi3w06JcMsduNRHs6zL1s6jOqOLJJNNnVmqfBvbwB
         ibMIdtwbvt5Uy+qe0hTpBRU48Aq44AgDF/CrqSsjao8L8F1BUqMfJhag9mbDNVtFiLkP
         PiG5D3/3+R0d4CKCyWTRkobfjeBO+Inm+G20P5ruo2479WRGH1DSQ9IVwC3vqq1FQ90r
         kdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6abPrRsty666RLpimb6ESpBVhJDIjn7Fwp58quyohDI=;
        fh=yg9HFI/65n1Nxbxfc79cW9kOSWF6ummo0d6ZzmDjQ68=;
        b=U4PHj8g2IS3kH1MaCOFYG8wju6Md78osyRepfBSEVqj1W1JIYNFOPIWRzAymafMsYD
         h2xvmQKJbmGmNxBocAZWXdyq1QdmyN52Q1WJhUvk6RWouy47R520LnNrICrXbtgGldO7
         Zymwh3D7tHzlgMllr8lcnaNwK0zXahJX21j6BLaxvqE5yQ69Pft+OvGBY/mmTycOBlIF
         RG7/MjfxQZs3MXZaSXZKJ1hDBrqtfc7Zlg8ORryYFwP/Xcv55bs8U3JZ9G+Bjeq8J/e/
         xrFnKTX693V6sNLUVxD2aV9CdmNCR8E+J7qsxERyZFsFNc1Z+sBBXx7+TDTjWDvpB3dN
         OoVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443531; x=1775048331; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6abPrRsty666RLpimb6ESpBVhJDIjn7Fwp58quyohDI=;
        b=HGTAHfAnM9crGOW0oZ1ke9KD19FD2g6IdSFmRoI28lrTxuZUY7I9l/IKoPd3UPoQg5
         aZQY+IAAwJ+pEIgnrDZhID/MqDc6diza3lpc0CaPYWvaE79AE/Dx7dFBxSkb0F3+uO0Z
         2ARDY8R2TP0Uf3+En7op8F8y4zh3W+TSGaivPKcSK66wWxzomkOvvo+KZSgTpCHcwSi5
         947iIPTsILPaL3xBBQFxWKeqAXWJ8464JCP20cDOgLeNF5ZCN8+30EPpdxi8nuNq8qwU
         SH0xY1x+ZkqrTjjDeToMiitYpasTKOnutnuSRhlv/JTCe01Bfnin5XkWwbKfp9QDOnuK
         qgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443531; x=1775048331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6abPrRsty666RLpimb6ESpBVhJDIjn7Fwp58quyohDI=;
        b=Wiznew3a0S9/1B/VwrsUT3oLaxC/DkC0/4pH0Kfq5uqrOq8WFmy34vlBdJDhdwKlQm
         GY8MIHlNalaksxmliic9B1II8j77hXQZ1nSQ1beuPINZ8aJHubY4w3QUgD/Se6nlwOzc
         CdDyNGuFo1frpvvsnVY+yRdn0CwKyNEFHLdXNV4xtB7KvOlGxW+e8B7d/Lhy9wSQWGua
         grT767jJazZJjndJTXiS+R7L8jdj07abp7ZwHgLJPupL2+fKCpWlaeVngyGBRL9Cow0d
         AXEPj46bxhQ0jgB81XxW9VYY+EO4RJmzVHHwpvRaRFZ7lIQ0nCWN/S4LJfquof2htNeY
         HrPA==
X-Gm-Message-State: AOJu0Yz1CHTiCC3T2gGG7ckkFtRt3ulrXwrWAXBMbt6rsSQ2p66eCj2R
	876nndf1iqGvMt5tQPbBYN2ufJDCOOiLEut9rrY1fMLnx4ldWIuxIMYbWnlnd8agR32QwgYhS7t
	xvCOpQ6GXLf/rBLiG2EvCXQnLnGeWz8k=
X-Gm-Gg: ATEYQzwzAupO7GyJjdJdYZiSTMC2sIe7B6J41BMOjxIT7wABjYvMQd5TbaCMWwLSSFO
	0dibqRkhiMz79psS9AVnpneJ2OmjxO1/DiMKyzTqYH7Wk0a7aJvxP1Puf5O/7T7xlbiS/gPcVWW
	2cQnDvtkMQ8rux7pAkSEKkQXIYcRRwkFkkljdy9bKeER/4KpGUZG8tS93sr1Fh7QZrOGNWXyL6w
	yqiCAtmSjTNaMYrzYjKxSj/jQptNWBqg1BhHpDgg19rufdOelPbmAZZAee7sP9AO22g8MENra5o
	8WkTWzPYca3EPisr20MssZnz9b9H3Xdk5Y90/txt
X-Received: by 2002:a53:d017:0:b0:64c:a0c6:da8e with SMTP id
 956f58d0204a3-64ee60ca7dbmr2797542d50.29.1774443530592; Wed, 25 Mar 2026
 05:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260325084021.3915804-1-daniel.turull@ericsson.com> <20260325084021.3915804-2-daniel.turull@ericsson.com>
In-Reply-To: <20260325084021.3915804-2-daniel.turull@ericsson.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2026 08:58:38 -0400
X-Gm-Features: AQROBzAaT0fLtM_pZLtiAZAXS8ToH3B08vEeLtq1Mnp-NtOzu3z1ML1sb84Zurk
Message-ID: <CADkTA4PkenyxfFJR6fvFSpjKV_3MhyChDQZLZ3d5hB7HZbGyOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@est.tech, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000050a36e064dd8d42d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233904

--00000000000050a36e064dd8d42d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 7:07=E2=80=AFAM Daniel Turull via lists.openembedde=
d.org
<daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> runltp has been removed from ltp and kirk is the official tool to
> invoke linux ltp tests.


For something like this to be considered for merging, I'd have expected
a lot more information.

Is the test coverage the same as before ?
What are the results of the tests versus the previous harness ?
Is it truly a drop in replacement for the previous runner ?
.. etc

Switching the executable is the easy part, ensuring that it actually works
a replacement is the hard part.

Bruce



>
>
> See:
>
> https://github.com/linux-test-project/ltp/commit/6efd3605dc005c3ed135b463=
f182174e24bdce1b
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> Assisted-by: Claude, Anthropic
> ---
>  meta/lib/oeqa/runtime/cases/ltp.py        | 16 ++++++-------
>  meta/lib/oeqa/runtime/cases/ltp_stress.py | 16 +++++++++----
>  meta/lib/oeqa/utils/logparser.py          | 29 +++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20260130.bb |  1 +
>  4 files changed, 50 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py
> b/meta/lib/oeqa/runtime/cases/ltp.py
> index 0ffdbe23e4..11c4814090 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
> @@ -12,7 +12,7 @@ import pprint
>  from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.runtime.decorator.package import OEHasPackage
> -from oeqa.utils.logparser import LtpParser
> +from oeqa.utils.logparser import LtpKirkParser
>
>  class LtpTestBase(OERuntimeTestCase):
>
> @@ -66,9 +66,9 @@ class LtpTest(LtpTestBase):
>
>      def runltp(self, ltp_group):
>              # LTP appends to log files, so ensure we start with a clean
> log
> -            self.target.deleteFiles("/opt/ltp/results/", ltp_group)
> +            self.target.deleteFiles("/opt/ltp/results/", "%s.json" %
> ltp_group)
>
> -            cmd =3D '/opt/ltp/runltp -f %s -q -r /opt/ltp -l
> /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
> +            cmd =3D 'kirk --run-suite %s --json-report
> /opt/ltp/results/%s.json -n' % (ltp_group, ltp_group)
>
>              starttime =3D time.time()
>              (status, output) =3D self.target.run(cmd, timeout=3D1200)
> @@ -87,14 +87,14 @@ class LtpTest(LtpTestBase):
>              self.extras['ltpresult.rawlogs']['log'] =3D
> self.extras['ltpresult.rawlogs']['log'] + output
>
>              # Copy the machine-readable test results locally so we can
> parse it
> -            dst =3D os.path.join(self.ltptest_log_dir, ltp_group)
> -            remote_src =3D "/opt/ltp/results/%s" % ltp_group
> +            dst =3D os.path.join(self.ltptest_log_dir, "%s.json" %
> ltp_group)
> +            remote_src =3D "/opt/ltp/results/%s.json" % ltp_group
>              (status, output) =3D self.target.copyFrom(remote_src, dst, T=
rue)
>              if status:
>                  msg =3D 'File could not be copied. Output: %s' % output
>                  self.target.logger.warning(msg)
>
> -            parser =3D LtpParser()
> +            parser =3D LtpKirkParser()
>              results, sections  =3D parser.parse(dst)
>
>              sections['duration'] =3D int(endtime-starttime)
> @@ -113,9 +113,9 @@ class LtpTest(LtpTestBase):
>
>      # LTP runtime tests
>      @OETestDepends(['ssh.SSHTest.test_ssh'])
> -    @OEHasPackage(["ltp"])
> +    @OEHasPackage(["ltp", "python3-kirk"])
>      def test_ltp_help(self):
> -        (status, output) =3D self.target.run('/opt/ltp/runltp --help')
> +        (status, output) =3D self.target.run('kirk --help')
>          msg =3D 'Failed to get ltp help. Output: %s' % output
>          self.assertEqual(status, 0, msg=3Dmsg)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py
> b/meta/lib/oeqa/runtime/cases/ltp_stress.py
> index ce6f4bf59d..cf84ec1182 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
> @@ -13,7 +13,7 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.runtime.decorator.package import OEHasPackage
>  from oeqa.core.decorator.data import skipIfQemu
> -from oeqa.utils.logparser import LtpParser
> +from oeqa.utils.logparser import LtpKirkParser
>
>  class LtpStressBase(OERuntimeTestCase):
>
> @@ -60,7 +60,7 @@ class LtpStressBase(OERuntimeTestCase):
>  class LtpStressTest(LtpStressBase):
>
>      def runltp(self, stress_group):
> -            cmd =3D '/opt/ltp/runltp -f %s -p -q 2>@1 | tee
> /opt/ltp/results/%s' % (stress_group, stress_group)
> +            cmd =3D 'kirk --run-suite %s --json-report
> /opt/ltp/results/%s.json -n' % (stress_group, stress_group)
>              starttime =3D time.time()
>              (status, output) =3D self.target.run(cmd)
>              endtime =3D time.time()
> @@ -69,8 +69,16 @@ class LtpStressTest(LtpStressBase):
>
>              self.extras['ltpstressresult.rawlogs']['log'] =3D
> self.extras['ltpstressresult.rawlogs']['log'] + output
>
> -            parser =3D LtpParser()
> -            results, sections  =3D
> parser.parse(os.path.join(self.ltptest_log_dir, "%s" % stress_group))
> +            # Copy kirk JSON report from target
> +            dst =3D os.path.join(self.ltptest_log_dir, "%s.json" %
> stress_group)
> +            remote_src =3D "/opt/ltp/results/%s.json" % stress_group
> +            (status, output) =3D self.target.copyFrom(remote_src, dst, T=
rue)
> +            if status:
> +                msg =3D 'File could not be copied. Output: %s' % output
> +                self.target.logger.warning(msg)
> +
> +            parser =3D LtpKirkParser()
> +            results, sections  =3D parser.parse(dst)
>
>              runtime =3D int(endtime-starttime)
>              sections['duration'] =3D runtime
> diff --git a/meta/lib/oeqa/utils/logparser.py
> b/meta/lib/oeqa/utils/logparser.py
> index c479864162..a907421fab 100644
> --- a/meta/lib/oeqa/utils/logparser.py
> +++ b/meta/lib/oeqa/utils/logparser.py
> @@ -5,6 +5,7 @@
>  #
>
>  import enum
> +import json
>  import os
>  import re
>
> @@ -158,6 +159,34 @@ class LtpParser:
>          return results, section
>
>
> +class LtpKirkParser:
> +    """Parse kirk JSON report into the same format as LtpParser."""
> +
> +    STATUS_MAP =3D {
> +        "pass": "PASSED",
> +        "fail": "FAILED",
> +        "brok": "FAILED",
> +        "conf": "SKIPPED",
> +        "warn": "PASSED",
> +    }
> +
> +    def parse(self, jsonfile):
> +        with open(jsonfile, errors=3D"replace") as f:
> +            report =3D json.load(f)
> +
> +        results =3D {}
> +        section =3D {"duration": 0, "log": ""}
> +
> +        for entry in report.get("results", []):
> +            results[entry["test_fqn"]] =3D
> self.STATUS_MAP.get(entry.get("status", ""), "FAILED")
> +            test =3D entry.get("test", {})
> +            section["log"] +=3D test.get("log", "")
> +
> +        section["duration"] =3D int(report.get("stats", {}).get("runtime=
",
> 0))
> +
> +        return results, section
> +
> +
>  # ltp Compliance log parsing
>  class LtpComplianceParser(object):
>      def __init__(self):
> diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb
> b/meta/recipes-extended/ltp/ltp_20260130.bb
> index dcd1e81398..1ff20a7898 100644
> --- a/meta/recipes-extended/ltp/ltp_20260130.bb
> +++ b/meta/recipes-extended/ltp/ltp_20260130.bb
> @@ -104,6 +104,7 @@ RDEPENDS:${PN} =3D "\
>      net-tools \
>      perl \
>      python3-core \
> +    python3-kirk \
>      procps \
>      quota \
>      unzip \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233871):
> https://lists.openembedded.org/g/openembedded-core/message/233871
> Mute This Topic: https://lists.openembedded.org/mt/118498904/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000050a36e064dd8d42d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 7:07=
=E2=80=AFAM Daniel Turull via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@=
lists.openembedded.org">ericsson.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Daniel Tur=
ull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" target=3D"_blank">dan=
iel.turull@ericsson.com</a>&gt;<br>
<br>
runltp has been removed from ltp and kirk is the official tool to<br>
invoke linux ltp tests.<span class=3D"gmail_default" style=3D"font-size:sma=
ll"></span></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">For something like this to be considered=C2=A0for m=
erging, I&#39;d have expected</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">a lot more information.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Is the test coverage the same as before ?</div><div class=3D"=
gmail_default" style=3D"font-size:small">What=C2=A0are the results of the t=
ests=C2=A0versus the previous harness ?</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Is it truly a drop in replacement for the previous=
 runner ?</div><div class=3D"gmail_default" style=3D"font-size:small">.. et=
c</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Switching the executabl=
e is the easy part, ensuring that it actually works</div><div class=3D"gmai=
l_default" style=3D"font-size:small">a replacement is the hard part.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
See:<br>
<a href=3D"https://github.com/linux-test-project/ltp/commit/6efd3605dc005c3=
ed135b463f182174e24bdce1b" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/linux-test-project/ltp/commit/6efd3605dc005c3ed135b463f182174e24bdc=
e1b</a><br>
<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
Assisted-by: Claude, Anthropic<br>
---<br>
=C2=A0meta/lib/oeqa/runtime/cases/ltp.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++=
++++-------<br>
=C2=A0meta/lib/oeqa/runtime/cases/ltp_stress.py | 16 +++++++++----<br>
=C2=A0meta/lib/oeqa/utils/logparser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
29 +++++++++++++++++++++++<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20260130.bb</a> |=C2=A0 1 +<br>
=C2=A04 files changed, 50 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cas=
es/ltp.py<br>
index 0ffdbe23e4..11c4814090 100644<br>
--- a/meta/lib/oeqa/runtime/cases/ltp.py<br>
+++ b/meta/lib/oeqa/runtime/cases/ltp.py<br>
@@ -12,7 +12,7 @@ import pprint<br>
=C2=A0from oeqa.runtime.case import OERuntimeTestCase<br>
=C2=A0from oeqa.core.decorator.depends import OETestDepends<br>
=C2=A0from oeqa.runtime.decorator.package import OEHasPackage<br>
-from oeqa.utils.logparser import LtpParser<br>
+from oeqa.utils.logparser import LtpKirkParser<br>
<br>
=C2=A0class LtpTestBase(OERuntimeTestCase):<br>
<br>
@@ -66,9 +66,9 @@ class LtpTest(LtpTestBase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def runltp(self, ltp_group):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# LTP appends to log files,=
 so ensure we start with a clean log<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.target.deleteFiles(&quot;/o=
pt/ltp/results/&quot;, ltp_group)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.target.deleteFiles(&quot;/o=
pt/ltp/results/&quot;, &quot;%s.json&quot; % ltp_group)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;/opt/ltp/runltp -f =
%s -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp&#39; % (ltp_group=
, ltp_group)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;kirk --run-suite %s=
 --json-report /opt/ltp/results/%s.json -n&#39; % (ltp_group, ltp_group)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0starttime =3D time.time()<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status, output) =3D self.t=
arget.run(cmd, timeout=3D1200)<br>
@@ -87,14 +87,14 @@ class LtpTest(LtpTestBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.extras[&#39;ltpresult.=
rawlogs&#39;][&#39;log&#39;] =3D self.extras[&#39;ltpresult.rawlogs&#39;][&=
#39;log&#39;] + output<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Copy the machine-readable=
 test results locally so we can parse it<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(self.ltptes=
t_log_dir, ltp_group)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_src =3D &quot;/opt/ltp/re=
sults/%s&quot; % ltp_group <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(self.ltptes=
t_log_dir, &quot;%s.json&quot; % ltp_group)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_src =3D &quot;/opt/ltp/re=
sults/%s.json&quot; % ltp_group<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status, output) =3D self.t=
arget.copyFrom(remote_src, dst, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if status:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &#39;=
File could not be copied. Output: %s&#39; % output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target.l=
ogger.warning(msg)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser =3D LtpParser()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser =3D LtpKirkParser()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0results, sections=C2=A0 =3D=
 parser.parse(dst)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sections[&#39;duration&#39;=
] =3D int(endtime-starttime)<br>
@@ -113,9 +113,9 @@ class LtpTest(LtpTestBase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0# LTP runtime tests<br>
=C2=A0 =C2=A0 =C2=A0@OETestDepends([&#39;ssh.SSHTest.test_ssh&#39;])<br>
-=C2=A0 =C2=A0 @OEHasPackage([&quot;ltp&quot;])<br>
+=C2=A0 =C2=A0 @OEHasPackage([&quot;ltp&quot;, &quot;python3-kirk&quot;])<b=
r>
=C2=A0 =C2=A0 =C2=A0def test_ltp_help(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;/opt=
/ltp/runltp --help&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;kirk=
 --help&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &#39;Failed to get ltp help. Outp=
ut: %s&#39; % output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3Dmsg)<br=
>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runt=
ime/cases/ltp_stress.py<br>
index ce6f4bf59d..cf84ec1182 100644<br>
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py<br>
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py<br>
@@ -13,7 +13,7 @@ from oeqa.runtime.case import OERuntimeTestCase<br>
=C2=A0from oeqa.core.decorator.depends import OETestDepends<br>
=C2=A0from oeqa.runtime.decorator.package import OEHasPackage<br>
=C2=A0from oeqa.core.decorator.data import skipIfQemu<br>
-from oeqa.utils.logparser import LtpParser<br>
+from oeqa.utils.logparser import LtpKirkParser<br>
<br>
=C2=A0class LtpStressBase(OERuntimeTestCase):<br>
<br>
@@ -60,7 +60,7 @@ class LtpStressBase(OERuntimeTestCase):<br>
=C2=A0class LtpStressTest(LtpStressBase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def runltp(self, stress_group):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;/opt/ltp/runltp -f =
%s -p -q 2&gt;@1 | tee /opt/ltp/results/%s&#39; % (stress_group, stress_gro=
up)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;kirk --run-suite %s=
 --json-report /opt/ltp/results/%s.json -n&#39; % (stress_group, stress_gro=
up)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0starttime =3D time.time()<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status, output) =3D self.t=
arget.run(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endtime =3D time.time()<br>
@@ -69,8 +69,16 @@ class LtpStressTest(LtpStressBase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.extras[&#39;ltpstressr=
esult.rawlogs&#39;][&#39;log&#39;] =3D self.extras[&#39;ltpstressresult.raw=
logs&#39;][&#39;log&#39;] + output<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser =3D LtpParser()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results, sections=C2=A0 =3D pars=
er.parse(os.path.join(self.ltptest_log_dir, &quot;%s&quot; % stress_group))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy kirk JSON report from tar=
get<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(self.ltptes=
t_log_dir, &quot;%s.json&quot; % stress_group)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote_src =3D &quot;/opt/ltp/re=
sults/%s.json&quot; % stress_group<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target=
.copyFrom(remote_src, dst, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if status:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &#39;File =
could not be copied. Output: %s&#39; % output<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.target.logger=
.warning(msg)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parser =3D LtpKirkParser()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results, sections=C2=A0 =3D pars=
er.parse(dst)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runtime =3D int(endtime-sta=
rttime)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sections[&#39;duration&#39;=
] =3D runtime<br>
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logpars=
er.py<br>
index c479864162..a907421fab 100644<br>
--- a/meta/lib/oeqa/utils/logparser.py<br>
+++ b/meta/lib/oeqa/utils/logparser.py<br>
@@ -5,6 +5,7 @@<br>
=C2=A0#<br>
<br>
=C2=A0import enum<br>
+import json<br>
=C2=A0import os<br>
=C2=A0import re<br>
<br>
@@ -158,6 +159,34 @@ class LtpParser:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return results, section<br>
<br>
<br>
+class LtpKirkParser:<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Parse kirk JSON report into the same forma=
t as LtpParser.&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 STATUS_MAP =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pass&quot;: &quot;PASSED&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fail&quot;: &quot;FAILED&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;brok&quot;: &quot;FAILED&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;conf&quot;: &quot;SKIPPED&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;warn&quot;: &quot;PASSED&quot;,<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 def parse(self, jsonfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(jsonfile, errors=3D&quot;replace&quo=
t;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 report =3D json.load(f)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 section =3D {&quot;duration&quot;: 0, &quot;lo=
g&quot;: &quot;&quot;}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for entry in report.get(&quot;results&quot;, [=
]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results[entry[&quot;test_fqn&quo=
t;]] =3D self.STATUS_MAP.get(entry.get(&quot;status&quot;, &quot;&quot;), &=
quot;FAILED&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test =3D entry.get(&quot;test&qu=
ot;, {})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section[&quot;log&quot;] +=3D te=
st.get(&quot;log&quot;, &quot;&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 section[&quot;duration&quot;] =3D int(report.g=
et(&quot;stats&quot;, {}).get(&quot;runtime&quot;, 0))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return results, section<br>
+<br>
+<br>
=C2=A0# ltp Compliance log parsing<br>
=C2=A0class LtpComplianceParser(object):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self):<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb" r=
el=3D"noreferrer" target=3D"_blank">ltp_20260130.bb</a> b/meta/recipes-exte=
nded/ltp/<a href=3D"http://ltp_20260130.bb" rel=3D"noreferrer" target=3D"_b=
lank">ltp_20260130.bb</a><br>
index dcd1e81398..1ff20a7898 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20260130.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20260130.bb</a><br>
@@ -104,6 +104,7 @@ RDEPENDS:${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0net-tools \<br>
=C2=A0 =C2=A0 =C2=A0perl \<br>
=C2=A0 =C2=A0 =C2=A0python3-core \<br>
+=C2=A0 =C2=A0 python3-kirk \<br>
=C2=A0 =C2=A0 =C2=A0procps \<br>
=C2=A0 =C2=A0 =C2=A0quota \<br>
=C2=A0 =C2=A0 =C2=A0unzip \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233871): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233871" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233871</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118498904/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118498904/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000050a36e064dd8d42d--

