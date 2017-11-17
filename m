Return-Path: <tom.rini@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id E2C0178798
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 16:08:25 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id p44so7244374qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 08:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cBw5JmK7BmW1RQ4xJSY0KQql8vJ3HzsPVHfb3ihaXoA=;
	b=VCl4D+2knwCwRf6sjr5aQN4a2c4zqz0enQMJrYFCPqNGRtPMh1PKdsZW4K0lzL4Xtm
	VxQWqS93/fFs8x7NXAOhJKAWs6y1PGZZleU5SdVaAZjYRpFOGsRfnTMpROCIHar8/uU7
	NB21HyC8sDKAi3fI/2geTlDKh+KWLO77AfbErWZ+/ec3ar8KqpPKiaWkzSlrDefSO6+L
	QbYgIeIKuOfbYO+ED8qWrhetmQTr9Ax2y5/3Gyx1vBqZ2kwUZKuClaJQcPMixm0G9Rvz
	z72ACAzQFkjHuZRjBB25A/IxLktsoPuBtZ9D0qs20eY9NNLdqmCTE0nWPOImc5SbeLx2
	37vQ==
X-Gm-Message-State: AJaThX49M1/876fUstR/ytWcSn8NJkRcCXB9Vp7ejv4vnA2sho33WegS
	OuU/vRkQ54ab1UM96C3Jrb5F
X-Google-Smtp-Source: AGs4zMa6o0Dc0ITV+c/q4HX+nnZiJZ4OLiTz7OcM5qTHZ2PBsWvDLJ6H/V5a8szKvVreuYHJKu8Kfg==
X-Received: by 10.55.122.134 with SMTP id v128mr2628911qkc.354.1510934906477; 
	Fri, 17 Nov 2017 08:08:26 -0800 (PST)
Received: from opus.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	q37sm2714304qtj.66.2017.11.17.08.08.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 08:08:25 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 11:08:16 -0500
Message-Id: <1510934900-22044-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2 0/4] wic: Further enhance UUID / fstab support
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
X-List-Received-Date: Fri, 17 Nov 2017 16:08:26 -0000

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

--
Tom

