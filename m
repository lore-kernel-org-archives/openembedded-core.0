Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A176CDB46F
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:33:13 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48967.1781893983077887817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=eozda5Zc;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Kcpir7xl;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5626F7A015A
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:33:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 19 Jun 2026 14:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781893982;
	 x=1781980382; bh=3iklHRqAyKVDAlLD1QiniYL7JHAupFxZnkuO1+eXIfA=; b=
	eozda5ZcyqoipO3XETi1sAFlvp2wN7hGHQ10TTNR+6GOvlhhiGS1q5Iqx6uOsrTw
	1+YM9giyh60sN/JvjXeGM2oZDqXWeJnDV960qMRlnUG+dZQ0qRmX3pBkhWjkcXpo
	mCEVnfA9XE+22fPleufELQmyNUK5RtIeZRExZqRKHCno284TEQoK29Mum/YgC1U/
	PPKLNWryuWxuFLpk7NSoDs3/CENUR2iSGXRq9tbZ+bnsHCImrmzCce0o2MKZ3dBu
	teS6h0czce9i8/XStUZZX+vsg/GHdkaF318DbIl0GglYoK8gXmH8R4rhM0e6Tjqa
	TJj6mii5FZClYdL4YIMnJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781893982; x=1781980382; bh=3
	iklHRqAyKVDAlLD1QiniYL7JHAupFxZnkuO1+eXIfA=; b=Kcpir7xlGN9bsUHSS
	6AVOq8eMyegNAm8dxxAH+J60asFyryDgsdknfDaZxhy1RRNVz8hjzhtrS3G3X5t2
	RPcS9cBpa6aRUfnsuzdFHaXj3ZJc3XzLJ4UE7bpeu90/BQi4bXEti2DYLAeDQORh
	9IV8ko4RX5o9+xsO6mLzeYi79FCxosa3d7+j1ZEPvHK4TD0uTTh1ZFQvkQw0C14q
	Q+GvM2tzYN06D6/P5Yz9KKKtkmxRUFAxLXXTTRKL0ixNIu/173RNmOxs7zI0d/Np
	89ZUS5AczXtJj0xmuIVxF2mUHfYkuC5gM/zaG/9Gdf4XbSzqpu1mwRmhbmEdYwOu
	Z+Cpg==
X-ME-Sender: <xms:XYs1agphdM3wUlaaiEP9BjEgLNID_xBgq_VMWKprJIbSsNq-qgj1Ww>
    <xme:XYs1atlhlNH1-DxkoG7WSglAU4ZwS-Z5H8oWzS0hGdNziMksbTXTzLH7oS9LN-t4t
    guRDLc4WxURhR3yJdM-kssDyVKhMf1Ng5T4L4ABFWTaZE4eixiWKus>
X-ME-Received: <xmr:XYs1aq0KRWqERF6hg06WGG4N144rRFaQDaNH98pQS8zli0CxLcSR-R1DRmPDlhZA36JLyL6MKZLECcRZ5Cb4LQfjJP6TYCw>
X-ME-Proxy-Cause: dmFkZTEoRZIfnal4GD17rFFQ1G6ZRr+aB9E9IT6aDaEqIgKwnyq32alY4baFB31MZxdVrD
    Jh39LagJR/BfMuG8wQykPrOVCeDCl9iRP2mZjZWCSe50Gt3nc8I9x9gjsSdlqQDoQDQEAd
    q3dY1Y6B76583CZqmUdSqCRxtFkRpa+Uv4a5lg9pPRI/JDl7a+mel0gSoy/4MghhKFPrZO
    1G8HeEk4H5TXBaO2QI/QjbWd4K6UeexQmPbG8tXRGBSsSG5vAaXa5hYL8Zwr8Izjqx+ozz
    jaPqhfL4NlNonPWDMcgM7rkrDo2cfhqh58oaFBnxxWU2RYRMNOHfNql6bhJVQJZIW1MpNx
    XJsVjuZixbTqBCm8pza9AY7w1r9XXkw+XLEA97Ws6siDfwaJL6YWErcNl5IdxxSfzcZgxq
    d7ozizjuWgTRHC+ejUtO9lJy5SGs2vMqAl0ZQs92h8ollsaHwkmv6le6OOjp2V4WzN6ggr
    gT7jtvGbwZG9nDtzS/karjoeJQCJyReGYwwr2qA/ocQVTBkoXplV+izZmWlM0t9Not0qF5
    nyj5cZYvuHVTw33gvkDTf9SgmPC75uFrUDeKcqFVav6n0cWjhjdXClUgOR+hAhMCdVCk8l
    VnxaUDKTFVe7++UhfiNhRYCC/2p2BhjM1bd5XEmx90ARv+RRkivjChj+JeIw
