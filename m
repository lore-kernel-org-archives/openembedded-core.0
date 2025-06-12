Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74440C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 08:58:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8196.1749718697425840336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 01:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S0YhwdZM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D70EF43292;
	Thu, 12 Jun 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749718695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+ZkYfk5XYeAYJ6y0y8PtuKuH3jk1FjExMdkaPG3rRQ=;
	b=S0YhwdZM8xrQaC80pzFl9mG6a3d0TkXqyl08/HxaVwbMYsoD5f2ZM39w0hAzQD74kCtiz7
	9NWg5tfhqree/XC6H6MaZtPcdfXNbeIIdJO8/uSpUN2pwvaMrdlmrDWbgYJ7t2JahWIL9g
	ZJ+RerDSsx7H+blEsTh6AwVgeU78eCoM0vgPlmKkm3f7JXn+AXPCBTOpX3lb74Al801lI0
	bJiSaMEA2nBJmA1uKc8252TDImksClt3rHMMGFnDvnbIfZp1Xap7T5kvH6wU1izp4OA6fI
	58WAUeyvOM/MnT2VveWre/Mvcd7sQu+2Vu8A/hpxD5ZSe6ljaTtG3AtYF2U3zQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 10:58:14 +0200
Message-Id: <DAKFIFEGGV3U.7U3JRRVUW278@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] Glibc: Fix for CVE-2025-4802
Cc: <sunilkumar.dora@windriver.com>, <Sundeep.Kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <SunilKumar.Dora@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250611113400.2146584-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20250611113400.2146584-1-sunilkumar.dora@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedthfegtdduffeifeeiteduheevhefhjeduvdefffevveeghfekueegvdduveeuleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhsohhurhgtvgifrghrvgdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopefuuhhnihhlmfhumhgrrhdrffhorhgrseifi
 hhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepufhunhguvggvphdrmfhokhhkohhnuggrseifihhnughrihhvvghrrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218489

On Wed Jun 11, 2025 at 1:34 PM CEST, Sunil Kumar via lists.openembedded.org=
 Dora wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
> [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32976]
>
> Upstream-Status: Backport [ https://sourceware.org/cgit/glibc/commit/?id=
=3D5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
>                             https://sourceware.org/cgit/glibc/commit/?id=
=3Dd8f7a79335b0d861c12c42aec94c04cd5bb181e2 ]
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---

Hi,

Thanks for your patch!

It looks like this does not apply cleanly on master. I do have conflicts
when applying you patch (which I tried to fix on my branch), but it
looks like we also have conflicts when the glibc patch is applied during
the build.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1802

Would you mind rebasing on master and resubmit?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


