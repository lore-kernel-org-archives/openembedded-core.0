Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABBACA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 12:20:15 +0000 (UTC)
Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6535.1790684415029123889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 05:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HmxRApnd;
 spf=pass (domain: gmail.com, ip: 74.125.230.232, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5ce99149so296198885a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684414; x=1791289214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3bOPpCaOBDGcOEvneWuRLWDqyHFfhkwAiIqGgEfrtY=;
        b=HmxRApndXcUYPWBwRv1LPa94yMnLTrglD5evfgYLfNKPn/7IMmQl3fVYFu0hIV9yTO
         5ntsnko9U/G5j5yeCvfr91QXR2TM3vNv1Zs1rFzPmZkarenMdtvEJKSp5yDEjr/1LRBj
         RrDlH0JZ9NR0cOVGxbMYIr3gs4QP9JY2809xPGEZ9gnnm1Shz4Ryr8vChROXSGcKQ4Hq
         BPn/+O+wFe29IvOK69QMTzg22pRWj8HKvTjcd9opA/UMcn7U8wc02Y7d92MebEY8SnBf
         HYqHQvWH/uORXlOdczoPe+FoKCbgdZFD+/gE4RMnJD4t6SJUt6YQdKfkGyUvmUO5fMNn
         jsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684414; x=1791289214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3bOPpCaOBDGcOEvneWuRLWDqyHFfhkwAiIqGgEfrtY=;
        b=jv+5a4BogdiBXfndewsBWdEPmw7Z8TmtN+OHcqKgOC9Qt2hkzXDUUozv7HNslMjDvW
         NxH9TJBgoFT0ydNgttxV+Do7UCxOmMXGK4tE5E792xJZwpfh/zv+3aTVRokI8EIlsegV
         7DzsKUoXeqjbNjv3bYt7th5wEgnFlS+7ROLurF00cId8n2m9DsBwWMSvnLG9gNvBl1vd
         6V68mO6CEgAHFEgpTxNBA8HONy/+Q5I/OzNwK4gNXAO2280cm65dOks8LNlPsx0PaYp+
         drfhOhvpjsfiqhAGiv7mIpMwQRGWooh5be6Dyf/4uNFPzhhmWpcGT9cwTcrofbwFN3Sx
         xRvQ==
X-Gm-Message-State: AFuF++lVQkmIm1tAYpGsBW3qUubOIMzRBdXXXxTchT+WyVfgaa7KVBhK
	fqb3Hw4wB/A2u/Oocm0m6JYYHOvG268dr+irftin6eJR9/8Nn8wNdo4e
X-Gm-Gg: AYBFou0bEAYDM8GD0ynzcEpgzecoq25bqywCoVYAmO7y+UJgIEqeQPxuyp0voXOO1aN
	p5BqCKDsVsr8/KIseKlZMor+96qsJK3DRszCfGH8DF+7k5nqd7x/+PQwuCiAeM+aphhA8vot9YQ
	BjhNoepDNOQkRobQ8hK/WYu4bzs6BMwbhJeoOS5SypHqBUYzQ+zJZI6Tj/TDuO4J3y5UCxcRXf5
	OL6F6tw3ZK7beT0bPtOFaf6JXBk9W80NgkI/WdeIpEF0g/YeW3ueskQDqoP10mA/2QdgIOlya/4
	VgSjO1AJHMiBW7L5A2spm/wV2AqlAFUP4/i5sr/NsAfoVMqM4LtjbRuzuErG0YPpsD49p6Qa9Wm
	s1waGIl8HRzUIgqPEAsdf7C3n7LSISH2NlelhtbSzXWNfWIYS72370RZcmxuBUNZ3/9hRcs0jk9
	orbpfD2abSu59QSasD9fYVmPC3TRokCdHo05CRgf7yHoZZC5XBSOF09J1iP78NBSy7kgV/j2HVh
	Po80rc88YdDP0MeNd3JeuNx2fJ5NJ37eEeLtFVHudWPIIHw7R3FFOt8ISpR7jRRGPyEhPHaqetX
	LFTUoEsctSi5Q2+5EJyb1IBQOj+b4xYjPvJ+xeWEH5tx+cV/YdED+eCkJ/7EO9xPoUlDHbkUVJR
	ZGG21OxSRYeBl9Q+tkDxS/J5chQ==
X-Received: by 2002:a05:620a:2b97:b0:934:946d:599d with SMTP id af79cd13be357-93c43e0e559mr2624821785a.33.1790684413657;
        Tue, 29 Sep 2026 05:20:13 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c815a47a6sm377055685a.47.2026.09.29.05.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:20:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: stable bumps
Date: Tue, 29 Sep 2026 08:20:06 -0400
Message-ID: <20260929122011.2449622-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 12:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246853

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

These are not intended for the release, but for after it goes
into maintenance.

I was asked to not hold these -stable updates during these
sorts of windows, so here they are.

Single series, across the two repos that need to be updated.

Bruce


openembedded-core (2):
  linux-yocto/7.2: update to v7.2.8
  linux-yocto/6.18: update to v6.18.54

meta-yocto (2):
  yocto-bsps: update to v7.2.8
  yocto-bsps: update to v6.18.54

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 22 +++++++++++-----------
 meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 24 ++++++++++++------------
 6 files changed, 33 insertions(+), 33 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

