Return-Path: <jatedev@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 459896B89F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 20:37:47 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id z60so747277qgd.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0KsWuBDcyNSnbcFCdyU55F3ZA6SaCusPhWUDIg66aLY=;
	b=axLypj2XuMRjzDs1mDOYdCY5yqwCmBKhJ5ocUfQbBuzx+EWv6JDP1bd+vWtDG5nnpi
	/DxIyiNPu03FPZHDvKGqZJZYrejouiZZA3iU1P7Sr4njhu57X2EDtW9o93tnjWy3zxS8
	GgFHt8n83CqNjEt91u1WXCymFMGKRfWjYlXiY/xTkfwwNus80033k8z4qMora5CLQkjl
	vPu8bI/YYl+R9yk/rcn/Ui5PuMhXhoM6VCtYyxTTsd/rmPvEk7d0Dh1aZ4v0NWrbpSOq
	vd2C5qIg9/aULH1uB+cTnQ4pqsdStjvj9Apo1dg8e2J579CbCY8yt40EXaOQHAcaZFet
	XkYw==
MIME-Version: 1.0
X-Received: by 10.224.67.131 with SMTP id r3mr17048322qai.75.1396643867941;
	Fri, 04 Apr 2014 13:37:47 -0700 (PDT)
Received: by 10.140.23.234 with HTTP; Fri, 4 Apr 2014 13:37:47 -0700 (PDT)
Date: Fri, 4 Apr 2014 16:37:47 -0400
Message-ID: <CAPphmgb9DTJ+K010b0CaqZM-_DCiOtWj7mhVPzMvArHczbyKLg@mail.gmail.com>
From: Jate S <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH] samba: remove talloc from DEPENDS
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
X-List-Received-Date: Fri, 04 Apr 2014 20:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've only tried this out on dora. There are no other changes, so I
think it should work for newer branches.
----
samba: remove talloc from DEPENDS

Samba has a DEPENDS on talloc, but the recipe runs configure
"--without-libtalloc".

The dependency tree causes a rebuild when using a PREMIRROR sstate
cache. Removing talloc from DEPENDS fixes the problem.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-conn
index 7391bbf..42979c8 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 LICENSE = "GPL-3.0"
-DEPENDS = "readline virtual/libiconv talloc zlib popt"
+DEPENDS = "readline virtual/libiconv zlib popt"

 SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \

