Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E9AC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 09:42:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.19593.1751449349737202486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 02:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hAnLmF2u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cf214200so34572965e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 02:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751449348; x=1752054148; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVCGNO3l0NRiY3xvHcwnuRMek7V/eCJjhBFk66YsvzY=;
        b=hAnLmF2umNJGTsymbSjim48GjIf635NV/If3A4v8KhlkeAaQIxxdeTqpHjBHx+kPRH
         tWN9JARmUz3OsE6u3EPpYyfkyZpciA+n9/u8umPEnoWoe0M9+61UW7K0rxykVvfZGVYp
         mPOPm9XahXrQAz1OS/BuqZ1mCDFr56cBQ/3JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449348; x=1752054148;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVCGNO3l0NRiY3xvHcwnuRMek7V/eCJjhBFk66YsvzY=;
        b=CD2ZTwOYfESn8h1iC9vIexVMP6ChsWwRRVxwhQI9nJHXiO11JgKK3iksxobBny8RKF
         +Dkp/BvkVlstoNcBHOmLLuFJj753yYg0KYZt2wxVQ2RNBzBk8vutiMY/sN/R0FNhf8Cn
         dpMWNYsNj2hrj6Srb8QC/UvHxFhEGIoeVNLu0ZaGniZU8OpmH8heHblGHcpbyl8+gUGW
         1viCr/u6B1ATXzA2+dvkOtwTKqCAGuFsH0ZkToxGFt7YuZU72s85FoIPBEGuKtkqMPNF
         RZvTRO07WTB1UpZ6mxIkgFtRZFMYqsacFmbNx7ybXMu/5oDw5ISsjcskoK7K+ElksJ4d
         v0BA==
X-Forwarded-Encrypted: i=1; AJvYcCVkRAHnW7lTZKUY0nbiDh7sUT14AiTuPO0CgNoCra0qSVX2jV2xaphmxWYd2Z2NhGreDQ25GCfbXQ25gDmO0aQHaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2/B3tI6CJZ+Kbg6Hz4PhcuN3j6mLw6Dztsx60/gFYbOB7gs80
	gpf5yHFZtTyG9PcHWLMY1h/2v0CPePzWDqvgKaoFZJL/KTtR6iwXWaPOnpvcJi6JsvQ=
X-Gm-Gg: ASbGncvbm/6trGxDhudchXvrZGH9EcgBBTamdCZMocbjVZb/aFGXHIspSZvBRpF15pC
	Jkd/MIy3u10tV0GYYbmKG6DsuIgM9Txx6aMJLHk7Du2womXzOeLUgAZ0dwNTz2LHfnRFXuO9J0D
	6S/YYu9iZIr6/Qq/Hj5Eg/t6yWxkV0959+4Y7tRFqxdywB1vDwcwE9CdKSa2DLxYdd/DyrBo7jD
	uG0mo7XvshxSTC0p/kWPNGSW6H8xtI6EwPtTn6tfJt5+mPlFLvInf38q129cSHPhYhNsh/yAli5
	RiaFXY6tKL2weXe7DkbQS5crAnpYNeiWFGGaqYVX8CUkTkUslQjbAwhRm0FX20x3t1fEkUwIC3l
	DuPhLQMWtflNzs+b2n5E2LhHdhqrrKuzfcw0ibmy5JEHVN6aQfIY=
