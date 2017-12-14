Return-Path: <tom.rini@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC9C60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:20:31 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id d141so4658993qkc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ynBl5SbYiJKfqo92JkBFg4RGDlJfH4AJMDs3wn9JLJg=;
	b=rki1pHqO0sCYTSG/wLnU/0oprnCv86mvQ+VYlr10pCwdwTCL+F870JDS5/Mp6+tabw
	B5GaEbH0AdEHsku3kBrUIoz1QNSBP0WuikEXDqM4WIhRsZyluBQxQy8H/4KhxgxUiivW
	o808MspqaiM26g8nT6lNLNDd9MCsTpZYDR3GcJgVQs3nQIYQEIsGYr6NU3DGQTCt1DY4
	pkkvw7bsZJqNa/28Bjkg2sEy4oIfJfdsv8E40ByVv2kSnkoUFrqFFaBB1l7pV12h6viP
	Q6GZeZsMDaf7Bb/cn3MNylIIIud7oaK7ZRr/7qUGGM5MdSiqGEMmz0/bHvYLquT9wW5F
	3suA==
X-Gm-Message-State: AKGB3mL1VKkOZSORJGEkTlFPQd4fmte4DoxxrBg9msIb4Pbplgb4dGJ+
	M7O/d+PMXCjyoCA20pWSRTzm
X-Google-Smtp-Source: ACJfBosH2yxefcLenKPRsgroxJ8lpNazktsn0FhMTCDawuTmyqzuHR/2wnQLu7RKjC0ogJLzjL+B2A==
X-Received: by 10.55.106.131 with SMTP id f125mr13455981qkc.88.1513221632459; 
	Wed, 13 Dec 2017 19:20:32 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	s43sm2001533qta.49.2017.12.13.19.20.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 19:20:31 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 22:20:22 -0500
Message-Id: <1513221626-18805-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv4 0/4] wic: Further enhance UUID / fstab support
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
X-List-Received-Date: Thu, 14 Dec 2017 03:20:32 -0000

Hey all,

So, per Ed's feedback on my first series, I went and spent some time
trying to figure out how to have wic know what the UUID would be when
updating the fstab.  It turns out the easiest answer here is to have WIC
make the UUID.  Per Otavio's concern last time, I also make sure that
the filesystem UUID can be passed in, for reproducibility.  One thing to
keep in mind here is that FAT filesystem UUIDs are a bit funny to deal
with as mkfs.vfat / mkdosfs / etc want to be given a 32bit hexadecimal
value.  But when we talk mount, it must be split and it must be in
uppercase.  To make the rest of the code easier I'm encoding the '0x'
portion into part.fsuuid rather than doing "-i 0x%s" in a bunch of
places.

While preparing all of this, I found a few minor things such as we did
not test for squashfs and --use-uuid (not supported) and an incorrect
comment around the btrfs support.

Since v1, I've added a testcase into wic.Wic.test_qemu for a UUID mount
and the UUID that we've given. I think this is cleaner than adding a
python function to make a wks file just for this task.

Since v2, I've rebased to master again and removed an accidental change
that limited qemu to running without graphics.  oe-selftest wic
continues to have the testcases that I'm modifying work, so I'm not sure
about Ross' problem on the autobuilder.

Since v3, I've moved the mount point for the test from /uuid to /media
as when testing with sysvinit (as is required), /uuid will not be
created so we need to test with an existing mount point.

-- 
Tom

