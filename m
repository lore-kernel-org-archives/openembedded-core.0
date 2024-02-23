Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56515C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 17:27:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.877.1708709268416263523
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 09:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hT0apHpF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso894757a12.3
        for <Openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 09:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708709268; x=1709314068; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eEhRz19xKuh2mboh2JSS9nT3j+aS2Qva5/l8vhiWjns=;
        b=hT0apHpF/4ZPyJkUBiS6eprU2ki7vjyQhYMbDj+fPyG2WEPKuE5RyAkioStOhD9yTo
         BxJxYYACf8oj2WBTmDP75uoTUiOaT3H3k7PrRwq6PFTpR1uzMoZ7XNfAGmrPsASO6b2b
         pLIt7kQCUbTassmLpCtOwNPzdVeDpWKKPlsF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708709268; x=1709314068;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEhRz19xKuh2mboh2JSS9nT3j+aS2Qva5/l8vhiWjns=;
        b=h9+rvYg+wVOLJ5E+MX8rv4LUejsYAx0uMF7TT9hK86BwtwUE6+ejtooXZSXzkA8Y/K
         V6sbT84vtGnrnYP+nmWdoEoGhCWcNA6VXmnFlwhauKVKutTwFUYuiPjdgklLRi9kCvuq
         IZl6AjyroCIFBhGR4GVQmJLiKyiXXc2u8wEa3JQuZiBw7cbUIwGEaSURzPWvMRmrvgwN
         d5rtr4HlB4ERVW6OsN4+HQVzKql7vOt9xisZ6Sbal0TkB9+vA8c8bTV5xqAZzNF2pbrj
         q0HrQ/kDr5e8aKiEJtbb0sg2A0OdXx1gDhe1deJAVKfNNK+QKedz7444RrZc3Uh7QpiG
         Kv3w==
X-Forwarded-Encrypted: i=1; AJvYcCWN3w9sQn+V4YxrBsHT00R8tXVqD5IIXC5JZdAdBkchoeKR6VLXh58tzqRiMQJzqvxuBFnZqGRCKMNf1UXw0hazVJWacQrnHFk+eTeXtN6lauOIlOJeIK9w
X-Gm-Message-State: AOJu0YyKjf07mndSuh7SShZvw2AsWPmKzzPgJZK1SKh4SgmF9OlecNzx
	UpxseUW2AvBYyl6prwR9JUaIl8BM3p2RVJhwHFig/9DcE7rB0LtSl7fXaN+WDbs=
X-Google-Smtp-Source: AGHT+IHi13DNnNS7Y6BGU3PEtduxIsfMTUCcDQl5fOe4xqhqiNnA/JryHB0KKxzW/iA+RfwzvoJzSA==
X-Received: by 2002:a17:90b:19cf:b0:299:d5fa:3e1c with SMTP id nm15-20020a17090b19cf00b00299d5fa3e1cmr446926pjb.31.1708709267830;
        Fri, 23 Feb 2024 09:27:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:25c1:6c0c:e2b8:37ae? ([2001:8b0:aba:5f3c:25c1:6c0c:e2b8:37ae])
        by smtp.gmail.com with ESMTPSA id h7-20020a17090ac38700b00298f2ad430csm1744263pjt.0.2024.02.23.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:27:47 -0800 (PST)
Message-ID: <d17283d1e037be26e5fd905853ff47c48d630e85.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v3 1/5] lib/oeqa: share get_json_result_dir
 helper
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 23 Feb 2024 17:27:44 +0000
In-Reply-To: <20240223151648.1453027-2-alexis.lothore@bootlin.com>
References: <20240223151648.1453027-1-alexis.lothore@bootlin.com>
	 <20240223151648.1453027-2-alexis.lothore@bootlin.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 17:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196104

On Fri, 2024-02-23 at 16:16 +0100, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> Multiple places in oeqa need to get the log output path, and redefine
> a
> small helper to accomplish this
>=20
> Define this helper in lib/oeqa/utils/__init__.py and import it
> wherever
> needed to allow using it.
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
> There is one additional place re-definining (slightly) differently
> this
> helper, which is in selftest/context.py. This one does not check
> OEQA_JSON_RESULT_DIR from the datastore but through test data
> embedded in
> the test context. Based on Richard's feedback in v2, the datastore
> functions may be correctly simulated even in this case, so I may do
> some
> tests and come up with a patch after this series
> ---
> =C2=A0meta/classes-recipe/testimage.bbclass | 12 +++---------
> =C2=A0meta/lib/oeqa/sdk/testsdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 11 ++---------
> =C2=A0meta/lib/oeqa/utils/__init__.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 7 +++++++
> =C2=A03 files changed, 12 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-
> recipe/testimage.bbclass
> index d076102f9691..959c226072aa 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -149,13 +149,6 @@ def get_testimage_configuration(d, test_type,
> machine):
> =C2=A0=C2=A0=C2=A0=C2=A0 return configuration
> =C2=A0get_testimage_configuration[vardepsexclude] =3D "DATETIME"
> =C2=A0
> -def get_testimage_json_result_dir(d):
> -=C2=A0=C2=A0=C2=A0 json_result_dir =3D os.path.join(d.getVar("LOG_DIR"),=
 'oeqa')
