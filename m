Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
 by mx.groups.io with SMTP id smtpd.web11.5940.1588858407010457951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=avgRjgti;
 spf=pass (domain: pr.hu, ip: 87.242.0.9, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeT-0005Y0-JM
	for openembedded-core@lists.openembedded.org; Thu, 07 May 2020 15:33:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Ce3EVBo92kVVkY4Q/LaE6bYhGSpWkaDd7iP35S0Fsc=; b=avgRjgtid7MMTNKwwRjTziTgjA
	ZGx/hnqWoBHjljuNNMAgJUfpqoeuugk1jdi7hhc0Cy/jrUyP0xhQFvX32EcBZqyu75SlMUoc9zEi1
	9/zWtBGU43rJnCICZMtO5uJ5yb3lnIFcs7Esl3QO4s3sbDq4kj/kK3jE3ufwioLwfhjYVrPfhYuS7
	stLwcNqyIyCPnQ6HYy5QOmJb/hfl7yU40R94w43Do6EQJG9KnPzDOAfRt1E89vK5tasfi7yNoDk40
	ZCJjTocR0IPTQpwwKapgpZRCllb17Ws1HWgrM7+EiCDVPuU735ZieAApy5rLia8YBE659qOTVGM6m
	yftRQXbA==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197] helo=zolilaptop.sicom.com)
	by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeP-00055M-L4; Thu, 07 May 2020 15:33:23 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
Subject: [PATCH v3 0/4] Enable VAAPI and VDPAU video drivers in Mesa
Date: Thu,  7 May 2020 15:32:57 +0200
Message-Id: <20200507133301.4336-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200227052448.65435-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Scan-Signature: a1aedbebb1ad86a93e9d56217add5c67
X-Spam-Tracer: backend.mail.pr.hu -1.0 20200507133323Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mesa needs libva to enable VAAPI state tracker and drivers.
libva needs Mesa to enable its GLX part.

This is a circular dependency that can be solved by introducing
a new libva recipe variant that doesn't enable GLX.

Actually, the presence of Mesa/OpenGL headers is autodetected
in libva so it's enough to leave out Mesa from DEPENDS in the
new libva recipe variant.

With magic already existing in sstate.bbclass and staging.bbclass,
naming the new libva recipe variant "libva-initial" avoids an
error for every other recipe that pulls in libva as dependency,
including libva-utils and intel-vaapi-driver.

The error (if not naming the recipe as "*-initial") is that
the prepare-sysroot phase of a package would pull in the files 
rom both libva build variants that would obviously install identical
files.

Enabling the VDPAU state tracker and libraries is trivial,
it was just missing from the recipe.

[PATCH v3 1/4] libva: Factor out base parts into an include file
[PATCH v3 2/4] libva-initial: New bootstrap recipe
[PATCH v3 3/4] mesa: Add PACKAGECONFIG knob to enable VAAPI
[PATCH v3 4/4] mesa: Add PACKAGECONFIG knob to enable VDPAU state

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>


