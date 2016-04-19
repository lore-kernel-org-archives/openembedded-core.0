Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B07666E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 19:34:07 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l68so1270999qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=mmquJ/G6GLVr8FusgCA5QxxVyqyOABiadh2hop9qZag=;
	b=J720t5SOshJPCOWnzqMhZjhuU4ONShTvaPg9fWhb+uAFtuiOYNa9DRi5vaqpuKcshs
	uQbf+a5VZBUFNAE+rv/OUtyRAzEYhjKImvqL67T/nbQpe9lEvWGOk4dYcvZqi4tCGwHc
	DqXcuV1odN0PCIvQA1n//XiakR6HvodUVtdQgNYPYFAQQqmhEv4IT7fEfSM0qeOX5k/2
	QvOZLumdsHG8wA1c9uFm+z5zgwPWSVzleC4AGkny8WyCfBp+37OSGpCIkXCs+0In6arW
	xvnwbt/scn3VmMk7Y68GpyP/4sUKGNNOcstYZajMxfZyj7LRBN9QN+T0QrGS4F43vc6V
	1G/A==
X-Gm-Message-State: AOPr4FXd+JZ4SXzucntiIZVxiljPebdeDtFAVoy/KhQtJtG0QZjoS1qJDILWyZwrNrCQyA==
X-Received: by 10.55.73.74 with SMTP id w71mr6235428qka.60.1461094447942;
	Tue, 19 Apr 2016 12:34:07 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	s62sm23034774qhe.10.2016.04.19.12.34.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 12:34:06 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 19 Apr 2016 16:34:01 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 16:34:00 -0300
Message-Id: <1461094441-3445-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] syslinux.bbclass: The AUTO_SYSLINUXMENU value needs to be boolean
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
X-List-Received-Date: Tue, 19 Apr 2016 19:34:08 -0000

The python code expects AUTO_SYSLINUXMENU to be a boolean value,
otherwise the logic fails. This fixes the code comparing the value to
"1" which is the value expected by the shell script code, counterpart.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/syslinux.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index defad73..fd04ac6 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -121,7 +121,7 @@ python build_syslinux_cfg () {
     if syslinux_serial:
         cfgfile.write('SERIAL %s\n' % syslinux_serial)
 
-    menu = d.getVar('AUTO_SYSLINUXMENU', True)
+    menu = (d.getVar('AUTO_SYSLINUXMENU', True) == "1")
 
     if menu and syslinux_serial:
         cfgfile.write('DEFAULT Graphics console %s\n' % (labels.split()[0]))
-- 
2.8.0


