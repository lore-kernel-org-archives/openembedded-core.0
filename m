Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 861A060017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 05:54:02 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id hi8so1500186wib.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 22:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0VsPY9Qf3uWC9h0jHuUhYYWMBGG/uHsP5W2H48qS1mI=;
	b=VwWkfkSXh2BIffumrtVHDDJVyW7d7IEFohZnzyokKpbI6Q614Fz/xtRVw1LWLQ8jCk
	6hqD5aW1Zif8IfjXvxq3EPTdU5Gckg45wgzi9oF5C32h4b1dyETCnPEs2k9QUfzM30qm
	9hsfcEKKcMcZpMijhBH5Ggtg6KeM+VYviSNwwlRYi6scEtacuRIvZR53M2ora6LQ960U
	MNKsA4T/HofyzUxgCNFv3FO3iTSWVnwvf68qyilPrYwD1TwF3xVbJkMEbEhEA9zgZgON
	51orUYKMVt2qr2Zsv6L4/kQk9RANmKwUjrrREfrdbevHmYSmhfmN3KwTAMA9hJTtcBSG
	byZQ==
MIME-Version: 1.0
X-Received: by 10.180.37.20 with SMTP id u20mr5030886wij.21.1376459641318;
	Tue, 13 Aug 2013 22:54:01 -0700 (PDT)
Received: by 10.194.34.168 with HTTP; Tue, 13 Aug 2013 22:54:01 -0700 (PDT)
Date: Tue, 13 Aug 2013 22:54:01 -0700
Message-ID: <CAJ86T=UDy7FJWR735GcK3bWZxmwRrGPdinfb+f49Wc1dEmg+ZQ@mail.gmail.com>
From: Andre <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [dylan]devshell: broken
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
X-List-Received-Date: Wed, 14 Aug 2013 05:54:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

bitbake -c devshell seems to have stopped working (tested with xterm
and mate-terminal) in dylan since this commit:

  a749f06 terminal: Run command using a wrapper script

It looks like the run.do_devshell.<PID> script is generated but then
fails to run when passed to a terminal.

A possible clue is that after manually editing the do_devshell script
to replace:

  do_terminal() {
  exec pseudo /bin/bash
  }

with:

  do_terminal() {
  exec /bin/bash
  }

the script runs OK when passed to a terminal manually, such as:

  $ xterm -e tmp/work/.../temp/run.do_terminal.25789

