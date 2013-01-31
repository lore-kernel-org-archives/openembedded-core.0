Received: from mail-qa0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <geiseri@geiseri.com>) id 1U0sZt-0007km-OA
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 12:45:19 +0100
Received: by mail-qa0-f43.google.com with SMTP id dx4so935182qab.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 03:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=inq8CGySI2iP8HrlQLhcrlESN4dzZVWi7deMSOSCoPI=;
	b=P3oz442qKaiwJfZBQJ4+na3pNkTbx0UH66RtSEnNHj08npkTAQFUvrSsWQ3e7uKIAi
	s7ksUISR97uLYANbMvQ7KGDyLDc3cE7Zn4qRn7fWapKtko99VaEQJyj8IMXH4v7fU/f3
	Kp+gsWFy3aGObPLSeRmS0k5cOVO+ZyzheP+HmaD84ZGhkv4tOIj99026noZvDbfaQCeg
	nyc0/WfztjLDHcxTUCPGpClYV2vWfm4+4UftP8i/PUtYYlIw7Wfbz15axl8KRFqKhsmA
	1uGhZXnZ7ZYwUFYLMeQTDNqFCaXtq7mCLsX3uDGZSU2Ik7NwH64X3z6VHsgJOSgWaST/
	s7Kw==
X-Received: by 10.49.127.238 with SMTP id nj14mr10047523qeb.9.1359631770730;
	Thu, 31 Jan 2013 03:29:30 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPS id dg4sm4072129qab.7.2013.01.31.03.29.29
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 03:29:29 -0800 (PST)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2013 06:30:39 -0500
Message-Id: <1359631839-12941-1-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm8BwjK/NC5drFejJT8VuInizZsHcSOKTfYhYi+OnsQkmiYBfibrUJ9+gvIBofehnSchEld
Subject: [PATCH v3] mesa-dri: add extra dri drivers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 11:45:19 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

 * By default enable only swrast.  This needs to
   be here or for some reason qemuarm tries to
   detect the intel dri libraries and fails.
 * For x86 and x86-64 clear out the field so mesa
   enabled all of the modules.

 builds properly with qemux86 qemuarm and qemux86-64

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 1f6ec78..7d11dac 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -1,12 +1,12 @@
 DEPENDS += "libdrm expat udev"
 X11_DEPS += "dri2proto"
 
-DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86 = ",i915,i965"
-DRIDRIVERS_append_x86-64 = ",i915,i965"
+DRIDRIVERS = "--with-dri-drivers=swrast"
+DRIDRIVERS_x86 = ""
+DRIDRIVERS_x86-64 = ""
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
-EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--enable-dri ${DRIDRIVERS}"
 EXTRA_OECONF += "--enable-gbm"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
-- 
1.7.9.5



