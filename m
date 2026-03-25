Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E531099B44
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:22:28 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23439.1774448538871259647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 07:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CZbRq6PX;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so5415912a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774448538; cv=none;
        d=google.com; s=arc-20240605;
        b=DIRqq8fyKA/e45syORqEIdspEAfYbRnPdUNdiAaYYjC7QZHS+t4kUyuJ8iQ3a9/APx
         bFa2uad1CI7G0Mirr7sJhReIlx0EKa9yX18lGdCEO4QDBnMnv+sbQUVPQprc29xTljvV
         gybC2tRx+IBnDKMTJ1rOjXJ5x3rsV4vLBOVft6x7kVvy1CUoEjFigLdkUK9WxSKRuan1
         41Mw/UrlE/XF8zm4E67EjZ9LSHKclSu7rcr+CcWsKktnApuV1G3O73Ce92aleXt0rFxu
         hda2FZmGDA59JfWpVEXQ48qNgt4prdF+i4lql4KXpuY4G74DuBqTqDElbPQPfRCtutH9
         j9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kO6Qw/gaDiC0E8Wbgp6nWCWcJox5w+jyFvkKXx0Vtxw=;
        fh=is8lxxtuk9/J1HM0zJVbkf6bc92qVvzU6FJegOtQL4Q=;
        b=QQ9Dy7SRd6qgg1+UsojY5r+65LxyuuV34VucSdNGKExCfVUqGmCb+Wz1YgmrXwFJxT
         NFG8HylPHOlJHRcsxNIzqxWnv2/oirfgxPI2QoELv38AoVsXsGUFumFyZ/D346K6aZiu
         l3xWPYnn8c1GRJ9igyf+F4l74SUijOzruI/sAUN62gOOzYwlYfZv/eoF1CnjIrwT1R1l
         M/zC7AAUiYRegAySpX0Lp8aujvql5HGsAktO2XvzjUNIGoNvO6hZz6a8AZfV14ReiOnM
         bvUXXh1guSrNXHUoFLHHaPqvOP/Nixm+HnLMGYn2rEk5v1Ruj/XxOa2Qm8T7B75jyXmU
         ybMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448538; x=1775053338; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kO6Qw/gaDiC0E8Wbgp6nWCWcJox5w+jyFvkKXx0Vtxw=;
        b=CZbRq6PXGX4R5R24j4MEvo1i+2FNBH62rg+os9XPvrAbxrIivTekIWD11AavgRhCzG
         KedvoBjo9aDoRPYv19h8MTT9ZZwsuR0psVGnHQqUb269yRGam6B5O8hAEVOWcIhH+QFC
         3Cz0883Saiek+F1sEsN0J185ZZeqTjbAhKdVVnRHXaYOkgdM325ArzRkhgF9b/X11HlG
         1YSoSutOZm8WGqLy+ktlH0n8PFZizIWburOodwNz3rH4rkWPO3KlFxOh6twQttd+cBFK
         oBxTQCGHBfdmttCii9oWeyyIFGwTBRIgWm1KdvGBH3ch5Y+BUshu8rGIPO19vWfnW18F
         cFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448538; x=1775053338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO6Qw/gaDiC0E8Wbgp6nWCWcJox5w+jyFvkKXx0Vtxw=;
        b=KdsGVu3Z/G+krfjTZm9GlB4E9F8sr8r/UU+YYbzcmt3XPvhYowyX4N4eAJd0d6jCMd
         U9hGEG3Q42vGU051uNn8GNvUV3yomfOmcriV3+qbN+h02UgP41m/TKgRD2Rb2gZWAfRM
         eO1afMIty0IBzOTXDzdkSGtmmFlTC17iTkg5OQMOG1fW52zfRXfJW9wSX5OvmnZInzd8
         eeAXl6hs89AoaPeYqWwikMV7zqDubbbtsxiPhFnRhCk2DjyFExD/zp5RmqZoNmUuA/B3
         pz3FDC2TbQCGPgkNucW+uk9iGwlpacWp8I/8+P6SXBNHPsI9mQc+hRfQ3rrWFpFGALBv
         V1+g==
X-Gm-Message-State: AOJu0YxE47NxqNKBR52H4hCp38NZ3yAy6MqNa5f4YTz/KyNF9fdj41zj
	Jb2NU9VR3Vc6bGshhwPVdT67tt1wWEblheLdty5Od1dimVNuLK0ZERvu5xONV1duS04+xzCT5yC
	Yqg57qk5zNPiCydDze93qfigBwDE84pk7vZ4hf+M=
X-Gm-Gg: ATEYQzxOwrABFxiTA5W6qjCFe9XiUdfKrhCAeYhPz5NHX8sU0q+va0Yuvh1SThGhG5U
	910kVYpGFBhGnOOf+7GKR/h5jqYGw8nQNHaZqc1qC5rHZ65feMg7LjnU7R7VGHeNOil9UB6y3oE
	O/XzCPAPripeQrbg8AquqGOwy4bE7Dr69oafypwol5JiBQZ7Lw/DbQh0Cn3eAILSvL1WEJi8zRM
	LWuavEiCSuoSAuymrH2FZPyhNlJrUHR4giNLiy7a1PNRNz69/fMslGuzYp1Hw/aCufaFHSwBQ/m
	FOWmtvo6l6xLqhvAfKAjp+oAI9qwfXDLcs77OJss
