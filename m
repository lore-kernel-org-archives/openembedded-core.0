Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EFECE9D45
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:24:00 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92228.1767713035762449402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWn3P2+v;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88ffcb14e11so11222876d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713035; x=1768317835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QcJ4xvrbZf3gw/mHalzQrwhpn1e7/2JUGcFfsId96I=;
        b=fWn3P2+vd6uYzcgdP+EfME/KcJyr4M89PigAhj23YR0F7CNuaHnWWlCHEPNhUZsq9b
         iCBeJUce+eHXwhTswuebEvrAqk42H4NeZiqZEG+rTz9RLg6rsabc+uczyzErUwtNy6/W
         xOFC7y1oeHNkentsnaKUvbSgGRHdQAl00rY16yUPFktn3tUWXOriTgTY/4uZX2YkO7xd
         vdZW78xXtfXIf+tlLZZl1epq4pYrRhgxoZpxEaIr7xCPyLU4EuQ5Uhw+LJCNbQPiLOai
         +6PDxzwFPAmuHhv3XHVJ/ZfptoDbUTlf65gjbi64/3d7HUKXUaKs+BGnc7OykeYMz9Nw
         eDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713035; x=1768317835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QcJ4xvrbZf3gw/mHalzQrwhpn1e7/2JUGcFfsId96I=;
        b=HFUGq/6AMAWAOFxpZ6DCyyqYWISBcxR1fQKIkXCIHRsdew0Wq/spVR77oWZAiXPEuB
         pUnrbPnYkg0bm33izaS6rlwMtxuPDrJRoNfDLpJHcN2mFi+WJGra2i548Kx8cX+igcJg
         u5vJMIgMluIIqsxKjLIbiJVjol0QD/tRcDawsoOqNA/mt3TfKqHlJHvy12O3Yq5Z4hCA
         oAg/OEBFLH02HV/Qg8nf+v6Fv18qSbvqj/k0NyDD7KZT7S7HQldtkgwqnFxNVpyWa+hF
         hEcYtuSnNPtaqH0uf8qVghTgCV92rMZplvCO7AWCOGnbrUpfETd6zIK+95kxRCAhJmhs
         lOZQ==
X-Gm-Message-State: AOJu0YxbxPyO1YLPsTkLahD8CqBqPex6HnzhxRvzfw3GGmKhDgXnzWex
	DDVymYdekGZ+ARvzMn5wrV3cNThDK4zA8WZcc0Tlgn+wkoU/2UWoVIuE
X-Gm-Gg: AY/fxX46hLo8JkoGjrBH8+bl2GJX3dKqxCeqp4v3wKorQhgAs/TjSU9dPawNXlFIiSF
	sxnpIqU4bkd+A4KmLdESSOrcF/0G5KrIIszqqNGCV0QG7CrWVP5eNovHTCz3AFpsCMfQ/LCVaqx
	tUKEdE7ymXe6SPS5Phv+e0JZZolqX0uq3FkiTEGwYxJ+zCMcZCS/Z30jjPTz2psFVRu3lDWmCYm
	PqYZj/LEZ1vyAIlxKvKLsq59z2QIDXg4AMrnF6/yElNTAtY06iR5D2YqwZTFFBUl7InmsiESbIW
	v5U6LannhSBde2/dqkfgsqHD7xP3hdKUrDBfPz5zHP+s5pmrsFNZ/H5/FTO+WFOQHrYNR3podgG
	/S684AjBwjpmdzENHQYCPQMy9MaXyefQTamxIJC0ZoZnM1KzYlLrN1ANh9mCLjN2cNZEACGsK20
	x70z3bwQ0GkO16lC7MQotWpfa7SMAx0buH19tsLsCKxS0a4UZog1Ipdxtj202EUgkx+/QfDthVW
	qmMFOJNlwF77ug=
X-Google-Smtp-Source: AGHT+IGUr5XD/FO4kGWKlS9sMyGmsH9ohGyOesSHMytDgvTA5WKwN+Cc5eRWEx30Y047bGOMaaS2Bw==
X-Received: by 2002:a05:6214:5348:b0:888:7c7e:fce1 with SMTP id 6a1803df08f44-89075e57ca7mr48834406d6.4.1767713034657;
        Tue, 06 Jan 2026 07:23:54 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm15587326d6.48.2026.01.06.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:23:54 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	haokexin@gmail.com
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
Date: Tue,  6 Jan 2026 10:23:45 -0500
Message-Id: <20260106152352.932717-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228894

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

I'm still tweaking my pull request scripts for the split repositories,
so apologies if something doesn't look quite right.

I'm unable to push to openembedded-contrib right now, so this is a
patch only send.

We are getting closer to removing 6.16 (and then 6.12) from oe-core
master. These updates should address some config warnings, and
otherwise improve stability.

We need to get the reference platforms update to 6.18, so I've cc'
kevin@windriver to see if he has any plans or comments on that.

Cheers,

Bruce

OE-core (7):
  linux-yocto/6.18: genericarm64: remove SLIM_QCOM_CTR
  linux-yocto/6.12: update to v6.12.63
  linux-yocto/6.12: update CVE exclusions (6.12.63)
  linux-yocto/6.18: libpf prepare for new glibc
  linux-yocto/6.18: update to v6.18.3
  linux-yocto/6.18: update CVE exclusions (6.18.3)
  linux-yocto/6.18: mtd: use refcount to prevent corruption

 OE-core:
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc   |   380 +-
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 12024 +++++++++++--------
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |     6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |     6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |     6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |     6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      |    28 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |    24 +-
 8 files changed, 7168 insertions(+), 5312 deletions(-)

-- 
2.39.2

