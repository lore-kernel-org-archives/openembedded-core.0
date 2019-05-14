Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 370947DED6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 12:26:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f204so2678650wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 05:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q2IM6Sb2wy2ahaVRW3NsNmm7HaIaiJHxg/nghv3KBqo=;
	b=QGmkOUO0nMSaG0ECMIEGzy7lXNNmmU9SaejIZpPsKNwn431Ak/1g1InP44G9LYqiSY
	omBCyKKzgFeQbd6kbU3BD6S1qSKEbis3ePREWmFW2Xa6pbw74SsB+4vwCY9hW8k8mHaW
	pEWJAG+N0TBlIOuC4VS0KUq4N8SdBATV6aWdV98rKDd+iAJ4pL1K84jVrej+GPh5pxU6
	JywStRzuvgh6X+f+eBqezaLrzJrtHptzhq2zSuSJqS8JOsxwZtszE/GhKiezuufw4QfJ
	yTQpozrMuxBxBqupJyJVmdwDdYabu+4K8dZ92tNM04obhC4Izk/bNf/Emv0N8zvigEBq
	Zqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q2IM6Sb2wy2ahaVRW3NsNmm7HaIaiJHxg/nghv3KBqo=;
	b=jwuwgndHWnsbRcXG2ZzI+EkBMREWFXQKmJfDbKgb4KwrreFEPg78LFbATkTo9F+Omr
	6Y3aJDi83d9+aa7znhEvl30Zo8PvCT+XcMWrTJmWiNDL+jk1dZMUmiiqGvsriPYUmw2h
	tY5irYDR9W8DWx6DLho6XnLy3tfRqrvbxg5Jo9jZPqbz9flPFYo4m0bJRJNHwkNwWN7p
	5AH8R9XZ6R1MEX+38HX2og6BUfyW3qAzbTixtSarcC7ZmXw35EGICBSOHBqHxVMQ5xAw
	CXurlPNW/oSAACJdvcGj7+v+NCWSob/FuEfO7kl7eAc6jYy397oGzlJKJ9VtnoPaUMPy
	TItQ==
X-Gm-Message-State: APjAAAXldCBokUQPGI7pI+bNVYgx1nUlemkT87Xb5EDbKuMqqMdc99ss
	zE7gitpp49wN/Mg/si/KlSk6BBVLcCc=
X-Google-Smtp-Source: APXvYqy6iScI+lc6LaEF0oH2ni/bDwcyx8iSZrNqY404pfeiPbmpsHZjHL7DDqyJ3vH8FEFrU8/HZA==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr19231863wmc.148.1557836806869;
	Tue, 14 May 2019 05:26:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id g2sm8124457wru.37.2019.05.14.05.26.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 05:26:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 14:26:38 +0200
Message-Id: <20190514122639.102946-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514122639.102946-1-alex.kanavin@gmail.com>
References: <20190514122639.102946-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] packagegroup-cross-canadian: repackage when TUNE_ARCH changes
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
X-List-Received-Date: Tue, 14 May 2019 12:26:46 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../packagegroups/packagegroup-cross-canadian.bb            | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index d551147b5a4..3b430c08148 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -16,3 +16,9 @@ RDEPENDS_${PN} = "\
     ${@all_multilib_tune_values(d, 'GDB')} \
     meta-environment-${MACHINE} \
     "
+
+# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated), 
+# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
+# This will result in erroneous reuse of previous sstate packages. The following line
+# establishes a direct dependency instead.
+do_package[vardeps] += "TUNE_ARCH"
-- 
2.17.1


