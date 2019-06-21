Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 15DEA7E7AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 16:14:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v14so7159052wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=iWyfxQm+8U885+sgkKz6nYc/Ilp38bzRpgX5JIkdRxY=;
	b=Dpkqp/zWrDrzl+g34jy/xgtmixzlroi/Yg3HXH8Csb8z2MBBsfJhSmUtywMUlzJRup
	nHvm1DbeL7E3Ut3qq6rlXTkikNXGdy5wflgqEyTtf+5WVhryj4jS0z2gFM6bR9Dm263/
	YdEcCZ9Wk5BZC4lb4ln8BeeaokE91vu7NmLD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=iWyfxQm+8U885+sgkKz6nYc/Ilp38bzRpgX5JIkdRxY=;
	b=oS2fIUqqu7hJZBXhHbrZDY76mUezaa9/RfFq9Qj/Y7J/A4LVvAz/KLo61QV96xkBxv
	DaCi6bl+9GASfsQWCaCBIo+k1wKGCZTFXykwBni9HxnSA+SO+vl5IVmCNroaJA+Dcneg
	n9B/W8/n7IfxaAn/dPVY44lWyuy07wNwoB0aNbrX+y/1AiUMvwqCJOggDShqQn0zYkjC
	wKDKuoy9Ceyq8cQkZ5Qt0bYgTgniyHuYhlskWR8n2VviwCD5mfVeRoSjFpnCwP3UC6k7
	kB3PSNynXzIcSNCFEnv7F/kcpvqmdymV89+6McFk9+OdxpJTHyN5fm09kPCdPkbhjxCL
	cgbg==
X-Gm-Message-State: APjAAAUgvlGzmTr/JXp9Zxylwvtr/gl6t9yY7KW74Nu/90IarPSY6UzV
	JFfJrR40ORIXdyyXa8BCYOtBOg==
X-Google-Smtp-Source: APXvYqzH41n/BYHT0oaOmL43tRZ2mZ0IHbUcuPqHp0qwlB8PFIT5smDmOxFfvIguVBkZxAfnoWDiBA==
X-Received: by 2002:a5d:56c1:: with SMTP id m1mr14519497wrw.26.1561133694863; 
	Fri, 21 Jun 2019 09:14:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j18sm4379787wre.23.2019.06.21.09.14.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 09:14:54 -0700 (PDT)
Message-ID: <eea8e0445b82a8fd472fa9333a665555a990728a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 17:14:52 +0100
In-Reply-To: <20190621154213.12761-1-jdmason@kudzu.us>
References: <20190621154213.12761-1-jdmason@kudzu.us>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 21 Jun 2019 16:14:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-21 at 11:42 -0400, Jon Mason wrote:
> syslogd and klogd can occasionally take too long to restart, which
> causes tests to fail by starting before the log daemons are ready.  To
> work around this problem, poll for up to 30 seconds on the processes to
> verify the old ones are killed and the new ones are up and running.
> 
> [YOCTO #13379]
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/lib/oeqa/runtime/cases/oe_syslog.py | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> index 0f5f9f43ca..3270a0fc88 100644
> --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> @@ -50,9 +50,46 @@ class SyslogTestConfig(OERuntimeTestCase):
>      @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
>                     'Not appropiate for systemd image')
>      def test_syslog_startup_config(self):
> +        status, syslogd_pid = self.target.run('pidof syslogd')
> +        status, klogd_pid = self.target.run('pidof klogd')
> +
>          cmd = 'echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf'
>          self.target.run(cmd)
>          status, output = self.target.run('/etc/init.d/syslog restart')
> +
> +        # Error, most likely a race between shutting down and starting up
> +        if status:
> +            import time
> +            timeout = time.time() + 30
> +
> +            while time.time() < timeout:
> +                time.sleep(1)
> +                # Verify the old ones are no longer running
> +                status, output = self.target.run('kill -0 %s' %syslogd_pid)
> +                if not status:
> +                    self.logger.debug("old syslogd is running")
> +                    continue
> +
> +                status, output = self.target.run('kill -0 %s' %klogd_pid)
> +                if not status:
> +                    self.logger.debug("old klogd is running")
> +                    continue
> +
> +                # Verify the new ones are running
> +                status, new_syslogd_pid = self.target.run('pidof syslogd')
> +                if status:
> +                    self.logger.debug("new syslogd is not running")
> +                    continue
> +
> +                status, new_klogd_pid = self.target.run('pidof klogd')
> +                if status:
> +                    self.logger.debug("new syslogd is not running")
> +                    continue
> +
> +                # Everything is fine now, so keep running
> +                status = 0
> +                break
> +
>          msg = ('Could not restart syslog service. Status and output:'
>                 ' %s and %s' % (status,output))
>          self.assertEqual(status, 0, msg)

Thanks, I think this is reasonable however I think we may need to make
the above a function and then call it from other places in the tests in
that file.

test_syslog_restart should check it did restart using the above

test_syslog_startup_config does a second restart which we should also
check?

Out of interest were you able to see error codes being returned in
status in your tests?

Cheers,

Richard


