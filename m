Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC165C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:05:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.33680.1702465521980740504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LnzAqCmC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F06F76000B;
	Wed, 13 Dec 2023 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702465520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H0t4tkJM7nmbeG0Si3NsIN3OgSAU1Ujl1r7AqtyhZuw=;
	b=LnzAqCmCIxq0q9wYvv4kL9bIeIhvpJlJsXLPrkVZnld49k9z1lbjLztaXkh1u4D+KhrxsW
	ip83r//CdPgqE4to8g4cRf7m2esA/M4xeqQMAN33U5FDOpUK+oPCmLx5pE1kKLAi8Ex+0y
	BFezYNIjNAFxASp5TEWSh2eqKgk8HfA3MNsK/dW+XtDlMX0NHbE/N3SQPGL3jOEmZCV2JG
	bsF3s4ESj4fPvQ+AvyymvwHKwI+6H7RCfwL5w3vILrmYX2xYcZ1w7qYurbksgH3CCcP+fs
	D/1hOOmCzw0xCePsmnVRVLQi88GGbDu/cabV2xgUyBwZEKlyJehFclq/U0+HcA==
Message-ID: <5ad9de1e-6a75-4198-8b61-027f0be9e5e5@bootlin.com>
Date: Wed, 13 Dec 2023 12:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Issue with relative DEPLOY_DIR in meta/lib/oeqa/runtime/cases/rpm.py
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192283

Greetings,

Using the latest poky master branch, I'm running:
bitbake -c testimage core-image-full-cmdline

I'm getting errors in the RPM tests:
AttributeError: 'RpmInstallRemoveTest' object has no attribute 'test_file'

Tracing the code, this happens because the code in rpm.py is trying to 
access DEPLOY_DIR/rpm, which is a relative path (tmp/deploy/rpm), and 
this path doesn't exist because I'm not running BitBake from TOPDIR. Of 
course, if I'm running BitBake from TOPDIR, the test works.

Why doesn't this module see an absolute path for DEPLOY_DIR, like the 
value I get from "bitbake-getvar"?

This would make the test modules more robust.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


