Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 989DF7318C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:03:41 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id d63so13843178ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:content-type
	:mime-version:content-transfer-encoding;
	bh=tlnxESG4SJ4KVIQ/amsXtpY0GrRfEn3K+KC/C2f8wrw=;
	b=iPpIpdevbs7X4qhJcijgTu0cutAxMIbS24E19RPQBdiLx/k868VlSEBhgnlDHfuehp
	1oaOBgPhy1GDKR5Hi8n+rAGkhl+oanFoWMWo+aaLnSHBy4H5jxNTql+QNJQhip5pu9KO
	4xJ+PmFx+xpJhlQU44NnScD9ALp5d+5S48EwgG36Bio7bmX6ammcB53qK/XX7owtDNHR
	NqSJit/AIv8F0gJpRVadousGGYdRhtT/jlgAR6ugjS/79LxUT7TwUvS6+mfUHWBqt4su
	9egrOzHfHEOZfCOIZM2nd6d2peyaCc0igyDu7Givi43hyd/zxD5qfOqa9OY4WbkhO8o7
	Zosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=tlnxESG4SJ4KVIQ/amsXtpY0GrRfEn3K+KC/C2f8wrw=;
	b=RuMmDhDkg06PbyNokb1HM4r48gAstmLlMzJnG4nvWaUs/eBuKo/U8Rf5voCZF19TvO
	oEBg2cVs/Jex3dYiCt9ugA+U2YvZvUkoamcGj9pYV/4a+PWIsPGyI99hMpqpLFpBdyet
	rKJ9+rwirT+nmPE+CTUX3kkmsn3IPPcL+vMpKeggWxug1+AIZIuAOMLp8uIrW7OBUUE+
	UJcdaODd43FDcj/9hKn4AJlV+B3PMeqjqM/aWLz2Cg+pVTPxQ4+thZ6JB32k1zddGV/Z
	033mc5giqTVFcEzx1ukegh3r5gUjhbyu8i0njKJLHEfvoJzYBEUlGAM7Yhd1EsnwFupL
	HjLw==
X-Gm-Message-State: AG10YOTGRZr5jkTBVzkAK4k4qN9IndFtatqqYYEO6ba1cLpWYvGBGAXFgYN73YBEwer4K2lS
X-Received: by 10.107.10.101 with SMTP id u98mr16099327ioi.60.1455015821467;
	Tue, 09 Feb 2016 03:03:41 -0800 (PST)
Received: from pohly-mobl1 (p57A57CC2.dip0.t-ipconnect.de. [87.165.124.194])
	by smtp.gmail.com with ESMTPSA id
	l91sm14506843ioi.3.2016.02.09.03.03.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 03:03:41 -0800 (PST)
Message-ID: <1455015819.17004.21.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Feb 2016 12:03:39 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: update-alternatives + absolute links
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
X-List-Received-Date: Tue, 09 Feb 2016 11:03:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I noticed that toybox's switch_root has problems handling /sbin/init
-> /lib/systemd/systemd. Apparently it tries to check permissions with
stat() before switching the root, and at that point resolving the
symlink fails.

Are there reasons for preferring absolute paths as link target? Using
relative paths would avoid the problem, and also make it easier to
investigate the content of the rootfs on the build host.

Is that something that would have to be fixed in the different
virtual/update-alternatives providers? I'm using opkg-utils at the
moment.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




