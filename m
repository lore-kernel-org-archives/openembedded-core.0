Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 696357F8A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 04:03:20 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id t17so11458609ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2019 20:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RhYuX6jW+0cEwzZTEIbG+4SgH0xEXrooLk9aviqBStk=;
	b=Ty/F31l7LwvuyMQj1XPZoP4mQIgIa9yKlTwxau8llxQLYJvMXB5TZuf6fP80FHoeJL
	Ou9CUAz6HgSifj3/ZBmMl3BkAq2S5HDq7Iv7T7Evyua96UJmqrHAOZUn9npsWeecIwFR
	398hnePulqpRWZq6veUc+HwVy6EjshW3VFq+sOE20j4kr4eMViVLXAj+OaXJQnzXl0/4
	fH2w+vwJog8FLXpGJAfipHNFOeF7tUD4gqSq3gQok8Md8M1gJPZ5uUZvI6mt7OZU1cef
	3bU0ZhApKutCOkg6fF89b7Or7dhOPzvlT3Aw6fGmnhTg14uZ1X73Db/YSTEbTXj2EYWi
	Zm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RhYuX6jW+0cEwzZTEIbG+4SgH0xEXrooLk9aviqBStk=;
	b=SQdqpQUfzSCCA+OzdP1h7UTotjNXtla9H+kXrw8ltTxk497I6vjf/WH04gNu0oH1Nb
	Z2zGYnEn6RK535wE1NjGXkm1cbAprKlqxpdDhugcPgSzsLzwkLgxPtqIiTrwLVyYLKg/
	YLLJxj013fwaWwc2/iLKRUKuTErvbVthC0q8uYXCKFj77AAcSnIlp8vNPNyqR5U6DJtw
	baSbH/Gp/fHJFVswyYlrrJa7TFmk3xwac1RoAN2uD4uS32jSkrMNb/kwqBQzZ80c/+Zb
	4G3K4PCi6rwsq0/ZWVSFV0aMrmSzXgCkAMFIz8D/kF3R/N5a6Mw5cy590eNRAETCvld3
	sW2w==
X-Gm-Message-State: APjAAAVVvTNXmOJCUzvyzBup+PVpWt2kxcBvHHiD+UebJzqZuGalboFI
	tY7xhMbhuiUSY+PCN/vvJVz3rkrNaTI=
X-Google-Smtp-Source: APXvYqzjnBRoltMxDpKhywVOxG+KGEUAor0+sVnGBX3jhNrC4anS58jjumz6g/kE7lDxaSxZsq5NkA==
X-Received: by 2002:a92:ce85:: with SMTP id r5mr26710785ilo.301.1575864201155; 
	Sun, 08 Dec 2019 20:03:21 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v21sm3465649ios.69.2019.12.08.20.03.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 20:03:20 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 22:03:10 -0600
Message-Id: <20191209040312.3475750-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Build libjpeg-turbo reproducibly
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
X-List-Received-Date: Mon, 09 Dec 2019 04:03:20 -0000
Content-Transfer-Encoding: 8bit

Apply patches to nasm that allow changing the debug prefix in generated
output files, then use this option to make sure libjpeg-turbo builds
reproducibly.

Joshua Watt (2):
  nasm: Add debug-prefix-map option
  libjpeg-turbo: Build reproducibly

 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   | 117 +++++++
 .../0002-Add-debug-prefix-map-option.patch    | 325 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |   2 +
 .../jpeg/libjpeg-turbo_2.0.3.bb               |   2 +
 4 files changed, 446 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch

-- 
2.23.0


