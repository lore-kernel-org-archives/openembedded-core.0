Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id ACB617D200
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 20:10:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u19so195887ior.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3p7ZDVZnOaNldxc2Az4Y1nb85xNuwRQ5KuK/9KZMsfE=;
	b=gJWloPbrqbHju2UwZTSntQw3dk4GNqkTvdub5ZtQbfW7Tujoven0anLujnPB1wTgny
	xaV7OgPf73RcnPWf46xzI5SY9h2+Zqy3N+kxS4eFz3NQuU2UyGW3QsQvM//dDSM5rXGN
	WxuJ6LZWVDbXWamjFKQ+RzTTTCu1CXt++9VCdPq4n8O3BcHCkDA4mq+7rLVbjhBqHztl
	AX1GXmCK9DOMdkukgCJ2IyHYjC23jwYMvdVjGq4ZtTfwCdUYJ8yMaLBuIsilnXAZkTnW
	kiD4m1iP9ERYCXNX3KSdgBBOmZIK2AKRx6AAyAmUjmFRwVLOwVTIWsqgUN2J2Xj9BfrZ
	g/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3p7ZDVZnOaNldxc2Az4Y1nb85xNuwRQ5KuK/9KZMsfE=;
	b=Yn6DM7afZ8vwnivvkNjOItECUt9qJcMT0l+tXrJ9FEcEgnggtlTIK/e6+ONCIFcFHn
	GdAHuifHSSXDQ/jwRf2Bp9M+UCqNa7Q+iG3Ii6rnHpVz7HXCjShM1RSMuzv10blh/95G
	YnlZzMGuotEI/RRqHi5mKYA6jX1I2jm8ukEqmLg48egHATn4Zo+csTmI2fiVt7reMBNm
	4MJa3PA1jFtaM5wa+aFe3yqNqNVopqto43vz25o9MfP61+HXquBC9idN3+2v4lyKKhUr
	LXYS+P47SU/sht2ECf8J62cm+Kdn0kpwtxMj2lclIAXzULjlwJoab17PnYDsRrXDqE7h
	pfAA==
X-Gm-Message-State: APjAAAXi3DcK2uNR3LBXqeB/jw+hkNgSmmqLaAFlJIM9RN8brPzCldqw
	PY+1vV1lhc43Lpud2g/0VxcHF1pv+rQAgin6YF90LGF8Wms=
X-Google-Smtp-Source: APXvYqzrFbqWnkKRMG2yoliicdaL9RlGfENTl9TQex4sOHNSRz03ZJaHNhMrb1EBwokcI2rKYKbaIFWavyFuVfB8vP4=
X-Received: by 2002:a05:6638:5:: with SMTP id z5mr22985220jao.58.1561234229435;
	Sat, 22 Jun 2019 13:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190621192710.15428-1-jdmason@kudzu.us>
	<30d4f80b522e6bcb23143a804eb44fc5067b3b47.camel@linuxfoundation.org>
In-Reply-To: <30d4f80b522e6bcb23143a804eb44fc5067b3b47.camel@linuxfoundation.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Sat, 22 Jun 2019 16:10:18 -0400
Message-ID: <CAPoiz9y4STG1zqd_ZT47bZWh7fA0HUx1Ar+28V+K0318XGrKpQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe_syslog.py: Handle syslogd/klogd restart race
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Jun 2019 20:10:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 22, 2019 at 4:08 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-06-21 at 15:27 -0400, Jon Mason wrote:
> > syslogd and klogd can occasionally take too long to restart, which
> > causes tests to fail by starting before the log daemons are ready.  To
> > work around this problem, poll for up to 30 seconds on the processes to
> > verify the old ones are killed and the new ones are up and running.
> >
> > [YOCTO #13379]
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/lib/oeqa/runtime/cases/oe_syslog.py | 54 +++++++++++++++++++++---
> >  1 file changed, 48 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > index 0f5f9f43ca..480aadedf9 100644
> > --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > @@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
> >  from oeqa.core.decorator.depends import OETestDepends
> >  from oeqa.core.decorator.data import skipIfDataVar
> >  from oeqa.runtime.decorator.package import OEHasPackage
> > +import time
> >
> >  class SyslogTest(OERuntimeTestCase):
> >
> > @@ -21,6 +22,49 @@ class SyslogTest(OERuntimeTestCase):
> >
> >  class SyslogTestConfig(OERuntimeTestCase):
> >
> > +    def test_syslog_restart_sanity(self):
> > +        status, syslogd_pid = self.target.run('pidof syslogd')
> > +        status, klogd_pid = self.target.run('pidof klogd')
>
> FWIW by calling this test_, it will be run as a standalone test. This
> may have two issues:
>
> a) it won't work on a systemd image

I didn't know that was something desired.  I can modify it to try and
cover that use case, as it does make sense to try and cover all of
them.

> b) its missing dependency markup (is syslog running?) that the other
> tests have

I assumed that the dependencies on the calling functions would filter
down.  I'll add a similar limit as the other functions present.

> Unless we really want it as a standalone test (I think there is a
> similar one already), the fix may be just to rename it something other
> than starting with test_.

I can change that.

>
> Cheers,
>
> Richard
>
> > +        status, output = self.target.run('/etc/init.d/syslog restart')
> > +
> > +        # Always check for an error, most likely a race between shutting down and starting up
> > +        timeout = time.time() + 30
> > +
> >
>

