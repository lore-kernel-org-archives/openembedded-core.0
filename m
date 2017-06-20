Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C689671996
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 08:27:43 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u195so12862555wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization:mime-version
	:content-transfer-encoding;
	bh=ZsgxkJ8gWnREKuFQlnZc5EZuaDiiRVbQdX/5P6OOQp4=;
	b=Qp0Qx7pss1eelXXSOTQ/omg+BtFymYkgtbi2Gqru4MJuZWdfT8R8cCIFRykl96OEg/
	9in91tTE4DBPXHIqxmtpc4VW+oMGl3z5XCnsIqGg26V1wpTXsZ/j0wtExQzzu+2IwTK/
	qVVFwXFtz4VUiKHZI0+gYoqz4zQtiTjsG4kMttLZV1oohl8/EX6BLbIXrAYCd3RlP/8S
	0/LZ2dJC3k8bsQWFXHXbipbnJfLh8YodHLZHUBRxIkutEM4TLWupntyHHzHqvxSgEF6x
	3kp/SN1PfXvi/QA9o1iAbhSPvOCGHrsqSJioxob7hd3MB0MEFhram5a3+Z2zkiWclkS6
	PbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization
	:mime-version:content-transfer-encoding;
	bh=ZsgxkJ8gWnREKuFQlnZc5EZuaDiiRVbQdX/5P6OOQp4=;
	b=b8QaYEBRJZsd7qDhnK/D2+D1lUnazZE/nQHa3clzmcKmePH2+dp5sipeU3wly6uCtR
	xZvwGy9XhGEPy7ol1AL285P7LSo6zDecigwkwvPv930CgZ4T01wRWmeptr9PvY1WeAnw
	MYxjcZbA8ZI8kh1xKhxaCDDWi7iqJxxNXDD1F/5JnRJw7G9Q0qx1ojyxnkcJySwhWSKq
	mkY9FnPWdaG1UjiTLlGH/AY6uzyj1/E9S5RcDLsaddeiBMrKTEsg1A82h7lMNEuTAGce
	p1mmR0YE/oD6HSOWef3GIqZsFQFL6AmMd3styMnCpDtcqoC+AkL6dvdsuwfYqT2HBMK8
	9mSg==
X-Gm-Message-State: AKS2vOwl5W1H02jFqIFQseOx8Ydh4H1Xv2+jzA1cxMFBqhyYd3vlG7iD
	DyNuBrnIOYhoWXiRlrI=
X-Received: by 10.80.134.141 with SMTP id r13mr20642418eda.77.1497947264116;
	Tue, 20 Jun 2017 01:27:44 -0700 (PDT)
Received: from localhost.localdomain
	(host57-224-static.7-79-b.business.telecomitalia.it. [79.7.224.57])
	by smtp.googlemail.com with ESMTPSA id
	x9sm7595713edd.36.2017.06.20.01.27.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jun 2017 01:27:43 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 10:27:42 +0200
Message-ID: <2269926.uz0A4b8jSC@localhost.localdomain>
Organization: Kynetics
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] wic: fix restoring of original fstab
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
X-List-Received-Date: Tue, 20 Jun 2017 08:27:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ed,

> Wic updates fstab if mount points are specified in .wks.
> After partition images are created the original fstab is restored.
> However, if exception is raised when partition image being prepared
> wic doesn't restore original fstab. This can cause duplication of
> added lines in fstab when 'wic create' runs next time.
> 
> Wrapping call of 'prepare' method and restoring original fstab
> even if exception occurs should fix this.
> 
> [YOCTO #11633]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh at linux.intel.com>

I've applied the patch locally, and deliberately caused some WicError 
exceptions: the resulting fstab correctly has only one mount entry. So this 
seems to fix #11633.

Tested-by: Diego Rondini <diego.rondini@kynetics.com>

Thanks for taking care of this,
Diego