X-ME-Proxy: <xmx:XYs1atB67ozT133Ie1kD4bgJvGHlJoRKMVCapTPD98r1xWvGWXbllg>
    <xmx:XYs1avwfxnzh7BniTOkxTM-hfyAB1uK5wz8IopwSpGjadgUbMds5sg>
    <xmx:XYs1ajnzEue_WkJ6UxMKBeb-xbW9sLMH8ayGUn5Qy7N08QGOWJ6oaA>
    <xmx:XYs1asHOIR-7H_H2LCk49QOSLldz0pgAIGB-lf8j7_JA2KmBtdbNcA>
    <xmx:Xos1amYFPwsCIYwuhnkLohCHYDvlbvmgyHLwsuxbdns_QqTqMTCWRJy4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 19 Jun 2026 14:33:01 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 19 Jun 2026 19:32:19 +0100
Subject: [PATCH 1/5] libportal: upgrade 0.9.1 -> 0.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-auh-v1-1-62299dbd8231@pbarker.dev>
References: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
In-Reply-To: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=lRoA9I37y6Bk+8q/rgXVSKNmR/oQsjBE8e2VYBQlsSQ=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSZdkdnPxO5uuTp8xuSKepXFTRX9j522DfDzEvGNSCCd
 eZfpzVbOkpZGMS4GGTFFFk293y9/7TXkTcj5JYCzBxWJpAhDFycAjCRH5aMDIeTtt3jONpnKlm1
 zdNrbuf07w/djIvz7ep7HD7dNFwy9SHD//y8d91n12+8clejwm3jvMdJDX+85p5eWj11tur0ovr
 aa1wA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 18:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239185

Dependencies:
- GLib >= 2.80 is required
- Meson >= 0.62.0 is required
- g-ir-scanner required if building with introspection

Features:
- Support directory selection in xdp_portal_open_file() (#211)
- Add clipboard API and support InputCapture session persistence (#214, #220)

Bug fixes:
- Replace deprecated Gio.UnixInputStream with GioUnix.InputStream in tests (#205)
- Fix a memory leak in the background API (#216)
- Specify --doc-format=gi-docgen when building introspection (#221)
- Use canonical property names and G_PARAM_STATIC_STRINGS for all GObject properties in inputcapture (#222)
- Fix invalid free of call-related data in inputcapture (#217)
- Expose libportal/settings.h header in libportal/portal.h (#199)
- Fix build with Qt 6.9+ (#200)
- Don't install glib-backports.h as part of public headers (#193)

For more details, see:
  https://github.com/flatpak/libportal/releases/tag/0.10.0

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../recipes-gnome/libportal/{libportal_0.9.1.bb => libportal_0.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.9.1.bb b/meta/recipes-gnome/libportal/libportal_0.10.0.bb
similarity index 96%
rename from meta/recipes-gnome/libportal/libportal_0.9.1.bb
rename to meta/recipes-gnome/libportal/libportal_0.10.0.bb
index 59252e2a67bb..4ba56dd44f65 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.10.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "8f5dc8d192f6e31dafe69e35219e3b707bde71ce"
+SRCREV = "c23024018c8eb076549a1517fcb2d7f80d3e2ed5"
 
 inherit meson gi-docgen gobject-introspection vala pkgconfig
 GIDOCGEN_MESON_OPTION = 'docs'

-- 
2.43.0


