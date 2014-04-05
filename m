Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 49E186B181
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 02:14:21 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id f73so3885553yha.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 19:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=jvclq24MtZMPZI9kTMNz1fiT5vbQQEba4LrZGcTvuIc=;
	b=qXIwEqb3Btzr5NYTQU4aI8mf71WEZtpYCXkNskH02Qp/3S9BHkeDteHfTjyqrhfgBM
	mdhCMUC/dL31FUpZ1NnEfAXSbakof2NlFJqcwfXEAS8VUlI4uaCPSv6kv9oDc84ovv1d
	9oJPS6Fsuta3nyXz0Vh6PL+iSt4Ze0CWTnhbGYUABjmpEaGgxrt0oQ4NWkc4PoDM4vee
	umyuz+BPF6D9Q9ULHbWdzcoV4gXSM6RsmdY2m+UXQKHaSelcAsYYibceRtgP/pb0B7N4
	8wyH1K6fzAovozbBqAJJ5cvGZOGmkYSKoCySE14IppDYSG+Twh8/uX2hB+pM9/dPB1ZC
	QuHg==
X-Received: by 10.236.202.18 with SMTP id c18mr674216yho.117.1396664062422;
	Fri, 04 Apr 2014 19:14:22 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id n5sm18173596yhn.43.2014.04.04.19.14.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 19:14:21 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 23:14:08 -0300
Message-Id: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 0/3] wic: using indirect string to connect images
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
X-List-Received-Date: Sat, 05 Apr 2014 02:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now is possible to pass a image OE name or a rootfs directory.

The command-line param and .wks remains the some.

    wic create ... --rootfs-dir rootfs1=core-image-minimal \
        --rootfs-dir rootfs2=core-image-minimal-dev
    
    .wks:
    
      part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 \
        --label primary --align 1024
    
      part /standby --source rootfs --rootfs-dir="rootfs2" \
        --ondisk sda --fstype=ext3 --label secondary --align 1024

João Henrique Ferreira de Freitas (3):
  wic: Move find_bitbake_env_line() to oe.misc
  wic: add find_artifact() to get a specific bitbake variable
  wic: Extend indirect string connection to support image names and
    rootfs

 scripts/lib/image/engine.py              | 17 -----------------
 scripts/lib/mic/plugins/source/rootfs.py | 27 ++++++++++++++++++++++++---
 scripts/lib/mic/utils/oe/misc.py         | 30 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 20 deletions(-)

-- 
1.8.3.2


