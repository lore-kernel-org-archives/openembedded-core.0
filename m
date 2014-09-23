Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B676D65DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 12:07:48 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so4488699wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 05:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:reply-to:user-agent
	:mime-version:to:cc:subject:content-type:content-transfer-encoding;
	bh=5IA6d1XMXX0aV2v+NmWBotL0vOlDlyK7O7thoDc0/C0=;
	b=cCnQ8SoQ5ZEt0Lr+CfOqSR3pWLV8edtlKhg8KoVfXPVvW5iVIeocmFXwQnYEZM7i2d
	2SOGorBM/Vc43tmDJGq04gfk0AA9Du8L7XXMWv1sZLvjQwgw+fpRpd/5JeHbsOTnTm7m
	V2bCK9m3oJDLMQ6t5M4hhOynUAOTrxDk2njVgPmcsatanyvnxDUVlzLUC8gGF5eUwIav
	NPhmAMv+oKKVJcypU3cHNlXejGVSItuLG+JMiSidHWitwKX6MdxXVOZg4y9KnmsffykZ
	aDS/+XmuUFwqduKo3u8eSzr4nPHmzX1V5KbBtRWpuMMWETBiO0DiesTBeCu+n48+2QGi
	pt4A==
X-Gm-Message-State: ALoCoQns41AMg+JTpLIkTaqpKOlPIkh54TIayjkWcw0lzmbnA3jgSrUKH+6AtzQ4VkSBGVRyQRnR
X-Received: by 10.180.75.210 with SMTP id e18mr22691157wiw.6.1411474068978;
	Tue, 23 Sep 2014 05:07:48 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id gl10sm2300341wib.1.2014.09.23.05.07.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 05:07:48 -0700 (PDT)
Message-ID: <54216293.4040907@dresearch-fe.de>
Date: Tue, 23 Sep 2014 14:07:47 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Lianhao Lu <lianhao.lu@intel.com>
Subject: hash generation/PR service problem with xuser-account and other packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Steffen Sledz <sledz@dresearch-fe.de>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Sep 2014 12:07:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

As i mentioned in another thread before we're investigating some problems related with package versions going backwards using a PR service.

Now i have some more information. But i'm not able to understand and fix the problem for myself.

Assume we have a clean workspace and i bitbake the xuser-account package with this command:

  MACHINE="foo" bitbake xuser-account

This generates these packages (the 207 comes from our PR service).

  tmp-eglibc/deploy/ipk/all/xuser-account-dbg_0.1-r0.207_all.ipk
  tmp-eglibc/deploy/ipk/all/xuser-account-dev_0.1-r0.207_all.ipk
  tmp-eglibc/deploy/ipk/all/xuser-account_0.1-r0.207_all.ipk

If i call the same bitbake command again, the same packages are generated. Fine!

Now i call:

  MACHINE="bar" bitbake xuser-account

The generated packages now get a new number from the PR server (so they have a different hash i believe).

  tmp-eglibc/deploy/ipk/all/xuser-account-dbg_0.1-r0.208_all.ipk
  tmp-eglibc/deploy/ipk/all/xuser-account-dev_0.1-r0.208_all.ipk
  tmp-eglibc/deploy/ipk/all/xuser-account_0.1-r0.208_all.ipk

But this package does not seem to be machine dependent!?

If the next build for machine foo is a clean build again (e.g. on our Jenkins continuous integration server which makes clean builds once a week) the PR service generated number wents back to 207 which results in:

  "ERROR: QA Issue: Package version for package xuser-account went backwards which would break package feeds"

Can someone confirm this behaviour?

Is this a bug? I think so.

Can someone give some details what went wrong here? Also after studying <http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#checksums> i was not able to fully understand the background, not to speak of fixing something.

BTW: We see the same behaviour for the cpufreq-tweaks, linux-firmware, run-postinsts, and some of our own packages.

Thanx for any help,
Steffen

PS: We're working on the daisy branches using Angstrom with some more own layers.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

