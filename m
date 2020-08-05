Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.3195.1596652623072195511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 11:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZTNHvK6d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id l2so31103262wrc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zwoh46vInaItGZC6u+7d51Yecp1szi3+AsjVqHN4fb0=;
        b=ZTNHvK6dUZppHiuLfl4vMIugeU5b92rpUWnV5Rn/WpKULKMyk3z82d/NK3q9PDJV7B
         /yoJA7WK3Z9gKPvszhb9tL/XM/uCBfyWf71BFkOkSrdxZ+T+8NVVmmV912aXTD81XLVs
         AjCHKl8fSjhrS/XZ8d7TTio5+nqkPtwZHXXRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zwoh46vInaItGZC6u+7d51Yecp1szi3+AsjVqHN4fb0=;
        b=DD9fsJxE49jLVHosnHby8nupDhwL4NxQS+sajdmMlsD15JWh8u/vxOWUH/v7uW3QE6
         nfwQY2qSRgWoLYL8P3X4Et3pyldjeWuKb1218/NF1SEuyInjIGKa+secJbFxZHXhDX3Y
         apoqjxKF1RG1QbTRMKw26HxYPyhRpXbFYJt6ciHoxs6549ajyclzsxlEfz1F/8Ie1cnm
         dPrJe60FuUwBo8mYJCIrooKMWY2dwyn6uNN87hZRLqJBh390XNJPbClpayIM81AwaY3E
         3Mom5KJQd/Zy34vnAe5CkhfcwCaoq2XOyL+s26geVHxbtredauaellYy3WipLd9z3LnF
         dZVA==
X-Gm-Message-State: AOAM5326ERlS4uEsPCfus9X6/4vPRGCXjnc2mvJl2zD5Mv5MN2uAddvM
	tl/MM1ZTdyluVzxW19KRMe2vGA==
X-Google-Smtp-Source: ABdhPJy1gvQ4FuKMzT1h/Nr1VRQApBSOk9BEHlz5sAaPK/P+LwFDU0fsPvOfbJtIFw1YmkWxS0A4oQ==
X-Received: by 2002:a5d:5588:: with SMTP id i8mr3894175wrv.177.1596652621402;
        Wed, 05 Aug 2020 11:37:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id k126sm3982652wme.17.2020.08.05.11.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 11:37:01 -0700 (PDT)
Message-ID: <6d12e9899f7011def936353111bf0e88333a8781.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3] ltp: make copyFrom scp command non-fatal
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 19:36:59 +0100
In-Reply-To: <873651hrhl.fsf@windriver.com>
References: <20200805181025.6361-1-matthew.zeng@windriver.com>
	 <83a3c9a961bec6ed39fb48d67a3c615e13d05fa3.camel@linuxfoundation.org>
	 <873651hrhl.fsf@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 14:33 -0400, Mingde (Matthew) Zeng wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> > On Wed, 2020-08-05 at 14:10 -0400, Matthew wrote:
> > > [YOCTO #13802]
> > > 
> > > Make the scp failure non-fatal so the ltp tests continue to run and
> > > the rest of the logs will be available to see afterwards.
> > > 
> > > Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> > > ---
> > >  meta/lib/oeqa/core/target/ssh.py   | 7 +++++--
> > >  meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
> > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> > > index 090b40a814..aefb576805 100644
> > > --- a/meta/lib/oeqa/core/target/ssh.py
> > > +++ b/meta/lib/oeqa/core/target/ssh.py
> > > @@ -107,13 +107,16 @@ class OESSHTarget(OETarget):
> > >              scpCmd = self.scp + [localSrc, remotePath]
> > >              return self._run(scpCmd, ignore_status=False)
> > > 
> > > -    def copyFrom(self, remoteSrc, localDst):
> > > +    def copyFrom(self, remoteSrc, localDst, warn_on_failure=False):
> > >          """
> > >              Copy file from target.
> > >          """
> > >          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
> > >          scpCmd = self.scp + [remotePath, localDst]
> > > -        return self._run(scpCmd, ignore_status=False)
> > > +        (status, output) = self._run(scpCmd, ignore_status=warn_on_failure)
> > > +        if warn_on_failure and status:
> > > +            self.logger.warning("Copy returned non-zero exit status %d:\n%s" % (status, output))
> > > +        return (status, output)
> > > 
> > >      def copyDirTo(self, localSrc, remoteDst):
> > >          """
> > > diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
> > > index 6dc5ef22ad..da529ce482 100644
> > > --- a/meta/lib/oeqa/runtime/cases/ltp.py
> > > +++ b/meta/lib/oeqa/runtime/cases/ltp.py
> > > @@ -78,7 +78,7 @@ class LtpTest(LtpTestBase):
> > >              # copy nice log from DUT
> > >              dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
> > >              remote_src = "/opt/ltp/results/%s" % ltp_group
> > > -            (status, output) = self.target.copyFrom(remote_src, dst)
> > > +            (status, output) = self.target.copyFrom(remote_src, dst, True)
> > >              msg = 'File could not be copied. Output: %s' % output
> > >              self.assertEqual(status, 0, msg=msg)
> > 
> > The idea of this change is so "the ltp tests continue to run" yet if I
> > understand that code, a copy failure will throw the assertEqual and
> > hence stop the test so we don't get all the other logging information?
> 
> When warn_on_failure=True, so is ignore_status. Then 'status and not
> ignore_status' evaluates to false, and 'raise AssertionError("Command
> '%s' returned non-zero exit ...)' will not run.

Sure, but status will be non-zero and the code says:

(status, output) = self.target.copyFrom(remote_src, dst, True)
msg = 'File could not be copied. Output: %s' % output
self.assertEqual(status, 0, msg=msg)

so

self.assertEqual(status, 0, msg=msg)

will fail if copyFrom() fails?

Cheers,

Richard




