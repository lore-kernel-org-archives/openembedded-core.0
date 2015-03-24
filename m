Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0F760034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 07:59:40 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so54479605iec.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 00:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=WPAyPaB0isKKcaqLMMJYnapBj8z46g3ufSoswqFPWBo=;
	b=NqqlDMglnQEJ4vuPf+apRuCv3JmMOyqtwekUq2blhAAu5w509vqxNwsJKsj4Rr3FDU
	TyLxCvRPYUjRqKkFIPbzvMCDjV6v2ZjSZS2nAHId7G+XtexFaQkY4h9ZQqIcVKmuqTBY
	dWdXgCC1HuPNq8+r7i8Xnxd1pYE0FHtAnuu9Jii5ZgzQk2AHM93WX3DcPl6yGjZ+8I6v
	GflccfZJZwn7uKEGC0MX1rh2x+VkS3DiKSLyeo48xGSEWmvlXZlww/TVs5UHv6C94o/a
	zn1jFfmfRAZOPHsyCs6bSBX/fWOVJoutXj5ng6Q3lRfSOQPzmHUECVS9fr4e7CdMyUOl
	Sz5g==
X-Gm-Message-State: ALoCoQm3CTIS9wthkAl+ii26SYhB8pfFiwbCTLqv6BQkQlGUMTJTDmCicZFVvqhvv3fD2fvbpCtE
X-Received: by 10.42.107.132 with SMTP id d4mr15787993icp.69.1427183981325;
	Tue, 24 Mar 2015 00:59:41 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E434.dip0.t-ipconnect.de. [93.232.228.52])
	by mx.google.com with ESMTPSA id x10sm8094279igl.13.2015.03.24.00.59.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Mar 2015 00:59:40 -0700 (PDT)
Message-ID: <1427183976.3412.96.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Tue, 24 Mar 2015 08:59:36 +0100
In-Reply-To: <551094C1.8020507@gmail.com>
References: <1427147834.3412.89.camel@intel.com> <551094C1.8020507@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd + run-postinsts.service
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
X-List-Received-Date: Tue, 24 Mar 2015 07:59:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-03-24 at 09:33 +1100, Jonathan Liu wrote:
> I am not sure how well systemd works with executing systemctl to 
> manipulate services from within a service that is starting...
>
> What is the definition of foobar.service?

Manipulating services within a service works. You were on the right
track when suspecting a dependency deadlock.

> foobar.service may depend on other services/mounts/targets to start 
> before it but since "systemctl start" is blocking, those dependencies 
> may not be satisfied yet until sometime after run-postinsts.service 
> which can result in a circular dependency deadlock. See 
> DefaultDependencies, After, Before in 
> http://www.freedesktop.org/software/systemd/man/systemd.unit.html.
> 
> Things to try:
> 1. Refactor foobar.service and your image recipe to not require calling 
> systemctl from within a systemd service
> 2. Change "systemctl start foobar" to "systemctl start --no-block 
> foobar" to let the startup continue without waiting until foobar is started

"--no-block" did indeed help. The recipe uses only the default
dependencies, but that already seems enough to prevent starting it at
the time when run-postinsts.service runs.

I guess the situation hasn't come up before. But when it does, it
probably breaks systemd.bbclass for most services. I wonder whether
--no-block should be added unconditionally to systemd.bblcass'
"systemctl start" invocation?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




