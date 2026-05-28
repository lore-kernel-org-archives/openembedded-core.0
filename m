Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956E9CD5BC9
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:37:24 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2751.1779935837327980270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iMpgBC2L;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8b9f2295a9dso134698906d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779935836; x=1780540636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtINCaSnkm4bJnRRNHYN1kZWGzC4ugcuOaDmisNh9+Y=;
        b=iMpgBC2LYgg+44DwSuXQ78CL0rMsdYBY2R3qosbNlTEBym2eBmMFeE/1D2sb2GLcQk
         7tOEYhWVgX6piZqbnW//ypOeVbdN+tX9Cp+fCRuoYvEdEqGVPluK66qBA43kh4YNwogP
         7VKfst+hhN7kOoxWJf4SgcO2nl6rOlAEnL0eeZWj8+abd0bvxNgv3KgkK22kYf4sLiFt
         HuAUujZ0atS4a7DcOvC9RuZ/e204HWoSbnVSEtYn6el6ajHPsUXmtckW7V9kW7qLwWvG
         ivv0dHcpoqSHqJ34CTwFtMxdV6P+syYWnavYvPN56k73CHNxCRHyh1rigzV5oHiRGpDG
         CiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935836; x=1780540636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtINCaSnkm4bJnRRNHYN1kZWGzC4ugcuOaDmisNh9+Y=;
        b=WmSmk1tGR+mrc63xcA0/MuqHoDssrV0ZsOemOkCiK4C9YNMWXf2qccHhCfHQFXtCB+
         hLjv3qfAVUzBduQ5tNAkUcKkIYM9O1MLQdmBNbxXllpJD2UVKC0IHYqDsx53dP3WWeTa
         zZ7kAzY4ttl2Dt24J20kjeem7vq9tKKi9kOkyq+6YfbETby0l/Yoinx11t55u/xZXCOz
         PS/oudd+HdtobAoYYEj3uih9BBUfn1eCrR+jJsCz38gF2Mpz4//lND+CFn7a3OqrA7MW
         SM9ft9D5oK8TlqSPGAAeFQuPKpsJ3GYrXFHoujWtlrIBZXsM44bNNj3yjNc50j4cYGHe
         VVbA==
X-Gm-Message-State: AOJu0Yz7tpHPlZS8mvgbXECDVZY8nQG/TMS95zudcGDX+zB51vH2icc8
	cg7Hh9/MwzbL7ndyHthc5i5sO2sGohfaMTSzsh57m0BYYO5M28aUB2Uzae1lv+hd
X-Gm-Gg: Acq92OExfWytksfsQAfVxPNPELa8excx73N7UA6E7h8XVYZD43Z3Y6k/Lvomiu97o/O
	q0rgq38dmOLtxs95vcVSBgl1PYuburYQHrLT4U0cOcER15ZLFUui7oCUeV7YhAF31leTraISsY5
	QmMeUZYa37F4JZ98taoXytei7I6Bcay1HPQr8/+LnQD8aQNVm/j+hWzYm5qONPATzddRVzhapSF
	8Sll3sCv/x29xOo+1vzwBfgOz9MoOabaiJfjpAowqAHC+AohTir1aAr5qw+5qNn7igNfkF0FOQW
	h/Bc3xOOj5Z9Sxla7q3R4KEw/TRMi0yNjU9NFXEiqB7rU0+oJk5Q3apcSRu3IhGBT4Ks5q1hRGF
	hoxUzRvW/6wvL4x4Yf1uRE5NKYmtUSnFheijkx+FCpizp9loEqY0fyiPEyrn1q1Y4D+1GTE9B/L
	4tWOI4R7vd1lzV/D3BE4anRPImFcn4JarWcUqKuCNf2jIa6+z5cowCunxcIrsY6LRXhb7DscKHs
	jaCllanjahgzFDkcfiBy006jHTtAEpI0VH2WUuaGSnwmzwZEMQpsMWjYyh3x3NIrukkmprP9U7u
	ofe4jrLPFshoqfnaWp8WvvR/da1y5HkQ52jtZ54w2/fxBSRhb8AkS1E=
X-Received: by 2002:a0c:f00d:0:b0:8cc:d606:175f with SMTP id 6a1803df08f44-8ccd606208fmr4655756d6.48.1779935836111;
        Wed, 27 May 2026 19:37:16 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcec8esm186146436d6.7.2026.05.27.19.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:37:15 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
Date: Wed, 27 May 2026 22:37:04 -0400
Message-ID: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237681

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's the latest -stable bumps for OEcore and yocto-bsps (again,
let me know if the combined pull causes issues).

I've also moved the dev kernel to v7.1 and fixed lttng-modules
along the way. Hopefully a new point release will be available soon
and we can quickly drop the backported patches.

Also note that since ross removed the CVE exclusions .inc file in
a patch (which I think is still pending), I haven't updated the
exclusions for the kernel in this series.

Bruce


openembedded-core (5):
  linux-yocto/6.18: update to v6.18.32
  linux-yocto/6.18: qat/intel configuration warning fixes
  linux-yocto-dev: bump to v7.1
  lttng-modules: fix build against kernel 7.1+
  linux-yocto/6.18: update to v6.18.33

meta-yocto (2):
  yocto-bsps: update to v6.18.31
  yocto-bsps: update to v6.18.33

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-dev.bb                                                                      |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb                                                                  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb                                                                |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb                                                                     |   24 +--
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch |   94 +++++++++++
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch            | 1424 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch            |   75 +++++++++
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch           |  103 ++++++++++++
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch            |   54 +++++++
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch        |  198 +++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch |   56 +++++++
 meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch             |  276 ++++++++++++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb                                                                 |    8 +
 13 files changed, 2308 insertions(+), 20 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

