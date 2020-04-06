Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.135.1586192555419862706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 10:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=UsGJWeYW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id g3so348367wrx.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OQbJqggWie38E2OM/mMDu9R7XpcBSOK5ybAKfgFvkmQ=;
        b=UsGJWeYWluqjsC3hlXp6ZrD2YE43ShfJJn5dKjOjaGs/jEEjlvgOxzMNIqMBnJyO+m
         8pvXfoNTvq315CvapgDYnndEIXm3S7ZisWxY4h5764zH2XxxiyW/RPvE2oubMNJnp2r1
         QZt70kVCLWoRC8g2ne7UP/q9/3m0Y0WpiIuq6gQAl1PPe8O2oL3s9PMh37JKAKweVfyX
         vj6t+6B4O92k4Wd8i3NUpx2k6jsLdGtqV1QR4e4I5H3/lkUJXasKrR8pVg7xNk6qQS2Q
         3p47jkQuVfpcVOJbj7RS7OTK13f+GSmNTbDXtDbH7LHJy9PGLBTsh179T0Lv8gWXlvkM
         nLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OQbJqggWie38E2OM/mMDu9R7XpcBSOK5ybAKfgFvkmQ=;
        b=Iz4inDMAAeO40rnlu6C1pqVudrF9ZRkklYunkN2ShVsKiDLLWcbvoUt71eO5gOiooT
         lxJeU88Q7lTVCFbOsCDo0aY8S0EVwQt4p5fkFZUAftI0I1kKzR/M6IVV6r/uaIglC9b6
         +n6u4cjYG2fMkbIfkbSRonAO3GS0ZV1t7bR8vU/cCefijuyxfGwT2d80R93CAyOpm3dE
         Xnv5C4u5QaZY+oKBZbPRfFDpy0+7QbhlMQs5KfG6/2yf/R6icdri3RQxcDG3CMt0Sl8w
         7MHO9GJK2o2CTEfcK13PLOqM5iKQz+6tY2oKmGRZCDDOvJeXolXge0ywjj8LhkT5SACN
         qZ+g==
X-Gm-Message-State: AGi0PuY5lgMUF7T4Ru/V/2tTM+l76Hqof1q9AUWn7OyblltgWzIvAkkX
	OHNCqSWgHpXEmz2mt/d2r84wrg==
X-Google-Smtp-Source: APiQypLwLZvt+Y2Zy5tmWIjnUIb2v7YLpW4DIwtPRWE0DYrAonWNxPtjH3uggh+GhPHvsaIm78XAqA==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr184847wrt.246.1586192553895;
        Mon, 06 Apr 2020 10:02:33 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id u17sm30614386wra.63.2020.04.06.10.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 10:02:33 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH v2 0/2] introduce multi-state image deployment
Date: Mon,  6 Apr 2020 19:02:27 +0200
Message-Id: <20200406170229.25363-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Richard et al,

This is another shot at multi-stage image deployment. This time around
I managed to fix the problem with changing task hashes and anonymous
python functions ordering by simply moving the code assigning pre- and
postfuncs for sstate into an even handler invoked right after all
anonymous python code is run. Seems to work fine and there's no need
to deltask do_package anymore.

Just like before: each image task becomes an sstate task and handles
the deployment of the artifacts it generates. Files created by tasks
other than IMAGE_CMD are still deployed by do_image_complete.

The dm-verity problem I'm trying to solve is described here:
    https://lists.openembedded.org/g/openembedded-core/message/136203

Bartosz Golaszewski (2):
  qemuboot.bbclass: don't redefine IMGDEPLOYDIR
  image.bbclass: deploy image artifacts in stages

 meta/classes/image.bbclass    | 17 +++++++++++++++++
 meta/classes/qemuboot.bbclass |  1 -
 meta/classes/sstate.bbclass   |  4 ++++
 3 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.25.0

