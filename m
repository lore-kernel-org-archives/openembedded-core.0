Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA7FC61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 16:23:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.15246.1675441374353396171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 08:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=czpROQYW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 360BA2000E;
	Fri,  3 Feb 2023 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675441372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HQLOygyR8+v8d4epi40X62KKWgWSDQZPzk6tsjQ/xrg=;
	b=czpROQYWAKFLZawdNMrpvH3hbKzug8hbcyuG/vS87ChsszlFxCDCCHOJyfkaLK34TVv5jU
	SP4w1oia096NgUFfMgyDcZtcevjeCF5yWjb1FUlycCuzE/ApiPNv6mkRe+qCuaEysxPL+S
	Y+vzO7GVYrRRAmyEnbNRRFiN4wFYL4Gt8V+Een5R1Ld4iqi5ugVuZH8KZ9vvZ/WV4o9uEX
	nMjiH4ZmNf5bqLIaX8NU6VdJ8dnYaoiU/sbvE+HG1JDqLn0hI5YFXXniYnHnWTzG3QQxXh
	SuDDXo1pFjdQM2GZtjO+nAouALLUJYlKvMmLkXzNpQt8gVSaYtNBCfyAafMonQ==
Date: Fri, 3 Feb 2023 17:22:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] meta: remove True option to getVar and
 getVarFlag calls (again)
Message-ID: <Y9002wNuWoRMTyCs@mail.local>
References: <20230201155038.539949-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201155038.539949-1-Martin.Jansa@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 16:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176726

Hello,

I'm not sure what you based the patch on, it didn't apply for me.

