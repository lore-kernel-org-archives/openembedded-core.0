Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3E1CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:02:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8954.1778151742762045136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uw+T8Qlb;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45297094718so590265f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778151741; x=1778756541; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK5xnVqoO0yfPU7bbXDh7qgiOoFOVq5jsWvup0gh4uU=;
        b=Uw+T8Qlbd2VoJKXHGfOpYuYMMuY8QgTSRjGlAG2n/eab/0k+UqPA46/pkhIIykrARz
         XWgos3CJt2P6v3BKbv9UYtp2Cu9REKsMbuxR2HZM5vL7B9pUEJzjE8RQ5WZAFTdmXesn
         9Wu73NCU6bv9nlPUk1e9Qz/LEQIL0podMnXW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151741; x=1778756541;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SK5xnVqoO0yfPU7bbXDh7qgiOoFOVq5jsWvup0gh4uU=;
        b=QApNm/ZLtkx8jwvUwKWRUzDwwO5ChwfxBU1xcXPk5jY90Ev78HzE69Ryn3g9hIGeTz
         clYRSqxAZ+6GKHvNmC9d70gKtf9gKvKNWNsGUgzWs32cQ9czu9PR0dgBQYu835y3m5UT
         /87c6xdBBaaShiX3h0S/cRqfbTvopcAf6ihls5C8Y54rQNLX2ILY/mdUQtjEAcOn+/29
         XMozl5vqw3cqljjGHJrNIJhWZW4CjYpIRHV3z97Fd2yJfKHdV++Ac9LXbwj4FdjoOpZB
         GgB9Cw+wzRRuVNjSnU3uB3pmIOggQtOesv7qTJXqfXYzTlddX+BIMK5ywgOKaEOBqS/6
         F6tQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AK3iEdvZU5Km4JRkshM1D0SNyyMhfBNnKmphI7Xt+Rxj2wyNq2mL64l+sV297AaBq5o0ElEYU4NYUHsN5q6SMRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yywj4Jz9ZYEte51QjM3SPbjVY4xE6YU9zmtis0Zph7tgSYDZW72
	c1oVn21k3hKAFPM1BfBIil5PW2NwieLWAF4OJ7KvoD4ahUKZzYfw4j22mQJTzv9JWU9bRw6rw3B
	DrLk4RZE=
X-Gm-Gg: AeBDievPle6cPZs1L1Fu4ah5AeSvHy2Eu/3JDamMQbB+TdN7zdQPeBouGIYuNbNp1HU
	ldLQTQt7q3ki90fCojKzvkMn/nnJ0YOnmlwYfP8N64wTQwm/5cZp0YCDgCArs5qXSGKgen4MBHO
	UoTINf3EjwEkB/0PhJoE52ARRWiekIOQj7o1QG9Fak1hWrg/cBh2O2ztPnzoAnPz5iTU0uGQ1uc
	yb4/gDvxHIlEhViEPRYGTgmsL1UAVGpAqsw4+RsdgKDVGoEvtDnJj40cXS00BmvEpIFiKEwTkNX
	UXbjTawB9RgTh48jayhC58Gydqd1oJS6Onym3Fwf4dTyz6H6WM2Pl9MZb18JQy/8nHs9VuyS5jj
	QJYppbnB3N7WDI2kuXqETplA9l10VWZHndO7gvswATcIcB/cH0jRJir7Jm3LLH8KGLVIiJqAdpy
	jWl5Rnp5cOlpOBj7bduy0ONBpIbt3dy3IqzEnkdUrmgjNQAOh2YeeXBAiR/pwsPhzs3jFWsmFCQ
	JR+1yb6Vh2OhFOXbEnc2W10a5Naas/+I7Ma
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr135027605e9.10.1778151739893;
        Thu, 07 May 2026 04:02:19 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538c4ae1sm112528135e9.12.2026.05.07.04.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 04:02:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 13:02:17 +0200
Message-Id: <DICE6N67I0ZF.BWZR5G4QRYQR@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
 CVE-2025-56005
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>, "Wang, Jinfeng (CN)"
 <Jinfeng.Wang.CN@windriver.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-5-jinfeng.wang.cn@windriver.com>
 <DI16KRN0V4A0.1I7P5Z5C5PG7S@smile.fr>
 <18AA22684C0F041F.2188217@lists.openembedded.org>
 <BN9PR11MB5354F2CF2323061354A5AC18DE3F2@BN9PR11MB5354.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5354F2CF2323061354A5AC18DE3F2@BN9PR11MB5354.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236576

