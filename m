Return-Path: <joaohf@gmail.com>
X-Greylist: delayed 1304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 May 2014 03:21:41 UTC
Received: from mail-ob0-f170.google.com (unknown [209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id C97D16FC12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 03:21:41 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uy5so11863205obc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 20:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=vTa2VccBtLBZjPfSRTjkckv3vErWrivSnY7oklY1Zmw=;
	b=U0oGVX6aotl77EqcP4xS6hbprwG4WdUTU9paJJ94GK90IR1XurCpFQhd3wMeknXuEF
	d2NA/yfDzaAryALUe+5g5jV/Jc7CoJjWjmtPl11uEN1o6RQdVDEAY4Ta/kQY7zuTJ3VV
	9xyzOl28w1w5geaef2PMKQv1dZHg+xROK5rqAGOMceAAXM8UwI2LuJA/iSxpqziIWKg8
	Iya2Nj0FukL1s3iB8wZgVA49sifDvvenOJy1yZ7Ikc9vgCxy+X4V3xMFhjHCSalLnKaw
	vfTJDyo2fzHRUCDdV9cuD2v6lGxGfBGQGH8jDGh7IsJhrB6KQtp2dTwdvCssVAXmS+m6
	hf5w==
X-Received: by 10.60.81.200 with SMTP id c8mr4264459oey.75.1401332038184;
	Wed, 28 May 2014 19:53:58 -0700 (PDT)
Received: from localhost.localdomain ([201.53.199.239])
	by mx.google.com with ESMTPSA id
	ux1sm37851395obc.28.2014.05.28.19.53.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 19:53:57 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 23:53:50 -0300
Message-Id: <1401332031-23133-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: paul.eggleton@intel.com
Subject: [PATCH] combo-layer: git revlist does't take account about file_filter
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
X-List-Received-Date: Thu, 29 May 2014 03:21:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This fixes a combo-layer behaviour that I found using this .conf:

[meta-intel]
src_uri = git://git.yoctoproject.org/meta-intel
local_repo_dir = /home/joaohf/jhf/opensource/meta/meta-intel
dest_dir = .
branch = daisy
last_revision =
file_filter = conf common meta-crownbay

The first time that I run, everything was Ok. But the second time was a mess.

combo-layer took the wrongly last_revision and was trying to use it to
compute its revlist.

The patch fix the 'git rev-list' command passing file_filter that
'git format-patch' uses.

I don't know if my assumptions are correct but 'git rev-list' really needs to
take account about file_filter too.

João Henrique Ferreira de Freitas (1):
  combo-layer: fix revlist taking into account file_filter

 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


