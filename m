Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 333FC6D433
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 18:58:40 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id if17so3082584vcb.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 10:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=vACOK6r1CImH4yTWJzMaDNDOg3zD+HAUouyUykWnXXM=;
	b=I8Gu4D2m5Fy+CsrooLMfFhC4tfADIANhF0VGi0LSYsHeRti2uDVb0q2elEtjeJeIzT
	yOjnLgH6aamZMnE3N+X8HUt7yfm6P7xbg3inyu1NBfxf+TYZavaTxq7BnlGShrpqny5R
	AbvWOqeDgK9FyMNyz56d0bJQ94Z0Ik7758N17fldmo7E/uNKNM4Wy1YbzLZg7BqPOHPk
	HWQd2EtgbsCog2NXbtRrEhVjDAvcRbb334RZbIXLBPUMXiEJgtSP4Mf1UQIdv/lqC4dk
	IY+rXuZUKU+AxDqylQJI2hcCtG3EUX3psbSrGNJyLS8ybB21JFQhCyt8Ar4iRYP6JCmw
	0Ezg==
X-Received: by 10.220.192.198 with SMTP id dr6mr11463518vcb.19.1384714720974; 
	Sun, 17 Nov 2013 10:58:40 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.49.71 with HTTP; Sun, 17 Nov 2013 10:57:58 -0800 (PST)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 17 Nov 2013 18:57:58 +0000
X-Google-Sender-Auth: Q9_I_FZTikv9spEiim98a2dEQtE
Message-ID: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: opkg dependencies and update-alternatives
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
X-List-Received-Date: Sun, 17 Nov 2013 18:58:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I've been trying to add PACKAGECONFIG options to opkg and have ran
into a dependency loop whilst building with certain options. Enabling
curl support within opkg requires a dependency on curl. curl in turn
depends on ncurses (via a few intermediate dependencies) and ncurses
uses update-alternatives causing a dependency on
virtual/update-alternatives.
PREFERRED_PROVIDER_virtual/update-alternatives is set to "opkg" in
meta/conf/distro/include/default-providers.inc and so we have a
dependency loop if curl is enabled via the new PACKAGECONFIG options
for opkg.

I can cause the same dependency loop by setting
PREFERRED_PROVIDER_virtual/update-alternatives to "dpkg" as dpkg
directly depends on ncurses (which uses update-alternatives). So if
someone wanted to use the more powerful update-alternatives from dpkg
on a target system it doesn't look like that is currently possible.

This places quite a constraint on whichever recipe PROVIDES
update-alternatives. Going forward I'm hoping to use libarchive within
opkg and libarchive depends on bzip2 by default which uses
update-alternatives, which would cause the same problem.

Does anyone have any clever solutions to this? Perhaps we could split
update-alternatives off into its own recipe which should be dependent
on very little, allowing opkg a little more freedom in its
dependencies.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

