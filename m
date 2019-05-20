Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 102797E078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 16:57:24 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id m141so154610ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QsJX7XN90u7FJts9U8TpbdarBx4ICu4JHlgltoudoFc=;
	b=KXba+aOHu1pbUC/3yb/8duw+WF9TCkasRExRNyfu3+B20rlWCnk+Lx8jkP0DmtyAIz
	iux7DbLH5Gx/uQbQjgLxF6rpWSD7S7oPwrgSmDCNX7/Zl6iyWYuSS6Kg2ys5Qj463+9j
	gAOCXz2STfjv+a+oR3fokexKfjIfxtAVTtoKgM5unLHNvAUHuNVMNlz08pa4Aj2pw4LA
	85DO1WShXAyDhPxWrbNt7bKVvphTk/duhyVvgdqnQrbikIPfUXTUUctaiyv5tOSdqe5Y
	zT7rWiRmbXamzI9sctO21hsFvwfMGTJp+7xXCIlMpwZqOZ+ccN86EUOn5uG725LQ4728
	BVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QsJX7XN90u7FJts9U8TpbdarBx4ICu4JHlgltoudoFc=;
	b=s97JpHR11dWGxJ5ZG5iQt58rJG5W/E9Dd2WeazedwfcOILs8ZMuLypCL50+CF67iU2
	muGMZC0TFJEF8VG+GOHNji4cc/TEtU9guBIXTwH0+oi0gzb69rG1RO2OjEQ7XFgYV2Pm
	S+d8OW4gkGImq1T7ql13lgt4J0zAiWaZR/N7gjK5HT0fRYtb8voI9sKi0Yb7mWMUseI/
	BtWDiN8WoJc05brVg4CoyNS5mq7PaaUa/ZlrE7908OWpymPQWfuAnr6BlBOHdFMSThKv
	B6IDl+3IXTSwbiHWSufxOIGTsEYH9bOL7iuT08rtIJHR7eT/qWp/AMoXJtl1OSoxX4iu
	zExQ==
X-Gm-Message-State: APjAAAU6UrsDPW+0Mgo3wQuvrJ3APmgBJtt/D757f2OxbYQCWWxQWgg1
	UARBFwDgQ1kN1EtjYfcmEWNWigcB
X-Google-Smtp-Source: APXvYqzrEKvb40/Ef2zEfue62wi+k1JoqQtWv74ActpJO9nZSaTnqblgoW6LvpLmkkXNg3omCAhDnA==
X-Received: by 2002:a24:5cce:: with SMTP id q197mr1196itb.127.1558371445375;
	Mon, 20 May 2019 09:57:25 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id b8sm5633122ior.5.2019.05.20.09.57.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 09:57:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 11:57:18 -0500
Message-Id: <20190520165719.20041-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/1] Initial QA test for reproducible builds
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
X-List-Received-Date: Mon, 20 May 2019 16:57:25 -0000
Content-Transfer-Encoding: 8bit

Implements an initial QA check for reproducible builds. This check is
sufficient for an initial implementation, and will catch a wide variety
of reproducible problems, but it does have the following problems:

 1) It doesn't pass. Currently, about 800 packages fail to build
    in a reproducible manner for core-image-minimal. I've found two
    major sources of non-reproducibility so far:
     a) The perl-module packages don't have a consistent
        SOURCE_DATE_EPOCH which means when they are packaged the
        timestamps on all the files are different. Thankfully, this
        accounts for several hundred of the packages, so fixing this
        should remove a lot of the failures
     b) Debug package strings aren't consistent. It appears that in some
        of the -dbg packages, the linker changes the order of the merged
        .debug_strings section. This trickles down into the packages
        that contain the executables because it changes the hash the
        executable contains to ensure the debug symbols match up.

 2) It's not easy to debug issues when there are reproducibility
    problems. I had initially intended to run diffoscope on the
    resulting files but this takes much longer than I think we are
    willing to run on the autobuilder and also generates far too much
    output to be really useful. I think a better long term route is to
    have the test dump the list of non-reproducible packages and then
    write a helper script that can consumer this list, allow the user to
    select a package, then run diffoscope to examine it.

 3) This test currently is incomplete and won't catch all classes of
    reproducibility problems. At the least, I know that it won't
    consistently catch the use of the __DATE__ macro in source code,
    since that requires the builds to be done on two separate dates (on
    the other hand, use of __TIME__ will be caught pretty reliably since
    the builds are done serially). I suspect the correct solution to
    this is to borrow from Debian and use something like faketime to
    fake out the system time to some suitable future date when doing the
    test build, but this will require some though to how it should be
    implemented.

 4) It currently only tests Debian packages and core-image-minimal. The
    test case has support for building the other package formats and
    other images at the same time, the idea being that the long step in
    this test is building everything from scratch, and building multiple
    package formats and images at the same time will be much faster
    overall than having multiple tests that have to do from-scratch
    builds (although, there might be a way to serialize multiple tests
    and have them share the test build TMPDIR). Until at least 1 package
    format and image are passing, I don't see a huge motivation to
    enable more.

Joshua Watt (1):
  oeqa: Add reproducible build selftest

 meta/lib/oeqa/selftest/cases/reproducible.py | 159 +++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/reproducible.py

-- 
2.21.0


