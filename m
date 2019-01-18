Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
	[209.85.219.175])
	by mail.openembedded.org (Postfix) with ESMTP id 03F456D74B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 22:17:38 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id j10so4940363ybj.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 14:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Vx8EsbSzqlTHlCqpa3ik7qJfAY8CzUnBgzIcuJBhx/g=;
	b=avOHByyoNYkj/O3QmywcdlmW6VAku+BB/gmWnMucBIj0fcu+Cjbqiv+5AJMIpqRHNc
	Y5wESRHeFNakXi6KYw1Rw/N88AaT88u+RwdUBDHe3EanuUhDLc3JskKKaqcIyBt+K5MO
	DENFp2v9STRmTJyWzovnP368wwEi0X9aJFbWxOH0wp1ZQSPsO/rLGC3NYF6MA86e8DD/
	MrypWAuoqHVYMpVh9Ya/bnXqXysQLy8Y0uL2RVpC6V8N9EuKVXvKK6e0w1xXIQNaz2ie
	PqlbIAbinOaNTggSJeju3xgiKVINrpDo5zeWZo+X8ah5CwFkEsj0otsCPv4nwVZQCLko
	6n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Vx8EsbSzqlTHlCqpa3ik7qJfAY8CzUnBgzIcuJBhx/g=;
	b=s0KrBK3j5KHzY+20twFAbPRuf1A0hRrS1Lsh08qiP2cbmViEs6HaTX+NMrfreTq7U6
	DFyiAw8UelCTtXj2zzXtHJliOcXRlcQeTk2Y2rdsyF2KsjEDBEd5/AAvnScq9GD0PcXj
	e/oNExBNMgZl9GPTd2QYuCdKkQdo6GNh6TVfghlgNvhXB2t9FAQu4P4vMcXibO8mCxTy
	c9LhSYU/6Ou/9z1lYxdiiET96bqp3mYD7dj/8ZOrRWmPModqRHDcgGP/DxW4IQGU4/wG
	7tAeZeEYs3WO3yhUxi5bqq3Ed6Gca2A7leq9lK79tgOFctttj1aPzLUDUgOaWaqCcCVM
	/EcA==
X-Gm-Message-State: AJcUukeOSETfz/erYFHJh5UkVMWhuHBEEr3spQKxfJRnYlNOnpmgC13p
	MdfLqz9kiboEAiEqnWp+PT9Zr2yCAZZouA==
X-Google-Smtp-Source: ALg8bN7zaVGRRhzjOQ/IeT3e0VYL/4pyRfermtk2p9oacXARlf615nx8KEq+fdL63T8FozZYrWB2Qw==
X-Received: by 2002:a25:97c1:: with SMTP id j1mr8040626ybo.450.1547849859343; 
	Fri, 18 Jan 2019 14:17:39 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	h62sm2287468ywe.100.2019.01.18.14.17.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Jan 2019 14:17:38 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Fri, 18 Jan 2019 17:17:37 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 17:17:34 -0500
Message-Id: <20190118221737.14443-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH 0/3] qemuarm: update to ARMv7
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
X-List-Received-Date: Fri, 18 Jan 2019 22:17:39 -0000

This series of patches allows for qemuarm to be a more modern and
(hopefully) faster platform to test on by default.  Firstly, it
introduces a QEMU ARMv7 based Cortex-A15 system (of machine type virt).
It then renames the existing qemuarm machine to qemarmv5 to allow for it
to be used by those who still want to use it.  Finally, it renames the
newly introduced qemuarma15 to qemuarm.

Jon Mason (3):
  qemuarma15: ARM A15 Support
  qemuarm: rename to qemuarmv5
  qemuarm: Rename qemuarma15 to qemuarm

 meta/conf/machine/qemuarm.conf                | 29 +++++++++++--------
 meta/conf/machine/qemuarmv5.conf              | 21 ++++++++++++++
 .../linux/linux-yocto-rt_4.18.bb              |  4 +--
 .../linux/linux-yocto-rt_4.19.bb              |  4 +--
 .../linux/linux-yocto-tiny_4.18.bb            |  8 ++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_4.18.bb |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  8 ++---
 8 files changed, 58 insertions(+), 32 deletions(-)
 create mode 100644 meta/conf/machine/qemuarmv5.conf

-- 
2.17.2


