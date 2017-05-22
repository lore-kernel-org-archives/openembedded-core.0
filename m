Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E16371AC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 09:30:16 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id y201so100892404qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=UDa3yJBK6DziR+K7BLcxuZjjgAZZiGIlGyJhGNSUzc8=;
	b=WFS0+fXb3lh2qI/iKkojZhF+dvKW99ALGyfPTxyDUgRLem8xS1EUYTCJYYyLk8H9Cm
	iaaqY0qeZseXmaKK1Y4YvQGB+6LWPALbDm1/+PB/iCCvsU7SeEhSs6iyL9GSd+421m3T
	9qjMwoVZk3jbcmiB6jKU+jGZy93a+P/H/LGXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UDa3yJBK6DziR+K7BLcxuZjjgAZZiGIlGyJhGNSUzc8=;
	b=dIG6VsLuLzsPY1xvjsLwoG12uGh2Oyv+ME69QzJZRtjwcying84XqtzlLHxTFqIyGg
	+aVh2UrOacDk7jmG4wVKhtFAk6vG5kpaL6X8S3O083TokzXaHkMtCNuQyFr9lOsGPO85
	TOGSQzvHpYHoXDoRQI1JM9m44BX6fgqLRHJJh1afTKAEpHqMmdfnpr0UO7lXOLm70Dj6
	9BBJXtPipUUQFaoBXtCj9ItFpE4qLyl1qy5+VrALN6kuKq82An1RdVnP+G2MY0wk7Gdm
	6ZMlVvt81HH80htahjrFAMEgUJV3y1M6mIP3g6EILnT70+ovOyWkBnkGiu/6EFuWm2CP
	5TZA==
X-Gm-Message-State: AODbwcDOPwPpC5pKvDh+bvTJ5tEImFn4YBNyem9J++l1mSetHAzVLEM2
	gqk6LBihF0c6TzZyVPz/JA==
X-Received: by 10.55.64.133 with SMTP id n127mr6239163qka.145.1495445417536;
	Mon, 22 May 2017 02:30:17 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	n17sm11667604qtb.6.2017.05.22.02.30.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 May 2017 02:30:16 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 11:30:00 +0200
Message-Id: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 0/3] [RFC] Add support for 'fastboot images'
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
X-List-Received-Date: Mon, 22 May 2017 09:30:16 -0000

Many devices come with 'Android' bootloader that implements fastboot
protocol. This protocol was also added in uboot. This series tries to
make (Android) fastboot image a first class citizen in OE core. While
the fastboot protocol initially came from Android, it is not specific
to Android, and can be used with any standard Linux system as well.

More information abot the fastboot sparse image can be found at [1].

Such support already exists in meta-android, but I thought it would
make sense to move that into OE core, given that it allows any OE
users to reuse this mechanism directly. At least, I wanted to have a
discussion about it and gather others feedback!

[1] http://www.2net.co.uk/tutorial/android-sparse-image-format

Nicolas Dechesne (3):
  android-tools: import from meta-oe
  image_types: oe_mkext234fs: add arguments to customize output file
    extension
  image_types: add support for 'fastboot' image type

 meta/classes/image_types.bbclass                   |  24 ++-
 .../android-tools-conf/android-gadget-setup        |  25 +++
 .../android-tools/android-tools-conf_1.0.bb        |  13 ++
 .../android-tools/android-tools/.gitignore         |  57 +++++++
 .../android-tools/android-tools/adb.mk             |  72 +++++++++
 .../android-tools/android-tools/adbd.mk            | 163 ++++++++++++++++++++
 .../android-tools/android-tools/ext4_utils.mk      | 103 +++++++++++++
 .../android-tools/android-tools/fastboot.mk        |  89 +++++++++++
 .../android-tools/android-tools/mkbootimg.mk       |  29 ++++
 .../android-tools/android-tools_5.1.1.r37.bb       | 168 +++++++++++++++++++++
 10 files changed, 736 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
 create mode 100644 meta/recipes-devtools/android-tools/android-tools-conf_1.0.bb
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/.gitignore
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/adb.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/adbd.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/ext4_utils.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/fastboot.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools/mkbootimg.mk
 create mode 100644 meta/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb

-- 
2.11.0


