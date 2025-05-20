Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F5C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 11:23:41 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.18343.1747740215196016422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 04:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BMLAxg0+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48C7A1FCF0;
	Tue, 20 May 2025 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747740213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyM3AmibGdOLrB6yxjsgYwa1ejHJXvweglUGGBvZKMo=;
	b=BMLAxg0+sWb6TZ7lsPSyZhgsIsnvZJsMS04QZLY5RehKCpV6cIbWgAfzDSUeazHX2k8oX6
	b7jk/CThSgvm+4sgMNwxJ0Bq1TZ6iZrfVVDOfti2VW5ugmLTcfL0EnG7louxOjh/0pUut9
	qGnFXqbuRImGys/us1qlSR6+rdHziDqEANW/c5PMo6ZUprQrKbYYr3CbBCWH1At9EXxxOI
	wVWuW7aPpfZoLP4dUTdBLvDYsbBhNPlJJSe0CKyT38DCUUqaynJskPtrsACGT32h9f6JGp
	QpTavjPTyg00NZWr/vrrLGh1ydYOCGBux2r23GZQNSLdXZDJsyr8BSoMXzmOCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 13:23:31 +0200
Message-Id: <DA0Y755DVZNN.Q2FWYS44T3J@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
Subject: Re: [oe-core][PATCHv5 1/5] libx11: create tmpfile dir for x11
 domain socket
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250519191130.3532263-1-rs@ti.com>
 <20250519191130.3532263-2-rs@ti.com>
In-Reply-To: <20250519191130.3532263-2-rs@ti.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetjefhveevtdfhtdejffeffefgieeltefftefguddtheehhfffgeeifffhfeeugeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhssehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrg
 hdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhtrghvihhosehoshhshihsthgvmhhsrdgtohhmrdgsrhdprhgtphhtthhopehkvgigihhnrdhhrghoseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepuggvthhhvghrihgughgvsehtihdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 11:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216904

On Mon May 19, 2025 at 9:11 PM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Register a tmpfile.d or volatile directory entry for the x11 domain
> socket so this will always be created with the correct permissions.
>
> Currently some x11 related applications will create this directory if it
> doesn't already exist, but this is not true for everything. In addition,
> if the application in question isn't started as root, it's possible this
> directory can be owned by a non-root user. This isn't an issue by
> itself, but it can potentially lead to problems in a multi-user
> environment.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Hi Randolph,

Thanks for the new version.

It looks like we have a conflict on installed files here:

ERROR: dbus-1.16.2-r0 do_prepare_recipe_sysroot: The file /usr/lib/tmpfiles=
.d/x11.conf is installed by both libx11 and systemd, aborting

Happened on a lot of builds, such as:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1638
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/1657
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1626
...

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


