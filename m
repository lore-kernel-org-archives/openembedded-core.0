Return-Path: <matt@madison.systems>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3EC2600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:32:14 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id r5so18990468pag.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uYxxExB7cE9CM9QLAd484sFf+vZli477plZBJqGAYc8=;
	b=ziT3AyLAxJKbmzMiSSe4aVOEUxxrnH47Ky7ac67y3WwTyP2LrilaapX8Wt6Yu/OLWl
	csbEEA/EVZmbVzbGRDzLehdplqTQxX1x5Au4eVMUqvRfg/qjNFRsmsIK+aMMBT2UgnEC
	+IH7YxinmRkje6tcnVnFjDdChhedfB7BegRq/06gURqQdHcaJWhjtQRt2U1R6nqRjUYs
	kjBh3NTPWDkQsfyg7oFlsu9Z3fddATNl3H95PbS8ECKKsQ08LgUPsx7Dowmp1E+K8w0z
	fI1vKLjh20zKSh0fOiM0qwaAhtXX8rPZgACAP3DteXXkAIrwNZw+Qyz/Z7TTICxHbL26
	8pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uYxxExB7cE9CM9QLAd484sFf+vZli477plZBJqGAYc8=;
	b=krnZWpzaoJ1AJ04Mn+VovkfMsJwIY86ukvj/C9eLFAHfMI+UzuO9uesZC5l/FDo4zl
	Aq9q3XQGkjBnzyZheswbLuv5xTGQUx8h+ZhVW3eZoOKY429BPYt320Kzy4L6yUryKaOF
	dj/DrqbMNaWKSrt0XYRjVxfk+GLNI6P+HBLgJmTtScriVK8ZoXmylfiMiNh4bH6m6XkP
	VT+hztFmTK3/SaezjgTQNCM9yq2GMjZoPmZ+gyXQx9PiqUC+pP5QSqr9jALqaq1NFzOm
	FkPa5vfd6LL0R5+MUhjzZ7JI/bjsLPT6dpDJKlIU5LvEyh1LOhEhaZEGQzCpImSbqQy9
	qWPQ==
X-Gm-Message-State: AOPr4FULx4s6L6ewBzC3baD4LP1Zf/jKmddhN9uYft8nmXSYf5KGMi8SYO1uRoGKrSDO3Q==
X-Received: by 10.66.236.232 with SMTP id ux8mr11338211pac.145.1461760335199; 
	Wed, 27 Apr 2016 05:32:15 -0700 (PDT)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	c190sm6295285pfb.33.2016.04.27.05.32.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 05:32:14 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 05:32:02 -0700
Message-Id: <1461760323-27285-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] image.bbclass: don't expand IMAGE_CMD when setting do_image task
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
X-List-Received-Date: Wed, 27 Apr 2016 12:32:14 -0000

After being vexed with numerous taskhash mismatch errors on my
image builds, I think I hit on the source of the problem - the
value of the do_image_XXXX function reported by bitbake-dumpsig
had fully-expanded values for all of the variables referenced
in the function - so date and time stamps were showing up in
the text of the function.

Fixed this by not expanding the value of IMAGE_CMD during the
generation of the do_iamge_XXXX task.  The vardeps still do
their job for detecting relevant changes.

Matt Madison (1):
  image.bbclass: don't expand IMAGE_CMD when setting do_image task

 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


