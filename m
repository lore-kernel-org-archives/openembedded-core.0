Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F173EC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 21:14:51 +0000 (UTC)
Received: from mailrelay3-2.pub.mailoutpod1-cph3.one.com
 (mailrelay3-2.pub.mailoutpod1-cph3.one.com [46.30.212.2])
 by mx.groups.io with SMTP id smtpd.web11.17247.1639430089532315361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=Abm5Xr/F;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.2,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:to:from:from;
	bh=roQgQ/5fVoqDj1Qj101flBt/LOffuhOfaoDmvrxFPWo=;
	b=Abm5Xr/FFkm74ZbDz62IdXSMFO3iM5TwfOPxFdGKcWF18WxtWrYvGkWbbmZyJ7kmnO8UTsd0hB7uj
	 KssoB5nC8rySEe75++5y4UNdAT7IEv3NDMKJSmeH0JqytYm9eFfpQDMJCnyoK1riEU8drbT/fdq0KR
	 WUNML6ukIXJdWW72zYYq8M+NiZlWdgaIWVQkqztgVn92Z92CkClWW8m6t9wFOGxQ/1JS8zsVTsaf/u
	 5gW4O5BzT2kLj6JEzAlVKjq59iuN9ZA7+tKoTt5LsObllGzLyR/3DXdRx5diSXdeFiHrT6rw3pa7OU
	 Y/e8j9FpGEhswM5z/Sa30BIhhfJTxrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:to:from:from;
	bh=roQgQ/5fVoqDj1Qj101flBt/LOffuhOfaoDmvrxFPWo=;
	b=ZPkluPq7XmA3mKzTRI3ox1Xfzw/DItdtQgBke/0+5f4Ga7j8jOZejMCrLwdUvBUKqpj9eQgIWmVzQ
	 kkU0L6nDw==
X-HalOne-Cookie: 7575cc040b2829cff0cbdc32495cbf7899a15989
X-HalOne-ID: b0efaf10-5c59-11ec-9170-d0431ea8bb03
Received: from pbergin-7420.. (ua-213-113-157-96.bbcust.telenor.se
 [213.113.157.96])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id b0efaf10-5c59-11ec-9170-d0431ea8bb03;
	Mon, 13 Dec 2021 21:14:47 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] Implement functionality to exclude dirs from rootfs
Date: Mon, 13 Dec 2021 22:14:15 +0100
Message-Id: <20211213211416.46449-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 21:14:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159658


With this patch trying to wake alive an old patch that never
found its way in to oe-core last time [1]. The added function is to
configure directories that shall be excluded when creating an image.

One use case is that some directories are located in a separate partition
in the memory and mounted during boot sequence. For example configuration
that shall be kept during upgrade of rootfs. Then files in those directories
can be excluded from image and handled separate.

Is this functionality something that can be added to oe-core?
If not, are there already a method to get this with current functionality.

[1] https://patchwork.openembedded.org/patch/147567/


