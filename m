Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id EF05C60069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 05:59:07 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id z128so460871pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 21:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=s8vY0ZRn3yhiY9exq8YJ7mHTm9k9YixFBoznUvb7kl8=;
	b=iNJhzE+MPOa54nPerx/70iciiKlbdK7MDzG74vub2RM7B748uJqc6Yd5/IDDsJDmLh
	dNibrN3kYmSbKHjK93dbd5z5hms5FKaNbzuvDXYrdQyMiJvHXV2xt5hezznu2FnGL4/Y
	KCtvYIkm9cQl0oH/1Fkm3Ob8yVDB2l8AsecatRrj90elRNuulWqnKWLWS1n3c22fMQDC
	c/3+xX/ciFRd7OfACTgR0izT6QdrMSB6hjj465e9KkyU25hI5b2htjz/v8FF2Ix3mJu/
	rhLXOW9z2s/9zGSEU6lXqWFKsbpyKLBW6dpHUdYznQCiTpIlbNQsUVTi+FMnmhJKYwRP
	I14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=s8vY0ZRn3yhiY9exq8YJ7mHTm9k9YixFBoznUvb7kl8=;
	b=An1uC65OywEXouCyKac5uD/6cZiSJYL5vpR71aMDdmmLO4ydxcT59wgdR1z/+ZJUNB
	TVaSY7Q/X1Q/IpY9dwwc6DBRRa4UvVjeoV7N+/dF1q5XOpatx/SqvBEQn46qNGuJIzSG
	EJkbbYMW9pzvd7pwO4VpngxgaLN9TqGIzOz9+U/1RLd2r93DmSzR/1Hr5n7+zDkKOval
	JRmQLu7FKxn1/5sA2XGyAnq2JF/Oe3HLn62lSOtm0YyGW30Z1fMv+/7353YvBEdIQKh+
	Qfymi9F75u9x8leZmCfrzxOefiq9zNmgCbppDOIGSRGEDYAcSgwNLanRWWc8PaN34ND8
	CZeg==
X-Gm-Message-State: AMke39nLSgHklFbQb9CI9S+GEVEl2BtE50J97RE2MF2kbrfgw5KCvQKMAjLo4lSyJsK0lQ==
X-Received: by 10.98.10.216 with SMTP id 85mr23241723pfk.3.1487743148744;
	Tue, 21 Feb 2017 21:59:08 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66])
	by smtp.gmail.com with ESMTPSA id m21sm763555pgh.4.2017.02.21.21.59.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 21:59:08 -0800 (PST)
Date: Wed, 22 Feb 2017 15:58:57 +1000
Message-Id: <20170222055857.2877-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 0/2] glib-2.0 changes for nativesdk and packaging
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
X-List-Received-Date: Wed, 22 Feb 2017 05:59:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series contains two patches. The first fixes up the renaming of
gio-querymodules so that it is only applied to class-target (so that
'nativesdk-gio-query-modules' is not generated). The second change makes
the removal of 'charset.alias' occur for all targets including musl
since it is not packaged by default and not desired in cases that it is
generated.
---
Changes in v2:
 * Rebased on top of current master


Nathan Rossi (2):
  glib-2.0/glib.inc: Only apply MLPREFIX renaming to class-target
  glib-2.0/glib.inc: If 'charset.alias' exists drop it

 meta/recipes-core/glib-2.0/glib.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.11.0

