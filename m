Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FECC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 12:54:40 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.52933.1699275270236588373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 04:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcucZ5WG;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c594196344so59688131fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 04:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699275268; x=1699880068; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fRhYBxfm/+OjuXdIVQLuNVcJCjzMPs8bVVQdDKWPSg=;
        b=lcucZ5WG1UhpdkkpUM41frBdRWVFC+DfTRnJngdnA831yuw5iOQRQhaIydAP/dq2qU
         Aejx6rL2/hT8Uba+j9F+a+n9d+YobpOJaE3yVtFo7oKrlPGhdcGqomHgSmmtMUw8VSob
         mEjz2ZPA7rR720wfvPVccjTXdfLeSncyho9aQuwAHmBCf+t2W3196BU5G6lgPBc+O7Ap
         CNPSAZ7E0kRBbZi/skxNrVNOgInh8sAjxvhx8/r4kKGeWGGd3tQJSRNhMdz3tSOJZVq3
         7ox2e3E+tcg4s8NUKKehopdjiPA10Zss4QHDL8NdNDALLLTeuHc092JRp3z+ZkIa85K8
         PHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699275268; x=1699880068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fRhYBxfm/+OjuXdIVQLuNVcJCjzMPs8bVVQdDKWPSg=;
        b=pIw5WUJH4akV6gSSh1ciKrzyIF5qulW4/9l9TK33SS2NjfJ39UQylgddHnzFA4hcRe
         xdBS2Qm04u5zMLTlQUM376xQPoHv4Dqtiikry/L7fuI67u/wtlKappQ1HMA4jHkX4yoj
         VTdvAcqe2AV/pUZ+5lKTAgAEK/HG3pku2fMm9Z0Wf+X1/06kyEw/HNDZGG4n3rHAcqzu
         ImRO2xZ/2un5apIRYB/kVxU/bBPI2J2F/2q3SO6MNCxkqxx0Q6b66EKltVpz/09FS38/
         OtCsraBpQNvjUYFVnZ07ovJhTzXDsxBDwVIPoERceOupFmxthlr6N6aNu+XzAM3dUEiX
         s89g==
X-Gm-Message-State: AOJu0YwOU4jisdGr9eFbCGJqi9jZBTfGD0Hmp8jD4vDNqxqiT/Tr6ihl
	1GLQkpEK0Wbz0HAKRP3wbLg3qsrnNbxpfM6InKI=
X-Google-Smtp-Source: AGHT+IFe5JyskpdsMaJIYIbR3c6TNwToDykRGhnb5Oqkqm1tUFTPqZY7orbssr6Yo9VK/MurtUp50S7iZ1KZVT9Ujlg=
X-Received: by 2002:a2e:3c12:0:b0:2c5:1542:57e9 with SMTP id
 j18-20020a2e3c12000000b002c5154257e9mr25102175lja.41.1699275268230; Mon, 06
 Nov 2023 04:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20231103102806.2332746-1-alex@linutronix.de> <20231103102806.2332746-4-alex@linutronix.de>
 <2023110323503770e4813e@mail.local>
In-Reply-To: <2023110323503770e4813e@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Nov 2023 13:54:16 +0100
Message-ID: <CANNYZj9C-B-yO+H_hC32tZJMi7Btvh4p8knFr=oGLqkyZ+V+hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] populate_sdk_ext: split copy_buildsystem()
 into logical steps defined as functions
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190212

Thanks, I just sent a corrected patch.

Alex

