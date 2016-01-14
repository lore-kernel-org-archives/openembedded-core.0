Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 47678731C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:17:34 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id 6so414811046qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=H3gMfhQiE9iiXpe4FXQN35D/OZllP/7tIy8Xydo+xjs=;
	b=gsooeRVJuDIDyq5g59uuf3S2Z9dYqEU46RTEIfBFw5CzKSLFyIcn/ojYXG9ndz+dnx
	U7wSv6q+yyUatqxgcBfx+LkezrZe0/ynS72SNsONH1/6C3WeHoVUyqXl4LItzoSlm55R
	ht8wmCAkczzPEBHsrM4y8zpbl+kwXRHiKKwlx8LhK3VHZe07+k2SX2fvK11f4ve5mk4q
	hwZjn+JHMzNMbh7+pRk79C/XC1b5IFUO1pnr8DkdYulhW0BMLmHOgjhaQ58zmmFOudNB
	wtxxnpwk3iSLuJ81Sb3BwUIHK7xz499roZLpEDhZfrHaO+vXrEgMXqhqI1HAkadQZfDm
	z6Aw==
X-Gm-Message-State: ALoCoQndI6ABcljn9Qn5Ujf5Jk8jLZr9oUj5zGu2MzkPLChS9FGVT9k0oqblVayyTATsEFjevtVGTlGooQjuVIMYg/ZpukG4mA==
X-Received: by 10.141.5.213 with SMTP id h204mr9437467qhd.43.1452806255362;
	Thu, 14 Jan 2016 13:17:35 -0800 (PST)
Received: from localhost (187-5-147-27.bnut3700.dsl.brasiltelecom.net.br.
	[187.5.147.27]) by smtp.gmail.com with ESMTPSA id
	c34sm3206218qgc.14.2016.01.14.13.17.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jan 2016 13:17:33 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 14 Jan 2016 19:17:10 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 19:17:08 -0200
Message-Id: <1452806228-23095-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.0
Organization: O.S. Systems Software LTDA.
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] image.bbclass: Handle image base type dependency properly
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
X-List-Received-Date: Thu, 14 Jan 2016 21:17:35 -0000

When a base image type has an implicit dependency (from IMAGE_TYPEDEP)
this has to be taken into account. This is a regression introduced by
OE-Core:c2dab18 (image: Create separate tasks for rootfs construction).

The issue has been found when building meta-fsl-arm based images which
does not include the rootfs image type explicitly in IMAGE_FSTYPES but
instead is added, using IMAGE_TYPEDEP, for the 'sdcard.gz' image.

Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 48505c8..657f9bf 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -334,6 +334,9 @@ python () {
             _add_type(dep)
             basedep = _image_base_type(dep)
             typedeps[baset].add(basedep)
+
+        if baset != t:
+            _add_type(baset)
         
     for t in alltypes[:]:
         _add_type(t)
-- 
2.7.0


