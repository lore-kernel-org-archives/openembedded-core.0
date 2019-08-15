Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 42E547F29D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 05:57:06 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id i2so723714plt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+mXViqYx47wjQl6EKaIq9HCtv4gonR5UTnUh1BDb5O4=;
	b=VBNG5jYWihR51RC/WQgJKX6LmTCaraKYZfEI5VTUcUYP/DTZ4bk/vPcyhLwq99xeze
	vizVwdCuSUJ9LPCACbED2n0wmT4tYXb0b/Un/kZG3/ccew/R1jFYaG/qsRp38f2A7ibe
	DiI2GTot8hcyURGHLPiUcP9s7z1hHre44w3es1zw45VQwACPon0WNH4dfBWLrhJX6Fhh
	U2nfQ4xSQhXe9PdKUm+afh+bWisFBFJOVjhgvdAH4tFAlDyHPhx/5AjZsJL90SAbm/BZ
	gTKlLboGRzWVkgmfvTXI+fL/FGTEJR2/V9ykL57YyMNYbw1stBS/lTa/iUPvIJ1TY/lH
	BDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+mXViqYx47wjQl6EKaIq9HCtv4gonR5UTnUh1BDb5O4=;
	b=r1WsXdhEJSqNyb82t5Ky6+QscUA2fF7CZsarRbgZcMHqu970AJFnsz2nx2wpvxI6AC
	yi9gXhsQYYAE/8Vp73xV0oY6xaoSynR+mKreFTIIYy8+XfZrXk36wrkh5U1HcQ33/7QY
	BZ4Ui/NUdOW9+b7NWqsAVxoPWSCODfXl4vI9LX1QK0jM9ej7+83TKKSDxZVRsKY6VkRO
	U1mroV1n7iwZD2YIUXrhEyVZp4eb5fNkMYZLdPL8EmYFLVqWY4CURjdJWJrXArPwtQ8u
	b/KTnuV2kK2ukZXqh2jGNla4pRvzvhS6NhBfWS5hCAc/TeEdQyPhjsKnWxgfhMbUi/ZV
	q3Xw==
X-Gm-Message-State: APjAAAW4XGDRSgMj1KAryHu2Q8DeVsM1eTms1guVxTAfJjufVwlKmT6k
	ApDCNPKAgE9IMZ9Lvf7XXDzmIXDoxOg=
X-Google-Smtp-Source: APXvYqzyd7R4PWpE+Om2/T3DeDJf3e47GWNu0owDHe1TyVCrISyd3Bc7Hyt70ba2nSvsQXH1Riphtw==
X-Received: by 2002:a17:902:e493:: with SMTP id
	cj19mr2846402plb.292.1565848626865; 
	Wed, 14 Aug 2019 22:57:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a12sm1285396pgv.48.2019.08.14.22.57.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 22:57:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 22:56:55 -0700
Message-Id: <20190815055655.6759-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815055655.6759-1-raj.khem@gmail.com>
References: <20190815055655.6759-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] systemd.bbclass: Limit rm_sysvinit_initddir and rm_systemd_unitdir to target alone
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
X-List-Received-Date: Thu, 15 Aug 2019 05:57:06 -0000
Content-Transfer-Encoding: 8bit

These postfuncs cause native recipes to rebuild when changing system
init provider between sysvinit and systemd. Some of these native recipes
are pretty early in dependency chain ( e.g. util-linux ) which can casue
rebuild of pretty much everything including compiler.

Found with bitbake-diffsigs

Hash for dependent task python/python3_3.7.4.bb:do_prepare_recipe_sysroot:virtual:native:/mnt/a/yoe/sources/openembedded-core/meta/recipes-devt
ools/python/python3_3.7.4.bb changed from 2a45fe0cd0d3640a88c4a5c8b1880c4e9a089cc7446a91d2a920c1cef6fa916a to bc2a0921cce50da1b7be3b59a3d8211ec
2a31262493ffa5909acbb7116fad3bf
    Hash for dependent task util-linux/util-linux_2.34.bb:do_populate_sysroot:virtual:native:/mnt/a/yoe/sources/openembedded-core/meta/recipes-
core/util-linux/util-linux_2.34.bb changed from 15d6e165f025f10c2c455df8a875cafe021eaed4214c793e708d4827a58ca89d to 54e542d5da99cacfc9290ef5d27
9de50bdcb9195f67ae6dfff59fe41d10f7bd2
        Hash for dependent task util-linux/util-linux_2.34.bb:do_install:virtual:native:/mnt/a/yoe/sources/openembedded-core/meta/recipes-core/
util-linux/util-linux_2.34.bb changed from e25b1119ce8dd7ca43fbd2db771e04fa6ff6b9d701fd78ac6c443224b036ed9f to bb5b172a83e7edd272402a9dcd80c4e1
29aa1ecb824c2cfa388086cfed24fef5
            basehash changed from 62df6610eab9c1b1a17d7132943507641c8538690f26186843c86144d4598e64 to 80471f7c0bded9d1b593da69708b0e0f10882db08
5e1bf769edb3018e6c744d0
            Variable rm_sysvinit_initddir value changed:
            @@ -11,4 +11,4 @@
                         shutil.rmtree(sysv_initddir)

             DISTRO_FEATURES{systemd} = Unset
            -DISTRO_FEATURES{sysvinit} = Set
            +DISTRO_FEATURES{sysvinit} = Unset

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase

 meta/classes/systemd.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index d1cb17dc8d..747055b8fa 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -214,7 +214,6 @@ python rm_systemd_unitdir (){
         if (os.path.exists(systemd_libdir) and not os.listdir(systemd_libdir)):
             os.rmdir(systemd_libdir)
 }
-do_install[postfuncs] += "rm_systemd_unitdir "
 
 python rm_sysvinit_initddir (){
     import shutil
@@ -229,4 +228,8 @@ python rm_sysvinit_initddir (){
         if (os.path.exists(systemd_system_unitdir) and os.listdir(systemd_system_unitdir)):
             shutil.rmtree(sysv_initddir)
 }
-do_install[postfuncs] += "rm_sysvinit_initddir "
+
+do_install[postfuncs] += "${RMINITDIR} "
+RMINITDIR_class-target = " rm_sysvinit_initddir rm_systemd_unitdir "
+RMINITDIR = ""
+
-- 
2.22.0