X-Received: by 2002:a17:90b:3f47:b0:359:8de8:1229 with SMTP id
 98e67ed59e1d1-35c0dd7b0d8mr3454009a91.21.1774448537926; Wed, 25 Mar 2026
 07:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
 <20260325084021.3915804-2-daniel.turull@ericsson.com> <CADkTA4PkenyxfFJR6fvFSpjKV_3MhyChDQZLZ3d5hB7HZbGyOA@mail.gmail.com>
 <PA3PR07MB107211977EFF68E353CCB59578A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB107211977EFF68E353CCB59578A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2026 10:22:06 -0400
X-Gm-Features: AaiRm515ua93cxKXRlLxPMrbjDa2ajFgHjLjIHumQ1kfH_Nk0Nq_ums8nFaHpyI
Message-ID: <CADkTA4M5j5jjaTbE37f4X0nVdckTNBH1KfEmd424Hv1jD1B1Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"pratik.farkase@est.tech" <pratik.farkase@est.tech>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000c68070064dd9fe0c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 14:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233918

--000000000000c68070064dd9fe0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 9:44=E2=80=AFAM Daniel Turull <daniel.turull@ericss=
on.com>
wrote:

> Hi,
>
>
>
> Kirk is official way to run ltp since runltp has been dropped. Richard
> mentioned yesterday in the Weekly Project Engineering Sync if no one was
> fixing the runltp issue, he will drop ltp from oe-core.
>
>
>

Yes, we know this, it's been mentioned for months. We are
fundamentally too late for the LTS release in my opinion, since
Richard would likely be left fixing issues with LTP failures that
could gate the release.

It isn't even the results that are the issue. How will this perform
on a fully loaded machine (i.e the auto builder), will we get
inconsistent results ? Intermittent failures ? Different results based
on the architecture ?



> The test coverage is the same since the logic there is not touched but th=
e
> output is different. Now it is a json file with the results, which is
> machine readable without any extra parsing. Do we need a conversion from
> the new to the old to keep compatibility?
>

Only if it impacts the reset of the QA or Autobuilder testing. If
everything in the test stack continues to work with the new
format, I'd say it is ok as-is.


>
>
> I=E2=80=99m attaching the old test output with the new one for the math t=
est suite.
>
> New: math-raw.log and math.json
>
> Old: math.old math-raw.log.old.
>
>
>
> You can see at the end of the old output:
>

This all needs to be in the commit itself. As well as a results
summary from all the supported primary architectures.

Bruce



>
>
> -------------------------------------------
>
> INFO: runltp script is deprecated, try kirk
>
> https://github.com/linux-test-project/kirk
>
> -------------------------------------------
>
>
>
> Best regards,
>
> Daniel
>
>
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Wednesday, 25 March 2026 13:59
> *To:* Daniel Turull <daniel.turull@ericsson.com>
> *Cc:* openembedded-core@lists.openembedded.org; pratik.farkase@est.tech;
> richard.purdie@linuxfoundation.org
> *Subject:* Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
>
>
>
>
>
>
>
> On Wed, Mar 25, 2026 at 7:07=E2=80=AFAM Daniel Turull via lists.openembed=
ded.org
> <daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> runltp has been removed from ltp and kirk is the official tool to
> invoke linux ltp tests.
>
>
>
> For something like this to be considered for merging, I'd have expected
>
> a lot more information.
>
>
>
> Is the test coverage the same as before ?
>
> What are the results of the tests versus the previous harness ?
>
> Is it truly a drop in replacement for the previous runner ?
>
> .. etc
>
>
>
> Switching the executable is the easy part, ensuring that it actually work=
s
>
> a replacement is the hard part.
>
>
>
> Bruce
>
>
>
>
>
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
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c68070064dd9fe0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 9:44=
=E2=80=AFAM Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com"=
>daniel.turull@ericsson.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div class=3D"msg-2824116989376943524">





<div lang=3D"en-SE" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-2824116989376943524WordSection1">
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Hi,<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Kirk i=
s official way to run ltp since runltp has been dropped. Richard mentioned =
yesterday in the Weekly Project Engineering Sync if no one was fixing the r=
unltp issue,
 he will drop ltp from oe-core.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0</span></p></div></div></div></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Yes, we know this, it&#39;=
