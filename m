Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 845DF6B067
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 09:27:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so8740269wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gMkDqAxA/g+Bj86ysnWtDJgGLAFOO++KP/HJzs5FnDE=;
	b=CqA6JYcARGIFJQoTrXrvM7QkIAzZJUaYIWph7A/v9iWCMzE+ivaaPakcOMazS68obM
	5oD0qJ7/3bGChWJg3LPwRYIjxU6Yy/uJxwg341PVanxjpPSXhz54ftP9yShlCJ5Ejw4e
	nZg+uomCd3SmslM+ogBv7hQVi9JFMDN9EFN58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gMkDqAxA/g+Bj86ysnWtDJgGLAFOO++KP/HJzs5FnDE=;
	b=j/6iBvdYatGsv8UUuFNcl9BFy3DNrUJuF+iw++mInywdmSF7rmagT37d2lHExVv2Al
	mWAANIbTCKT560Idl2sz+gNv+1KlQz0mw4IJvU+57yWPWQDyY2N2ESrhFt5NQ7AUwwlA
	5JMVAMSXQVYM+K+Lv//A47sWHlJ/rhm5PI9t4vbilHC4HTAbXWFroik39/0E2utqhKaY
	pPU3nltNGwwRSMxs1bNLfxwRdKtogf+STbvtIGxT/Y+ABSmBOu4mTkk5szdck8I9/lri
	OXIGgYoLx+1xcsCe2qoSuidDUnoLKku83AEMs3iU/I+yJSzKEQLqYAr01Vsdbj+wqpGO
	DNLQ==
X-Gm-Message-State: APjAAAVv868OwNRl1CR6IMzAillwiy9kN+DzbaLg9UBv0MuoB/V4Mp/C
	ZJQXBoCxIhTDXfZUkqZInwiZAg==
X-Google-Smtp-Source: APXvYqw5RdxkbKksKOO9BtRdxRBHWEe84PlADTkhkMlyBZiwQ0u2LHmgVlffTtj/k4laxLd7QiCdnQ==
X-Received: by 2002:a1c:ca14:: with SMTP id a20mr7165281wmg.71.1561195664992; 
	Sat, 22 Jun 2019 02:27:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a2sm7035427wmj.9.2019.06.22.02.27.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 22 Jun 2019 02:27:44 -0700 (PDT)
Message-ID: <ffc89351e9c95660d306ddbb8a6c0cfe915402dd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Sat, 22 Jun 2019 10:27:42 +0100
In-Reply-To: <87c6043e7cdd430d885ddf51c636217ea9196021.camel@linuxfoundation.org>
References: <20190621192710.15428-1-jdmason@kudzu.us>
	<30d4f80b522e6bcb23143a804eb44fc5067b3b47.camel@linuxfoundation.org>
	<87c6043e7cdd430d885ddf51c636217ea9196021.camel@linuxfoundation.org>
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
X-List-Received-Date: Sat, 22 Jun 2019 09:27:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-06-22 at 09:12 +0100, Richard Purdie wrote:
> On Sat, 2019-06-22 at 09:08 +0100, Richard Purdie wrote:
> > On Fri, 2019-06-21 at 15:27 -0400, Jon Mason wrote:
> > > syslogd and klogd can occasionally take too long to restart,
> > > which
> > > causes tests to fail by starting before the log daemons are
> > > ready.  To
> > > work around this problem, poll for up to 30 seconds on the
> > > processes to
> > > verify the old ones are killed and the new ones are up and
> > > running.
> > > 
> > > [YOCTO #13379]
> > > 
> > > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > > ---
> > >  meta/lib/oeqa/runtime/cases/oe_syslog.py | 54
> > > +++++++++++++++++++++---
> > >  1 file changed, 48 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > > b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > > index 0f5f9f43ca..480aadedf9 100644
> > > --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > > +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > > @@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
> > >  from oeqa.core.decorator.depends import OETestDepends
> > >  from oeqa.core.decorator.data import skipIfDataVar
> > >  from oeqa.runtime.decorator.package import OEHasPackage
> > > +import time
> > >  
> > >  class SyslogTest(OERuntimeTestCase):
> > >  
> > > @@ -21,6 +22,49 @@ class SyslogTest(OERuntimeTestCase):
> > >  
> > >  class SyslogTestConfig(OERuntimeTestCase):
> > >  
> > > +    def test_syslog_restart_sanity(self):
> > > +        status, syslogd_pid = self.target.run('pidof syslogd')
> > > +        status, klogd_pid = self.target.run('pidof klogd')
> > 
> > FWIW by calling this test_, it will be run as a standalone test.
> > This
> > may have two issues:
> > 
> > a) it won't work on a systemd image
> > b) its missing dependency markup (is syslog running?) that the
> > other
> > tests have
> > 
> > Unless we really want it as a standalone test (I think there is a
> > similar one already), the fix may be just to rename it something
> > other
> > than starting with test_.
> 
> Sorry for all the replies, just realised I could quickly test a
> rename
> of the function so I've done that in -next.

Looks better but still some syslog problem related to core-image-full-
cmdline:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/231

I think that has a different syslog provider which may be affecting the
test somehow.

Cheers,

Richard


