Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB74C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 11:47:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.11035.1749728863947711511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 04:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pdIEl1ZP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D62FD43A1A;
	Thu, 12 Jun 2025 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749728862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fG7D3tVa3YiDE4X8yUK4fEJL90/7VBCfatt03UkR5r0=;
	b=pdIEl1ZPcT9jWUT6BWzAIckkCjZFZqzeRRhj9g958jGS2aq/U6skTs5irrbnzGDC8EcmEJ
	3J/fJO/z3TRuHVhzPjf2hTTHmXoeClgOjnTFho812w41o2sUMD/NUONGzS+IhobxD5m4vX
	Ld1c/kOJrE1Lfn5wGoOF+Ktu9DF+qjN8UR8kx2XIB8Xvtsay/kBaoiojLdGem/51SXCd8+
	DTmsE/mXtnx3tNvKDEmDlJZsJj25Bbjt6FaF1vG5VyD9//JRPt+GoLdnKdWp9JWE8izuUa
	KbZsGyvBJiLVVsr6Prc5gA0gZWxjEYRHy3F6Lz1tB7MMDgQ9wnsmCeXraym3pw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 13:47:41 +0200
Message-Id: <DAKJ465UQIQP.2RNSHUDVHRKO0@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] wic: pluginbase workaround on invalid
 module filenames
Cc: <richard.purdie@linuxfoundation.org>, <Ross.Burton@arm.com>,
 <bruce.ashfield@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Anibal Limon" <anibal@limonsoftware.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250611153319.54778-1-anibal@limonsoftware.com>
In-Reply-To: <20250611153319.54778-1-anibal@limonsoftware.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeghfektedtfeegjeffvdfhudetledvfeffhfetkeffleefjefgieffudetjeevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghnihgsrghlsehlihhmohhnshhofhhtfigrrhgvrdgtohhmpdhrtghpthhto
 hepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheptfhoshhsrdeuuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopegsrhhutggvrdgrshhhfhhivghlugesghhmrghilhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218514

On Wed Jun 11, 2025 at 5:33 PM CEST, Anibal Limon wrote:
> Apply a workaround on invalid identifiers replace '-' to '_' to load
> the module with valid identifier.
>
> Let the user know (warning) about plugin doesn't has a valid module
> identifier to encourage fix, it gives time before rename oe-core wic
> plugins and drop workaround.
>
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---

Hi Anibal,

Thanks for the new series.

I believe we have oe oe-selftest errors on x86, while creating image:

2025-06-12 09:33:17,228 - oe-selftest - INFO - overlayfs.OverlayFSEtcRunTim=
eTests.test_lower_layer_access (subunit.RemotedTestCase)
2025-06-12 09:33:17,228 - oe-selftest - INFO -  ... FAIL
...
|   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/scripts/lib/=
wic/plugins/source/bootimg_biosplusefi.py", line 159, in do_configure_parti=
tion
|     cls.__instanciateSubClasses()
|     ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/scripts/lib/=
wic/plugins/source/bootimg_biosplusefi.py", line 108, in __instanciateSubCl=
asses
|     loader.exec_module(mod)
|     ~~~~~~~~~~~~~~~~~~^^^^^
|   File "<frozen importlib._bootstrap_external>", line 1022, in exec_modul=
e
|   File "<frozen importlib._bootstrap_external>", line 1159, in get_code
|   File "<frozen importlib._bootstrap_external>", line 1217, in get_data
| FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/y=
octo-worker/oe-selftest-debian/build/scripts/lib/wic/plugins/source/bootimg=
-pcbios.py'
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1750
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1689

Can you have a look at this issue?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


