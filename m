Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA486D7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 14:36:22 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j89so10532162edb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 06:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=riObfBD82xZLA/AJJ8MecCPe/VtcwvDPA0k4WMuu85Y=;
	b=Gu4WZlHs6zxST29h0xlstDosaYuS0MbYDi089uuaoCy6EaLhUrK2JRXeh+IVNyr8Kb
	sclJI6arqToe9m8D53rIKcpRub3JXT0jujjHKOkaI7lkcPd2SttlKpAwnKzQSDYj17KF
	2aOpdU+y58Z1NpMo6nUBOilpwCuYwPbheYnsd2XyQuCFd4XBTI3nIZ4Vh61getAYLgTB
	3jJlmInFjt/zYDAo6v0A+JW7A9G6ef++Fz31YOhYbG05M5EPTSPvNAT2k+QmCGOfar5d
	Q3qKgGBCKbw7VvXrtVuB04VF/vziFcVoalcHfNTcYEA9RMoRNnTrsMXXSdAn2CIYAM6w
	oSYA==
X-Gm-Message-State: APjAAAXV4QYxzKFjUYVAlNGF8Vhn8dT1zZYRcRXwxNGKxFHtGeuBbFgv
	kcANfORn4kV/xIeOgoIANQ14d3c=
X-Google-Smtp-Source: APXvYqx6EFuYgGePNGZ0OfyzZUPJ9apO7HhzDXstgHi5zXAC4UMHUCYHgEkSUEg7Zpo3CYsG/Q8vVQ==
X-Received: by 2002:a50:94d6:: with SMTP id t22mr24285073eda.232.1551882982409;
	Wed, 06 Mar 2019 06:36:22 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-159-4081-9338-CA43.dyn6.twc.com.
	[2606:a000:1401:880d:159:4081:9338:ca43])
	by smtp.gmail.com with ESMTPSA id i14sm363467ejy.41.2019.03.06.06.36.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Mar 2019 06:36:21 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 09:36:09 -0500
Message-Id: <1551882973-8710-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 0/4] Introduce packagegroup-core-base-utils
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
X-List-Received-Date: Wed, 06 Mar 2019 14:36:22 -0000

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

With respect to functionality, and since v2, this is basically 1:1 with
busybox.  I didn't add more "useful" utilities (which I would argue belong in
packagegroup-core-full-cmdline which follow up to this could be enhanced to
pull in this packagegroup and add to it).  In terms of deviation:
- On systemd, we use that for a trivial dhcp server.  On sysvinit we provide
  dhcp-server.
- We don't have fbset in oe-core, nor netcat-openbsd.  Both of these exist in
  meta-openembedded but I don't know if it's worth the overhead to move one or
  both of those to oe-core as well for this.

[1]: https://lists.yoctoproject.org/pipermail/yocto/2019-February/044317.html
-- 
Tom

