Return-Path: <mk@mkio.de>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Mar 2019 15:55:02 UTC
Received: from mail-relay.contabo.net (mail-relay.contabo.net
	[173.212.240.237])
	by mail.openembedded.org (Postfix) with ESMTP id 374EC7CCDD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 15:55:02 +0000 (UTC)
Received: by mail-relay.contabo.net (Postfix, from userid 103)
	id 1161E2107C; Fri,  1 Mar 2019 16:45:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on vmd4985.contabo.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=4.0 tests=BAYES_00 autolearn=ham
	autolearn_force=no version=3.4.2
Received: from m2731.contabo.net (m2731.contabo.net [193.34.145.203])
	by mail-relay.contabo.net (Postfix) with ESMTPS id 8777C20556
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 16:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mkio.de;
	s=default;
	h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EiDnKB9zTfjODGFeJFU5hsi5j9jigs5GH4uXp2tVx7g=;
	b=Ojnc2C8SaSr2DRB/cCikuL859Y
	hYieebeQZjnvNraeE22GqsCtNPhWWZSyQfdtruw4WDmeUQG1FRCY9pwFWLh+WpBTpcOf9VpkiZZaY
	e/jPqnhOchThReVFFngjYscCL6/e1XmaIDp/0i+kPTliFqfC1Rq9Z+Ll5EHYLmTUgNnyWyQh62IzF
	NSDCYxXo7O0ZTCCekA5+sOT/8Xk+eQ/niepuaOOHMJ+L9qM5ZpqhPDGZdPGCAcujNQ2DWIPu9PG+e
	sOEZFMvB2xUKAqsg0jEpIVAKLu8dAqbwJR8r7Qnjc1xjO/aBE2C7Mb8YWPG6uXTZUaJ6LH2eGdrpm
	vwHbwugw==;
Received: from [95.208.211.40] (port=31323 helo=localhost)
	by m2731.contabo.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
	(envelope-from <mk@mkio.de>) id 1gzkLT-00Gsfd-A2
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2019 16:45:09 +0100
Date: Fri, 1 Mar 2019 16:45:01 +0100
From: Markus Klotzbuecher <mk@mkio.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20190301154501.GA24139@e460.mkio.de>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - m2731.contabo.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - mkio.de
X-Get-Message-Sender-Via: m2731.contabo.net: authenticated_id: mk@mkio.de
X-Authenticated-Sender: m2731.contabo.net: mk@mkio.de
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: naming of link to fitImage with initramfs
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
X-List-Received-Date: Fri, 01 Mar 2019 15:55:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone

After updating to thud, I noticed that the naming of the softlink to a
fitImage with an INITRAMFS_IMAGE effectively changed from the form

   fitImage-${INITRAMFS_IMAGE}-${MACHINE}.bin

to 

   fitImage-${INITRAMFS_IMAGE}-${MACHINE}-${MACHINE}

This happens because the latter is constructed in
kernel-fitimage.bbclass as

      fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME} 

where kernel.bbclass sets:
      INITRAMFS_IMAGE_NAME ?= ${INITRAMFS_IMAGE}-${MACHINE}

and kernel-artifact-names.bbclass defines:
      KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"

and
      KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"

leading ${MACHINE} being added two times.

Is this intentional or am I missing something? I'm not attached to the
old naming, but the double MACHINE in the link seems a bit odd.

Thanks in advance!

Best regards
Markus

-- 
Markus Klotzbuecher
Freelancer Embedded, Distributed & Real-time Systems
Am See 28, 78465 Konstanz, Germany

