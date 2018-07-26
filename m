Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D16278C61
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:51:34 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id p81-v6so5113304itp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HNhJ0t45e1rEF2xBKYjA9btUl3WrafyIOAo4apQW5nA=;
	b=Paa7pCd39RxolM8KkALYe7SWoJJFfRCdr9FLqoS2Zi1Qh4zN0c9z+M1gsiMG7Bky+D
	VE5bzdBq81PCSqIJ6U7IVp60W3CbwfZJvcgrKO0PYmBWbhSzuOHdbU3u38OBWM6RIoWn
	tMoA+ijKc6lCkqa2JiT0AiaG3he6W6ujzAzPuFeJbXScHe3/gWoBzk9bK5hnybbYkS8S
	jS3yxXQGngIdAMxzYS5/7uU2Of9E6p206eWjZHsOxkGK5mTIjbYwF3Yad2GoauMz2zN5
	F9K4kRLr1AaRi9R2E+uo4QM6FdNxtbfPkx41LdVgO6ae7bTIninhQkRKyqOT9fS4SmEf
	paEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HNhJ0t45e1rEF2xBKYjA9btUl3WrafyIOAo4apQW5nA=;
	b=Cxo2JC3Z+DdPHs9GO5qR0ZDbwe2PtWKTlOaJjupw7RjimCwWs0aGgYH9sbk4iu6Heu
	xod6/UPa20n6bwDbZgO2ctBcnPsV6ilkPNbyA0jBljj20N39TE48XVIAOhY+aVgEUCbN
	47qieviS3fYwk+4sEuYZPNsnaCe0XImG33eZncRLW8V1o0xyvntIQ08J3Wl3b/adluGW
	f+dcLq7tRzRDz3G2bOdDte+gxUdGNwzUr/AlQ5XWdE93nPxralT0DlmANzrfPyCOSDFf
	pP2gBKc+tbYpwcW/ewPlFDqpBIILhB57hCjqTfccIrlDhkJh4aYy3eZLTJ2WMZxanxwb
	9HyA==
X-Gm-Message-State: AOUpUlFuBVEJGQGcfw84ZjlQskcmvLVZSMNwyh4yngGQPcwBjplNFV0o
	6DxOXAcdXsjFntmAj6SA8ZwaD++KaKo=
X-Google-Smtp-Source: AAOMgpdSpyFQjlEyRwiUhZOgylWbJyfL3qZ7dLXZ6CePzQd7Mdq7r2QPVE+reK3jxbFuXK2wOXVonw==
X-Received: by 2002:a02:8952:: with SMTP id
	u18-v6mr4010906jaj.13.1532649095187; 
	Thu, 26 Jul 2018 16:51:35 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm1568533itw.31.2018.07.26.16.51.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jul 2018 16:51:33 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 16:51:22 -0700
Message-Id: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] binutils : enable x86_64-pep for producing EFI binaries on x86/x86-64
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
X-List-Received-Date: Thu, 26 Jul 2018 23:51:34 -0000

On x86 and x86_64 architectures, add the x86_64-pep emulation support
to the linker to enable production of Portable Executables for EFI
binaries.

Enables building the x86-64 EFI variant of the Xen hypervisor.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Changes in v3:

* Use overrides rather than a function to add the configure flags.

I've used a construction that should allow other layers to override a
single variable to provide different extra targets if needed.

* Only make this change for x86 and x86-64.

The linker flag for x86-64 EFI binaries is known: x86_64-pep.
Make this available on both x86-64 and x86, so multiarch is covered.

The linker flag for constructing 32-bit x86 EFI binaries is not known by me,
and is not easily discoverable via inspecting the binutils source or
queries of the internet. 32-bit x86 UEFI appears to be very uncommon.

* No change for the ARM architectures in this patch.

I have no data on what linker flags are required for EFI on ARM,
and again I'm drawing a blank via source inspection and internet
query. If additional lines for arm and aarch64 are added later,
they will fit well with the structure added by this patch.

The ARM64 build of the Xen hypervisor does not need additional toolchain
support for construction an EFI image as its PE/COFF header is coded in
assembly.

* Using gmail 'From'/'Author' address as it is preferred for contact.
  S-o-b address as provided is required for attribution. Unchanged from v2.

 meta/recipes-devtools/binutils/binutils.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 37813dd..9f06d94 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -74,12 +74,17 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --enable-deterministic-archives \
                 --enable-plugins \
                 ${LDGOLD} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
+                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
+                ${ENABLE_EXTRA_TARGETS}"
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
 LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
+ARCH_EFI_EMULATION_x86-64 = "x86_64-pep"
+ARCH_EFI_EMULATION_x86 = "x86_64-pep"
+ENABLE_EXTRA_TARGETS ?= "--enable-targets=${ARCH_EFI_EMULATION}"
+
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
 
-- 
2.7.4