On Wed May 6, 2026 at 10:24 AM CEST, Libo (CN) Chen wrote:
>>-----Original Message-----
>>From: openembedded-core@lists.openembedded.org
>><openembedded-core@lists.openembedded.org> On Behalf Of Chen, Libo (CN)
>>via lists.openembedded.org
>>Sent: Monday, April 27, 2026 2:20 PM
>>To: yoann.congal@smile.fr; Wang, Jinfeng (CN)
>><Jinfeng.Wang.CN@windriver.com>;
>>openembedded-core@lists.openembedded.org
>>Subject: Re: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
>>CVE-2025-56005
>>
>>
>>
>>>-----Original Message-----
>>>From: openembedded-core@lists.openembedded.org
>>><openembedded-core@lists.openembedded.org> On Behalf Of Yoann Congal
>>>via lists.openembedded.org
>>>Sent: Friday, April 24, 2026 2:45 PM
>>>To: Wang, Jinfeng (CN) <Jinfeng.Wang.CN@windriver.com>;
>>>openembedded-core@lists.openembedded.org
>>>Subject: Re: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
>>>CVE-2025-56005
>>>
>>>CAUTION: This email comes from a non Wind River email account!
>>>Do not click links or open attachments unless you recognize the sender
>>>and know the content is safe.
>>>
>>>On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via
>>>lists.openembedded.org Wang wrote:
>>>> From: Libo Chen <libo.chen.cn@windriver.com>
>>>>
>>>> According to [1], An undocumented and unsafe feature in the PLY
>>>> (Python
>>>> Lex-Yacc) library 3.11 allows Remote Code Execution (RCE) via the
>>>> `picklefile` parameter in the `yacc()` function. This parameter
>>>> accepts a `.pkl` file that is deserialized with `pickle.load()`
>>>> without validation. Because `pickle` allows execution of embedded
>>>> code via `__reduce__()`, an attacker can achieve code execution by
>>>> passing a malicious pickle file. The parameter is not mentioned in
>>>> official documentation or the GitHub repository, yet it is active in
>>>> the PyPI version. This introduces a stealthy backdoor and persistence =
risk.
>>>>
>>>> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-56005
>>>>
>>>> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
>>>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>>> ---
>>>>  .../python/python3-ply/CVE-2025-56005.patch   | 125
>>>++++++++++++++++++
>>>>  .../python/python3-ply_3.11.bb                |   4 +
>>>>  2 files changed, 129 insertions(+)
>>>>  create mode 100644
>>>> meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>>>
>>>> diff --git
>>>> a/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>>> b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>>> new file mode 100644
>>>> index 0000000000..3f1e62b766
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>>> @@ -0,0 +1,125 @@
>>>> +From bfaebcc33a5af77f2701581638aa31a1bf918302 Mon Sep 17 00:00:00
>>>> +2001
>>>> +From: Libo Chen <libo.chen.cn@windriver.com>
>>>> +Date: Tue, 27 Jan 2026 13:58:57 +0800
>>>> +Subject: [PATCH] python3-ply: fix CVE-2025-56005
>>>> +
>>>> +Deprecate and disable the unsafe picklefile parameter and related
>>>> +pickle serialization/deserialization functions to prevent RCE attacks=
.
>>>> +
>>>> +The picklefile parameter in yacc() now issues a DeprecationWarning
>>>> +and is ignored. The read_pickle() and pickle_table() methods are
>>>> +stubbed out to issue warnings and raise NotImplementedError,
>>>> +following Python's standard practice for security-deprecated APIs.
>>>> +
>>>> +CVE: CVE-2025-56005
>>>> +
>>>> +Upstream-Status: Inactive-Upstream
>>>> +
>>>> +Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
>>>
>>>Hello,
>>>
>>>The status of this patch is not clear: It is not mentionned in the NVD
>>>report you linked.
>>
>>The upstream https://github.com/dabeaz/ply was archived by the owner on D=
ec
>>22, 2025. It is now read-only. So I could not submit my patch to the upst=
ream
>>and only mark it as "Upstream-Status: Inactive-Upstream"
>>
>>>And there is an argument to reject the CVE:
>>>https://github.com/tom025/ply_exploit_rejection/blob/main/README.md
>>
>>I can reproduce this CVE. Here're my steps:
>>
>
> Yoann, do you have additional comment? Thanks.

I stand by me decision to not take this like this, sorry.

I appreciate you took the time to actually test the vulnerability but
the fix is still too intrusive (removing a feature) for a general merge.

