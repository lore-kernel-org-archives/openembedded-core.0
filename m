Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Feb 2020 19:22:53 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id CB94960C5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 19:22:53 +0000 (UTC)
IronPort-SDR: KE3V91aH4nyz9jEk4SupmmdyqBjXIW6TEUQlfbIdhYGXI0KkwjFU3CXkneAxSwQ9SaqqzeUHkH
	Dep63EUA929jfMAm25VK1rG5cwBreYqVVLqKRDt4pZ1xmCLMeHdjTTnJvgiWFBWlc79jmW8QR6
	MRSKTXINaATerKT0JSt9VpU5JFLz6B9HPr67eUpo/Ss2tS4HDzKIhUI2+y8yO2ZiJTNUe4/Hyj
	jZeBuchbCESTd5rsJyQJbqeiehyDISeRRqQPy2BGYcdn9kcxai4l6kk+fvDa2qe+qfdeFWeD2D
	zj4=
X-IronPort-AV: E=Sophos;i="5.70,406,1574118000"; 
   d="scan'208";a="4970818"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Feb 2020 20:15:40 +0100
Message-ID: <20200205191540.9200-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [zeus][PATCH] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Wed, 05 Feb 2020 19:22:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
2.21.1


