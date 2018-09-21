Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id CEE2C7988E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 06:24:42 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i26-v6so5490622pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=xOc1IDBB2vYVBs/SuZPsYFOSStRt1ByURFAFW3w7GB8=;
	b=c2JD7xZO+sDZn6H7cGjlDmmFzZc/daes0LkWpmrd51voi6troRFIPd5e46HSnEqhY4
	heydewS35ru7b2+ng3Z9N1ZyJ0lnqYCTVJXfuoCL6zG762dxHi1UtrsdGhK424rY3MYn
	0GmW1pFvGsut57dlftEYmvwnMH0rC/we4UVJqtqTSb7LeOGgovaeMrHqPrI59DFPwKHM
	vdF7lXWu5q5eVrnH0xe0EIVHHwQVcK8sl71DxlwOI01YLgnrj14LMl1HtprZW/OsPApN
	c6OaiGCUUsIpdwsZv/853DCK6gfs0z6JupV2ec2UV78aIYdmMXJm2wgINjQ09dk4vxgX
	6/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=xOc1IDBB2vYVBs/SuZPsYFOSStRt1ByURFAFW3w7GB8=;
	b=ju8kY6sCQVQ6VOKD2mfFu9BQQdsUq3v7MNrAUDzQqLYrXDYe+VQnma3var7yS75TGR
	w4PEClpHgpBFXP4XG4ig1lMYZZi5nTSYAB7dzxXp/GZqLju6bxgGYONMLE63hrkuvUxD
	njBttDzDDB9iyuPzieWWxTsjOkHGDG83qJ7TlLZs4p/ovHLsxotBRlBDALJGr1C6mm1s
	GYWXD2VGLbPnovVKbxbNDPkbKyIhUFZpNavdNzom3cgDsvLBgzRNItPGG+n3W30Xw9Gx
	aZZpeYrnAELEu21KSX8TlhCwC+cDGeORi0q6LtN4ELk1/jEBEAb8ZvWatcaJTDIB6ltz
	gqjg==
X-Gm-Message-State: APzg51Dx0ttcGkaM9jQDd6zzxNAEjq+WrZelbOFbVq//IXysdvHiPWq4
	rjfHLpgAqU2zvIQ0ITiFZ+Be2x6szFM=
X-Google-Smtp-Source: ANB0VdZDJmtFtmZ2YmeA5Jup1iub8QrQJRU+WVfQ+B0IZyCtegmnG5MKVxbt2vg674yto0gNrI4+Sg==
X-Received: by 2002:a62:cac5:: with SMTP id
	y66-v6mr44689143pfk.187.1537511083638; 
	Thu, 20 Sep 2018 23:24:43 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	h124-v6sm4607842pfg.112.2018.09.20.23.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Sep 2018 23:24:43 -0700 (PDT)
Date: Fri, 21 Sep 2018 06:24:32 +0000
Message-Id: <20180921062432.4257-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] libgloss_3.0.0.bb: Ensure ${D}${libdir} exists installing content
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
X-List-Received-Date: Fri, 21 Sep 2018 06:24:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Some targets do not populate any content into libdir, so make sure it is
created before attempting to move files/directories into it.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/newlib/libgloss_3.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core/newlib/libgloss_3.0.0.bb
index e412153dab..c9ed30d988 100644
--- a/meta/recipes-core/newlib/libgloss_3.0.0.bb
+++ b/meta/recipes-core/newlib/libgloss_3.0.0.bb
@@ -18,6 +18,7 @@ do_install_prepend() {
 
 do_install_append() {
 	# Move libs to default directories so they can be picked up later
+	install -d ${D}${libdir}
 	mv -v ${D}${prefix}/${TARGET_SYS}/lib/* ${D}${libdir}
 
 	# Remove original directory
---
2.19.0

