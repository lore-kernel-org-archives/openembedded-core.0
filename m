Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 76E8379322
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 00:06:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d19-v6so3045951pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 17:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i4FZFubAl8mUdHopqOn4T0iMMssQT5lcHaMSCleChXA=;
	b=I1rZhj/qgrVEQvlrpAS0Zex8dlEEDmh7yTH2+00hJq+qq51WgZWXUxKKFbKVk7/49I
	XXTyMliPI1eozzicB2c5cONziHHJlx7YiJl4RdkgJTvIf+jhF9dxapUqL6juPv6893g4
	4QUWyJjXBLelTrI8Dq4kVO5xVYC/AhOHqVfqBRpdZlM8A8gbRxlBb9XyIzKtBrLNt62J
	HOR7JABdEJKiBDzxeUXkUfIr/xy+4Gry0ue5PJvDo8vuhi5OWhECOFqSFxOsc0er+f8+
	zCbD52ZS/mDtPaOb7NouXYBcwcQYjT0GtdrqZRxBOlffAqvBdCEuIZg2WWWu7kR2eis8
	ESfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i4FZFubAl8mUdHopqOn4T0iMMssQT5lcHaMSCleChXA=;
	b=LysaCW87GQ3sMusKakFPWpxT34o0HxV4Gupv8fkCXQHIoAjsdWBV1YB+hNDrMK8+uH
	yXZeXupZTZ9gw1n0UsmWO/A2E9yjLCtXCgY9s4aW/pjwgJU3sDa/aHz8VxK/7XGOj7I+
	fmpDgtDh0lTucfDhWbYSk1CvsghvtTlbhVNLRJuHJ31c/7SVvoPETcuGfBLboAQ+TR4G
	eelQC/AxcHZhsWjnPRDoPrD8qLa6V3Fcu3OXEXGnTTPjJUVnyNwiIoMSuvedAj3nVCn6
	Q1MYz07sL2GHolguREm0PJNuhqFz5WX+BULe0R3kS1npaYJI/Rvfz2q8A7BM6rg3sx9r
	kj3g==
X-Gm-Message-State: APzg51AExbEE5jlTb4a/83lzoELfBwIFWs0YK/l/SRFOnMZThkmPoFlQ
	znqh4vgC6RS05CTJaN2YYyuYHPAd
X-Google-Smtp-Source: ANB0VdZNV+m9KMRGkIAQTb473Mu9Jyix1qjRfKdl9tGXlNpKtvMYmqGh30Z82YmrCH29MTcbDGkiEg==
X-Received: by 2002:a63:e647:: with SMTP id
	p7-v6mr7246268pgj.218.1535587573115; 
	Wed, 29 Aug 2018 17:06:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	x65-v6sm8295727pfk.140.2018.08.29.17.06.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 17:06:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 17:06:02 -0700
Message-Id: <ed1d14d5b20bd6a359b4202751e13cc55869709d.1535587162.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535587162.git.raj.khem@gmail.com>
References: <cover.1535587162.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] glibc-locale: Enable riscv64 and riscv32 in BINARY_LOCALE_ARCHES supported architectures
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
X-List-Received-Date: Thu, 30 Aug 2018 00:06:12 -0000

This support is there using cross-localedef but was not enabled, this
caused the post-install for locales to be emitted which delays the boot
significantly.

emitted postints for locales contain exit 1 which is flagged now and was
causing image generation to fail.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index e50e5cf5e3..1b676dc26e 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -21,13 +21,13 @@ RDEPENDS_localedef += "glibc"
 # to decrease initial boot time and avoid localedef being killed by the OOM
 # killer which used to effectively break i18n on machines with < 128MB RAM.
 
-# default to disabled 
+# default to disabled
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
 ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "1"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64"
+BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
 
 # set "1" to use cross-localedef for locale generation
 # set "0" for qemu emulation of native localedef for locale generation
-- 
2.18.0


