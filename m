Return-Path: <matt@madison.systems>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 35AB073CBD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 14:36:06 +0000 (UTC)
Received: by patj18 with SMTP id j18so147227667pat.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Apr 2015 07:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:content-type
	:mime-version:content-transfer-encoding;
	bh=h/7uRLJ2Or6HfifYddlbWD3tmn8ptk7liJNpM4QubfE=;
	b=XHd+PqcXTcSDv/Tlzs1guNOKzPEWS/VFSpEjp1k2aeGUNJ5vWMtI5hPxyuljcZh/Sc
	NR/nVJoaUSkAatT6ol5PS7hbRH2n72yKLTTqHmDAr70BDl3GoY76FhMEjTFKrXcUPJ85
	MV/T6inb1qVxbBwmQ7Kt4a1pE2S2Fo/sE8yFNH+/DDk7c/ljdokUC+Ja/3YBJvQNUniN
	qFtNLeBFq0lf2Ur3gIT+jW80boAtZuX2RHKa+xyyTDe1vDENUisIuaushhWca2mUUJBy
	muzxJ6E6FaV/aDCPECuDmJ39r1irVsuz/4d8WCS9YcWFq6H+a3zAGgXDUZBusHJ8IRcy
	yEFw==
X-Gm-Message-State: ALoCoQlBtV7JddJqCnEFv5v8RNEHF6mfRYICm9h8fddbefjB+seCkHBgfjikh0Me452N9Q7qugTa
X-Received: by 10.66.227.169 with SMTP id sb9mr12844447pac.11.1428158167828;
	Sat, 04 Apr 2015 07:36:07 -0700 (PDT)
Received: from [172.16.1.18]
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by mx.google.com with ESMTPSA id
	n10sm11264942pdp.18.2015.04.04.07.36.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Apr 2015 07:36:07 -0700 (PDT)
Message-ID: <1428158165.4354.25.camel@workhorse.madison.systems>
From: Matt Madison <matt@madison.systems>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 04 Apr 2015 07:36:05 -0700
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: Removing shadow breaks PAM logins
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
X-List-Received-Date: Sat, 04 Apr 2015 14:36:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For one of my projects, I have a read-only rootfs, but I do use PAM
plugins for controlling login access to the device, as well as group
controls and non-root users for daemons and such.  After my latest
update to master, I ran into an problem where all logins failed and some
daemons failed to start.  I tracked it down to this recent commit:

http://cgit.openembedded.org/openembedded-core/commit/meta/lib/oe/rootfs.py?id=f4932e2e640764d16f1f6d398390ebfb376f4cf1

The problem is that the shadow package includes not only the utilities
for manipulating the password and groups files, but it also includes the
full-featured /bin/login and the su, sg, groups, and newgrp utilities,
plus the login PAM rules file.

I worked around the issue by repackaging shadow so the programs and
config files that aren't related to changing the passwd and group files
ended up in a separate package that remained in the rootfs.  That seemed
to be the cleanest way to deal with the problem, and it did the trick
for me.  If there's interest, I can submit a patch.

-Matt


