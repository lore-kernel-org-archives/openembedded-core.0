Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 801DE72F8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:52:05 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id j18so6798772ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 02:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=MKGjovbcWJohX+54JhOaJxcIBE3Bft67ce4L5llqifQ=;
	b=BtFJZXk+3jU3F9FwjAwIIDzYMDi3oIZelDUjWjFPiLc1N1QPYeNbYDY8e8VYXlxYc4
	0Sebv5ljicibvvBx9q2o7nOtXtsiwRb8KeqJtjtl6N925ArvzjR+mKM5hZFeTzPWo29e
	y6dTafAQNClFbOGnWzx0REC/dWdqH8jms5mfzJEpNYJ+Rnt4reaU3HJ98vW3rrq6Vgcq
	C6B6ArCPBGbVsyErtx0t3yjK2MFSoGopemTK+Sm56xr8aKOT+P3dzZLwOcbHvP9m8SaX
	Cxl9XqSuv0KSwnFsnBqFU9qKPayrMAw99yAziVofw+DTWqyEWPssv8Rn7WNg5J163wYT
	5nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=MKGjovbcWJohX+54JhOaJxcIBE3Bft67ce4L5llqifQ=;
	b=GwqojtTsJK2WYyWBzD6U41pORJ3WhQJySz2U8TSTG3JSOCBTpICLASCy50aDSCfoxj
	HJJkveDxyetdUG7yQfNQAaHRR7S+H1y7M30PvHWpZ8ir/klJaYkhXbFliSPRbSJjNzFv
	67wSOokSrstqRcX8pqndAgCKot7p6qGXHTRT8Ft49LnKxfolOH9aO92CTxZFoZlUY8yX
	Lzk0e08qxAYPcyupRgvjggkD8NTWnhGydev43FOkg6op1eH016goj2g+fji6oVW9ElWe
	/XMMXGqgSDWvCtp9ghyMsz62Q592Pg/yyHbofvO/s7qop9xLZxQ5zPuovm8RL/g7FYQ3
	2wdg==
X-Gm-Message-State: AMke39lSCVgW4Q8r3xP+Ulm+TbI2u0dZMOwnbNHVSt3ekzNrJj6cYFtc17G/fEVELeIMqyNT
X-Received: by 10.107.16.217 with SMTP id 86mr1857914ioq.228.1488279126296;
	Tue, 28 Feb 2017 02:52:06 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D654.dip0.t-ipconnect.de. [93.232.214.84])
	by smtp.gmail.com with ESMTPSA id t7sm676254ioe.22.2017.02.28.02.52.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 02:52:05 -0800 (PST)
Message-ID: <1488279122.7785.34.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
Date: Tue, 28 Feb 2017 11:52:02 +0100
In-Reply-To: <1487690288-18275-1-git-send-email-dmitry.rozhkov@linux.intel.com>
References: <1487690288-18275-1-git-send-email-dmitry.rozhkov@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu: avoid overridden user input for bootparams
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
X-List-Received-Date: Tue, 28 Feb 2017 10:52:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-21 at 17:18 +0200, Dmitry Rozhkov wrote:
> Currently runqemu hardcodes the "ip=" kernel boot parameter
> when configuring QEMU to use tap or slirp networking. This makes
> the guest system to have a network interface pre-configured
> by kernel and causes systemd to fail renaming the interface
> to whatever pleases it:
> 
>   Feb 21 10:10:20 intel-corei7-64 systemd-udevd[201]: Error changing
>       net interface name 'eth0' to 'enp0s3': Device or resource busy,
> 
> Always append user input for kernel boot params after the ones
> added by the script. This way user input has priority over runqemu's
> default params.

Presumably the user's bootparams then would include "ip="?

Either way, the change looks good to me. I did something similar for the
qemu parameters in "runqemu: let command line parameters override
defaults".

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




