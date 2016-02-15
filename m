Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A190E60291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 16:57:19 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id x1so57092743qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WvKMkQSKL52P2hEsNqlAPSiwo7iCjgYRfeIxUNKblaU=;
	b=Lip/MdKpetmHVIoGRuc47s83tqCTIZwGM1WRx+GNw8iarH/YGgo4DXSfloe+u8/85V
	JOTaVctPGVrUZ0CPPfswra+X6M3bC8whB2F0coKV9X5F526SnyJUWEGCIpeGxukHuLJx
	xiqAfnSE2oCyWCJ2Rk80rMazciUykXgyCByrc8/62AujdGVtrqEW5dpZ4dnYAOmVlUtz
	ScwPp6OfT90o7HI6xt3loZw6Fmundfeub03S+sELFA+9QlWfTJ7tAhyH3R9WZ4MYNvQY
	ytzluAKADpfUgcKu9WgZ6/VXGgH7aeWr5oc/Mu0U1t2oW6BipUneJI5Lw3LinJvSLagu
	PNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WvKMkQSKL52P2hEsNqlAPSiwo7iCjgYRfeIxUNKblaU=;
	b=do+gBONPcYbeSemQpSFSeVdvJIU5h8OT05M08trTD+AKRN0bDxz7nd36+Hokk1VPPk
	+2PJXSDMSUFIDy2e4eTpDNY0skFndZkYDR5Q3udoyQbdnag9m1FWjePtz7diQTIYC3QR
	Vm3KmTjMGnFHqmRtFUqo/FsvNQ+JrXvbPM3zOB3JkIg0xjfUOp2a2wZXIXU4P7Ht2LOR
	Mny6E++AnpHTZAJom+Vic2kLfNn/XvkJ0nnfnrxWDEqbOOiSp4td4KwDWf0QoF/dnpmL
	iMRJ0U0FugT6Wq7Q0tj5V3wYCQhvxTpaX79CYFZSh3/7Hv6s3806qtvJNci1GhzkVCLE
	ZN4w==
X-Gm-Message-State: AG10YOSQnVA7SS582wrrWHGYUFzjRFOUz7ot/buLxXLu/Dwr7o9NsY5EGCHSGJo3HJOSBw==
X-Received: by 10.55.73.85 with SMTP id w82mr21915157qka.52.1455555439942;
	Mon, 15 Feb 2016 08:57:19 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	u10sm11334219qhc.0.2016.02.15.08.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 08:57:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 16:57:14 +0000
Message-Id: <1455555434-43134-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH 2/6 V2] security_flags: Add SECURITY_CFLAGS to TARGET_CC_ARCH for binutils
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
X-List-Received-Date: Mon, 15 Feb 2016 16:57:19 -0000

libtool decides to
filter out -fstack-protector-strong on its own and its documented here

https://www.gnu.org/software/libtool/manual/html_node/Stripped-link-flags.html

this causes linking errors when linking libbfd.so since objects (.o) are
compiled using -fstack-protector-strong so they are expecting to link
with libssp but the option goes missing in linker flags.

With this patch the security flags are hoisted upto CC itself and
libtool thankfully does not touch CC.

Adding to CC also means that we can now remove it from LDFLAGS since
when gcc driver is used to do linking then we have LD = CC and this
option makes to linker cmdline

Since CC is used without CFLAGS in configure tests, some tests fail
complaining that -Olevel is not used while using _FORTIFY_SOURCE
therefore added SELECTED_OPTIMIZATION to TARGET_CC_ARCH as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 235f413..2ba2755 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -103,3 +103,5 @@ SECURITY_LDFLAGS_pn-xf86-video-omap = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
+
+TARGET_CC_ARCH_append_pn-binutils = " ${SECURITY_CFLAGS} ${SELECTED_OPTIMIZATION}"
-- 
2.7.1


