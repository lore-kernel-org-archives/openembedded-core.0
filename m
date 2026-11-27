Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15250.1795783627573908623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 04:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=j3q5Olkv;
 spf=pass (domain: geanix.com, ip: 79.135.106.112, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795783623; x=1796042823;
	bh=PJNeZ1UnDRTXzVOov3yUPXlZweKkIvF/vSEbwGJHfq8=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j3q5Olkvmbyjie5lMJnIKLAEb77b7wANX3XbjsIs7zZCe5mLm2Z9zVgUG/7w3ru49
	 z4xoxfm90FcwJdc2Ft1IhU7G6c2r4Ts7MlwsKqHOsk5WgohZawaXI5Jdj4mlVI9ees
	 4xOOhajaXMFXP7FqvcskKKxzGgMD/7i+rforBTj9gCXpWmX+PdTAQGOLNU+wmrqxt8
	 M9vfgaNvhFeFalFBDVSBINJ6YeJIMEWz7p4Iaj9iiXbBL8ozF47qyES99K9gyT934U
	 42nSXoCIocFAC8DTZdte/ij1ievMFeXyvj7J6Lr5uYb0gdCFVutYHog/3BLIN969ZB
	 hMKGOJv0vqXSA==
X-Pm-Submission-Id: 4jbY8Q0LWxz1DF5P
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH 0/2] rm_work: remove work directories for do_populate_sdk
Date: Fri, 27 Nov 2026 13:46:39 +0100
Message-ID: <20261127124657.769093-1-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251384
Content-Type: text/plain; charset="utf-8"

With rm_work enabled, "bitbake <image> -c populate_sdk" leaves the work
directories of all recipes the SDK depends on behind, as do_rm_work_all
only runs before do_build. Patch 1 fixes this, patch 2 documents the new
task.

Before this series:
% du -csh sstate-cache tmp
16G     sstate-cache
129G    tmp
144G    total

After this series:
% du -csh sstate-cache tmp
16G     sstate-cache
31G     tmp
47G     total

[YOCTO #15824]

Sean Nyekjaer (2):
  rm_work: also remove work directories for do_populate_sdk
  documentation.conf: add do_rm_work_populate_sdk doc

 meta/classes-global/staging.bbclass |  3 +++
 meta/classes/rm_work.bbclass        | 14 ++++++++++++++
 meta/conf/documentation.conf        |  1 +
 meta/lib/oe/sstatesig.py            |  5 +++++
 4 files changed, 23 insertions(+)

--=20
2.56.0

