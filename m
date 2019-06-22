Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B87287CE12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 08:08:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a15so8203510wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aSnzrGSvGFhX4TvQKOAiwrFPUeg6JOhha0bAKzvn0vs=;
	b=ikD0J5XxFHgRCYfkIYeFAuueoy/BM0c/h/i6BM5n8kuZhuO+9aANVLB8K291S0IXBm
	gdy2i4D5A3JwdmL+ZHXm0KQR3OYCF4OBkhF3Qy9wRx/OKjk2/MU5CKEEzcZK1Z70nfH7
	cOgmeNnVXqCPOwMYNj0183DXoGNsaK0b0e7os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aSnzrGSvGFhX4TvQKOAiwrFPUeg6JOhha0bAKzvn0vs=;
	b=UqmtbblSniG9Aq9dA5j6Bq7BjhmvxZYJe+pnw2o24msB/rTbBqxNST3vyBWwC0DrNy
	HPHflAap6LTyQNLBIvsmHgIPNSr5p/bY7jLB2YyPkRvHhHAiWLWEuHbQVFswxybgCMU+
	dInWBq7GgxtwGjRmlsIgDDbB9hinfiPm/3sJroWlUbB8QSF86n7CL9/ny1jHcJ8QgCXt
	lGvW7mR1tjtiphhgCDLqEeRKVT6fYMPfBGDWnMYMmiHhgOwJC5Hhb+5DJOWJHpym+Lwv
	fu8+iOqH4aN1fz5+CBc9vyWAA+eU7Moy4AvXIHtuM4mw0S2z5Xf+aYti05RwjQ8hKHML
	n/vA==
X-Gm-Message-State: APjAAAUgukbcqeJZHFrYODDpEpXUOZSaasbD7Bxkl42biJxEjfftecS9
	WBbh4oEnLPsjZlAapMNP+FivrOcMLyU=
X-Google-Smtp-Source: APXvYqwULkCkMqyLQv8SY+MHgOhb0px/kJiuS8+UnWZrm6ha9EoQgMBK2lcRxRsRRIKM9q6nId+nTw==
X-Received: by 2002:a1c:4041:: with SMTP id n62mr7355778wma.100.1561190886454; 
	Sat, 22 Jun 2019 01:08:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z76sm2904229wmc.16.2019.06.22.01.08.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 22 Jun 2019 01:08:05 -0700 (PDT)
Message-ID: <30d4f80b522e6bcb23143a804eb44fc5067b3b47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Sat, 22 Jun 2019 09:08:04 +0100
In-Reply-To: <20190621192710.15428-1-jdmason@kudzu.us>
References: <20190621192710.15428-1-jdmason@kudzu.us>
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
X-List-Received-Date: Sat, 22 Jun 2019 08:08:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-21 at 15:27 -0400, Jon Mason wrote:
> syslogd and klogd can occasionally take too long to restart, which
> causes tests to fail by starting before the log daemons are ready.  To
> work around this problem, poll for up to 30 seconds on the processes to
> verify the old ones are killed and the new ones are up and running.
> 
> [YOCTO #13379]
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/lib/oeqa/runtime/cases/oe_syslog.py | 54 +++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> index 0f5f9f43ca..480aadedf9 100644
> --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> @@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.core.decorator.data import skipIfDataVar
>  from oeqa.runtime.decorator.package import OEHasPackage
> +import time
>  
>  class SyslogTest(OERuntimeTestCase):
>  
> @@ -21,6 +22,49 @@ class SyslogTest(OERuntimeTestCase):
>  
>  class SyslogTestConfig(OERuntimeTestCase):
>  
> +    def test_syslog_restart_sanity(self):
> +        status, syslogd_pid = self.target.run('pidof syslogd')
> +        status, klogd_pid = self.target.run('pidof klogd')

FWIW by calling this test_, it will be run as a standalone test. This
may have two issues:

a) it won't work on a systemd image
b) its missing dependency markup (is syslog running?) that the other
tests have

Unless we really want it as a standalone test (I think there is a
similar one already), the fix may be just to rename it something other
than starting with test_.

Cheers,

Richard

> +        status, output = self.target.run('/etc/init.d/syslog restart')
> +
> +        # Always check for an error, most likely a race between shutting down and starting up
> +        timeout = time.time() + 30
> +
> 


