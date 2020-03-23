Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.158.1584984493032864793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=F+SB1qsq;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.65, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f65.google.com with SMTP id b2so18098753wrj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEVJd6MWR0iuvMAbnBiBJuoxBz9Eb2dFFdhIq/NHeyo=;
        b=F+SB1qsqyNLyOntTHHbSnp3O0Zr+wITwpJ2bkivmuZJby/zpPx8dl/q5Hx1wCSNxKW
         DINpEpmuYNusP5n/VR5wvIweFFIxTbwAw29epM/qc83ChedCMJfWgDEe5Q3wuHgxFWp6
         lgtOH6qlTJExi77HZyjsaq6LGt1E1Li9+pXDe1ujWpiZDHdT3Po0NAMsR33EaODCmLd3
         x00wfNJ2IIveykKJffgNDYmdrF55hCmALTWnplfAEUd8SfyrgYNFEwS0kQ8BiD66Aj0B
         ZR0yEEr2rdTuwkZDNCbCEcPW0DXQv37bbrFo3PcYjkZcee+hhMT/OFXZBoK3tWuKcqBj
         ldng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fEVJd6MWR0iuvMAbnBiBJuoxBz9Eb2dFFdhIq/NHeyo=;
        b=FCEj+ibmJWJbD0SSH/Pde9nm+KxnTGeaRO0j9wSkwC5uOVXdNmp83mDn2d3ladfgaC
         mXmkGej1z82QM7AD+u1FImpTw+4+KbmILU2Ty5Y4dSmLQQGdD2D8iKqBJv9wDocFBPOT
         3AgDlquuqMXQcCJSte2UyYJ4VM5BFQPv4pGjupMj4uVh+PgiwNwF0NFz2RQEXB08tT41
         gGK1s1Lts4cqHxqm6OpvtL2t4frtryEwCrSwh8obxMu+UWuVQWrNZbohxYQUungzjZ4t
         lCEcxxhjC0PtnzOkqPSr4z7srG+7XbNno/GMwat2b86lljJaKLFBb/VkvEK0mTAHI+Yv
         qgOQ==
X-Gm-Message-State: ANhLgQ1iOUyrvZbdVWc+/opP9tJQZ2wx6yHhQ4sGrjNKmhYIIHFrV2UO
	PWlBHMWGniVP2vooGjbZhAv1Iw==
X-Google-Smtp-Source: ADFU+vsUMf3Gs7GZP8+KFCic9elP1eJG6nV46fuCNUInLe6mHJiYCXZxfgvvt9f+P5BDAv1lQhEQsw==
X-Received: by 2002:adf:f892:: with SMTP id u18mr21911075wrp.367.1584984491646;
        Mon, 23 Mar 2020 10:28:11 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id a16sm303574wmm.20.2020.03.23.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:28:11 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][RFC PATCH 0/2] introduce multi-state image deployment
Date: Mon, 23 Mar 2020 18:28:06 +0100
Message-Id: <20200323172808.26338-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Richard,

please take a look at the following patch series. It's a follow up to
my previous attempt[1] and is also related to the dm-verity problem I
described on the list[2].

This time instead of having hardcoded two stages of deployment for simple
and composed image types, each image task becomes an sstate task and
handles the deployment of the artifacts it generates. Files created by
tasks other than IMAGE_CMD are still deployed by do_image_complete.

I'm tagging this series as RFC but actually the code turned out to be
surprisingly clean and straightforward. Please let me know what you
think.

[1] https://lists.openembedded.org/g/openembedded-core/message/136526
[2] https://lists.openembedded.org/g/openembedded-core/message/136203

Bartosz Golaszewski (2):
  qemuboot.bbclass: don't redefine IMGDEPLOYDIR
  image.bbclass: deploy image artifacts in stages

 meta/classes/image.bbclass    | 26 +++++++++++++++++++++++++-
 meta/classes/qemuboot.bbclass |  1 -
 2 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.19.1

