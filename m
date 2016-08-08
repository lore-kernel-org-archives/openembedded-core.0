Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F54D771A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:39:01 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a101so5823462oic.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JxRvGcRgPuTPNEAyL36ImyiKHY4i8DNUfh2Dbhk5ogU=;
	b=hI0xhlAoEhgQ8kmLjq9HJ8qLj6XWq43eKL79+QhMu3Sfa9N+y1GC8txNT4n4IdNvxL
	/RGghnrdrrh+AWQMpVjfMrzFdMrxEYLsomfBBnXatyw+7qaDqnOnPjLY9f9wbSWV7ye6
	raEsY1ajXrSFaDDnA5LQqvQ+6an0D3K8huGUFRJyzshlC0d1PiVLLSnh4f4h9/JsWajX
	z29Tvsps+n6sU1S3HYibQpWOT4K3a8Zr/jMR6Szc27ERz/WikkytDNBY25osdw77dQTX
	DL7alZCP47seHVngk/yfnI0Cqy/2vGlCVFP8GTmmIZq1IaGskZcO/lL1E/huR8R8dcng
	qzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=JxRvGcRgPuTPNEAyL36ImyiKHY4i8DNUfh2Dbhk5ogU=;
	b=Fzd71eIIXVru9YGw8gmnwM+B0XHTCj+aHPnWkuWd4vY7hwQl+RjHwpaF/hIw5Y7olh
	a2t3F56PkikucrdlfvVKLaqSFuAUJf8ZYSDokzfpYdOFgJvVPYmIPlUJyiKo7SemOyog
	Wh+RihSEiI75cv07iGZaVFo8Q5JOrMOgnr1zPn6IpBlWVpWtvEgkPHiow9uLUCAv7O7J
	gZjN7Njumo5ckpFLwLkIBGRBWzwNZUqco3ojmAHGvudbkKcrvBrLOqKRUGPlg6y+kRbZ
	AkCvoqIVqi3RNbFZotYjb7ckw+Lpv8jmAvxFj5byRGOePRLteincgcdasWquBsaxLXfd
	ltAw==
X-Gm-Message-State: AEkoouv2ZVqZZf3DLrWkK7XZ6o8Ns55fQPcddMv2KPCz20shYK3ajiUy5910YLQ3NVSmCw==
X-Received: by 10.157.52.176 with SMTP id g45mr16434229otc.195.1470674342339; 
	Mon, 08 Aug 2016 09:39:02 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	e195sm12516486oic.21.2016.08.08.09.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:39:01 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 11:37:57 -0500
Message-Id: <d37bec4f77f0670b35347c367371d2cd4887b29a.1470672689.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
Cc: marex@denx.de, trini@konsulko.com, andrew.bradford@kodakalaris.com,
	denys@ti.com
Subject: [PATCH 5/5] uboot-sign: do_concat_dtb(): cd to $B
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
X-List-Received-Date: Mon, 08 Aug 2016 16:39:01 -0000

Prior to running oe_runmake make sure $B is the cwd. This is required
due to bitbake commit 67a7b8b021badc17d8fdf447c250e79d291e75f7
"build: don't use $B as the default cwd for functions".

Without this change, do_concat_dtb fails with:
| ERROR: oe_runmake failed
| make: *** No targets specified and no makefile found.  Stop.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index d56ad8e..3c56db8 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -66,6 +66,7 @@ do_concat_dtb () {
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
 		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
 			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+			cd ${B}
 			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
 			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
-- 
2.8.0


