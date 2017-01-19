Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9C695719BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:02:22 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c85so292298609wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5OVVCYdcqYyKJYgW7soOI95pIcXD+CFUSltknRgDxmM=;
	b=1oAXJWLst3jIgjE0nGGnDSQIIDqN2ooRKW+Zt5I3UfGB9qgP6qyd/pUFD1TQYZP9sG
	ahZVagfTcWL1bWUN0nNDTlJYU0Ikt14UNrVEb8AQe68PCESmCdfJl2rPF2xVfwFb4O25
	1XYiG6vrN5z1Yio5umcfMuwb8ceVzHbSBwcwFMXmebuJNLWJPaoNUBQQWZQCsWnFxnKv
	YtC2nUsr/994mMYF9sljez6Lu+M11NGhYvFtJ2Y+E/8wJ+YgnI03ti/sqxo0PXS66bp7
	GlxTOL34tKmHAUBX/wH7siBC9xk55RgJwDxnM82kesdmT2fj1htTTs0FXmrGdpyPVJkv
	U3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5OVVCYdcqYyKJYgW7soOI95pIcXD+CFUSltknRgDxmM=;
	b=I1ODuorO+Cre66wZxGSYdx2AnZ6fuVM3Rzk07EOi3wNe3m18/pi4sBfqcMzqukS3uW
	/7Ur61Pfok1zCu9lWN6DWzyVPeASJo7wkWraO507sw2wbMP1MMTqF/luX2UA5BJwnf6/
	Ep73ZeYvs0coTba/MX3Cwb7AoBTAclabjycRVTOu84O+6Unkq1Ru27UvdAR6MktYmD+K
	HLPZvDDkjNssKMzcDfmNfJA/jFkfVTu+AKJ7srkvLEQ7F2iVMlGalvbmOVB3npHUtVpm
	mhR/lFpqL22877vFg50yqNNvnfPV8tTuYp011d4Xg2J2ubu1KDEBVxMSuBl8bubFwaQK
	oWZQ==
X-Gm-Message-State: AIkVDXKwxb71wAB62PXEcgCAwV2Dsk/1NLhhHA0bJjzAw4lb0S04FzQqxrGIMKM9ErpwVw==
X-Received: by 10.28.54.195 with SMTP id y64mr23914468wmh.10.1484838142415;
	Thu, 19 Jan 2017 07:02:22 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	o132sm13329243wmo.17.2017.01.19.07.02.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jan 2017 07:02:21 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:01:30 +0100
Message-Id: <1484838091-13265-2-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [PATCH v2 2/3] ccache.bbclass: add trimming tasks
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

These can be use to trim ccache directories to default cache size (1G)
without deleting the whole dirs.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/ccache.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index b6643a1..0bad4d4 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -12,3 +12,20 @@ ccache_init() {
     fi
 }
 do_configure[postfuncs] += "ccache_init"
+
+addtask ccache_trim
+do_ccache_trim[nostamp] = "1"
+do_ccache_trim() {
+    if [ -n "${CCACHE}" -a -d "${CCACHE_DIR}" ]; then
+        ${CCACHE} -M 1G
+        ${CCACHE} -c
+    fi
+}
+
+addtask ccache_trimall after do_ccache_trim
+do_ccache_trimall[recrdeptask] = "do_ccache_trimall do_ccache_trim"
+do_ccache_trimall[recideptask] = "do_${BB_DEFAULT_TASK}"
+do_ccache_trimall[nostamp] = "1"
+do_ccache_trimall() {
+        :
+}
-- 
1.9.1


