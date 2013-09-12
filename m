Return-Path: <christian.babeux@0x80.ca>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id E96BA6BFFC
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:12:25 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id c14so131431vea.29
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x80.ca; s=google;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Tau9t0VIqu6rZNE08UH/zgTwB5bZkxNxh2sRXLrJ4BE=;
	b=husqIFU24OzDFg9roTbikst3vwlwskuW2SPEvATJrH1gT6ek0KNY9LWZYIAcOi1jNl
	p/LNQlmuSKCNJbGhafOeFOz00DhvaBxYITTGd2PeNr1Aws4mQ6NAw3ASGKevfxmoMmgG
	70dnTQ56rHBCr2na3wyed08IboAL4PODTM9bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Tau9t0VIqu6rZNE08UH/zgTwB5bZkxNxh2sRXLrJ4BE=;
	b=cirkUr5LGBfTTW9yzptu9wvujtpO7H3Y9wl2GQ0RWzsQ7NLFoZQ4K/BHdpEDuFL8aS
	8vfCbQ9tSs+/sBOe8+8ZqxuNaTnBv0hoyDV3SE56vCj1Kf0f5/WVXcSQR+4sqh0V1MHX
	B8hTt5dPxVIDr0X7wK3uZaBz4ywf19sPFarj2dL1igvxxqPWD1DYv+dNAj/062J8QbHx
	JP+CwBX5XOawtK4KjPFLFsIh50je//TGyPbVqMrxQqv+aBj8PkZVUEZ0wpcLZQ+/Otcl
	0Wjq8gcUN4NPRqTs7CuFc+JtcArn85pU+9LdUuA1gSCd7ODDqR45rvbyrtrYUV7YLJ/b
	jgLQ==
X-Gm-Message-State: ALoCoQmu2306pD8Td6oEFtmDDy8papfupn0oUxnPqinXVR3iwmArCCk/CnW0DYqkFVC+eYIKiObs
MIME-Version: 1.0
X-Received: by 10.220.244.132 with SMTP id lq4mr1880243vcb.31.1379009547497;
	Thu, 12 Sep 2013 11:12:27 -0700 (PDT)
Sender: christian.babeux@0x80.ca
Received: by 10.59.4.6 with HTTP; Thu, 12 Sep 2013 11:12:27 -0700 (PDT)
X-Originating-IP: [173.246.22.188]
In-Reply-To: <1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
References: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
	<1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
Date: Thu, 12 Sep 2013 14:12:27 -0400
X-Google-Sender-Auth: ULjRT19oXlXvvdd7BZOLxYEglME
Message-ID: <CAGDH53kUE8aB_MoRvsxhA7jhvTpvT0+DYCGNmZnVdMFLgreR7w@mail.gmail.com>
From: Christian Babeux <christian.babeux@efficios.com>
To: Stefan Seefeld <stefan@seefeld.name>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Thu, 12 Sep 2013 18:12:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi Stefan,

> +
> +make -C tests installcheck
> +

A majority of the tests will probably fail this way. As of now, most
tests assumes that they are being runned in the build tree and expect
binaries to be at specific paths. We will have to fix this upstream if
you want to integrate our testsuite with ptest.

> ++prove --merge -v --exec '' - < $1 | sed \
> ++  -e 's|^ok \(.*\)|PASS: \1|' \
> ++  -e 's|^not ok \(.*\)|FAIL: \1|' \
> ++  | egrep -h 'PASS|FAIL'

This is sadly needed because we are using TAP as our standardized test
output format across the multiples lttng codebases.

Thanks,

Christian Babeux
EfficiOS Inc.
http://www.efficios.com

