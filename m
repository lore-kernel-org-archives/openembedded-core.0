Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 096B87D19E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 16:39:24 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e3so2901851ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1KK3mrLEfr9SU9R3WBeQs1W1sNlDufHNuLB6hJecN7s=;
	b=Ims1plMKVmJn96IRE7kH290jEJtR4Rkeol6OknKXdFqu5LrTW52kbRKIHpytDEDV/y
	zpAICHqh2orJFG72luQzrW6ekgzHxpFv6D9XVcBNKJd1EM6gIYUr5KoB+H4QmLX7UlTk
	p97icyUGtIoaBXP4kLFUx25eZ8d/VBZBCkDfNV0xKlz1RyVLSKqAJCcXOY+pXsy/VOpa
	3o5sRTlB2OYoGyLEJoWzRrgYQxRuBl7+uRzOfQT49tKVNnIC6JATmi4kRPpr5bdTisfK
	e4CI0ZF9OH5wYM9Iu5bglOpXhP4P5cpYOV7KXUHqRMvszab/CEYd6gF8rqn0bFKcr8Ku
	J+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1KK3mrLEfr9SU9R3WBeQs1W1sNlDufHNuLB6hJecN7s=;
	b=r+nTF8NpAfLQ/oBae/Mahbu4m3thi+TPhh8sTSbTmAAlR8oIrSloy+VhdcXonaf16I
	cmOzcz8ATbEkLKW3zH3uB2C8qWans94DqYTEETkSCHdGxQt2tUHYFSPnuln1Z5vOVqy2
	RiQoXnGNRKP43WSJ1t2Z/7PdpSMUVBllk2cyy3QC/Ni9FcgB8HDmGdaWWO6f4sxhBxfB
	KLevXc8cJdMCHwIVvNpyz1K1KUXCzxd4Fjyia2Uf3zuegtSgrvl7JxxT5Rraam2KGGc3
	tWXkMG1cQTGS3tBK0AwlUFHOrhN5/S+NZB/NtRDIrCEBZk9pHsAhavr77w/Vz78fT8qc
	RnWA==
X-Gm-Message-State: APjAAAUihSGiaNHA1erDAop+zt5u8pML65sr8koyIhui+zD6hdpTBaFU
	RMMnsWWh/D2z/61GNIUYhX58O3vwl+9wJyLz6yhobw==
X-Google-Smtp-Source: APXvYqx8hiir4rOLcO3qS8xK/sUgIIhiDAIUm2TJSEUCXkIYSdZcIIR5UJUTJuecVq5sbR1HSVeSXooD86qc0Xy9yiQ=
X-Received: by 2002:a05:6602:98:: with SMTP id
	h24mr7573965iob.49.1561135165724; 
	Fri, 21 Jun 2019 09:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190621154213.12761-1-jdmason@kudzu.us>
	<eea8e0445b82a8fd472fa9333a665555a990728a.camel@linuxfoundation.org>
In-Reply-To: <eea8e0445b82a8fd472fa9333a665555a990728a.camel@linuxfoundation.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 21 Jun 2019 12:39:14 -0400
Message-ID: <CAPoiz9zekGpeDRd=PMCneuzNeBgEBzHjgoKvcrR5WjnWHUDSiw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Fri, 21 Jun 2019 16:39:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 21, 2019 at 12:14 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-06-21 at 11:42 -0400, Jon Mason wrote:
> > syslogd and klogd can occasionally take too long to restart, which
> > causes tests to fail by starting before the log daemons are ready.  To
> > work around this problem, poll for up to 30 seconds on the processes to
> > verify the old ones are killed and the new ones are up and running.
> >
> > [YOCTO #13379]
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/lib/oeqa/runtime/cases/oe_syslog.py | 37 ++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > index 0f5f9f43ca..3270a0fc88 100644
> > --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> > @@ -50,9 +50,46 @@ class SyslogTestConfig(OERuntimeTestCase):
> >      @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
> >                     'Not appropiate for systemd image')
> >      def test_syslog_startup_config(self):
> > +        status, syslogd_pid = self.target.run('pidof syslogd')
> > +        status, klogd_pid = self.target.run('pidof klogd')
> > +
> >          cmd = 'echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf'
> >          self.target.run(cmd)
> >          status, output = self.target.run('/etc/init.d/syslog restart')
> > +
> > +        # Error, most likely a race between shutting down and starting up
> > +        if status:
> > +            import time
> > +            timeout = time.time() + 30
> > +
> > +            while time.time() < timeout:
> > +                time.sleep(1)
> > +                # Verify the old ones are no longer running
> > +                status, output = self.target.run('kill -0 %s' %syslogd_pid)
> > +                if not status:
> > +                    self.logger.debug("old syslogd is running")
> > +                    continue
> > +
> > +                status, output = self.target.run('kill -0 %s' %klogd_pid)
> > +                if not status:
> > +                    self.logger.debug("old klogd is running")
> > +                    continue
> > +
> > +                # Verify the new ones are running
> > +                status, new_syslogd_pid = self.target.run('pidof syslogd')
> > +                if status:
> > +                    self.logger.debug("new syslogd is not running")
> > +                    continue
> > +
> > +                status, new_klogd_pid = self.target.run('pidof klogd')
> > +                if status:
> > +                    self.logger.debug("new syslogd is not running")
> > +                    continue
> > +
> > +                # Everything is fine now, so keep running
> > +                status = 0
> > +                break
> > +
> >          msg = ('Could not restart syslog service. Status and output:'
> >                 ' %s and %s' % (status,output))
> >          self.assertEqual(status, 0, msg)
>
> Thanks, I think this is reasonable however I think we may need to make
> the above a function and then call it from other places in the tests in
> that file.
>
> test_syslog_restart should check it did restart using the above
>
> test_syslog_startup_config does a second restart which we should also
> check?

Seems reasonable.  I'll crank out v2 shortly.

> Out of interest were you able to see error codes being returned in
> status in your tests?

I used code to force every error path during development, but not that
the testcase will fail.  So, your question did cause me to notice a
bug in the code when verifying that the old ones are no longer
running.  That should return 0 if still running, which wouldn't cause
the assert outside of the loop.  So, I'll need to tweak this there.
v2 will have this fix as well.

Thanks,
Jon

>
> Cheers,
>
> Richard
>

