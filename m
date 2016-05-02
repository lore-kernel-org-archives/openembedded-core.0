Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC18B606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:24:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so21491489pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pidRvLCJgP4+tos+sBEaoX6RmMMOR3zsTXI2l4gWQSY=;
	b=zrTS0FXT4KxqxV1EStloCLfDTNhtrocHjHOt4uEa+WwGJseimcAAaNqWQFMt4nwdAQ
	kChcHlbnQdNOOiGJQ96nUUAKBcEteZXz1eTUvFID+l/D9ftP3v4G4XiSdsg3S2lqlw7U
	vFNATu2BiS36+e0RX4nRbuFLyGQUdhVlpoxaw8S/IR/rDl+RPT8oDePbuOa9H4M5dV1o
	pU3aIVa2u9mDuozHgNLDHteVOzwVBTa0N3uzaiffb2cGx6GjmGjNZHUeRq1pTqyhKkV5
	6N5rrUfznrTqEKzUSM0zlCQ+aVX4LoJuGYpmP+fwwLDmUvD9apBz2bAOpXwr8UGZBCVj
	bmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pidRvLCJgP4+tos+sBEaoX6RmMMOR3zsTXI2l4gWQSY=;
	b=VSrMSWRuE/BDGQPh3lBS1xPpD1RTQJw21VTv//J0hxRAY3sSivA+LkjPtwKEPkXfMf
	4PIz0+75hbPrulJVrREAh5Q7ZJ/QqXFEfvvC5LWfhSHoqH8C9QMrO2VA87oI2GXZi1AD
	uLsf9bI7a0HzWebujLxzxyyGEp6hl5gKrPuMK3X1yzfy9y4bSrEQCMZvpN4t3RMUD5yf
	BT7HsHCXFqqTPwRvxHkKWhyBTw9DVD69F/6MdF57X2sVEUAiGu3UQ66OXEbpTV5YpZq6
	duoc85pEJDXFJf4K2AXpk0YQkERtWd76ePxauckBwVTkfd6UeKfYyg1LOFcVm25Rkvfy
	8GZQ==
X-Gm-Message-State: AOPr4FUeaG8LovNSfer/N73PkJewiEyyxEfLqchdM7Um4/9tnn5gzLsJjgn8mv+LyR6ZhA==
X-Received: by 10.98.87.220 with SMTP id i89mr53458215pfj.107.1462217041636;
	Mon, 02 May 2016 12:24:01 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	o2sm15767473pfi.85.2016.05.02.12.23.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 12:23:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 12:23:54 -0700
Message-Id: <cover.1462216694.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][RFC PATCH 0/3] Support template files for wic wks
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
X-List-Received-Date: Mon, 02 May 2016 19:24:05 -0000

From: Christopher Larson <chris_larson@mentor.com>

This adds support for .wks.in files as WKS_FILE.

These files are treated as the contents of a bitbake variable, so usual
bitbake variable references are supported. I considered using another
templating mechanism, for example the one used by yocto-layer, but then we'd
end up largely mapping metadata variables to template fields anyway, which is
a pointless indirection. Let bitbake expand the variables directly instead.

This feature lets us, for example, reference ${APPEND} in --append, and avoid
hardcoding the serial console tty in the wks file, and let the user's changes
to APPEND affect wic the way they do the other image construction mechanisms.

The template is read in and set in a variable at parse time, so changes to the
variables referenced by the template will result in rebuilding the image.

It's been suggested that the name should better reflect how its contents are
used, i.e. .bbin or so. I've also considered including something like 'bbv' or
similar, to indicate its contents are that of a bitbake value. I think this
should be discussed.

I'd love to hear questions or comments on this. I think the value is clear,
and it's something we need to solve, but I'd like to hear if others agree or
disagree on that, and whether this implementation is appropriate.


The following changes since commit 1a0e56630c5c27d8899dd0979ae0b86bbe227881:

  utils.bbclass: note for deprecated base_contains (2016-04-29 07:53:58 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core wks.in
  https://github.com/kergoth/openembedded-core/tree/wks.in

Christopher Larson (3):
  image.bbclass: append to prefuncs/postfuncs for do_image_*
  image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
  image_types.bbclass: support template .wks.in files for wic

 meta/classes/image.bbclass       |  4 ++--
 meta/classes/image_types.bbclass | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.8.0


