Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id DAD7B77C81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 15:04:22 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id 75so1855973lfs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/qYW4AIIihAyQVhAxIoG1IuZo/4nhrF+yzEvani4jJQ=;
	b=o7I4UNnRY9xfssUewMZ/5erq9myIHGCf+SZ+B+q4wrj6+kMfWWqWCNu93Ho5dTEMjD
	l8ofSBQcTbog7nAYN82kQJfXeqtTGxoxc2QFoRbw/5ToMF/e5nuB3LRXxCtf5O5qALAT
	s4Tv3uZYm2b1Frm86Q+1EFSDG1LlEYD2NKvnIrIYkTQsmsVb5OvfGrbA7qzT+10q2CdQ
	pki1qLZrfW1eY9ItHaj737oI3XiwlrKW59IZavLP/gy5iUOUpeN0i/aUZapUjGn4c+68
	F4/3rbnkUEhjYNGSif3BR/0pNSRk7FcoaotC6+ZcIKeVr//V1hsacGK5dDha8DeTHHmK
	5R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/qYW4AIIihAyQVhAxIoG1IuZo/4nhrF+yzEvani4jJQ=;
	b=PSyEek98vJTtdWQkIPznJG3vQikKHy+mRjQIAoWoQlYVcBPrpk8V2V9+pQOH2ZKj/W
	cadY3OxR1fVZFdIg1ufOUoExm+0BxmD2EscCIhhHDc1Z5iLiW1L29I6WvH4dLZ2jz9dk
	YyWzReH/nbiC8a0OB4ZaOHLX46kVXhJ40DJQQo11BXXsuOBjssACOl7s9DoftzRWf/gp
	0gwYQLhNntC0BWq/2PVC/pZG7dTw4oH8NWKb1NolIypLxq22BoiVdoCAzOgdveVLOtzi
	gWubkcGGWOwRgFt4le78YV/IZSEFuUZoj7UwJF6mCIvFyZoE1DepT7GQQvSi5mpDNE+V
	KAOA==
X-Gm-Message-State: AN3rC/4jaDlnJYZuecGRe1bYpHFKyml9xE87AhH4h9izcNccRGcculMQ
	yPQ6D9pHcPXQXtZFfoM=
X-Received: by 10.46.5.22 with SMTP id 22mr88681ljf.3.1493219062754;
	Wed, 26 Apr 2017 08:04:22 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	27sm583571ljb.69.2017.04.26.08.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Apr 2017 08:04:21 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 17:03:50 +0200
Message-Id: <1493219031-12843-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: do_image: Adding support for IMAGE_ROOTFS_EXCLUDE_PATH.
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
X-List-Received-Date: Wed, 26 Apr 2017 15:04:23 -0000

This is a direct followup from the earlier f6a064d969f414 commit in wic. It
works more or less the same way: The variable specifies a list of directories
relative to the root of the rootfs, and these directories will be excluded from
the resulting rootfs image. If an entry ends with a slash, only the contents are
omitted, not the directory itself.

This is early feedback call, and several things are missing here (see
below). However, I would like to know if at least the basic approach is
acceptable. Reviewers pressed on time really only need to look at the topmost
hunk as well as the last couple of lines of the two functions. Those show what
the basic idea is.

What's missing:

* Documentation

* Test coverage

* Respecting IMAGE_ROOTFS_EXCLUDE_PATH is a behavior change, and isn't
  appropriate for all image creators. In fact, for the the main use case [1] to
  work it must not always be respected.

My idea for the last point is that the variable will not be respected by
default, and each of the pure filesystem image creators (btrfs, ext2/3/4, etc)
will set a flag that mark their image creator as a "pure filesystem", which
would respect this variable. Image creators that make partitions, however,
should not respect it, because they will use wic for that purpose instead, and
then they need to have access to the entire rootfs. Hence they should not set
the flag.

I'm imagining something like this:

  d.setVarFlag('do_image_%s' % t, 'respect_exclude_path', '1')

although I'm not sure if that's the best approach (tips are welcome).

[1] The use case for this feature is the following: We are creating two types of
images in Mender: One complete partitioned image, and one image containing only
the rootfs. In order to be able to populate non-rootfs partitions, we want to
use the regular bitbake recipes for building these components, but then exclude
certain directories from the rootfs image. Using wic, we are adding those
directories back into the partitioned image, but under different
partitions. Unlike the rootfs image, the other partitions are not expected to be
rebuilt after the first rollout.

-- 
Kristian


