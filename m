Return-Path: <sakoman@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id A6B426BA1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:38:41 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id gq1so2120034obb.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=zeoyr6zb2ehQzULClmpi1FZtOKhB9htRoTcJMog+YyA=;
	b=LX3Ki2Vhi0JSRxTbJ9MP6VZczR+0Jso5BhIlIQ8Xtt6hVrZkfTk95/SfzQkPxZ4x4v
	m6k2wW9c5426E9+63gdO0VjwRxQorM3NgK9mcV8tmN+KxFWe0TV2zv3K7Zp6UImzIdQH
	+lI62a34MKIj8Dz1vbTRQsPS/U9mzQGMsCjrqnZgvMIIlEj4cqs/9xXDrrZt3Dsd+IKV
	vZ+vaXV09yMYb/C6EMK5b+4YRqUDUJYKQo3b5l3QrLIGrUle6zPnWwfbDncVsOQosYjX
	5HMsgeMomp7783wh4qp6s3TddXvFaqL23WK4CNoIQYN/wiM/y9t+F/ii6HVAnhIae3uC
	bnSA==
MIME-Version: 1.0
X-Received: by 10.60.178.236 with SMTP id db12mr2113811oec.1.1386949120962;
	Fri, 13 Dec 2013 07:38:40 -0800 (PST)
Received: by 10.182.120.201 with HTTP; Fri, 13 Dec 2013 07:38:40 -0800 (PST)
Date: Fri, 13 Dec 2013 07:38:40 -0800
Message-ID: <CAGDS+nmbUGR6r72_xGzMyouAyGiCpPL115eD8=keaouwrHshBA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: dora: systemd + package_deb = broken run-postinsts
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
X-List-Received-Date: Fri, 13 Dec 2013 15:38:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

A client has requested help setting up a build using debian packaging
and systemd as the init system.

When testing the initial image build I noticed that package postinsts
didn't seem to run properly.

It turns out that dpkg installs an S98run-postinsts file in /etc/rcS.d
in addition to the normal S99run-postinsts link to
/etc/init.d/run-postinsts.

Systemd-compat-units installs a run-postinsts.service file that calls
/etc/rcS.d/S99run-postinsts.

I haven't investigated why the standard /etc/rcS.d/S99run-postinsts
doesn't work properly for the debian case, but I have verified that
changing the service file to use the dpkg provided
/etc/rcS.d/S98run-postinsts works, as does changing dpkg to write
S99run-postinsts instead of S98run-postinsts.

I'm not sure what the "proper" fix is for this issue.  Any
debian/systemd experts care to weigh in with advice?

Regards,

Steve

