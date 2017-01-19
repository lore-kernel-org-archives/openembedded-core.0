Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CDD15719BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:02:21 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id c206so81535956wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TTfehFJtHp2na4pJrVgu94C8KVH2MXdWPXLG+Fm5exQ=;
	b=TBpLzk3V9RNHu1ZxDFwTsAgC2m+19/XJQ/dMHn42nmzZ8LogYhxa17Q047Uigox2gg
	I2M2CAnMiYKeg4dQfilOCdAugNOiNkx4QaiprRt5TQXHzEMyBWdrmvMadcuPImrki7d7
	s/zXoGWZ2vyXGkHAQiHcVINYu8FrBvEQCypmjaShM3QpkZ5XfxHd6ao0QZfaqO5hCMda
	JInpz1zBtb6I56m9s/mDuw+kuGlYTvvYlLU74KRqFIPd/0Xo9hf6P020RvxH79vHykd2
	h8I/Bgx1LU2Ce3PrAG0+l8dvhqg3KePzdVmpRBncn5g7ZeZGQiMSmcQCfwILWjQE8+0c
	nT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TTfehFJtHp2na4pJrVgu94C8KVH2MXdWPXLG+Fm5exQ=;
	b=MgaXpe2Yu8AUqv9hkFXFXlkMD9m/fL5jCD4sjGKXQW9UIS0ho22ch1FtcGoZFw29bT
	+HVEVjrY2g4W4/Ph3liyDY5R1h1N1LGQSz6kMyIQBZZVl+r4X44imS3iZZpPF+4B7qK7
	NkVemAwuNgByv5B+QZiGfOA++0pzDd1Y61gKyCofVtoYGHE7qsZhqf3Wql1DmawMzLPB
	1Je+yRzc3ko0+W1CbFcxHkNo1ewKkov4ZHpOGRXLoz+x7Yw2a+SKOxRIslww/8EkfvZ1
	Ni8Scsr0XxNmjZ2tayg3JuJg2iKVcbLh/rJ18Lr4zJTm9nQuDd4KKXdjNS2lxM8t8GkH
	gvvQ==
X-Gm-Message-State: AIkVDXIaQOFRNpEWXHgFyl4i0DWkuet0IYfy2ZoKhYPpVzhAEPcKX0Rq4nulwc/t9SiLSw==
X-Received: by 10.223.174.199 with SMTP id y65mr9517725wrc.19.1484838141141;
	Thu, 19 Jan 2017 07:02:21 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	o132sm13329243wmo.17.2017.01.19.07.02.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jan 2017 07:02:20 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:01:29 +0100
Message-Id: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 1/3] ccache.bbclass: enable max size setup for ccache dir
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
X-List-Received-Date: Thu, 19 Jan 2017 15:02:22 -0000

ccache directories are limited to 1G by default.
This patch enables the configuration of their limits, and as default
location is TMPDIR, it proposes a size limit to "0" (unlimited).

The setup can be overloaded in local.conf by setting
CCACHE_MAX_SIZE to a custom value if needed.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/ccache.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 93fcaca..b6643a1 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,6 +1,14 @@
 CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
+CCACHE_MAX_SIZE ?= "0"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
 do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
+
+ccache_init() {
+    if [ -n "${CCACHE}" ]; then
+        ${CCACHE} -M ${CCACHE_MAX_SIZE}
+    fi
+}
+do_configure[postfuncs] += "ccache_init"
-- 
1.9.1


