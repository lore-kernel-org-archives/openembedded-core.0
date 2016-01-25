Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 02BB8760A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:36:02 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n5so86051683wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 07:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l073vKMp8Lq4bhCjCNjY+jfCsFfm52OASA/dAbApl58=;
	b=SIvWn+T7IjqlGqQuW0TmQ7lLNjoy5rQ3xr5vjX+2LxOCFPtz5maU7z4/+qUn4OrPXH
	KwWuCfhRgBKdw2yySSgsZQij6GC2jsDf13zpzBmd6/SGg4vL7+U/IV3bM57+Tka3+duP
	TRY1BBHB7pKm3e1Y+zJyPhROXXJxZf5XBKskH1+Seq1BqB/vf/4ExSkJl/fu47VR6oXd
	uZQz10QzfmpS7r+5wmLdPhkw2fQ5vFOtMQhPYiLo/r319f9tV/6y8INocI/MjT90ZVb3
	wy03MMKPxiZL33gYuC+HN90y8+Tjt8bZovyglptjxnaV8GjMWfZyEOtjbbknAqstKvsg
	zrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l073vKMp8Lq4bhCjCNjY+jfCsFfm52OASA/dAbApl58=;
	b=bhitgd2HBKA/bSreGbQEKHWNeuF2okBZ5qwuUHMhpLCZjpt3sd/cwM7m8kiSTFei7v
	r6bP2QBqVYLmut3VpuZk3v9QrFpVkBRCUEsPpJp60bxxEc3Yw/3OVe4KDHTnu+S2ZhVy
	NuwQnnUk9YtOxpucZKuuytNxvGZ/inT0yQuBvRr6SxwJJrFWqZRUwkJ3SyUKU8qDu4oy
	g97MOKaYYli7lF12ckpfDH/g3zWfmqKqu9YYX43PQle604BOmdjXVtux0JSQHhpFTAJS
	yS9ck/XsVQaLAyFdVEUbP8DkMlpdVCCBBFqYGIEEJzQJFNobdbrKo+EaX3pppw3JW3y3
	GSUg==
X-Gm-Message-State: AG10YOTGtU2rn37r9nTDfL/IbWrorImb/k4ao26W8kE1WsfarxL2ejd1Vovp5mafQ/VqlAc+
X-Received: by 10.194.104.38 with SMTP id gb6mr20845486wjb.22.1453736163337;
	Mon, 25 Jan 2016 07:36:03 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w23sm16774624wmd.1.2016.01.25.07.36.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:36:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 15:35:56 +0000
Message-Id: <1453736157-21837-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453736157-21837-1-git-send-email-ross.burton@intel.com>
References: <1453736157-21837-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] uninative: fix path to patchelf-uninative
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
X-List-Received-Date: Mon, 25 Jan 2016 15:36:03 -0000

When uninative was changed to use it's own sysroot the path to patchelf lost
${bindir_native}, so add it back.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 8686159..3383e01 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -42,7 +42,7 @@ python uninative_eventhandler() {
             except Exception as exc:
                 bb.fatal("Unable to download uninative tarball: %s" % str(exc))
 
-        cmd = e.data.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/patchelf-uninative")
+        cmd = e.data.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative")
         try:
             subprocess.check_call(cmd, shell=True)
         except subprocess.CalledProcessError as exc:
-- 
2.6.4


