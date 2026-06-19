Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D02FCD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:33:12 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48966.1781893982154926317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=W7FGDC0Y;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=MOKkrDwS;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 54FAF1D000B8
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:33:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 19 Jun 2026 14:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1781893981; x=1781980381; bh=R6SDYaQJ3h
	gjPT+qtxsvIumJCWAlztaKiZKpNkJ3vMg=; b=W7FGDC0Y7mZAztO34YImHtjulH
	q5P+xe+N9b09fsZGVFQmOpTUGCFqt6RZXzkTaPZuxV0oGZ+v0WYvtLnjGsy1RV/e
	Oge+uOW2rbe3H9XquFlFJpfRM02f2JOaDMAmCIx8cnFM0CIhClrj13WGDkJD4+0j
	ufanLPyg+IOYsvGdC6jj/QXyJND759DarGfv9AF053JFF99O6rHnJWzCl9HKQqs7
	aGnKfk2FcoLtsNhRshMmzhCUfPaatZQkX8TnGLLgseE/Ao6vhNwF7JiOSYGnJ7cD
	B6n5niqlk6UQGhf5Hh156NZ6mYGY2Z+9o1GgvHgMn5qmrP/jY2RG95ahlarA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781893981; x=1781980381; bh=R6SDYaQJ3hgjPT+qtxsvIumJCWAlztaKiZK
	pNkJ3vMg=; b=MOKkrDwSJhgP8pl5MjgKGqUMVmkYIlyXeUnEzTIKSddmc4a/Uj6
	hhVHD4svTxAhwSru2MEIhF4WmY2KFebhZJGj90q9dP2LgeAZ8Efg4FrmXrCNjBpj
	n/JNVXFP5fXI9fZUkiYqJPHbv7ab7D0ZVCEmx7a7eo7Fbtl2GNXAeRedGaBL9Fty
	XdFmmhwFQxezUdjv81t8djqb51QHOSBZRg3S2IXA/3Iy9Bn5fW2QbiaEnszK+7FL
	eiApJG8DVWpPVsVFEPd800L22FR3SR8m4OvFBFK8PC/MR9342QDDW66xz65brjvX
	vAoH/71qWk5QWxvRvaAvI50RDnKEoRyrojw==
X-ME-Sender: <xms:XIs1ahpQgpep4sWaqni2diyVsrhKWOKttvYIKCuXvbC_DyslPVscfw>
    <xme:XIs1aqmLC6HXuO_qy_CdiQc4ixd0XqxMOXR4zqPiJcRMtnuta8gG-WO4u1cmbsFPa
    G8SpeaUckYwGZG_Q2GBh4lrk7FtDccoOb6NO9lUUsI2G82BDBLOkDM>
X-ME-Received: <xmr:XIs1aj24UrtiHZGRj99DuG-NSYEt0p9RQQh642lsYTSjGNK-J9HASwAXZ68Jy_3YRE93rTYUBUFxBl2ZbEQ7IbE3nBGum74>
X-ME-Proxy-Cause: dmFkZTFW4x76fBxnDjQ32n1Lhx9OITGuDCLi8wOvrhNMgXNj2OvC9ehqPAHWHS/ldmJOxn
    KdEPAx8O51JyqpWJqYuaP3NcV1RIMJKTbBBxYKKdWu0ysAB/nejVZlJ3UtmS9Vp9xG95C/
    zCS+9A0xP/iQwyiMX6ft3ixQ+PPuHXU/lv7XO2L6Pxp0fQSW+Diay1miZq/zlIQc6Byj5e
    GGlhjyrn7K4nrQPoyx/sEThNtxL/0PpZjY1NON/eBNjBlcY6kY2sLj6XLcHyGmoV0advch
    G3FO4/rdbOZcM+/7PNgJ0TWGvsQRZqnUNuG00rH9QSMDvmv3jyzdMDIPCBRTvIaBTthncG
    3i4h7jSwDJBC1EvdrdFIiqOU2aRyvA3Sc2f6b4rFp0GVCH32/m3CTwaRa6qGWSaPNR5UAE
    RV8xtI3lZyZ4zUxqyBpL7/bo8hvU0oC+f4FA6KJTYOsVZYmx7/dFCPYnxCgjGvgTUvUl+X
    0PKuyeNi6z3SfPNGHX+ApB0ICpWyEc06HvQ9TYpMCbBrpZtr2MdAhlmqdWoOzwqAqW9MHq
    va/rdz5OBkjWPojV2SgbMT3NphaEagvndJTPCCYhtdz0iX8JuooKkJ3oFMJIw1YDfQHuR0
    KMGXJ5QNeSN7jAlGWynFdtu2oxXNUHdEM52hAgAUef6wXFfxaeY+dme+HyGA
