Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8E58F78376
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 20:29:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b79so2990485pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RFlUmFiLQyNUYA+RPSXN/Q3qr2ZkYfm50TGk8brwOHg=;
	b=PaYDpFZ/ogrHMAJAnILaHyBP/9nVfWRdudUlt5T+h50SagpPgerDX2FXyhLP0kNeqq
	DQ05W8+O+7CdkTBcOBxeSPpgu5w/i/YEwyj90ao6JLR3+BQ9ncrtp2sneBLyilQ5+Qqo
	xbUxUMHLRLHrtEio3jXhg4tOGsHsP/qbm6dcdR+Gq/hDuoUWt0tHUBs+8HqA4+an8w74
	LKUP7HY86OMBTDIDJnzolMug2QtlUqcErbObMOOyg9tjDKWjU4phgxNG9CeSqAkrmn4+
	rwTQPHKlDCLLyQ/7SCnfCMXil9adhvkf99nPz5q624lNrRVm+OaHnrbOD/h2+VF6Qrz9
	kGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RFlUmFiLQyNUYA+RPSXN/Q3qr2ZkYfm50TGk8brwOHg=;
	b=D9h7ILyZI/BMy6OZO/8gyah2mb2yHN9JnCkgYYC47pymxptIz9PUJgpqPdcanehdRS
	zs9K5McCo2kkGTPQSkmyvSsmyXpJAj9MoTaAYkIu2xcq7W+ZIUlGCw1DhfE/jgtEuPrK
	ePhCzgE43BO/y53FXqtUzQi+n9QKfP80OwvuXy1PVYfr05lo+X9VIjh41WQWswzBOK+W
	J2O8bbH/fm6+yAuI1fUop7vWks3KY0sadYPOrHnM9HRI42le3uBPxIpQ6iCzi500rzti
	e50QnlEeLTrsuT/y6VCIbPPO2e0e/0yiJm7h1kJNDZ8Y4CRouFvN1Li/I9ZWVb9q6dwD
	66nw==
X-Gm-Message-State: AMCzsaUdsqYxXEM879Cz/Muz5aPFWAjC2juWmyp91uIBc9xLKbRhRZtU
	L6mUAoQIbw/dN4k+1EfLJorpCg==
X-Google-Smtp-Source: ABhQp+QoXsvH0eUldLzssh/+RtYcW1I5ofGxDRS0sS6+pSEsDXJjxJ+LGHxIGx+GDDwWUcmmy9DVzw==
X-Received: by 10.98.178.22 with SMTP id x22mr8983819pfe.123.1509740969393;
	Fri, 03 Nov 2017 13:29:29 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z127sm11549498pfb.63.2017.11.03.13.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 13:29:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 13:29:20 -0700
Message-Id: <1509740960-11858-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH] libevdev: add libcheck dependency
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
X-List-Received-Date: Fri, 03 Nov 2017 20:29:28 -0000

The libevdev configure script contains an unconditional check for
libcheck. If libcheck is found, libevdev unit tests will be built.

Without a dependency, the presence of libcheck in sysroot is non
deterministic (in morty and earlier) and builds can fail if libcheck
is available during do_configure but not during do_compile.

(In pyro and later, the libcheck dependency is not required to make
libevdev builds deterministic due to recipe specific sysroots).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libevdev/libevdev_1.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.2.bb b/meta/recipes-support/libevdev/libevdev_1.5.2.bb
index c76e1d7..381d252 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.2.bb
@@ -6,6 +6,8 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
                     file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
 
+DEPENDS = "libcheck"
+
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "96ad6edb5ce5c4428f1b183cc180ff8c"
-- 
1.9.1


