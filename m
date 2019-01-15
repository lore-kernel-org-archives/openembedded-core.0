Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
	[209.85.219.180])
	by mail.openembedded.org (Postfix) with ESMTP id 280BE6BE2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:28 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y7so1109537ybg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FvCvVs2Fs6+zdoqAKsYASMCqaTXb315TQgU6khRKwdU=;
	b=k/+r2WkxzoleYIkmJ6pO2w75cGbt3CnfVAlFf9DDRF0KTZRlEJcgwU6UWyyaC9RMvh
	Pjfvw0JEVcIFDaWnxdjO7tMZnoRXSXLvR24GRLrY4Oo6hNCQd3hldXw72CpG9e+s3lJs
	4jJNOK6kaIpMrfuhfX2UiDkco6d0uff5wDRtQm8cY5gD8ZV68kMc7jtH/z/Lvb/pczx+
	xYaTCffWMheUpUKogfMQM2bKDqjfr82z+pErpFBIEy5411RWDZzlMDA16QRvJzMZmBTh
	NSglGU26ZkFbModQJOonzaOOMB64w+obQXZLdfCFFppaX4DwquEsWQCr8RIOYog82Fnv
	RkTQ==
X-Gm-Message-State: AJcUukemMOOgY3MFCQmBPZxkEiC5877P5/PW++4CUMH2T8UHGs5Nr4vl
	jSiFE9gl6i1r7tqgf29+d84d0V1s
X-Google-Smtp-Source: ALg8bN5id7fVrhLgsaLDGqbKLpxehq/Xotemxdi+3ZyM6Idf0HimF5qALvY1UwwGQ2oUt2GNwJleLA==
X-Received: by 2002:a25:23c6:: with SMTP id j189mr3238231ybj.266.1547563529735;
	Tue, 15 Jan 2019 06:45:29 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:28 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:10 +0000
Message-Id: <20190115144525.29388-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 00/12] util-linux: one package per binary
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is version 2 of this series. It addresses all open questions
I had, and fixes a few bugs:

Previous open questions:
* existing RDEPENDS vs RRECOMMENDS for some but not all packages
* -dev package depends no some, partly non-existing packages, e.g.
  util-linux-losetup-dev

    Both questions solved by simply dropping all pre-existing RDEPENDS,
    so that the util-linux meta package now unconditionally RRECOMMENDS
    all split sub-packages. No invalid -dev dependencies remain

* /etc/default/mountall
    moved into util-linux-mount

* util-linux-swaponoff remains


Some additional fixes have been added:
* Fix handling of escape characters in regexs and hence fix python
  Deprecation warnings which will be problematic in python 3.8.
  (similar to RP's patch posted earlier to other packages)
* use PN for package name prefix, not BPN
* -ptest depends on the meta-package now, so that all the utils it
  tries to execute / test are actually available in the file system
* use systemd_system_unitdir instead of open-coding
* inherit manpages
* use EXTRA_OEMAKE instead of duplicating command line arguments
* also sort ALTERNATIVE_LINK_NAME for man pages

I think this is ready to go now.

[YOCTO #13058]

Cheers,
Andre'



