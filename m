Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60EC06BAAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:40:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g1so7653710wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6zLiXUcutQg3hqWmku/NbatGjza0oveEqEX1CeuIUbc=;
	b=U8/5NFXF4CkZ4Orv72BuDH6y/DYp4+CcSKcl+GchtKQCnjqwnGGdRY/YVATWVEU9+O
	pawHCX+1S4iv2rVGrJMp7G4SjkF5qYsGhm9dz6zdT3wZi+yCrRRcCYy5hmyH0VC+PYF+
	v089oUtz27PuEhlogHI0c/VbI0mL09HtY/okA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6zLiXUcutQg3hqWmku/NbatGjza0oveEqEX1CeuIUbc=;
	b=cj87ZE69C3SMFoicQC8QTrDBy4T7aR4ZZ9HdfbMMJPHuI+KLV/qgLrOsG+LCky+Mr5
	RUa+F7LVpubqy4ggttETZ29KdQorXSf978a8WPpOpdvPTZZ1DKaHJ4mCtSl1QMbnNAGY
	sPnX6iYrN+LPKMYHVOLO6s+xhysAB9a4MTdW/xNjKShXbVaNPkoq2g1yu/2wdv/8+6sy
	GfaU9OfYgLrHs379ubG2ZChk17dIL1SkHzzpRImXDCclqYGoMy26/0wH4jAqqq4BjmUV
	2GAvdgvY6e94quV5TFPeeXMUTq2FO611gECDav0VmX+zOczvc2O1sgO4Xncs+1F+tj9a
	i+ag==
X-Gm-Message-State: APjAAAXF1K9vFHK5FvFIuJjoxXVPHEl/aXqvdWfxMwiqXg5cbT1dQ10m
	2oUP0J5pcTW1Ki7Vs7AI1UCuWO4ZgtI=
X-Google-Smtp-Source: APXvYqwfRzC7vGhQocs6ohPCzhAj0lW+SXxGdTzQlRJ6getDogCu0JJmOLC4FKGXf8sD/fTtzyx3tw==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr157409wmi.31.1580146812812;
	Mon, 27 Jan 2020 09:40:12 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm21488072wrt.1.2020.01.27.09.40.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 09:40:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 17:40:11 +0000
Message-Id: <20200127174011.16243-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] autotools: Give in and force CONFIG_SHELL to bash
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
X-List-Received-Date: Mon, 27 Jan 2020 17:40:12 -0000
Content-Transfer-Encoding: 8bit

At present, CONFIG_SHELL becomes /bin/sh if its bash and /bin/bash if not. This
isn't deterministic and leads to changes in ptest packages which include Makefiles.

At first glance you'd think we'd hardcode to /bin/sh since most system shells are sane.

Sadly the dash vs. bash leads to quoting differences in configure.

The bash default is probably the safest option since configure tries to find bash
and this is what most systems would end up using.

The end result is a more consisent build environment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 3d22ad02557..6c2a33ac72f 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -90,7 +90,7 @@ oe_runconf () {
 	cfgscript=`python3 -c "import os; print(os.path.relpath(os.path.dirname('${CONFIGURE_SCRIPT}'), '.'))"`/$cfgscript_name
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
+		if ! ${CACHED_CONFIGUREVARS} CONFIG_SHELL=/bin/bash $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
 			bbnote "The following config.log files may provide further information."
 			bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
 			bbfatal_log "configure failed"
-- 
2.20.1