> -=C2=A0=C2=A0=C2=A0 custom_json_result_dir =3D d.getVar("OEQA_JSON_RESULT=
_DIR")
> -=C2=A0=C2=A0=C2=A0 if custom_json_result_dir:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json_result_dir =3D custom_js=
on_result_dir
> -=C2=A0=C2=A0=C2=A0 return json_result_dir
> -
> =C2=A0def get_testimage_result_id(configuration):
> =C2=A0=C2=A0=C2=A0=C2=A0 return '%s_%s_%s_%s' % (configuration['TEST_TYPE=
'],
> configuration['IMAGE_BASENAME'], configuration['MACHINE'],
> configuration['STARTTIME'])
> =C2=A0
> @@ -224,6 +217,7 @@ def testimage_main(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 from oeqa.core.target.qemu import supported_fsty=
pes
> =C2=A0=C2=A0=C2=A0=C2=A0 from oeqa.core.utils.test import getSuiteCases
> =C2=A0=C2=A0=C2=A0=C2=A0 from oeqa.utils import make_logger_bitbake_compa=
tible
> +=C2=A0=C2=A0=C2=A0 from oeqa.utils import get_json_result_dir
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def sigterm_exception(signum, stackframe):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> @@ -426,14 +420,14 @@ def testimage_main(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 # Show results (if we have them)
> =C2=A0=C2=A0=C2=A0=C2=A0 if results:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configuration =3D get_te=
stimage_configuration(d, 'runtime',
> machine)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 results.logDetails(get_testim=
age_json_result_dir(d),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 results.logDetails(get_json_r=
esult_dir(d),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
nfiguration,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ge=
t_testimage_result_id(configuration),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> dump_streams=3Dd.getVar('TESTREPORT_FULLLOGS'))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 results.logSummary(pn)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Copy additional logs to tmp/log/oeqa so it's e=
asier to find
> them
> -=C2=A0=C2=A0=C2=A0 targetdir =3D os.path.join(get_testimage_json_result_=
dir(d),
> d.getVar("PN"))
> +=C2=A0=C2=A0=C2=A0 targetdir =3D os.path.join(get_json_result_dir(d), d.=
getVar("PN"))
> =C2=A0=C2=A0=C2=A0=C2=A0 os.makedirs(targetdir, exist_ok=3DTrue)
> =C2=A0=C2=A0=C2=A0=C2=A0 os.symlink(bootlog, os.path.join(targetdir,
> os.path.basename(bootlog)))
> =C2=A0=C2=A0=C2=A0=C2=A0 os.symlink(d.getVar("BB_LOGFILE"), os.path.join(=
targetdir,
> os.path.basename(d.getVar("BB_LOGFILE") + "." +
> d.getVar('DATETIME'))))
> diff --git a/meta/lib/oeqa/sdk/testsdk.py
> b/meta/lib/oeqa/sdk/testsdk.py
> index b4719110edbc..518b09febb61 100644
> --- a/meta/lib/oeqa/sdk/testsdk.py
> +++ b/meta/lib/oeqa/sdk/testsdk.py
> @@ -22,14 +22,6 @@ class TestSDKBase(object):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'L=
AYERS': get_layers(d.getVar("BBLAYERS"))}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return configuration
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 @staticmethod
> -=C2=A0=C2=A0=C2=A0 def get_sdk_json_result_dir(d):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json_result_dir =3D os.path.j=
oin(d.getVar("LOG_DIR"), 'oeqa')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 custom_json_result_dir =3D d.=
getVar("OEQA_JSON_RESULT_DIR")
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if custom_json_result_dir:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json_=
result_dir =3D custom_json_result_dir
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return json_result_dir
> -
> =C2=A0=C2=A0=C2=A0=C2=A0 @staticmethod
> =C2=A0=C2=A0=C2=A0=C2=A0 def get_sdk_result_id(configuration):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return '%s_%s_%s_%s_%s' =
% (configuration['TEST_TYPE'],
> configuration['IMAGE_BASENAME'], configuration['SDKMACHINE'],
> configuration['MACHINE'], configuration['STARTTIME'])
> @@ -72,6 +64,7 @@ class TestSDK(TestSDKBase):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from bb.utils import exp=
ort_proxies
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from oeqa.utils import m=
ake_logger_bitbake_compatible
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from oeqa.utils import get_js=
on_result_dir
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pn =3D d.getVar("PN")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger =3D
> make_logger_bitbake_compatible(logging.getLogger("BitBake"))
> @@ -134,7 +127,7 @@ class TestSDK(TestSDKBase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
component =3D "%s %s" % (pn,
> self.context_executor_class.name)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
context_msg =3D "%s:%s" % (os.path.basename(tcname),
> os.path.basename(sdk_env))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
configuration =3D self.get_sdk_configuration(d,
> self.test_type)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resul=
t.logDetails(self.get_sdk_json_result_dir(d),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resul=
t.logDetails(get_json_result_dir(d),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 configuration,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 self.get_sdk_result_id(configuration))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
result.logSummary(component, context_msg)
> diff --git a/meta/lib/oeqa/utils/__init__.py
> b/meta/lib/oeqa/utils/__init__.py
> index fbc7f7d525d8..53bdcbf26618 100644
> --- a/meta/lib/oeqa/utils/__init__.py
> +++ b/meta/lib/oeqa/utils/__init__.py
> @@ -90,3 +90,10 @@ def load_test_components(logger, executor):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "_executor_class defined." %
> (comp_name, comp_context))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 return components
> +
> +def get_json_result_dir(d):
> +=C2=A0=C2=A0=C2=A0 json_result_dir =3D os.path.join(d.getVar("LOG_DIR"),=
 'oeqa')
> +=C2=A0=C2=A0=C2=A0 custom_json_result_dir =3D d.getVar("OEQA_JSON_RESULT=
_DIR")
> +=C2=A0=C2=A0=C2=A0 if custom_json_result_dir:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json_result_dir =3D custom_js=
on_result_dir
> +=C2=A0=C2=A0=C2=A0 return json_result_dir
> \ No newline at end of file
>=20

I suspect this is missing a change to TestSDKEXT:

https://autobuilder.yoctoproject.org/typhoon/#/builders/136/builds/56/steps=
/14/logs/stdio

Cheers,

Richard



