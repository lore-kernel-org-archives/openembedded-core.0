Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD357C6F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 22:27:00 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h58so21353729edb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 14:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+iVBzUUN2EZ81OSWqjlqYpG5qR7kWAcgCWWvXE2assg=;
	b=h/n3i32lmyOBydGXLm3X16NdzLyWj8GIx3KTcCXljaCEf5ceeWyJ4BtZkjGKGt1mUc
	RUzwtCgAwP0qPHC5KOJxsBtuxWilxCFB/zF4FdxjiiXAarxisMP5jj6BrC1TbapwIFUh
	SJ6xWkSUmTVeWYZ8nzEtYWaWaMDqeXqp+Io8+I+1o1ScXsFUrgS67QhNdIjU2b5roZEi
	7LGACVdzroOM1FyczBpg7HazBH5xlld+I2R4FIkQshy8RPun+DTsqe6XqmETEBpvVCSX
	Eh08wjuaxee3+a6mKg/l1p+v6yywelo7t6ZnfHW93vHCLJKdRpi8LkbQXPA1D6F19nh+
	7s3Q==
X-Gm-Message-State: APjAAAWfCQ0usa2l+RECbWuP5rGqv711/APdiBqNrJVVRo+E+tsZwGeF
	PDbnf3YKktHjO1BPanABVrwmzlc=
X-Google-Smtp-Source: APXvYqzs55LiucHy0I4UnmJ2fyoZREFJarTAJ55bVQHaskX3wWdkiEgu/5Yr0gPLdFVRy+GbjWlBLw==
X-Received: by 2002:a50:9094:: with SMTP id c20mr5824588eda.126.1551479220682; 
	Fri, 01 Mar 2019 14:27:00 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id
	x34sm6337645edm.70.2019.03.01.14.26.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Mar 2019 14:26:59 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 17:26:48 -0500
Message-Id: <1551479212-28944-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] Introduce packagegroup-core-base-utils
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
X-List-Received-Date: Fri, 01 Mar 2019 22:27:00 -0000

Hey all,

Over on the Yocto list[1] the topic of how to build an image without
busybox once again came up.  As part of that discussion I said I'd been
thinking about a packagegroup to make this easier to do as while
virtual/base-utils and VIRTUAL-RUNTIME_base-utils exist and work and allow
for this, the list of things we get from busybox is non-trivial.  In fact,
this exposed that in oe-core itself we have no editor aside from busybox
and are missing a number of common network utilities too.  To that end,
this series migrates vim and inetutils from meta-oe to oe-core, introduces
packagegroup-core-base-utils (and documents using it in
local.conf.sample.extended) and finally adds a testcase of building
(technically, making the dependency graph as that does what we need and is
much quicker, 5s vs 3 minute) core-image-sato with busybox disabled, so
that we can do our best to avoid introucing busybox as a hard requirement
in the future.

With respect to functionality, this is basically 1:1 with busybox.  I
didn't add more "useful" utilities (which I would argue belong in
packagegroup-core-full-cmdline which follow up to this could be enhanced to
pull in this packagegroup and add to it).  In terms of deviation:
- We do not have a trivial dhcp server, unless you use systemd.
- We may have also lost a few similar trivial servers.  One may argue that
  by default maybe busybox shouldn't be opening this stuff up.
- busybox provides "nslookup" which at this point in time is an
  anachronism. bind stopped shipping "nslookup" prior to oe-core replacing
  the old monolithic layer.  We do provide host and dig and such via
  bind-utils.

[1]: https://lists.yoctoproject.org/pipermail/yocto/2019-February/044317.html
-- 
Tom


