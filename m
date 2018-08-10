Return-Path: <ptsneves@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7CC78EF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 19:38:11 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id g6-v6so7323025lfb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=oT6We97/aGTpsse6ci1gnxbeQb4UrJnVQFC+fKhkTY8cVAlTvGGLp4ceFPtg+YBNhS
	IVYTfgE4BHvkywAc1Rb7P/PP+1uw1mKLwVq/bTGRZ7ZYuCsvqKD+Far5PT+OMxyS0R/9
	LDtZUHoQKglDY8HdIqk+0SDt0zbnTLXFHkFA+YmE2YjowYBFGCyMAxIEGoqOR6EOGEw+
	NjqUQNmX9uEFOryEE4t0mjyo/VqddIt4Pj8/+MKcHCx9tMbvVl7MrajDUpSh0vj2xhLe
	iI0F5opxFAsUlNwHPTHBE/kLoPddoONbtzhguG0t4A1CZ0GRWbjcq1L9sYXzEhgU9EG5
	ETjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NTXCf36cbNikNEvEmxbPDEf7j0f34wmMsm3Jvu0nq84=;
	b=T6khMcvu5LU92x3Cby8cEkfPekLo89iZPLyemVn6vDXa/MsuN61MtBlXwYYx0q1gl8
	x+xRdUzF0xyTfbmaLuqqVkBVWhSP1XDcBFHKuNQp2KZrl5CxpK0INBc5Ugk1A3LPQR0u
	FtaHmSqjtaRuJwgWKbJNHSyB9RDzGOIg21Cq8AJKB2gvGfSPArJHfqi8OJvykWysiL3P
	Y2+GJ0NmbI5vmQO1km6OFWmj9znaxAcFsjFeKrMQemyMeyXjbyWP2JYaMS2ZJ58K+/fG
	OzXz3N6QJITFt55Xtu2Lwd13f0uR/eBc+NXiAZHtV8J+3tBaehqemKf651uhlSVwqwns
	4omw==
X-Gm-Message-State: AOUpUlHEjO02pN/duWWEfUHsvwTL6syOX9F/tgs/GqU3DrYOhIFeXnyl
	jwiHh8K7EU8sJpHjdK0+BJ5p+IjFJYFm
X-Google-Smtp-Source: AA+uWPyDKvwblvRojtCkf3+KgxgB3YxPa4tIPDL9gb/PTrA8Edgt18564OZTlZgiyNA63FazxpwEoA==
X-Received: by 2002:a19:eac1:: with SMTP id
	y62-v6mr5462650lfi.138.1533929891725; 
	Fri, 10 Aug 2018 12:38:11 -0700 (PDT)
Received: from pneves-XPS-15-9550.home ([78.8.180.157])
	by smtp.gmail.com with ESMTPSA id
	z7-v6sm1972460lfg.89.2018.08.10.12.38.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Aug 2018 12:38:10 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 21:37:59 +0200
Message-Id: <1533929879-22972-3-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
References: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
Subject: [meta-oe][PATCH 3/3] masterimage: Check for rootfs path instead of file.
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
X-List-Received-Date: Fri, 10 Aug 2018 19:38:11 -0000

The rootfs might be a directory path or a file path. A
case in point is if the test wants to deploy a rootfs
directly by rsyncing it to the target or even use it
as part of a tftp server.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 26e3870..fb8ab50 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -51,11 +51,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         self.image_fstype = self.get_image_fstype(td)
         self.rootfs = os.path.join(td['DEPLOY_DIR_IMAGE'], td['IMAGE_LINK_NAME'] + '.' + self.image_fstype)
         self.kernel = os.path.join(td['DEPLOY_DIR_IMAGE'], td["KERNEL_IMAGETYPE"] + '-' + td['MACHINE'] + '.bin')
-        if not os.path.isfile(self.rootfs):
-            # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
-            # the same as the config with which the image was build, ie
-            # you bitbake core-image-sato with IMAGE_FSTYPES += "tar.gz"
-            # and your autobuilder overwrites the config, adds the test bits and runs bitbake core-image-sato -c testimage
+        if not os.path.exists(self.rootfs):
             bb.fatal("No rootfs found. Did you build the image ?\n"  \
               "If yes, did you build it with IMAGE_FSTYPES += \"{}\" ?"  \
               "\nExpected path: {}".format(" ".join(self.supported_image_fstypes), self.rootfs))
-- 
2.7.4


