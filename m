Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D2EB96004E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 16:44:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 26so991187wmk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EaVa+fvY6Pnu19px7zYQBOoWvTZIBuX9XWxv1E2GPnE=;
	b=ZU6ephv1pBMa3fWmdTgPL+l8bx+bqTek3G+YVKGABoiJ1DTZs+IGPuBw8uYKXXWRdI
	NantOyLkuwDM/cyr9+OiyIMRM1AATBUgzgCusD6rJKsILBwvmhav8jHvbBW2ocPZYylQ
	RMHXRHkq4L66ZQKOvgTU7JL9OVYJ1HNAv57C4JXFKq19sIDLU7TKauErq288pm7wpHoj
	xXDoiRqU9VQeiWLKTgs095LznHn66Lg3hMGLYt6JWauw9of8lLESamDGqpZS3W62XDNk
	JmQuEkjCXMQXgm9gSt8XDNWalBggJD/jG8mA6Bj40thpXBV+UH2hE6JxnXcRE33GoYjm
	+Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EaVa+fvY6Pnu19px7zYQBOoWvTZIBuX9XWxv1E2GPnE=;
	b=NpxA0a0f/1ZZ4lDby45GkwsGdGMvkc4FRw5GtZsRWGQtCiPg7ueTZkvg3XjgrREygT
	m3R8LEwgbYIvl5HDm8jETRjARyn4wZqIO8tYvaVPTW21NfjqdNSRuWxnAoz8X0QlWkGq
	hAkIrKHq3kkzKWOYzPT25QQGuy68fj1271jvnlHw7dX4L3BKSYAcjzsNQXcvlHvRIUKC
	elOzDnqL1zdQMeZG8fx0SQq9LEGXpXxXGOUT+nsXNkx/CBAE18Ut0nGJlbQU7VEAwSUN
	9jNfhMPqDhxnHijV7J7XDuBiOAd18njJ6j21MS7JUPu7KKq2jTA7GrzE0psJBfZABX7S
	LqQQ==
X-Gm-Message-State: ANhLgQ3MersDjgkhwVkM1Cc7aj5i4ryBlsyVhm6oy4nXMg63pCQVylGI
	PvMIj+s/Ovj/SrWk4oICP+mWAg==
X-Google-Smtp-Source: ADFU+vtLLpKAA44ayGBndWwRsbs6KuDBpWpZ5rHKoqVFKqKnOaszgtZu3Mbo2lW3gVAuQ9tiAAFCSA==
X-Received: by 2002:a05:600c:2210:: with SMTP id
	z16mr3927744wml.38.1584636259130; 
	Thu, 19 Mar 2020 09:44:19 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
	[2.15.156.232]) by smtp.gmail.com with ESMTPSA id
	b82sm3741970wmb.46.2020.03.19.09.44.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 09:44:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Date: Thu, 19 Mar 2020 17:44:01 +0100
Message-Id: <20200319164403.29605-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/2] image.bbclass: support two-stage deployment of image artifacts
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
X-List-Received-Date: Thu, 19 Mar 2020 16:44:19 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a follow-up to the discussion I started on the OE-core mailing
list a couple days ago[1]. These patches propose to split the deployment
of image artifacts into two stages where the first one includes all
"regular" images and takes place before do_image_complete and the second
is mostly aimed at wic right now and happens after do_image_complete.

These patches work but I'm sending them as RFC mostly to continue the
discussion about possible solutions for the circular dependencies between
the rootfs and initramfs.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2020-March/294094.html

Bartosz Golaszewski (2):
  image.bbclass: add an intermediate deploy task
  image.bbclass: deploy artifacts in two stages

 meta/classes/image.bbclass                    | 54 ++++++++++++++-----
 meta/classes/image_types.bbclass              |  3 ++
 meta/classes/image_types_wic.bbclass          |  4 +-
 .../images/build-appliance-image_15.0.0.bb    |  2 +-
 4 files changed, 47 insertions(+), 16 deletions(-)

-- 
2.19.1


