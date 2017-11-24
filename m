Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id A15177016E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 12:10:32 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id u40so20179175wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=Uid01AVUwyi3Ds2TuweT89drdSQI6UodR0tnLGN0alU=;
	b=g78j/yLz89WhP05b6bFnFzSA3Ulv0kGCJjzH0S8QdA3QfM9zsUsebbBXJmuwDfoQ4X
	az1wiGpsVSChVQSMg3HMFdx5ca+K+rsDw76EVau8m1xZInHMU7rS/WATLVQTkvYIo2Ff
	uK/3RR2N1tNAqkw+ziP2j0xRKJZaDES7YpQGc0KbWEPpdWqn+DKg/YHOBQbZjXKogKRP
	r/l+eSE0n0wC+wpwQKRdayf/afKO9fuWJE83HlUe90ACc3X40riGYeyczX0zvKES8jQt
	YAoMljTNSRjY2jTlA0aU3Fb9voLz0ogf3Tpqtra+VNS5NX0oxEKZc1t8X5IWVhBbgBcQ
	2jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=Uid01AVUwyi3Ds2TuweT89drdSQI6UodR0tnLGN0alU=;
	b=lXf2uycFluPs+8wAKuJS60nnEOsk4k8XYWAKgmiji8dboQl+ZN91jHj0YtOqrxLRk+
	/v7qn19kX4V6s8P+tUTKmgl608w+kBVU6fh95zsHUretYfTmtQlMy9ZffDaS+RTe6Peo
	vX/zteGtIMoG8gOvJYMNTnvs3KJIjMOnT2PcCqhSAoik+mX4nMujNOR6HEeR2vPZMPJq
	rAbEhCEkoIzbmqEoqWMKegVZdo4eVtg/F02LXcysvBKJjjAEsso3LhyypIdhE6eAdKsz
	7G/wCThgE7sDScs1YuEvQtwXoecjgmGDudCv3lT7HueHw/+ZcWKam85CnINgiQCy2gRh
	5NPg==
X-Gm-Message-State: AJaThX49yEqCrEowIFZR/T53qrCxgUnr9FCzTtqDyFGzG99McBe3nApw
	IRHMyvuUuOS/Ip5VBasY4v0bBTE=
X-Google-Smtp-Source: AGs4zMYNSs05DMutyJnAgy/O8WZ+Ss2BZYlPSDpygA/ZB0lzhKYhYN+yy7Cs/obR7GYfl2QZ/VkX/Q==
X-Received: by 10.223.166.103 with SMTP id k94mr24530358wrc.22.1511525433278; 
	Fri, 24 Nov 2017 04:10:33 -0800 (PST)
Received: from pohly-mobl1 (p54BD57A0.dip0.t-ipconnect.de. [84.189.87.160])
	by smtp.gmail.com with ESMTPSA id
	g68sm6773179wmc.22.2017.11.24.04.10.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Nov 2017 04:10:32 -0800 (PST)
Message-ID: <1511525431.5979.64.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Nov 2017 13:10:31 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: read-only rootfs + boot parameters
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
X-List-Received-Date: Fri, 24 Nov 2017 12:10:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I noticed that APPEND is left unchanged when adding "read-only-rootfs"
to IMAGE_FEATURES. The effect is (at least in refkit, which uses an
initramfs based on initramfs-framework) that the rootfs initially gets
mounted read/write and then gets remounted by systemd as read-only -
but only after writing to /etc/machine-id.

Is that the desired behavior or an oversight?

To me, read-only means read-only, with no exceptions. The obvious fix
is:
APPEND_append = "${@ bb.utils.contains('IMAGE_FEATURES', 'read-only-rootfs', ' ro', '', d)} "

I'm just not sure whether that should go into image.bbclass or
elsewhere.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