X-ME-Proxy: <xmx:XIs1aiDBcDq3018BeuiQbiJYrzN0kZZChAi7XERImnxV9snXu64u0A>
    <xmx:XIs1agzwKZqSGBsJx_wzbEXt0gkNCaffWf9U_Foi2X62rMZYYdvuJw>
    <xmx:XIs1agnqQMahYwjPcTKe2VbuDjO40efJRUIArnNFs5Big3jaBlmW9w>
    <xmx:XIs1alHFMllv6UAqdQJFGG1-11derXfVBAPswsJgELdgPCrEIeXBSg>
    <xmx:XYs1arbUSmupqEn8nnDorkJ5cmTb0-D1dXF3iaCR8FFZTVkMs3S2J1tv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 19 Jun 2026 14:33:00 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/5] Various updates via AUH
Date: Fri, 19 Jun 2026 19:32:18 +0100
Message-Id: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKLNWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0NL3cTSDF3zVHOj1MS0RBMDwzQloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0AtnrshmcAAAA=
X-Change-ID: 20260619-auh-7e72eafa401f
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=z6jQc34RknOILdQTnxts1H5/iXRnZK0fuwLfkM6Dr08=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSZdkef3XVwadCMTwECmrcf5jU+XbrxdsyRopRda38Yf
 tmy343TtaOUhUGMi0FWTJFlc8/X+097HXkzQm4pwMxhZQIZwsDFKQAT6Sxg+O+0Yn5TzRHXW78+
 t7lsdZeZ/ZRXaO9+Rd4w/pKpZntVeD4xMnQd4TDPjOBc+mdudY6rh0Enw0TDZZU8hkEd0yf3rlL
 w5gYA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 18:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239184


---
Paul Barker (5):
      libportal: upgrade 0.9.1 -> 0.10.0
      bind: upgrade 9.20.23 -> 9.20.24
      lsof: upgrade 4.99.6 -> 4.99.7
      python3-dtschema: upgrade 2026.4 -> 2026.6
      ffmpeg: upgrade 8.1.1 -> 8.1.2

 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch       | 2 +-
 .../bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch    | 2 +-
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch    | 4 ++--
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch    | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                    | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch       | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch                 | 2 +-
 .../bind/{bind_9.20.23.bb => bind_9.20.24.bb}                     | 4 ++--
 .../{python3-dtschema_2026.4.bb => python3-dtschema_2026.6.bb}    | 2 +-
 meta/recipes-extended/lsof/files/remove-host-information.patch    | 4 ++--
 meta/recipes-extended/lsof/{lsof_4.99.6.bb => lsof_4.99.7.bb}     | 2 +-
 .../libportal/{libportal_0.9.1.bb => libportal_0.10.0.bb}         | 2 +-
 ...002-ffbuild-common.mak-ensure-target-directories-are-cre.patch | 8 +++++---
 .../ffmpeg/{ffmpeg_8.1.1.bb => ffmpeg_8.1.2.bb}                   | 2 +-
 14 files changed, 22 insertions(+), 20 deletions(-)
---
base-commit: d595615c6a027b80d6f7ea80ab25e85e97b2436f
change-id: 20260619-auh-7e72eafa401f

Best regards,
--  
Paul Barker


