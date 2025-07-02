Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53376C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 09:50:43 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.19756.1751449834922648988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 02:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=C3dL2Qft;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55515213c3cso3866154e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751449833; x=1752054633; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tG7IvIKFzfliMBLZqP547pTBB/J7JgSDkoDuBmdlrgQ=;
        b=C3dL2QftltcPtZ5Zr3LI1kuE4ZcMnVabXoTggVsE9I/mCoc6zwYB7CTulj1i/JWN3g
         cIleDUGMfNoY8sFQ7wf/6q/wXtijfoZVgJcidYfkatJl2ZBDbCFEFgGYpFcjw2x/dryB
         GqHJNNl6ZhEgMdxLpVp4gNXlx9Ynm1f1mhCW5+U0sG5lMjU/rJg5oJGGuCoyYanxLI4q
         pfRoPEfwYQ8bEPKbakq0da7IdtrsrTrQ0tCpuKD/ipIiILno1snd1np2xLA1CeJskXnd
         +AlWB4dxLc52LH7HoLh9QfJ93qrEbtlmL9rGf9OUiiyA1BKVmMKMjLq3sCPEcD8qZE9V
         tEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449833; x=1752054633;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tG7IvIKFzfliMBLZqP547pTBB/J7JgSDkoDuBmdlrgQ=;
        b=F9ndkWU9kAH6a3tv+4Si9nyTta6xVAIawrNR2RsYYVWQznXqtbCU1linHhKeEd8dL3
         qPa5rg3w7iSoUw/fjVALVKbFZSYBGgZAbqTZZfJISB31Z2/lbPhnswlbWI59Qi91RpUs
         tPghlqusxdE9z4Rfhnme7JNEX4tn4wwYi/AG5fSVFnxrtpkUpFihKpMKFUsEtyYrSJiF
         vMbb/ra2Cx3XXVXCwSLyfjPohh0gQt8LeNLNrTD2sv8KclnWQJOLp1tewIwGGtqgeuHo
         tgGrnB8Ckas5D0pO8hCxmOSZQk53QvL03OAHJanrk4O6I0detwrJCphpj3DuLy1Zdn0D
         teOg==
X-Gm-Message-State: AOJu0YxY6C0N0Nw/Mi7CxnDPTJyUKI79t5Y7LEQTWcGhY6P5d99CoZba
	i3fOHyzSCw0GhZGZngqT1fgvb3z2sy/bvu3HcAlcW6oIumAeBjgYTdfL4KUXiHv1MVM=
X-Gm-Gg: ASbGncs83BF4T6O5NHUgaDhuNLGtJpHBgFWxNSjpsPF8jXLpUdI1LxuYtQTrkeJ+vTa
	k1R7HGxALj47UuUQIcO9H5Dyf9B3o6RbdH4xVXVezuR0bRgTuv7qNTHzAnFc98nBcd9pfEsHRbi
	PCWj+pR9VEYU3sA+unBObMZhURUCb9hREARAeS+t5zvaJFEA0p8Pu2dFjjwT47N/OO/KdSR3Hk0
	zKEnUFWtHb6ROGH2edO+2JP1uPeCpI+NkzUVZepNtbAqMF/75fmo/n9CabC9ppkuEWNVEzqyFXB
	HFNe3+ISK0WIluKXETNQy65qiTvfPDk9TkqE4/htXvOt9Dy2ESUq7HjtiIJvA2ewrYMG55Nelhd
	16pst71st6SaY7/DxHP4=
X-Google-Smtp-Source: AGHT+IEl8e2wLeL580LhnEFhHmo1Adgg410zaHrI/QjmsYiEoY9A+5xZOYjdiPRfF2sqpaJCVlo6AQ==
X-Received: by 2002:a05:6512:10ce:b0:553:2fb1:cfe5 with SMTP id 2adb3069b0e04-5562829f56bmr692428e87.12.1751449832793;
        Wed, 02 Jul 2025 02:50:32 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e0c6easm17861061fa.26.2025.07.02.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:50:32 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:50:31 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/6] oeqa runtime apt.py: check errors and
 fix quoting
Message-ID: <aGUA5wjbdnoKvmrM@nuoska>
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
 <20250701073359.979368-2-mikko.rapeli@linaro.org>
 <e4c3d114eeec55e27d5da82569916332934381da.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4c3d114eeec55e27d5da82569916332934381da.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 09:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219815

Hi,

On Wed, Jul 02, 2025 at 10:42:26AM +0100, Richard Purdie wrote:
> On Tue, 2025-07-01 at 10:33 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > Check that shell commands succeeded and fix quoting
> > warning:
> > 
> > core-image-minimal/lib/oeqa/runtime/cases/apt.py:44: SyntaxWarning: invalid escape sequence '\['
> > � self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's|\[trusted=yes\] http://bogus_ip:bogus_port|%s|g'�sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/lib/oeqa/runtime/cases/apt.py | 8 ++++----
> > �1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
> > index 8000645843aa..b7cda0095394 100644
> > --- a/meta/lib/oeqa/runtime/cases/apt.py
> > +++ b/meta/lib/oeqa/runtime/cases/apt.py
> > @@ -36,12 +36,12 @@ class AptRepoTest(AptTest):
> > ���� def setup_source_config_for_package_install(self):
> > �������� apt_get_source_server = 'http://%s:%s/'�% (self.tc.target.server_ip, self.repo_server.port)
> > �������� apt_get_sourceslist_dir = '/etc/apt/'
> > -������� self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s/all ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
> > +������� self.target.run('cd %s && echo "deb [ allow-insecure=yes ] %s/all ./" > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
> > �
> > ���� def setup_source_config_for_package_install_signed(self):
> > �������� apt_get_source_server = 'http://%s:%s'�% (self.tc.target.server_ip, self.repo_server.port)
> > �������� apt_get_sourceslist_dir = '/etc/apt/'
> > -������� self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's|\[trusted=yes\] http://bogus_ip:bogus_port|%s|g'�sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
> > +������� self.target.run("cd %s && cp sources.list sources.list.bak && sed -i 's|[trusted=yes] http://bogus_ip:bogus_port|%s|g'�sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
> > �
> > ���� def cleanup_source_config_for_package_install(self):
> > �������� apt_get_sourceslist_dir = '/etc/apt/'
> > @@ -49,12 +49,12 @@ class AptRepoTest(AptTest):
> > �
> > ���� def cleanup_source_config_for_package_install_signed(self):
> > �������� apt_get_sourceslist_dir = '/etc/apt/'
> > -������� self.target.run('cd %s; mv sources.list.bak sources.list' % (apt_get_sourceslist_dir))
> > +������� self.target.run('cd %s && mv sources.list.bak sources.list' % (apt_get_sourceslist_dir))
> > �
> > ���� def setup_key(self):
> > �������� # the key is found on the target /etc/pki/packagefeed-gpg/
> > �������� # named PACKAGEFEED-GPG-KEY-poky-branch
> > -������� self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
> > +������� self.target.run('cd %s && apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
> > �
> > ���� @skipIfNotFeature('package-management',
> > ���������������������� 'Test requires package-management to be in IMAGE_FEATURES')
> > 
> 
> This breaks the test on the autobuilder:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1885
> 
> (or it was broken and hiding an error)
> 
> Either way, we need to fix this before it can merge.

Thanks, I came to the same conclusion from the failures reported by Antonin.

I dropped this change from the testexport related series in v3.

Cheers,

-Mikko