On Sat, 4 Nov 2023 at 00:50, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7419/steps/16/logs/stdio
>
> On 03/11/2023 11:28:06+0100, Alexander Kanavin wrote:
> > copy_buildsystem() has become far too large and needs to be split
> > into shorter and more understandable pieces; some of those
> > pieces will be reused for the purpose of providing esdk mode
> > directly from a plain yocto build.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes-recipe/populate_sdk_ext.bbclass | 59 ++++++++++++++++----
> >  1 file changed, 47 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
> > index 53adc868d47..a20f38fb210 100644
> > --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> > +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> > @@ -186,12 +186,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
> >          if os.path.exists(localconf + '.bak'):
> >              os.replace(localconf + '.bak', localconf)
> >
> > -python copy_buildsystem () {
> > -    import re
> > -    import shutil
> > -    import glob
> > -    import oe.copy_buildsystem
> > -
> > +def copy_bitbake_and_layers(d, baseoutpath, derivative):
> >      oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT')
> >
> >      conf_bbpath = ''
> > @@ -200,13 +195,7 @@ python copy_buildsystem () {
> >
> >      # Copy in all metadata layers + bitbake (as repositories)
> >      buildsystem = oe.copy_buildsystem.BuildSystem('extensible SDK', d)
> > -    baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
> >
> > -    #check if custome templateconf path is set
> > -    use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
> > -
> > -    # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
> > -    derivative = (d.getVar('SDK_DERIVATIVE') or '') == '1'
> >      if derivative:
> >          workspace_name = 'orig-workspace'
> >      else:
> > @@ -231,6 +220,9 @@ python copy_buildsystem () {
> >      d.setVar('oe_init_build_env_path', conf_initpath)
> >      d.setVar('esdk_tools_path', esdk_tools_path)
> >
> > +    return (conf_initpath, conf_bbpath, core_meta_subdir, sdkbblayers)
> > +
> > +def write_devtool_config(d, baseoutpath, conf_bbpath, conf_initpath, core_meta_subdir):
> >      # Write out config file for devtool
> >      import configparser
> >      config = configparser.ConfigParser()
> > @@ -247,10 +239,12 @@ python copy_buildsystem () {
> >      with open(os.path.join(baseoutpath, 'conf', 'devtool.conf'), 'w') as f:
> >          config.write(f)
> >
> > +def write_unlocked_sigs(d, baseoutpath):
> >      unlockedsigs =  os.path.join(baseoutpath, 'conf', 'unlocked-sigs.inc')
> >      with open(unlockedsigs, 'w') as f:
> >          pass
> >
> > +def write_bblayers_conf(d, baseoutpath, sdkbblayers):
> >      # Create a layer for new recipes / appends
> >      bbpath = d.getVar('BBPATH')
> >      env = os.environ.copy()
> > @@ -279,6 +273,9 @@ python copy_buildsystem () {
> >          f.write('    $' + '{SDKBASEMETAPATH}/workspace \\\n')
> >          f.write('    "\n')
> >
> > +def copy_uninative(d, baseoutpath):
> > +    import shutil
> > +
> >      # Copy uninative tarball
> >      # For now this is where uninative.bbclass expects the tarball
> >      if bb.data.inherits_class('uninative', d):
> > @@ -288,6 +285,12 @@ python copy_buildsystem () {
> >          bb.utils.mkdirhier(uninative_outdir)
> >          shutil.copy(uninative_file, uninative_outdir)
> >
> > +    return uninative_checksum
> > +
> > +def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_checksum):
> > +    #check if custome templateconf path is set
> > +    use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
> > +
> >      env_passthrough = (d.getVar('BB_ENV_PASSTHROUGH_ADDITIONS') or '').split()
> >      env_passthrough_values = {}
> >
> > @@ -457,6 +460,9 @@ python copy_buildsystem () {
> >                  f.write(line)
> >              f.write('\n')
> >
> > +def prepare_locked_cache(d, baseoutpath, conf_initpath):
> > +    import shutil
> > +
> >      # Filter the locked signatures file to just the sstate tasks we are interested in
> >      excluded_targets = get_sdk_install_targets(d, images_only=True)
> >      sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
> > @@ -560,6 +566,9 @@ python copy_buildsystem () {
> >                  f = os.path.join(root, name)
> >                  os.remove(f)
> >
> > +def write_manifest(d, baseoutpath):
> > +    import glob
> > +
> >      # Write manifest file
> >      # Note: at the moment we cannot include the env setup script here to keep
> >      # it updated, since it gets modified during SDK installation (see
> > @@ -583,6 +592,32 @@ python copy_buildsystem () {
> >                      continue
> >                  chksum = bb.utils.sha256_file(fn)
> >                  f.write('%s\t%s\n' % (chksum, os.path.relpath(fn, baseoutpath)))
> > +
> > +
> > +python copy_buildsystem () {
> > +    import oe.copy_buildsystem
> > +
> > +    baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
> > +
> > +    # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
> > +    derivative = (d.getVar('SDK_DERIVATIVE') or '') == '1'
> > +
> > +    conf_initpath, conf_bbpath, core_meta_subdir, sdkbblayers = copy_bitbake_and_layers(d, baseoutpath, derivative)
> > +
> > +    write_devtool_config(d, baseoutpath, conf_bbpath, conf_initpath, core_meta_subdir)
> > +
> > +    write_unlocked_sigs(d, baseoutpath)
> > +
> > +    write_bblayers_conf(d, baseoutpath, sdkbblayers)
> > +
> > +    uninative_checksum = copy_uninative(d, baseoutpath)
> > +
> > +    write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_checksum)
> > +
> > +    prepare_locked_cache(d, baseoutpath, conf_initpath)
> > +
> > +    write_manifest(d, baseoutpath)
> > +
> >  }
> >
> >  def get_current_buildtools(d):
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#190151): https://lists.openembedded.org/g/openembedded-core/message/190151
> > Mute This Topic: https://lists.openembedded.org/mt/102361115/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

