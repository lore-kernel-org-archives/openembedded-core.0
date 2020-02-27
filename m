Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 269E661172
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:24:58 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j7BfO-00074W-2Z
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Feb 2020 06:24:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5EXGjHvLFhT+uor0k5nEBBGAGT8Wmp49CfI+6zf9sjc=;
	b=fskK9304r28E7vGWXA/acgXk51
	5srC/qxSYrETvwG8IyK+J7JgdBIHhT1sdCZNNPX5AqR2HNE5fO8W4FJ4ScqUh8A/KWIoZR4UxW6Ys
	1ctgjwwe7JFI00dYRrmpDwdo3J+8ivFNc1VT7RWoeg+V1tbPfxSDns2O3hKdM6rVVaTWEorVH61WY
	zk/xs3gJ9EbMNepY/wyjLuhVOFLJLk6ww9mlUdtgRgh+9/J2AScoUIydx3tWsWXbA7mDZxF6Oyp1p
	unLMKgkE1Ru1aY/SwGZ0HwP3+BEQP3THPNTGhN6ia0+9smthuWnpnwBSu3qIkWXBtWDJ6fAgakNay
	zZpvKWBg==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j7BfK-00020C-4A; Thu, 27 Feb 2020 06:24:56 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 06:24:44 +0100
Message-Id: <20200227052448.65435-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: a1aedbebb1ad86a93e9d56217add5c67
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200227052456Z
Subject: [PATCH v2 0/4] Enable VAAPI and VDPAU video drivers in Mesa
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
X-List-Received-Date: Thu, 27 Feb 2020 05:25:04 -0000
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

[PATCH v2 1/4] libva: Factor out base parts into an include file
[PATCH v2 2/4] libva-initial: New bootstrap recipe
[PATCH v2 3/4] mesa: Add PACKAGECONFIG knob to enable VAAPI
[PATCH v2 4/4] mesa: Add PACKAGECONFIG knob to enable VDPAU state

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>



