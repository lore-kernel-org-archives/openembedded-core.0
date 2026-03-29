Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA33BF3D606
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 13:47:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29767.1774792047208922638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 06:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=ae4Y6iQW;
 spf=pass (domain: essensium.com, ip: 209.85.221.43, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf906b007so284549f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774792045; x=1775396845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBblXOpA0huGRRq6wGnJ6Mxn22bi8b1iR7EjQEwS7cs=;
        b=ae4Y6iQWBzMqWNTwFZi3YFmlPxIuU5vTi8WZf7NXQ76O2N1juse4z+z9IeVWXAm9cN
         JHbXIMxB8u03rNnOsFRBoEX+UqNY+ML08XdkobYDGpPifnIi4fujNMBcJdDzDK+j4fNN
         Q1qJL+fHr84RzdaMZT373y+T1FfdmaqKOYlpC+O8gIURTQ0YkHSbUzQqrcZ4u00qsROD
         +k7S5Seg2SvT0G2v+ULZt7qRIiXNWNJP0MerwzDQjHpTEsnZ0DN5nhAaqxy8PxMmVOq4
         ezGLpB/q4IlxiCISK4paVij4rWu4QtvRGXMuvnRNT84dmgzO4QIxtDoJkrtbev4bHgRp
         eScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774792045; x=1775396845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBblXOpA0huGRRq6wGnJ6Mxn22bi8b1iR7EjQEwS7cs=;
        b=Ygrslk5vTzp4gLTQKdgBB8UW20ax5gCuoQWr8aTlJEFEFutFzCHyU9cnnYf+Nslrjv
         CCGvy/ypkxW0TwE5oG5aDz94GxxyZlqfD6q4y5vnyexBtFuuyXGJhU6ALB/aLk+ouolW
         s1LEQaS+dtPnY/APFapmEO/S/a/yJmPJuUnH+VD7oOotYvqaNK0YoA08kZmbx+1I3hou
         tlmo5I9fq+3VGU3HkoXAGmgbU8vyhepRGiD5YmhGtcPkMwn3Qwq64lFqGm21bWHkP+9r
         hyYY37z3eVU5Fl28GwJpBpoPf0CBoGLMEfIqBcFCmpKVYg1XmVMgfTPRUrEsBrNxTwPZ
         uHGA==
X-Gm-Message-State: AOJu0YyXQwBSs8L9vfVgt6aR7WpQaWl++buAH1F+KBU2QwAKNTdFpGJc
	N/nLHJ39tR+1LlPg0EIg+E6IoqRsUKyubzTQnRGwyK7aemW7fpGgm6g7Ib4j1agbinYH3rL8rLL
	nLJM3
X-Gm-Gg: ATEYQzy7u/Eu0iAJcO87NnoXN1lb3x2aCH9RTKEQ3EcUOyJj01mT7ZGz7wTRFapl1sE
	22S8rXp6jpAa+BK4mxYfc4FJVZfbGal1jP7gysn3X4XiDpfZUxOBQwaLJR/FAIJRAUuQioZF0Fu
	M4k8PBttndI5TjpS9pqILDBF0LrCnseKlXJfxizGmiHULMmcHfhledyPV9MVbHnohmmYqW26BaR
	5zGyVUfMJMmLWy2TjmALc5m5vwJd7wOHP3nUcBuL/1Mc8iQ8lRJHXyYDVgrAoBuBdmu35PgJUDa
	+NHkPMXXZiPYdCLmisB6WgJLRBxBWVclJUNV9oHl89HfMfuY4SDK3ATBKru/asFeyVLkeQeYgEA
	Jtx8BWVVc/CafC0ADsnNYHB959l4/Der+s8rDynCNxNXitLLAZi6crLW4RttHMv/Ng33oqdgNnj
	HC7WwYkGxHEmXZD0wzmhbdTYV96ZzyXL5i3gC+6Hq+drM=
X-Received: by 2002:a5d:68c4:0:b0:43c:f4df:923b with SMTP id ffacd0b85a97d-43cf4dfababmr5655693f8f.50.1774792045227;
        Sun, 29 Mar 2026 06:47:25 -0700 (PDT)
Received: from Jimmy.fritz.box ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm11162908f8f.9.2026.03.29.06.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:47:24 -0700 (PDT)
From: charles-antoine.couret@mind.be
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 0/5 v4] image_types: use IMAGE_FILE_MAXSIZE variable to create fixed partition size
Date: Sun, 29 Mar 2026 15:47:10 +0200
Message-ID: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 13:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234143

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

Details are described in the first patch.

Difference from v3:

* Don't use bashism which fails for Debian derived systems by default
* Improve test checks

Difference from v2:

* Added working and failing tests in meta/lib/oeqa/selftest/cases/imagefeatures.py
* Split commit to send documentation to right mailing list

Difference from v1:

* Added documentation for IMAGE_FILE_MAXSIZE variable
* Added Python function to get the value of this variable from shell functions
otherwise parsing issue can happen
* Added an additional task to check the final result which works for all filesystems
and not only those created with dd command.

Charles-Antoine Couret (5):
  image_types: add python function to get the IMAGE_FILE_MAXSIZE:fstype
    value
  image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
  image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
  image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
  image: add check_image_max_size as post function to check file size
    against IMAGE_FILE_MAXSIZE

 meta/classes-recipe/image.bbclass             | 29 ++++++++++
 meta/classes-recipe/image_types.bbclass       | 43 ++++++++++++---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 53 +++++++++++++++++++
 3 files changed, 117 insertions(+), 8 deletions(-)

-- 
2.53.0


