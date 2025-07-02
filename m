Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9460EC7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:24:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.17935.1751441066762436245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qmvwFqlM;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so8206024e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751441065; x=1752045865; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRSoEn+ou/UB6SZOPCHrLYdp4F0rmSFFfO0u4lrQIzY=;
        b=qmvwFqlMRP3X/2D9ArFAbQzhI7MBbck8p0f+etoSD+iOH6SOU8MfL2gLnaYz0i9Xd2
         +CUt0hJNyVYd44TIuPwVsCb0b0VGIRAEYjsXgQ3/j+vWwnkDiZZ8z20F5W97cT0j6oZu
         rI7W31dbjONE+wUGIPk1lBwmsrvawAqPb9bIaYhhZvZ2lvAbfs375/dVUcYILhBIhfqT
         s9Z0xwnyIfnqBaHVwoBRTKjPDvcRkT4Eg2kHMIMsLurMeCgAX3qjgXS9sycl8PeMmTHP
         Xlr18qkv6xsmRc16+vWITKb6aV98+gmfRQ50EabMTQeKGh61Qa/38wUOTwj55K1z1zVB
         U5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441065; x=1752045865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRSoEn+ou/UB6SZOPCHrLYdp4F0rmSFFfO0u4lrQIzY=;
        b=VpyA8FW6yYrDxzPofuBMv0wI3EC/aQK3ZomsEFviQKcdFkgIwcii7qcuNf22+CKjEz
         zona1xEJPkY7Op8MpNjh3TDrMA9FfU5anV1MSaGI5+oc5XjXF5kjSgco/7X+qW6U+7hH
         h9lDuO5HPPkYuC9ud8lWTEeLmYDeBpnp/+W7T/vzWHhaMPDtH8rLu3QOr4VmAp20UNOX
         w8Ah3nUA7aCpNE2RSu7/Ll+ZeT5p1c/Gkg0eCBstrFM2B3x36G4RKOowppwBHKPu/twp
         BTxtjopkiuR6iwjiF5Um6iSl8uJtry6NGuvqXwcITAi3x3U/I6sg0dYDzv0p4PyFeNY0
         Sl9g==
X-Gm-Message-State: AOJu0YzGEe2NYrwi37CXwQxdrLRdu4wGtc6dEWmMDI3OZmfliFHm+/TJ
	KOTWs4ADJG5ZpOjvaNxbsJIB7acYq1qfIqCpvES1epHc9Ncy0KvcvsmdY/NBfY5YRaggLT5J9zV
	Ox59s
X-Gm-Gg: ASbGncvvlx6fm+N0di0hDdjKipyiShcBS0vPzKOfTNKfn40ZmzboQ07+U+BPXR23ElD
	NTMxanZMRp8joD0LVX7A8B14HFJj7zwLN6ZxZhPMZrYyDzGhYP2vHry5iiu3IKk9+DwAoGvu9w7
	PSxXyuqvHSe6HZf+VrzkPncSYntoP8lT+2riHLPPstZcwZAYM0RVDRF7mfP7Ksp33E45MQX/+oS
	CQVa51nakDZfvrD5VKvjp7uqcbnoRL1LDK5fldQdmNKBff2fRwuX0XFp0g1sp/JQ/xdFE3YxTxP
	V95xp08hrPpyi6WGTMp7ezTUhXYYRfeC2y7dVHLmeMVwqnzQlfDpfPYe4/yPWSr1iyeGZysYZ3/
	dXGO2Co03YAyUTlLmy7o=
X-Google-Smtp-Source: AGHT+IGiwwv+Xl6pE4xnPx5VlGAoysRmeNasI/K0lHIo3sycNilfWJJMCQaJA/bZ6n/U+e+3hTAY0w==
X-Received: by 2002:a05:6512:acc:b0:553:cb0b:4dd8 with SMTP id 2adb3069b0e04-55628e57c59mr441697e87.6.1751441064432;
        Wed, 02 Jul 2025 00:24:24 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24d28esm2044523e87.61.2025.07.02.00.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:24:24 -0700 (PDT)
Date: Wed, 2 Jul 2025 10:24:22 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/6] oeqa runtime: set self.runner and
 handle None
Message-ID: <aGTephjaj-VL25oT@nuoska>
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
 <DB1CWHVP7UW6.Z2K1JXYVC2N8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB1CWHVP7UW6.Z2K1JXYVC2N8@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219788

Hi,

On Wed, Jul 02, 2025 at 08:30:52AM +0200, Antonin Godard wrote:
> On Tue Jul 1, 2025 at 9:33 AM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > Set default self.runner to None. qemu target sets
> > the runner to qemu. Then handle self.runner None in
> > run_network_serialdebug(). This way ssh runner
> > and failing ping or ssh tests handle the error cases.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/lib/oeqa/core/target/__init__.py | 1 +
> >  meta/lib/oeqa/runtime/case.py         | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> > v2: setting self.runner for all target types instead of target conditional
> >     paths in tests
> >
> > v1: https://lists.openembedded.org/g/openembedded-core/message/219377
> >     and https://lists.openembedded.org/g/openembedded-core/message/219378
> >
> > diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/__init__.py
> > index 1382aa9b5239..177f648fe358 100644
> > --- a/meta/lib/oeqa/core/target/__init__.py
> > +++ b/meta/lib/oeqa/core/target/__init__.py
> > @@ -10,6 +10,7 @@ class OETarget(object):
> >  
> >      def __init__(self, logger, *args, **kwargs):
> >          self.logger = logger
> > +        self.runner = None
> >  
> >      @abstractmethod
> >      def start(self):
> > diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
> > index 9515ca2f3d62..2a47771a3d47 100644
> > --- a/meta/lib/oeqa/runtime/case.py
> > +++ b/meta/lib/oeqa/runtime/case.py
> > @@ -23,6 +23,8 @@ class OERuntimeTestCase(OETestCase):
> >          uninstall_package(self)
> >  
> >  def run_network_serialdebug(runner):
> > +    if not runner:
> > +        return
> >      status, output = runner.run_serial("ip addr")
> >      print("ip addr on target: %s %s" % (output, status))
> >      status, output = runner.run_serial("ping -c 1 %s" % self.target.server_ip)
> 
> Hi Mikko,
> 
> I think this series caused some issues on the Autobuilder:
> 
>   AssertionError: 100 != 0 : apt-get install --yes run-postinsts-dev
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2031
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1879
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1816
> 
> Can you have a look?

Ok the apt test changes are causing these failures. I will drop
those changes.

Sorry about this,

-Mikko