X-Google-Smtp-Source: AGHT+IFT/bfv+2rYrll/qbJCnjm6O9tb1W/UXI5opv4A+Sd1t2iWOJy2PPXh4uYlZVTTeDDpIMQfug==
X-Received: by 2002:a05:600c:3504:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-454a36e49f6mr25197475e9.9.1751449348049;
        Wed, 02 Jul 2025 02:42:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:acf3:9ed8:45ec:fd86? ([2001:8b0:aba:5f3c:acf3:9ed8:45ec:fd86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4064b1sm196333125e9.29.2025.07.02.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:42:27 -0700 (PDT)
Message-ID: <e4c3d114eeec55e27d5da82569916332934381da.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/6] oeqa runtime apt.py: check errors and
 fix quoting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Wed, 02 Jul 2025 10:42:26 +0100
In-Reply-To: <20250701073359.979368-2-mikko.rapeli@linaro.org>
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
	 <20250701073359.979368-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 09:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219813

On Tue, 2025-07-01 at 10:33 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> Check that shell commands succeeded and fix quoting
> warning:
>=20
> core-image-minimal/lib/oeqa/runtime/cases/apt.py:44: SyntaxWarning: inval=
id escape sequence '\['
> =C2=A0 self.target.run("cd %s; cp sources.list sources.list.bak; sed -i '=
s|\[trusted=3Dyes\] http://bogus_ip:bogus_port|%s|g'=C2=A0sources.list" % (=
apt_get_sourceslist_dir, apt_get_source_server))
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/lib/oeqa/runtime/cases/apt.py | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/c=
ases/apt.py
> index 8000645843aa..b7cda0095394 100644
> --- a/meta/lib/oeqa/runtime/cases/apt.py
> +++ b/meta/lib/oeqa/runtime/cases/apt.py
> @@ -36,12 +36,12 @@ class AptRepoTest(AptTest):
> =C2=A0=C2=A0=C2=A0=C2=A0 def setup_source_config_for_package_install(self=
):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apt_get_source_server =
=3D 'http://%s:%s/'=C2=A0% (self.tc.target.server_ip, self.repo_server.port=
)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apt_get_sourceslist_dir =
=3D '/etc/apt/'
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('cd %s; echo =
deb [ allow-insecure=3Dyes ] %s/all ./ > sources.list' % (apt_get_sourcesli=
st_dir, apt_get_source_server))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('cd %s && ech=
o "deb [ allow-insecure=3Dyes ] %s/all ./" > sources.list' % (apt_get_sourc=
eslist_dir, apt_get_source_server))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def setup_source_config_for_package_install_sign=
ed(self):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apt_get_source_server =
=3D 'http://%s:%s'=C2=A0% (self.tc.target.server_ip, self.repo_server.port)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apt_get_sourceslist_dir =
=3D '/etc/apt/'
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run("cd %s; cp so=
urces.list sources.list.bak; sed -i 's|\[trusted=3Dyes\] http://bogus_ip:bo=
gus_port|%s|g'=C2=A0sources.list" % (apt_get_sourceslist_dir, apt_get_sourc=
e_server))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run("cd %s && cp =
sources.list sources.list.bak && sed -i 's|[trusted=3Dyes] http://bogus_ip:=
bogus_port|%s|g'=C2=A0sources.list" % (apt_get_sourceslist_dir, apt_get_sou=
rce_server))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def cleanup_source_config_for_package_install(se=
lf):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apt_get_sourceslist_dir =
=3D '/etc/apt/'
> @@ -49,12 +49,12 @@ class AptRepoTest(AptTest):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def cleanup_source_config_for_package_install_si=
gned(self):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apt_get_sourceslist_dir =
=3D '/etc/apt/'
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('cd %s; mv so=
urces.list.bak sources.list' % (apt_get_sourceslist_dir))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('cd %s && mv =
sources.list.bak sources.list' % (apt_get_sourceslist_dir))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def setup_key(self):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the key is found on th=
e target /etc/pki/packagefeed-gpg/
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # named PACKAGEFEED-GPG-=
KEY-poky-branch
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('cd %s; apt-k=
ey add P*' % ('/etc/pki/packagefeed-gpg'))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.run('cd %s && apt=
-key add P*' % ('/etc/pki/packagefeed-gpg'))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 @skipIfNotFeature('package-management',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Test requires=
 package-management to be in IMAGE_FEATURES')
>=20

This breaks the test on the autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1885

(or it was broken and hiding an error)

Either way, we need to fix this before it can merge.

Cheers,

Richard

