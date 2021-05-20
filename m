Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.8715.1621519049433538385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 06:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ma9jH9+W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id n2so17862821wrm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=N/DsNS0bLly1jWNKePl2eSJNFZlptR/MYBi9jVzTZGU=;
        b=Ma9jH9+Wu/UdFiiIVEdI2oNtVAKHCh7ZIL+KTq8nepntETw1IybelOkRryB+DysRdK
         3cb8NY7SFaTZmnkUDOCJBbhXsOREIhNWpX0k8yIofcc16BxmavKlu3b3wJii9W3jC1qp
         Vf+TA3J2my4OfReDsSwKKsC0ZcI0mPaKEoUpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=N/DsNS0bLly1jWNKePl2eSJNFZlptR/MYBi9jVzTZGU=;
        b=ZJ522lX7u/oK0cFRLxDretxqO7TYbzH3t5BngVlboMOKnW3ryO095tQGHgNuHA/CWr
         bwCGuZInIN5OhBVOqcgkVfmuKr/NiwiFkVN+I9JCS9dmKQ+cmYvvAGEOBaonmJr/VAla
         J5Od5LagCNPINuIOzIWm9j/Wy+Cm/Hh0jq2vI41Y19AdZ9/TyTm/deRhp1uTf4r2jyj6
         GSlCJG6QLJRIr7qVpDPrb1UcmsgPuTeKf6Mxg2v28amP+3cLCEawNGSAUjp6xURH5lym
         yd52VPsGoziPuNoaGIwMoREcdb7UVkEpbvrn3VVdU9Vq2StQvrhOZHl7dINZUvvg0+DL
         dSVQ==
X-Gm-Message-State: AOAM532yhHuQ4HpBOnoLfWoyvMFPZoJH33/ERGEvk42rxX/EC2lv15+z
	rj8dFRTcvD1VOiYLUtryMNArEQ==
X-Google-Smtp-Source: ABdhPJwdprBNdvEVgTQ53OlPZie4SCQTfJ95eFM9BypwDWC0r9nvmgHCloT6Wj/LaVlA98OsgoX9Vg==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr4364948wrq.93.1621519047787;
        Thu, 20 May 2021 06:57:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:56da:83e7:85fe:8f81? ([2001:8b0:aba:5f3c:56da:83e7:85fe:8f81])
        by smtp.gmail.com with ESMTPSA id c22sm2914680wmb.10.2021.05.20.06.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 06:57:27 -0700 (PDT)
Message-ID: <ba3c74eaecd5b27959744d0f6e48c630b10dd346.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa: sdk: basic go toolchain test support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Morrow <pemorrow@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Cc: peter.morrow@microsoft.com, Jon Mason <Jon.Mason@arm.com>
Date: Thu, 20 May 2021 14:57:26 +0100
In-Reply-To: <1680C2C73B5C2D54.9669@lists.openembedded.org>
References: <1621343133-5221-1-git-send-email-pemorrow@linux.microsoft.com>
	 <1680C2C73B5C2D54.9669@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-20 at 12:27 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2021-05-18 at 06:05 -0700, Peter Morrow wrote:
> > Add a simple build test for the golang toolchain which is produced into a SDK.
> > 
> > Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> > ---
> >  meta/lib/oeqa/sdk/cases/go.py   | 34 ++++++++++++++++++++++++++++++++++
> >  meta/lib/oeqa/sdk/files/test.go |  7 +++++++
> >  2 files changed, 41 insertions(+)
> >  create mode 100644 meta/lib/oeqa/sdk/cases/go.py
> >  create mode 100644 meta/lib/oeqa/sdk/files/test.go
> > 
> > diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
> > new file mode 100644
> > index 0000000..1af5516
> > --- /dev/null
> > +++ b/meta/lib/oeqa/sdk/cases/go.py
> > @@ -0,0 +1,34 @@
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +import os
> > +import shutil
> > +import unittest
> > +
> > +from oeqa.core.utils.path import remove_safe
> > +from oeqa.sdk.case import OESDKTestCase
> > +
> > +from oeqa.utils.subprocesstweak import errors_have_output
> > +errors_have_output()
> > +
> > +class GoCompileTest(OESDKTestCase):
> > +    @classmethod
> > +    def setUpClass(self):
> > +        files = {'test.go' : self.tc.files_dir}
> > +        for f in files:
> > +            shutil.copyfile(os.path.join(files[f], f),
> > +                    os.path.join(self.tc.sdk_dir, f))
> > +
> > +    def setUp(self):
> > +        if not self.tc.hasHostPackage("^nativesdk-go", regex=True):
> > +            raise unittest.SkipTest("GoCompileTest class: SDK doesn't contain a golang toolchain")
> > +
> > +    def test_go_compile(self):
> > +        self._run('go build -o %s/test %s/test.go' % (self.tc.sdk_dir, self.tc.sdk_dir))
> > +
> > +    @classmethod
> > +    def tearDownClass(self):
> > +        files = [os.path.join(self.tc.sdk_dir, f) for f in ['test.go', 'test']]
> > +        for f in files:
> > +            remove_safe(f)
> > diff --git a/meta/lib/oeqa/sdk/files/test.go b/meta/lib/oeqa/sdk/files/test.go
> > new file mode 100644
> > index 0000000..089f721
> > --- /dev/null
> > +++ b/meta/lib/oeqa/sdk/files/test.go
> > @@ -0,0 +1,7 @@
> > +package main
> > +
> > +import "fmt"
> > +
> > +func main() {
> > +    fmt.Println("hello world!")
> > +}
> 
> I'd love to add something like this but adding it triggered a lot of errors
> in our automated QA:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2169
> 

The autobuilder output isn't helpful to debug. I looked in and grabbed some of a logfile:

NOTE: ======================================================================
NOTE: ERROR: setUpClass (go.GoCompileTest)
NOTE: ----------------------------------------------------------------------
NOTE: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/core/case.py", line 39, in _oeSetUpClass
    clss.setUpClassMethod()
  File "/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/sdk/cases/go.py", line 20, in setUpClass
    shutil.copyfile(os.path.join(files[f], f),
  File "/usr/lib64/python3.8/shutil.py", line 264, in copyfile
    with open(src, 'rb') as fsrc, open(dst, 'wb') as fdst:
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/files/test.go'

NOTE: ----------------------------------------------------------------------


Cheers,

Richard

