Return-Path: <tom.rini@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id BBDCA78672
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:58:36 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id h203so812155vka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 09:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JwG5/nj5zRgfXCKz5RV6rg7keMRgaEF9n5WhrFPZqbg=;
	b=GGdRQCyOpc1GsGGG3lBo4KKvyc4w3ab6OFiREOlpQvXE3KTr8Rh9A6bamXaP6cdhuw
	e3wYOPkHXKe1fxz/MSJw3OooadKE4cLaLxxXUMCpao/r8WX4iAe6Jew9Z0c0aOjW9tb3
	uN9McMf54sLRyvB7YeU+vhYdST/YZot6znXAOe8oSssUsO1BRsBqLuQtwbo5zC/fUES5
	EQWvurWtf14Y7/e2MRoAmgZ8cxxRMlleYQMX5bzfg9xLSew96M8Dd4++Y6i6eEUMnmUw
	+z89VqXpVKjzoyb3H0inDdy7yeu5VmPOozq0ezhIJkME17epWVHmNGinJ6weJddSti2m
	2uCg==
X-Gm-Message-State: AKGB3mJiFF3e6Hj+Kdo2T8dXJT74gCclrIa/SHOcW8BUjnW5U+9gytUT
	O1ma+Svsm87JejNu5NOLVSW6
X-Google-Smtp-Source: AGs4zMbYX/5RjtJrradn16eM/DRSo1yQqC19J56NBISoGd5C06sVcVNqWql1/TQkanodUTNKUoQv9A==
X-Received: by 10.31.78.132 with SMTP id c126mr5108613vkb.163.1512496716752;
	Tue, 05 Dec 2017 09:58:36 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68])
	by smtp.gmail.com with ESMTPSA id 131sm305558vke.53.2017.12.05.09.58.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 09:58:36 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 12:58:26 -0500
Message-Id: <1512496710-10548-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv3 0/4] wic: Further enhance UUID / fstab support
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
X-List-Received-Date: Tue, 05 Dec 2017 17:58:37 -0000

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

Since v2, I've rebased to master again and removed an accidental
change that limited qemu to running without graphics.  oe-selftest wic
continues to have the testcases that I'm modifying work, so I'm not sure
about Ross' problem on the autobuilder.

-- 
Tom