s been mentioned for months. We are</div><div class=3D"gmail_default" style=
=3D"font-size:small">fundamentally too late for the LTS release in my opini=
on, since</div><div class=3D"gmail_default" style=3D"font-size:small">Richa=
rd would likely be left fixing issues with LTP failures that</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">could gate the release.<br><b=
r>It isn&#39;t even the results that are the issue. How will this perform</=
div><div class=3D"gmail_default" style=3D"font-size:small">on a fully loade=
d machine (i.e the auto builder), will we get=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-size:small">inconsistent results ? Intermittent=C2=
=A0failures ? Different results based</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">on the architecture ?</div></div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div class=3D"msg-2824116989376943524=
"><div lang=3D"en-SE" style=3D"overflow-wrap: break-word;"><div class=3D"m_=
-2824116989376943524WordSection1"><p class=3D"MsoNormal"><span lang=3D"en-S=
E" style=3D"font-size:11pt"><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">The te=
st coverage is the same since the logic there is not touched but the output=
 is different. Now it is a json file with the results, which is machine rea=
dable without
 any extra parsing. Do we need a conversion from the new to the old to keep=
 compatibility?</span></p></div></div></div></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">Only if it impacts=
 the reset of the QA or Autobuilder testing. If</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">everything in the test stack continues to =
work with the new</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">format, I&#39;d say it is ok as-is.</div></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-282411698937694=
3524"><div lang=3D"en-SE" style=3D"overflow-wrap: break-word;"><div class=
=3D"m_-2824116989376943524WordSection1"><p class=3D"MsoNormal"><span lang=
=3D"en-SE" style=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">I=E2=
=80=99m attaching the old test output with the new one for the math test su=
ite.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">New: m=
ath-raw.log and math.json<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Old: m=
ath.old math-raw.log.old.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">You ca=
n see at the end of the old output:</span></p></div></div></div></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">This all needs to be in the commit itself. As well as a results</div><div=
 class=3D"gmail_default" style=3D"font-size:small">summary from all the sup=
ported primary architectures.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div class=3D"msg-2824116989376943524"><div lang=3D"en-SE=
" style=3D"overflow-wrap: break-word;"><div class=3D"m_-2824116989376943524=
WordSection1"><p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-siz=
e:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">------=
-------------------------------------<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">INFO: =
runltp script is deprecated, try kirk<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><a hre=
f=3D"https://github.com/linux-test-project/kirk" target=3D"_blank">https://=
github.com/linux-test-project/kirk</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">------=
-------------------------------------<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Best r=
egards,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Daniel=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, 25 March 2026 13:59<br>
<b>To:</b> Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" =
target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a>; pratik.farkase@=
est.tech; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_=
blank">richard.purdie@linuxfoundation.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk<u>=
</u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">On Wed, Mar 25, 2026 at 7:07</s=
pan><span lang=3D"en-SE" style=3D"font-family:Arial,sans-serif">=E2=80=AF</=
span><span lang=3D"en-SE">AM Daniel Turull via
<a href=3D"http://lists.openembedded.org/" target=3D"_blank">lists.openembe=
dded.org</a> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@lists.opene=
mbedded.org" target=3D"_blank">ericsson.com@lists.openembedded.org</a>&gt; =
wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal"><span lang=3D"en-SE">From: Daniel Turull &lt;<a href=
=3D"mailto:daniel.turull@ericsson.com" target=3D"_blank">daniel.turull@eric=
sson.com</a>&gt;<br>
<br>
runltp has been removed from ltp and kirk is the official tool to<br>
invoke linux ltp tests.<u></u><u></u></span></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">For something like this to be c=
onsidered=C2=A0for merging, I&#39;d have expected<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">a lot more information.<u></u><=
u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Is the test coverage the same a=
s before ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">What=C2=A0are the results of th=
e tests=C2=A0versus the previous harness ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Is it truly a drop in replaceme=
nt for the previous runner ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">.. etc<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Switching the executable is the=
 easy part, ensuring that it actually works<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">a replacement is the hard part.=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Bruce<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"en-SE"><b=
r>
<br>
See:<br>
<a href=3D"https://github.com/linux-test-project/ltp/commit/6efd3605dc005c3=
ed135b463f182174e24bdce1b" target=3D"_blank">https://github.com/linux-test-=
project/ltp/commit/6efd3605dc005c3ed135b463f182174e24bdce1b</a><br>
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
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb/" target=
=3D"_blank">ltp_20260130.bb</a> |=C2=A0 1 +<br>
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
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb/" =
target=3D"_blank">ltp_20260130.bb</a> b/meta/recipes-extended/ltp/<a href=
=3D"http://ltp_20260130.bb/" target=3D"_blank">ltp_20260130.bb</a><br>
index dcd1e81398..1ff20a7898 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb/" target=
=3D"_blank">ltp_20260130.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20260130.bb/" target=
=3D"_blank">ltp_20260130.bb</a><br>
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
enembedded-core/message/233871" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/233871</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118498904/105=
0810" target=3D"_blank">
https://lists.openembedded.org/mt/118498904/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</=
a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></span></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><br clear=3D"all">
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-2824116989376943524gmailsignaturep=
refix"><span lang=3D"en-SE">-- </span>
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"en-SE">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></sp=
an></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000c68070064dd9fe0c--