>
>>1) copy the source code from
>>https://github.com/bohmiiidd/Undocumented-RCE-in-PLY/ to a python script
>>ply-bug.py
>>
>>2) set up a uv environment. Here's the configuration:
>>[xyz/temp/ply-poc]$ cat /buildarea1/xyz/opt/pyenv/pyproject.toml
>>[project]
>>name =3D "pyenv"
>>version =3D "0.1.0"
>>description =3D "Add your description here"
>>readme =3D "README.md"
>>requires-python =3D ">=3D3.14.2"
>>dependencies =3D [
>>    "ply=3D=3D3.11",
>>]
>>[xyz/temp/ply-poc]$ lsb_release -a
>>No LSB modules are available.
>>Distributor ID: Ubuntu
>>Description:    Ubuntu 20.04.6 LTS
>>Release:        20.04
>>Codename:       focal
>>
>>3) run the python script ply-bug.py
>>
>>[xyz/temp/ply-poc]$ ls -l /tmp/pwned && cat /tmp/pwned
>>ls: cannot access '/tmp/pwned': No such file or directory [xyz/temp/ply-p=
oc]$ uv
>>--directory /buildarea1/xyz/opt/pyenv run python
>>/buildarea1/xyz/temp/ply-poc/ply-bug.py
>>WARNING: yacc table file version is out of date
>>WARNING: no p_error() function is defined Traceback (most recent call las=
t):
>>  File "/buildarea1/xyz/temp/ply-poc/ply-bug.py", line 35, in <module>
>>    parser.parse('example')
>>    ~~~~~~~~~~~~^^^^^^^^^^^
>>  File
>>"/buildarea1/xyz/opt/pyenv/.venv/lib/python3.14/site-packages/ply/yacc.py=
",
>>line 333, in parse
>>    return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc=
)
>>
>>~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>  File
>>"/buildarea1/xyz/opt/pyenv/.venv/lib/python3.14/site-packages/ply/yacc.py=
",
>>line 1018, in parseopt_notrack
>>    lexer =3D lex.lexer
>>            ^^^^^^^^^
>>AttributeError: module 'ply.lex' has no attribute 'lexer'. Did you mean: =
'Lexer'?
>>[xyz/temp/ply-poc]$ ls -l /tmp/pwned && cat /tmp/pwned
>>-rw-r--r-- 1 xyz users 11 Apr 27 13:46 /tmp/pwned VULNERABLE
>>>
>>>In doubt (such as this), I'd rather leave the CVE applicable and let
>>>downstream users that uses impacted code decide for themselves how they
>>>want to handle this CVE.
>>>
>>>> +---
>>>> + ply/yacc.py | 72
>>>> ++++++++++++++++++++++--------------------------------
>>>> + 1 file changed, 28 insertions(+), 44 deletions(-)
>>>> +
>>>> +diff --git a/ply/yacc.py b/ply/yacc.py index 88188a1..5103566 100644
>>>> +--- a/ply/yacc.py
>>>> ++++ b/ply/yacc.py
>>>> +@@ -1998,31 +1998,15 @@ class LRTable(object):
>>>> +         return parsetab._lr_signature
>>>> +
>>>> +     def read_pickle(self, filename):
>>>> +-        try:
>>>> +-            import cPickle as pickle
>>>> +-        except ImportError:
>>>> +-            import pickle
>>>> +-
>>>> +-        if not os.path.exists(filename):
>>>> +-          raise ImportError
>>>> +-
>>>> +-        in_f =3D open(filename, 'rb')
>>>> +-
>>>> +-        tabversion =3D pickle.load(in_f)
>>>> +-        if tabversion !=3D __tabversion__:
>>>> +-            raise VersionError('yacc table file version is out of da=
te')
>>>> +-        self.lr_method =3D pickle.load(in_f)
>>>> +-        signature      =3D pickle.load(in_f)
>>>> +-        self.lr_action =3D pickle.load(in_f)
>>>> +-        self.lr_goto   =3D pickle.load(in_f)
>>>> +-        productions    =3D pickle.load(in_f)
>>>> +-
>>>> +-        self.lr_productions =3D []
>>>> +-        for p in productions:
>>>> +-            self.lr_productions.append(MiniProduction(*p))
>>>> +-
>>>> +-        in_f.close()
>>>> +-        return signature
>>>> ++        import warnings
>>>> ++        warnings.warn(
>>>> ++            "read_pickle() is deprecated and disabled due to
>>>> ++ security
>>>vulnerability CVE-2025-56005. "
>>>> ++            "Pickle deserialization can lead to arbitrary code execu=
tion. "
>>>> ++            "This function is no longer supported.",
>>>> ++            DeprecationWarning,
>>>> ++            stacklevel=3D2
>>>> ++        )
>>>> ++        raise NotImplementedError("read_pickle() is disabled for
>>>> ++ security reasons (CVE-2025-56005)")
>>>
>>>And, also, this is quite a breaking change for a stable user using this =
feature.
>>>
>>>So, I can't accept this one. Sorry.
>>>
>>>> +
>>>> +     # Bind all production function names to callable objects in pdic=
t
>>>> +     def bind_callables(self, pdict):
>>>> +@@ -2845,27 +2829,19 @@ del _lr_goto_items
>>>> +     # pickle_table()
>>>> +     #
>>>> +     # This function pickles the LR parsing tables to a supplied
>>>> +file object
>>>> ++    # DEPRECATED: Disabled due to CVE-2025-56005
>>>> +     #
>>>> + -------------------------------------------------------------------
>>>> + -
>>>> + ---------
>>>> +
>>>> +     def pickle_table(self, filename, signature=3D''):
>>>> +-        try:
>>>> +-            import cPickle as pickle
>>>> +-        except ImportError:
>>>> +-            import pickle
>>>> +-        with open(filename, 'wb') as outf:
>>>> +-            pickle.dump(__tabversion__, outf, pickle_protocol)
>>>> +-            pickle.dump(self.lr_method, outf, pickle_protocol)
>>>> +-            pickle.dump(signature, outf, pickle_protocol)
>>>> +-            pickle.dump(self.lr_action, outf, pickle_protocol)
>>>> +-            pickle.dump(self.lr_goto, outf, pickle_protocol)
>>>> +-
>>>> +-            outp =3D []
>>>> +-            for p in self.lr_productions:
>>>> +-                if p.func:
>>>> +-                    outp.append((p.str, p.name, p.len, p.func,
>>>os.path.basename(p.file), p.line))
>>>> +-                else:
>>>> +-                    outp.append((str(p), p.name, p.len, None, None,
>>>None))
>>>> +-            pickle.dump(outp, outf, pickle_protocol)
>>>> ++        import warnings
>>>> ++        warnings.warn(
>>>> ++            "pickle_table() is deprecated and disabled due to
>>>> ++ security
>>>vulnerability CVE-2025-56005. "
>>>> ++            "Pickle serialization can lead to arbitrary code
>>>> ++ execution when
>>>deserialized. "
>>>> ++            "This function is no longer supported.",
>>>> ++            DeprecationWarning,
>>>> ++            stacklevel=3D2
>>>> ++        )
>>>> ++        raise NotImplementedError("pickle_table() is disabled for
>>>> ++ security reasons (CVE-2025-56005)")
>>>> +
>>>> + # ------------------------------------------------------------------=
-----------
>>>> + #                            =3D=3D=3D INTROSPECTION =3D=3D=3D
>>>> +@@ -3225,7 +3201,15 @@ def yacc(method=3D'LALR', debug=3Dyaccdebug,
>>>> +module=3DNone, tabmodule=3Dtab_module, star
>>>> +
>>>> +     # If pickling is enabled, table files are not created
>>>> +     if picklefile:
>>>> +-        write_tables =3D 0
>>>> ++        import warnings
>>>> ++        warnings.warn(
>>>> ++            "The 'picklefile' parameter is deprecated and disabled
>>>> ++ due to
>>>security vulnerability CVE-2025-56005. "
>>>> ++            "Pickle deserialization can lead to arbitrary code execu=
tion. "
>>>> ++            "The parameter will be ignored and standard table files
>>>> ++ will be
>>>used instead.",
>>>> ++            DeprecationWarning,
>>>> ++            stacklevel=3D2
>>>> ++        )
>>>> ++        picklefile =3D None
>>>> +
>>>> +     if errorlog is None:
>>>> +         errorlog =3D PlyLogger(sys.stderr)
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb
>>>> b/meta/recipes-devtools/python/python3-ply_3.11.bb
>>>> index a05bd6702d..41bcac2be8 100644
>>>> --- a/meta/recipes-devtools/python/python3-ply_3.11.bb
>>>> +++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
>>>> @@ -8,6 +8,10 @@ LIC_FILES_CHKSUM =3D
>>>> "file://README.md;beginline=3D5;endline=3D32;md5=3Df5ee5c355c0e6719
>>>>  SRC_URI[md5sum] =3D "6465f602e656455affcd7c5734c638f8"
>>>>  SRC_URI[sha256sum] =3D
>>>"00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3
>>"
>>>>
>>>> +SRC_URI +=3D " \
>>>> +    file://CVE-2025-56005.patch \
>>>> +"
>>>> +
>>>>  inherit pypi setuptools3
>>>>
>>>>  RDEPENDS:${PN}:class-target +=3D "\
>>>
>>>
>>>--
>>>Yoann Congal
>>>Smile ECS


--=20
Yoann Congal
Smile ECS


