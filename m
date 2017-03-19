Return-Path: <avery.brian@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 153B660069
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 17:30:54 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id 21so32734697pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AkDjtkTgy2PIqc3J0ihDQ3rtRgV5PWOdxv7crPD04IM=;
	b=BLBvN3N2pxvuy77sBGKMHPHkSK9fHF+jcgxfKLwoida5rUfhvl9rTxQ62yV2yvGGMc
	cYa7hYDlrOPNvaGHkysPBSIu+snbpEOwDcRSUE7lCpHbw0r53na5bN0ODa/3sjjB9Nhk
	WtJG6957yE5hDqTR3yG3DTQaR9mt9c3Irao7W/hzc5SwKREKbZ1ZmErrULCeWP04oCrC
	68YLiP3kzJd5A9nvq8SBwCfoYqjHvz7EK9EG+GFfK1G6GNe919gdFmZetFZ/YiW5YFwi
	5T7+wt0vttH+1aA35P7eXBj/G086OmIVW5R+DQXUdpY8/hgFH93sLf2tjzaVrb2fOxfg
	CnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AkDjtkTgy2PIqc3J0ihDQ3rtRgV5PWOdxv7crPD04IM=;
	b=Uiabm4xrZq4/K0giexZZRVATML8Ty0vYxcq5Z0Q2PeOewpZ4y4t3fCIOoLTlOnCoE2
	3HgSecn56BTDv4sPZfEdNTNtxdn1ayqz2jjQpQRnNoZnvXrm20MsT20B1cTebRI/mNI8
	nGwJXHr5/Bry76xyd0Zp9oNOJtfkPrGKlgU+7FNYFjvZYiTgjrgAQLy0q0tlkic9ne/4
	BPtRRErPXgdOI2hgKppvx+Rj4XJKhsPXXOBNyKzfz58HIiNIbtg1P9IZD+ePhGrUDHak
	QKo+S9G5knBPhjQwPVD3A6aBRpUj8col0TsNgPpsF7XqalgxdcOpciabDsJkZD0kJrBe
	r/wA==
X-Gm-Message-State: AFeK/H2a9Rty8sLPjt0F71Gf4C73/kp4Mv8n720uPdLttCj9/rM1A5EX4pWfTQW5E1OjGg==
X-Received: by 10.99.163.72 with SMTP id v8mr16240959pgn.115.1489944655910;
	Sun, 19 Mar 2017 10:30:55 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	h71sm28226461pfj.65.2017.03.19.10.30.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Mar 2017 10:30:54 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
X-Google-Original-From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Mar 2017 10:32:32 -0700
Message-Id: <cover.1489944653.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V3 0/1] gen-lockedsig-cache: catch os.link error
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
X-List-Received-Date: Sun, 19 Mar 2017 17:30:55 -0000

We do a hard link to speed up sdk creation but if your sstate-cache is
across a file system boundary, this tries and fails. This patch catches
that error and does a copy instead.

-brian

The following changes since commit 7e0985bab68547f946163828a16beab7542fca2e:

  nativesdk-packagegroup-sdk-host.bb: add cmake (2017-03-17 16:53:06 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/gen-sigs-linkfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/gen-sigs-linkfix

brian avery (1):
  gen-lockedsig-cache: catch os.link error

 scripts/gen-lockedsig-cache | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--
1.9.1

