Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA57C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:56:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.1781.1750233358127887730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mdzE/H1s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDBE743999;
	Wed, 18 Jun 2025 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750233356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvFPWsbteJDNELrwcawnmGiNWXALk6PI4o+Wwl56pjk=;
	b=mdzE/H1sVmitLzi3tE0HBWMJkJtJ6VuO7iJJJJHAYyi+zhRX13F21FY3Y6BPzEXC4JOc0o
	NHh5a9+YoawOgeL0B5FkpTpMtWwijJoH4U1M6e/9gJwl/lGfYCvo4ItjA7a/EwXEh01YW3
	FAAV2ITA0qUyOLNjuwPm1QzDmK+23xQOlsH8bhgZYmF42FSyHzgKx+aII/7HF9Llxu3OLU
	k9V2WKGO5QALXg6C2tfn2ZmjhAJhZJWdHwU8ZKLSuI6caqksIN2wBZPhG2rlhwV9Ec8sY4
	YkTGIIsOvceSTzSO/QDi27fjT0+nC4YVIY32GoRrku/Y30HuTPBXm+gBtAe/DQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 09:55:54 +0200
Message-Id: <DAPHXYZS9HXE.1IVMNTMNN7C3S@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] oeqa/utils/command: fast-path
 get_bb_var()
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250617171332.3162295-1-ross.burton@arm.com>
In-Reply-To: <20250617171332.3162295-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsv
 gguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218978

On Tue Jun 17, 2025 at 7:13 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> get_bb_var() currently end up calling 'bitbake -e' and parsing the whole
> output. However if postconfig isn't set then we can speed this up by
> just calling bitbake-getvar.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Turns out this is breaking some selftest:

2025-06-17 17:45:55,857 - oe-selftest - INFO - bblayers.BitbakeConfigBuild.=
test_enable_disable_fragments (subunit.RemotedTestCase)
2025-06-17 17:45:55,859 - oe-selftest - INFO -  ... ERROR
...
2025-06-17 17:45:55,859 - oe-selftest - INFO - 4: 1/42 1/633 (1.46s) (0 fai=
led) (bblayers.BitbakeConfigBuild.test_enable_disable_fragments)
2025-06-17 17:45:55,859 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/bblayers.py", line 246, in test_enable_disable_fragments
    self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/utils/commands.py", line 295, in get_bb_var
    return subprocess.run(cmd, check=3DTrue, text=3DTrue, stdout=3Dsubproce=
ss.PIPE).stdout.strip()
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
  File "/usr/lib/python3.12/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['bitbake-getvar', '--value', 'SELF=
TEST_FRAGMENT_VARIABLE']' returned non-zero exit status 1.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1943
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1790
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1728

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