On 01/02/2023 16:50:38+0100, Martin Jansa wrote:
> * True is default since 2016 and most layers were already updated
>   not to pass this parameter where not necessary, e.g. oe-core was
>   updated couple times, first in:
>   https://git.openembedded.org/openembedded-core/commit/?id=7c552996597faaee2fbee185b250c0ee30ea3b5f
> 
>   Updated with the same regexp as later oe-core update:
>   https://git.openembedded.org/openembedded-core/commit/?id=9f551d588693328e4d99d33be94f26684eafcaba
> 
>   with small modification to replace not only d.getVar, but also data.getVar as in e.g.:
>   e.data.getVar('ERR_REPORT_USERNAME', True)
> 
>   and for getVarFlag:
>   sed -e 's|\(d\.getVarFlag \?\)( \?\([^,()]*, \?[^,()]*\), \?True)|\1(\2)|g' \
>       -i $(git grep -E 'getVarFlag ?\( ?([^,()]*), ?([^,()]*), ?True\)' \
>           | cut -d':' -f1 \
>           | sort -u)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes-recipe/image.bbclass             |  2 +-
>  meta/classes-recipe/license_image.bbclass     |  2 +-
>  .../classes-recipe/rust-target-config.bbclass |  2 +-
>  meta/classes/report-error.bbclass             |  8 +++----
>  meta/lib/oe/package_manager/deb/__init__.py   |  8 +++----
>  meta/recipes-devtools/go/go_1.19.4.bb         |  4 ++--
>  meta/recipes-devtools/rust/rust_1.67.0.bb     | 22 +++++++++----------
>  scripts/contrib/image-manifest                |  2 +-
>  scripts/lib/devtool/menuconfig.py             |  2 +-
>  9 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
> index e6d31c399f..0e252283dd 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -446,7 +446,7 @@ python () {
>          localdata.delVar('DATE')
>          localdata.delVar('TMPDIR')
>          localdata.delVar('IMAGE_VERSION_SUFFIX')
> -        vardepsexclude = (d.getVarFlag('IMAGE_CMD:' + realt, 'vardepsexclude', True) or '').split()
> +        vardepsexclude = (d.getVarFlag('IMAGE_CMD:' + realt, 'vardepsexclude') or '').split()
>          for dep in vardepsexclude:
>              localdata.delVar(dep)
>  
> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
> index b60d6e44f4..8560c27e93 100644
> --- a/meta/classes-recipe/license_image.bbclass
> +++ b/meta/classes-recipe/license_image.bbclass
> @@ -235,7 +235,7 @@ def get_deployed_dependencies(d):
>      deploy = {}
>      # Get all the dependencies for the current task (rootfs).
>      taskdata = d.getVar("BB_TASKDEPDATA", False)
> -    pn = d.getVar("PN", True)
> +    pn = d.getVar("PN")
>      depends = list(set([dep[0] for dep
>                      in list(taskdata.values())
>                      if not dep[0].endswith("-native") and not dep[0] == pn]))
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index 939dd13d2f..5e71546fee 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -114,7 +114,7 @@ def llvm_features_from_target_fpu(d):
>      # TARGET_FPU can be hard or soft. +soft-float tell llvm to use soft float
>      # ABI. There is no option for hard.
>  
> -    fpu = d.getVar('TARGET_FPU', True)
> +    fpu = d.getVar('TARGET_FPU')
>      return ["+soft-float"] if fpu == "soft" else []
>  
>  def llvm_features(d):
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index 7f2e994d35..1836af7ec6 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -51,8 +51,8 @@ def errorreport_get_user_info(e):
>      Read user info from variables or from git config
>      """
>      import subprocess
> -    username = e.data.getVar('ERR_REPORT_USERNAME', True)
> -    email = e.data.getVar('ERR_REPORT_EMAIL', True)
> +    username = e.data.getVar('ERR_REPORT_USERNAME')
> +    email = e.data.getVar('ERR_REPORT_EMAIL')
>      if not username or not email:
>          # try to read them from git config
>          username = str(subprocess.check_output(['git', 'config', '--get', 'user.name']).decode("utf-8")).strip()
> @@ -94,8 +94,8 @@ def errorreport_senddata(e, json_file):
>      import os, json
>  
>      if os.path.isfile(json_file):
> -        server = e.data.getVar('ERR_REPORT_SERVER', True)
> -        port = e.data.getVar('ERR_REPORT_PORT', True)
> +        server = e.data.getVar('ERR_REPORT_SERVER')
> +        port = e.data.getVar('ERR_REPORT_PORT')
>          bb.note("Uploading the report %s to %s:%s" % (json_file, server, port))
>  
>          with open(json_file) as f:
> diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
> index c672454072..0c23c884c1 100644
> --- a/meta/lib/oe/package_manager/deb/__init__.py
> +++ b/meta/lib/oe/package_manager/deb/__init__.py
> @@ -82,15 +82,15 @@ class DpkgIndexer(Indexer):
>              return
>  
>          oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
> -        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
> -            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
> +        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
> +            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
>          else:
>              signer = None
>          if signer:
>              for f in index_sign_files:
>                  signer.detach_sign(f,
> -                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
> -                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
> +                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
> +                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
>                                     output_suffix="gpg",
>                                     use_sha256=True)
>  
> diff --git a/meta/recipes-devtools/go/go_1.19.4.bb b/meta/recipes-devtools/go/go_1.19.4.bb
> index 98977673ee..587ee55944 100644
> --- a/meta/recipes-devtools/go/go_1.19.4.bb
> +++ b/meta/recipes-devtools/go/go_1.19.4.bb
> @@ -12,7 +12,7 @@ export CXX_FOR_TARGET = "g++"
>  # mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv32 and its
>  # variants.
>  python() {
> -    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv32' in d.getVar('TARGET_ARCH',True):
> -        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN',True), " textrel")
> +    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
> +        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
>  }
>  
> diff --git a/meta/recipes-devtools/rust/rust_1.67.0.bb b/meta/recipes-devtools/rust/rust_1.67.0.bb
> index f4ac8bc635..60f3daf464 100644
> --- a/meta/recipes-devtools/rust/rust_1.67.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.67.0.bb
> @@ -83,7 +83,7 @@ python do_configure() {
>      config = configparser.RawConfigParser()
>  
>      # [target.ARCH-poky-linux]
> -    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
> +    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS'))
>      config.add_section(host_section)
>  
>      llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
> @@ -98,7 +98,7 @@ python do_configure() {
>  
>      # If we don't do this rust-native will compile it's own llvm for BUILD.
>      # [target.${BUILD_ARCH}-unknown-linux-gnu]
> -    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
> +    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS'))
>      if build_section != host_section:
>          config.add_section(build_section)
>  
> @@ -108,7 +108,7 @@ python do_configure() {
>          config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
>          config.set(build_section, "linker", e(d.expand("${RUST_BUILD_CCLD}")))
>  
> -    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
> +    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS'))
>      if target_section != host_section and target_section != build_section:
>          config.add_section(target_section)
>  
> @@ -154,26 +154,26 @@ python do_configure() {
>      config.set("build", "vendor", e(True))
>  
>      if not "targets" in locals():
> -        targets = [d.getVar("RUST_TARGET_SYS", True)]
> +        targets = [d.getVar("RUST_TARGET_SYS")]
>      config.set("build", "target", e(targets))
>  
>      if not "hosts" in locals():
> -        hosts = [d.getVar("RUST_HOST_SYS", True)]
> +        hosts = [d.getVar("RUST_HOST_SYS")]
>      config.set("build", "host", e(hosts))
>  
>      # We can't use BUILD_SYS since that is something the rust snapshot knows
>      # nothing about when trying to build some stage0 tools (like fabricate)
> -    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
> +    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS")))
>  
>      # [install]
>      config.add_section("install")
>      # ./x.py install doesn't have any notion of "destdir"
>      # but we can prepend ${D} to all the directories instead
> -    config.set("install", "prefix",  e(d.getVar("D", True) + d.getVar("prefix", True)))
> -    config.set("install", "bindir",  e(d.getVar("D", True) + d.getVar("bindir", True)))
> -    config.set("install", "libdir",  e(d.getVar("D", True) + d.getVar("libdir", True)))
> -    config.set("install", "datadir", e(d.getVar("D", True) + d.getVar("datadir", True)))
> -    config.set("install", "mandir",  e(d.getVar("D", True) + d.getVar("mandir", True)))
> +    config.set("install", "prefix",  e(d.getVar("D") + d.getVar("prefix")))
> +    config.set("install", "bindir",  e(d.getVar("D") + d.getVar("bindir")))
> +    config.set("install", "libdir",  e(d.getVar("D") + d.getVar("libdir")))
> +    config.set("install", "datadir", e(d.getVar("D") + d.getVar("datadir")))
> +    config.set("install", "mandir",  e(d.getVar("D") + d.getVar("mandir")))
>  
>      with open("config.toml", "w") as f:
>          f.write('changelog-seen = 2\n\n')
> diff --git a/scripts/contrib/image-manifest b/scripts/contrib/image-manifest
> index 3c07a73a4e..4d65a99258 100755
> --- a/scripts/contrib/image-manifest
> +++ b/scripts/contrib/image-manifest
> @@ -392,7 +392,7 @@ def export_manifest_info(args):
>                      for key in rd.getVarFlags('PACKAGECONFIG').keys():
>                          if key == 'doc':
>                              continue
> -                        rvalues[pn]['packageconfig_opts'][key] = rd.getVarFlag('PACKAGECONFIG', key, True)
> +                        rvalues[pn]['packageconfig_opts'][key] = rd.getVarFlag('PACKAGECONFIG', key)
>  
>                  if config['patches'] == 'yes':
>                      patches = oe.recipeutils.get_recipe_patches(rd)
> diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
> index d87a01e7a9..18daef30c3 100644
> --- a/scripts/lib/devtool/menuconfig.py
> +++ b/scripts/lib/devtool/menuconfig.py
> @@ -45,7 +45,7 @@ def menuconfig(args, config, basepath, workspace):
>              return 1
>  
>          check_workspace_recipe(workspace, args.component)
> -        pn = rd.getVar('PN', True)
> +        pn = rd.getVar('PN')
>  
>          if not rd.getVarFlag('do_menuconfig','task'):
>              raise DevtoolError("This recipe does not support menuconfig option")
> -- 
> 2.39.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176557): https://lists.openembedded.org/g/openembedded-core/message/176557
> Mute This Topic: https://lists.openembedded.org/mt/96679225/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

