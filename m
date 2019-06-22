Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4039D7E7B9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 08:12:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so8201251wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=34AH7kLouFANtoq0pVNLQsxWZlmPq1NrPAA+Bctcnfs=;
	b=QjelxP5TI1JKuUOvcfZTl7oN4qRNi67YTHZyChisKMPyYH87FT40PPDS/noMA9jfGI
	HDUEY0kdIqTSdgUgLUqcarXM07Qo2HB5XMZN9Sl4uT9i97DCCiXGeTkCSwcp/oTbluER
	AAf89o01StBniQdkHmFt+Q+x/VYA47H7UEO8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=34AH7kLouFANtoq0pVNLQsxWZlmPq1NrPAA+Bctcnfs=;
	b=KaKJR5mE1D20Ay6unPquNqqdmfi1TjlxS3Z7l0C30PWCtLJivf2NxI27iJDS58UKjv
	l46DN7tyQWrxV0bp8TdpDw7ODYRNc92bofVN4rHbpvvMD7W58rK3Taxk9+A1COpxEAQz
	0gEZQ3tI8YL+xNW+mjgLnx6IWMuK+6y9/lBuDDzbwIjj/ivAalnfgEJY6QPf5LudNUPB
	gy7Q44KjjTEYzNL6uwkv0Ifm7fQVudtqw4y3Yn1KviKkxI2KQRd0yYRJVyD+CyV4czDI
	mR4NMxD4PDLcjqB7nsJM46oMzxjHGM4v+Iw66ay5COS7Cfkln/9VJ3QuXIZ8gxgPVMBd
	efNA==
X-Gm-Message-State: APjAAAVBoJGkrUiQnG8Uvw0Eo9ZmhJJ35ppgbRO59M5gGLWsc0rVybe6
	OOBbtuGa1fBq4QfcFrDELnamYALYM6k=
X-Google-Smtp-Source: APXvYqy61zYIRvBDDos4YEKXjtHUmvF7KM6YiJ+dDP8Y378llW/vxVk623sH3EewxjuOCFZzetfXhA==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr7164229wmf.166.1561191179989; 
	Sat, 22 Jun 2019 01:12:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p26sm10632034wrp.58.2019.06.22.01.12.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 22 Jun 2019 01:12:59 -0700 (PDT)
Message-ID: <87c6043e7cdd430d885ddf51c636217ea9196021.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Sat, 22 Jun 2019 09:12:58 +0100
In-Reply-To: <30d4f80b522e6bcb23143a804eb44fc5067b3b47.camel@linuxfoundation.org>
References: <20190621192710.15428-1-jdmason@kudzu.us>
	<30d4f80b522e6bcb23143a804eb44fc5067b3b47.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
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
X-List-Received-Date: Sat, 22 Jun 2019 08:12:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-06-22 at 09:08 +0100, Richard Purdie wrote:
> On Fri, 2019-06-21 at 15:27 -0400, Jon Mason wrote:
> > syslogd and klogd can occasionally take too long to restart, which
> > causes tests to fail by starting before the log daemons are
> > ready.  To
> > work around this problem, poll for up to 30 seconds on the
> > processes to
> > verify the old ones are killed and the new ones are up and running.
> > 
> > [YOCTO #13379]
> > 
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/lib/oeqa/runtime/cases/oe_syslog.py | 54
> > +++++++++++++++++++++---
> >  1 file changed, 48 insertions(+), 6 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > b/meta/lib/oeqa/runtime/cases/oe_syslog.py
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
> b) its missing dependency markup (is syslog running?) that the other
> tests have
> 
> Unless we really want it as a standalone test (I think there is a
> similar one already), the fix may be just to rename it something
> other
> than starting with test_.

Sorry for all the replies, just realised I could quickly test a rename
of the function so I've done that in -next.

Cheers,

Richard


