Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 99BE760CD2
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:06 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id l24so2541626pgk.2
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mKUQMkPPqSVBV/+XUrZNhQc8BUnTMJMM+0puT/uI9kI=;
	b=R2hvfLK7EQ3FVtVzgbHGQAniwSLPCrTrocOAISZkECbfpRd5gUyB6g/kIbTrZWpiJq
	nnZoofmqKM3yqvDmQ0Gk+3wq3+w5NgTfX8AYCToeUWVRll6LVIDrlMYqL2Z3En/QTQ+C
	IafOEpMq1yQImXjKU595mYZbYBZ749/C7XA651JQBH+zsLMTeWGw6xV9sSoYsG5UfeGI
	pbWSF+GoG4uqdZ9FvQxmIzg1fNDBTKXj0HA9hVOvbGePXXzVdcnFmF8G3duSpRbOhrXG
	6q9dBuU1b+MjtHNdWUwzSLQLxJrkNGOdR+pmO5Q7wtV9Mq5vzxul49X8KdZd088nO7lN
	Kukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mKUQMkPPqSVBV/+XUrZNhQc8BUnTMJMM+0puT/uI9kI=;
	b=fp9zBrPjtKtcdGPzpncHF6IBV0NGTxcDQGII/cj/QE3A2z+L90dVcr86DLOsvY9KSf
	STA6+PNS99TpO7+9e/gXxRCSVmxpzOArVY3lJ/CmO3hb8yScjKXOiv7Pd5FDSx9TEsUq
	kVF5DVaFADOQC7RfJbT1dSrm7E9P1TsC1qJF8b6IBvlVFXigeYmdxqSAqMLgqCI3DZEg
	BNY3mVYWnpofyipwXjmHTwLITLeiy3ij4+Gl1rrh4QFpf3rwPIFajjYyV80xlbdc4ojg
	CP8od9e4BE4DUJweRA5qPkTkqQRTB5P/8iKsK8TI3sZzCCXshdeQaR7RjLzei8jPPtUo
	+rCg==
X-Gm-Message-State: APjAAAUbNMK4B0zOqS0dRfMd6rOR+AtOFlaG07e1usPUusYhokmerM3U
	NrKGKYbhP54ruHu5J2neu8yLejmN
X-Google-Smtp-Source: APXvYqxyQfvRd0Fa4ClDtME2pCwk1JCEUXEVKUw2l44B/3hcfGavxDs1QFsVSQGDWni7DgFZi8wRVA==
X-Received: by 2002:a63:3004:: with SMTP id w4mr9935989pgw.164.1581264607585; 
	Sun, 09 Feb 2020 08:10:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.06
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:33 -0800
Message-Id: <2c2b187ec108d0157f6cc30fd9eb8862d8a35214.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 05/29] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:06 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

u-boot.inc supports u-boot recipes with or without menuconfig [1].
However, running devtool on a u-boot recipe that does not support menuconfig
results in an error:

cp: cannot stat '/home/r60874/upstream/fsl-xwayland/tmp/work/imx8mmevk-fsl-linux/u-boot-imx/2018.03-r0/u-boot-imx-2018.03//.config': No such file or directory

The problem is the devtool logic assumes that any recipe with a do_menuconfig task
will generate a .config in do_configure().

Fix the problem by removing the assumption with a flag that the recipe can control,
like this:

do_configure() {
    if [ menuconfig-supported ]; then
        ...
    else
        DEVTOOL_DISABLE_MENUCONFIG=true
    fi
}

[1] https://github.com/openembedded/openembedded-core/commit/11278e3b2c75be80645b9841763a97dbb35daadc

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/standard.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 60c9a046f9..b43c725cf8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -940,8 +940,10 @@ def modify(args, config, basepath, workspace):
                         '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure_append() {\n'
-                '    cp ${B}/.config ${S}/.config.baseline\n'
-                '    ln -sfT ${B}/.config ${S}/.config.new\n'
+                '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
+                '        cp ${B}/.config ${S}/.config.baseline\n'
+                '        ln -sfT ${B}/.config ${S}/.config.new\n'
+                '    fi\n'
                 '}\n')
             if initial_rev:
                 f.write('\n# initial_rev: %s\n' % initial_rev)
-- 
2.17.1


