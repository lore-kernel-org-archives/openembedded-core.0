Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.14862.1596744037786146298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 13:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qvZ2Il47;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id m22so8538475eje.10
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 13:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pslNY4wKYv6mM9X+RggbYrO7V0C08HqsyCco4fLrxuE=;
        b=qvZ2Il47zJAXjDjCJZ0AY8sLz3rc+c629Tr0Map3uLP7XAOfH1sU74RWQoWhAd8cgn
         Um9410+2cBPGNHn8usj1+ZNiucdWJGqbXq3nI8bKXa+/cEcSXRKTpzbY8HQKWZyfp4+v
         LG8ER922bfVla+YDqqF4s+dTsXdwkt4XwbBiALmmuk+KVwZLG52HcbUSbJL3kzKH5ZRV
         y5rSmw5Fwe63lLIfhGdyX8g0DI+zlBtDhMetgMpJEivG8xY14jOkaeF72F2QmgwUGOUM
         TyTGapY4qkws3ZXgIfCJrrNtgvABUPK+ZI+xB5e3aEgepJxIcPHOv5xu8M37STn0RYFi
         lrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pslNY4wKYv6mM9X+RggbYrO7V0C08HqsyCco4fLrxuE=;
        b=Vr6HGLyVg8ARv3LTEnVu510J1Seg5Ns8sWorBNf7nCLhd66EcgbzEH0fDZ17soeDJU
         IFX6Ce0ZHCVGun9RL16x548Q47XHAcvJQPZ69ZbKubMJmgeKkt3wofSPG8IlCqFbSBIX
         LZjJvm9paKGH0Tq+aT1ruw658+x6x/uXLd1ETBrUmSqIwAWtbAuCaaE4xcdYvERCnTuK
         6RU5fZDnubfRNpaRwBh6rafKHcU8FHQzT1skStZrZYdA1PmxroJLSUo2C8SptKXPgrDc
         RIdGp1WjO+n02OBwcOUJtqgJcxuZPyADlNWhM1jT6elmXD0JXmiVlWy+0T4jV8KYeZ/2
         D9xw==
X-Gm-Message-State: AOAM530Dzb+bbFIVWg12R5LeFPDNz7ftQ8LJEVm6IYeuxpKyk0fKzmk/
	bSwUfNhaY16ll19RtdguvNiZo89Nhnf2sXZ05pM=
X-Google-Smtp-Source: ABdhPJztNPcQZVqCutjgBgxvWdOQN+FrPveH4jAgr/7WpWlsxcGMngdGVd4L89SRtHvrbd+Hp3OSFfbI8CV/NPMPjwY=
X-Received: by 2002:a17:906:1414:: with SMTP id p20mr5851896ejc.247.1596744036165;
 Thu, 06 Aug 2020 13:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <1628C6121E3CC7FE.16348@lists.openembedded.org>
In-Reply-To: <1628C6121E3CC7FE.16348@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 Aug 2020 16:00:24 -0400
Message-ID: <CADkTA4MNfCoGgqiYiKvGKYTWW6h+3ATHmEZur=CEBT9mEmtejA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: enhance configuration queue analysis capabilities
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000012af3205ac3af1c8"

--00000000000012af3205ac3af1c8
Content-Type: text/plain; charset="UTF-8"

This should have been tagged with "v2"

Bruce

On Thu, Aug 6, 2020 at 3:57 PM Bruce Ashfield via lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Enable the kernel-yocto bbclass to use enhanced capabilities from
> the kern-tools symbol_why.pl.
>
> We bump the kern-tools SRCREV to pickup the reworking of symbol_why,
> which uses Kconfiglib to provide analysis on configuration values.
>
> This is useful for debugging why a symbol specified in a fragment
> did not end up in the final .config.
>
> We introduce two ways to interact with the new symbol_why:
>
>  1) a replacement of the existing kconf_check script
>  2) a dedicated task that is explicitly invoked to dump details
>     on the configuration.
>
> The kconf_check replacement is transparent to the user, and is
> run in exactly the same way as it was previously. But we get better
> output and more detailed diagnostics if there are symbols that
> don't make it into the final .config
>
> The second way to interact with symbol why is via the new task
> do_config_analysis. This is invoked like any other task, and by
> default will provide a full configuration analysis and point the
> user at files to look at for details.
>
> If a more targetted analysis is desired, then specific symbols
> can be set in the CONFIG_ANALYSIS variable. When this variable
> is set, the task will only run for the given symbols and provide
> per-variable links to the user. This variable can be set like
> any other, including specification in the local.conf:
>
>   CONFIG_ANALYSIS_pn-linux-yocto-dev = 'NF_CONNTRACK LOCALVERSION'
>
> Which produces output as follows:
>
>    WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
>    do_config_analysis: Configuration analysis executed, see:
> tmp/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/NF_CONNTRACK-config-analysis.txt
> for details
>    WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
>    do_config_analysis: Configuration audit executed, see:
> tmp/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/NF_CONNTRACK-config-audit.txt
> for details
>    WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
>    do_config_analysis: Configuration analysis executed, see:
> tmp/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/LOCALVERSION-config-analysis.txt
> for details
>    WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0
>    do_config_analysis: Configuration audit executed, see:
> work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed37-r0/LOCALVERSION-config-audit.txt
> for details
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> v2: - removed the bb.debug line that RP had to fixup previously
>     - fixed the detection of the .kernel-meta directory. This fixes the
>       meta-arm build issue, and should also help meta-intel.
>
> Note: you'll actually get a configuration warning out of meta-arm when
> you build now, but the warning is accurate and isn't a problem (an
> option goes from =m to =y).
>
> Bruce
>
>  meta/classes/kernel-yocto.bbclass             | 159 ++++++++++++++----
>  .../kern-tools/kern-tools-native_git.bb       |   2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   2 +-
>  3 files changed, 128 insertions(+), 35 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 70818cc01c..77849a28c9 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -405,6 +405,67 @@ do_kernel_configme() {
>  }
>
>  addtask kernel_configme before do_configure after do_patch
> +addtask config_analysis
> +
> +do_config_analysis[depends] = "virtual/kernel:do_configure"
> +do_config_analysis[depends] += "kern-tools-native:do_populate_sysroot"
> +
> +CONFIG_AUDIT_FILE ?= "${WORKDIR}/config-audit.txt"
> +CONFIG_ANALYSIS_FILE ?= "${WORKDIR}/config-analysis.txt"
> +
> +python do_config_analysis() {
> +    import re, string, sys, subprocess
> +
> +    s = d.getVar('S')
> +
> +    env = os.environ.copy()
> +    env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
> +    env['LD'] = d.getVar('KERNEL_LD')
> +    env['CC'] = d.getVar('KERNEL_CC')
> +    env['ARCH'] = d.getVar('ARCH')
> +    env['srctree'] = s
> +
> +    # read specific symbols from the kernel recipe or from local.conf
> +    # i.e.: CONFIG_ANALYSIS_pn-linux-yocto-dev = 'NF_CONNTRACK
> LOCALVERSION'
> +    config = d.getVar( 'CONFIG_ANALYSIS' )
> +    if not config:
> +       config = [ "" ]
> +    else:
> +       config = config.split()
> +
> +    for c in config:
> +        for action in ["analysis","audit"]:
> +            if action == "analysis":
> +                try:
> +                    analysis = subprocess.check_output(['symbol_why.py',
> '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c],
> cwd=s, env=env ).decode('utf-8')
> +                except subprocess.CalledProcessError as e:
> +                    bb.fatal( "config analysis failed: %s" %
> e.output.decode('utf-8'))
> +
> +                outfile = d.getVar( 'CONFIG_ANALYSIS_FILE' )
> +
> +            if action == "audit":
> +                try:
> +                    analysis = subprocess.check_output(['symbol_why.py',
> '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary',
> '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
> +                except subprocess.CalledProcessError as e:
> +                    bb.fatal( "config analysis failed: %s" %
> e.output.decode('utf-8'))
> +
> +                outfile = d.getVar( 'CONFIG_AUDIT_FILE' )
> +
> +            if c:
> +                outdir = os.path.dirname( outfile )
> +                outname = os.path.basename( outfile )
> +                outfile = outdir + '/'+ c + '-' + outname
> +
> +            if config and os.path.isfile(outfile):
> +                os.remove(outfile)
> +
> +            with open(outfile, 'w+') as f:
> +                f.write( analysis )
> +
> +            bb.warn( "Configuration {} executed, see: {} for
> details".format(action,outfile ))
> +            if c:
> +                bb.warn( analysis )
> +}
>
>  python do_kernel_configcheck() {
>      import re, string, sys, subprocess
> @@ -414,57 +475,89 @@ python do_kernel_configcheck() {
>      # meta-series for processing
>      kmeta = d.getVar("KMETA") or "meta"
>      if not os.path.exists(kmeta):
> -        kmeta = "." + kmeta
> +        kmeta = subprocess.check_output(['kgit',
> '--meta']).decode('utf-8').rstrip()
>
>      s = d.getVar('S')
>
>      env = os.environ.copy()
>      env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
> -    env['LD'] = "${KERNEL_LD}"
> +    env['LD'] = d.getVar('KERNEL_LD')
> +    env['CC'] = d.getVar('KERNEL_CC')
> +    env['ARCH'] = d.getVar('ARCH')
> +    env['srctree'] = s
>
>      try:
>          configs = subprocess.check_output(['scc', '--configs', '-o', s +
> '/.kernel-meta'], env=env).decode('utf-8')
>      except subprocess.CalledProcessError as e:
>          bb.fatal( "Cannot gather config fragments for audit: %s" %
> e.output.decode("utf-8") )
>
> -    try:
> -        subprocess.check_call(['kconf_check', '--report', '-o',
> -                '%s/%s/cfg' % (s, kmeta), d.getVar('B') + '/.config', s,
> configs], cwd=s, env=env)
> -    except subprocess.CalledProcessError:
> -        # The configuration gathering can return different exit codes, but
> -        # we interpret them based on the KCONF_AUDIT_LEVEL variable, so
> we catch
> -        # everything here, and let the run continue.
> -        pass
> -
>      config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
>      bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
>
> -    # if config check visibility is non-zero, report dropped
> configuration values
> -    mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
> -    if os.path.exists(mismatch_file):
> -        if config_check_visibility:
> -            with open (mismatch_file, "r") as myfile:
> +    # if config check visibility is "1", that's the lowest level of
> audit. So
> +    # we add the --classify option to the run, since classification will
> +    # streamline the output to only report options that could be boot
> issues,
> +    # or are otherwise required for proper operation.
> +    extra_params = ""
> +    if config_check_visibility == 1:
> +       extra_params = "--classify"
> +
> +    # category #1: mismatches
> +    try:
> +        analysis = subprocess.check_output(['symbol_why.py',
> '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches',
> extra_params], cwd=s, env=env ).decode('utf-8')
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
> +
> +    if analysis:
> +        outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
> +        if os.path.isfile(outfile):
> +           os.remove(outfile)
> +        with open(outfile, 'w+') as f:
> +            f.write( analysis )
> +
> +        if config_check_visibility and os.stat(outfile).st_size > 0:
> +            with open (outfile, "r") as myfile:
>                  results = myfile.read()
>                  bb.warn( "[kernel config]: specified values did not make
> it into the kernel's final configuration:\n\n%s" % results)
>
> -    if bsp_check_visibility:
> -        invalid_file = d.expand("${S}/%s/cfg/invalid.cfg" % kmeta)
> -        if os.path.exists(invalid_file) and os.stat(invalid_file).st_size
> > 0:
> -            with open (invalid_file, "r") as myfile:
> -                results = myfile.read()
> -                bb.warn( "[kernel config]: This BSP sets config options
> that are not offered anywhere within this kernel:\n\n%s" % results)
> -        errors_file = d.expand("${S}/%s/cfg/fragment_errors.txt" % kmeta)
> -        if os.path.exists(errors_file) and os.stat(errors_file).st_size >
> 0:
> -            with open (errors_file, "r") as myfile:
> +    # category #2: invalid fragment elements
> +    extra_params = ""
> +    if bsp_check_visibility > 1:
> +        extra_params = "--strict"
> +    try:
> +        analysis = subprocess.check_output(['symbol_why.py',
> '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid',
> extra_params], cwd=s, env=env ).decode('utf-8')
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
> +
> +    if analysis:
> +        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> +        if os.path.isfile(outfile):
> +           os.remove(outfile)
> +        with open(outfile, 'w+') as f:
> +            f.write( analysis )
> +
> +        if bsp_check_visibility and os.stat(outfile).st_size > 0:
> +            with open (outfile, "r") as myfile:
>                 results = myfile.read()
> -               bb.warn( "[kernel config]: This BSP contains fragments
> with errors:\n\n%s" % results)
> -
> -    # if the audit level is greater than two, we report if a fragment has
> overriden
> -    # a value from a base fragment. This is really only used for new
> kernel introduction
> -    if bsp_check_visibility > 2:
> -        redefinition_file = d.expand("${S}/%s/cfg/redefinition.txt" %
> kmeta)
> -        if os.path.exists(redefinition_file) and
> os.stat(redefinition_file).st_size > 0:
> -            with open (redefinition_file, "r") as myfile:
> +               bb.warn( "[kernel config]: This BSP contains fragments
> with warnings:\n\n%s" % results)
> +
> +    # category #3: redefined options (this is pretty verbose and is debug
> only)
> +    try:
> +        analysis = subprocess.check_output(['symbol_why.py',
> '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'],
> cwd=s, env=env ).decode('utf-8')
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
> +
> +    if analysis:
> +        outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
> +        if os.path.isfile(outfile):
> +           os.remove(outfile)
> +        with open(outfile, 'w+') as f:
> +            f.write( analysis )
> +
> +        # if the audit level is greater than two, we report if a fragment
> has overriden
> +        # a value from a base fragment. This is really only used for new
> kernel introduction
> +        if bsp_check_visibility > 2 and os.stat(outfile).st_size > 0:
> +            with open (outfile, "r") as myfile:
>                  results = myfile.read()
>                  bb.warn( "[kernel config]: This BSP has configuration
> options defined in more than one config, with differing values:\n\n%s" %
> results)
>  }
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 4f1af731d6..4402e14754 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
> "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
>
>  DEPENDS = "git-native"
>
> -SRCREV = "c66833e1caac25279a5052fceb13213f5e4f79f9"
> +SRCREV = "8b6fa727013daba5e8d72e5fc61d80caed944c6a"
>  PR = "r12"
>  PV = "0.2+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> index 7904850317..3f9e6aa480 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -38,7 +38,7 @@ DEPENDS += "openssl-native util-linux-native"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
> +KCONF_BSP_AUDIT_LEVEL = "1"
>
>  KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
> --
> 2.19.1
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000012af3205ac3af1c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Thi=
s should=C2=A0have been tagged with &quot;v2&quot;</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 6, 2020 at 3:57 PM Bruce A=
shfield via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mai=
lto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a=
>&gt;<br>
<br>
Enable the kernel-yocto bbclass to use enhanced capabilities from<br>
the kern-tools <a href=3D"http://symbol_why.pl" rel=3D"noreferrer" target=
=3D"_blank">symbol_why.pl</a>.<br>
<br>
We bump the kern-tools SRCREV to pickup the reworking of symbol_why,<br>
which uses Kconfiglib to provide analysis on configuration values.<br>
<br>
This is useful for debugging why a symbol specified in a fragment<br>
did not end up in the final .config.<br>
<br>
We introduce two ways to interact with the new symbol_why:<br>
<br>
=C2=A01) a replacement of the existing kconf_check script<br>
=C2=A02) a dedicated task that is explicitly invoked to dump details<br>
=C2=A0 =C2=A0 on the configuration.<br>
<br>
The kconf_check replacement is transparent to the user, and is<br>
run in exactly the same way as it was previously. But we get better<br>
output and more detailed diagnostics if there are symbols that<br>
don&#39;t make it into the final .config<br>
<br>
The second way to interact with symbol why is via the new task<br>
do_config_analysis. This is invoked like any other task, and by<br>
default will provide a full configuration analysis and point the<br>
user at files to look at for details.<br>
<br>
If a more targetted analysis is desired, then specific symbols<br>
can be set in the CONFIG_ANALYSIS variable. When this variable<br>
is set, the task will only run for the given symbols and provide<br>
per-variable links to the user. This variable can be set like<br>
any other, including specification in the local.conf:<br>
<br>
=C2=A0 CONFIG_ANALYSIS_pn-linux-yocto-dev =3D &#39;NF_CONNTRACK LOCALVERSI=
ON&#39;<br>
<br>
Which produces output as follows:<br>
<br>
=C2=A0 =C2=A0WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484=
ed37-r0<br>
=C2=A0 =C2=A0do_config_analysis: Configuration analysis executed, see: tmp=
/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8f=
c484ed37-r0/NF_CONNTRACK-config-analysis.txt for details<br>
=C2=A0 =C2=A0WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484=
ed37-r0<br>
=C2=A0 =C2=A0do_config_analysis: Configuration audit executed, see: tmp/wo=
rk/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc48=
4ed37-r0/NF_CONNTRACK-config-audit.txt for details<br>
=C2=A0 =C2=A0WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484=
ed37-r0<br>
=C2=A0 =C2=A0do_config_analysis: Configuration analysis executed, see: tmp=
/work/qemuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8f=
c484ed37-r0/LOCALVERSION-config-analysis.txt for details<br>
=C2=A0 =C2=A0WARNING: linux-yocto-dev-5.8-rc++gitAUTOINC+d22beb8f8a_8fc484=
ed37-r0<br>
=C2=A0 =C2=A0do_config_analysis: Configuration audit executed, see: work/q=
emuarm64-poky-linux/linux-yocto-dev/5.8-rc++gitAUTOINC+d22beb8f8a_8fc484ed3=
7-r0/LOCALVERSION-config-audit.txt for details<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
<br>
v2: - removed the bb.debug line that RP had to fixup previously<br>
=C2=A0 =C2=A0 - fixed the detection of the .kernel-meta directory. This fi=
xes the<br>
=C2=A0 =C2=A0 =C2=A0 meta-arm build issue, and should also help meta-intel=
.<br>
<br>
Note: you&#39;ll actually get a configuration warning out of meta-arm when=
<br>
you build now, but the warning is accurate and isn&#39;t a problem (an<br>
option goes from =3Dm to =3Dy).<br>
<br>
Bruce<br>
<br>
=C2=A0meta/classes/kernel-yocto.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 159 ++++++++++++++----<br>
=C2=A0.../kern-tools/<a href=3D"http://kern-tools-native_git.bb" rel=3D"no=
referrer" target=3D"_blank">kern-tools-native_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 |=C2=A0 =C2=
=
=A02 +-<br>
=C2=A03 files changed, 128 insertions(+), 35 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto=
.bbclass<br>
index 70818cc01c..77849a28c9 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -405,6 +405,67 @@ do_kernel_configme() {<br>
=C2=A0}<br>
<br>
=C2=A0addtask kernel_configme before do_configure after do_patch<br>
+addtask config_analysis<br>
+<br>
+do_config_analysis[depends] =3D &quot;virtual/kernel:do_configure&quot;<b=
r>
+do_config_analysis[depends] +=3D &quot;kern-tools-native:do_populate_sysr=
oot&quot;<br>
+<br>
+CONFIG_AUDIT_FILE ?=3D &quot;${WORKDIR}/config-audit.txt&quot;<br>
+CONFIG_ANALYSIS_FILE ?=3D &quot;${WORKDIR}/config-analysis.txt&quot;<br>
+<br>
+python do_config_analysis() {<br>
+=C2=A0 =C2=A0 import re, string, sys, subprocess<br>
+<br>
+=C2=A0 =C2=A0 s =3D d.getVar(&#39;S&#39;)<br>
+<br>
+=C2=A0 =C2=A0 env =3D os.environ.copy()<br>
+=C2=A0 =C2=A0 env[&#39;PATH&#39;] =3D &quot;%s:%s%s&quot; % (d.getVar(&#3=
9;PATH&#39;), s, &quot;/scripts/util/&quot;)<br>
+=C2=A0 =C2=A0 env[&#39;LD&#39;] =3D d.getVar(&#39;KERNEL_LD&#39;)<br>
+=C2=A0 =C2=A0 env[&#39;CC&#39;] =3D d.getVar(&#39;KERNEL_CC&#39;)<br>
+=C2=A0 =C2=A0 env[&#39;ARCH&#39;] =3D d.getVar(&#39;ARCH&#39;)<br>
+=C2=A0 =C2=A0 env[&#39;srctree&#39;] =3D s<br>
+<br>
+=C2=A0 =C2=A0 # read specific symbols from the kernel recipe or from loca=
l.conf<br>
+=C2=A0 =C2=A0 # i.e.: CONFIG_ANALYSIS_pn-linux-yocto-dev =3D &#39;NF_CONN=
TRACK LOCALVERSION&#39;<br>
+=C2=A0 =C2=A0 config =3D d.getVar( &#39;CONFIG_ANALYSIS&#39; )<br>
+=C2=A0 =C2=A0 if not config:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D [ &quot;&quot; ]<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D config.split()<br>
+<br>
+=C2=A0 =C2=A0 for c in config:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for action in [&quot;analysis&quot;,&quot;aud=
it&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if action =3D=3D &quot;analysis=
&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ana=
lysis =3D subprocess.check_output([&#39;symbol_why.py&#39;, &#39;--dotconfi=
g&#39;,=C2=A0 &#39;{}&#39;.format( d.getVar(&#39;B&#39;) + &#39;/.config&#3=
9; ), &#39;--blame&#39;, c], cwd=3Ds, env=3Denv ).decode(&#39;utf-8&#39;)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess=
.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
fatal( &quot;config analysis failed: %s&quot; % e.output.decode(&#39;utf-8&=
#39;))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D d.get=
Var( &#39;CONFIG_ANALYSIS_FILE&#39; )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if action =3D=3D &quot;audit&qu=
ot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ana=
lysis =3D subprocess.check_output([&#39;symbol_why.py&#39;, &#39;--dotconfi=
g&#39;,=C2=A0 &#39;{}&#39;.format( d.getVar(&#39;B&#39;) + &#39;/.config&#3=
9; ), &#39;--summary&#39;, &#39;--extended&#39;, &#39;--sanity&#39;, c], cw=
d=3Ds, env=3Denv ).decode(&#39;utf-8&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess=
.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
fatal( &quot;config analysis failed: %s&quot; % e.output.decode(&#39;utf-8&=
#39;))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D d.get=
Var( &#39;CONFIG_AUDIT_FILE&#39; )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outdir =3D os.pat=
h.dirname( outfile )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outname =3D os.pa=
th.basename( outfile )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D outdi=
r + &#39;/&#39;+ c + &#39;-&#39; + outname<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if config and os.path.isfile(ou=
tfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(outfile=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(outfile, &#39;w+&#39;=
) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write( analysis=
 )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn( &quot;Configuration {}=
 executed, see: {} for details&quot;.format(action,outfile ))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn( analysis=
 )<br>
+}<br>
<br>
=C2=A0python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0import re, string, sys, subprocess<br>
@@ -414,57 +475,89 @@ python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0# meta-series for processing<br>
=C2=A0 =C2=A0 =C2=A0kmeta =3D d.getVar(&quot;KMETA&quot;) or &quot;meta&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0if not os.path.exists(kmeta):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kmeta =3D &quot;.&quot; + kmeta<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kmeta =3D subprocess.check_output([&#39;kgit&=
#39;, &#39;--meta&#39;]).decode(&#39;utf-8&#39;).rstrip()<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D d.getVar(&#39;S&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0env =3D os.environ.copy()<br>
=C2=A0 =C2=A0 =C2=A0env[&#39;PATH&#39;] =3D &quot;%s:%s%s&quot; % (d.getVa=
r(&#39;PATH&#39;), s, &quot;/scripts/util/&quot;)<br>
-=C2=A0 =C2=A0 env[&#39;LD&#39;] =3D &quot;${KERNEL_LD}&quot;<br>
+=C2=A0 =C2=A0 env[&#39;LD&#39;] =3D d.getVar(&#39;KERNEL_LD&#39;)<br>
+=C2=A0 =C2=A0 env[&#39;CC&#39;] =3D d.getVar(&#39;KERNEL_CC&#39;)<br>
+=C2=A0 =C2=A0 env[&#39;ARCH&#39;] =3D d.getVar(&#39;ARCH&#39;)<br>
+=C2=A0 =C2=A0 env[&#39;srctree&#39;] =3D s<br>
<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configs =3D subprocess.check_output([&#3=
9;scc&#39;, &#39;--configs&#39;, &#39;-o&#39;, s + &#39;/.kernel-meta&#39;]=
, env=3Denv).decode(&#39;utf-8&#39;)<br>
=C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal( &quot;Cannot gather config fra=
gments for audit: %s&quot; % e.output.decode(&quot;utf-8&quot;) )<br>
<br>
-=C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call([&#39;kconf_check&#39;,=
 &#39;--report&#39;, &#39;-o&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;%s/%s/cfg&#3=
9; % (s, kmeta), d.getVar(&#39;B&#39;) + &#39;/.config&#39;, s, configs], c=
wd=3Ds, env=3Denv)<br>
-=C2=A0 =C2=A0 except subprocess.CalledProcessError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The configuration gathering can return diff=
erent exit codes, but<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we interpret them based on the KCONF_AUDIT_=
LEVEL variable, so we catch<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # everything here, and let the run continue.<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-<br>
=C2=A0 =C2=A0 =C2=A0config_check_visibility =3D int(d.getVar(&quot;KCONF_A=
UDIT_LEVEL&quot;) or 0)<br>
=C2=A0 =C2=A0 =C2=A0bsp_check_visibility =3D int(d.getVar(&quot;KCONF_BSP_=
AUDIT_LEVEL&quot;) or 0)<br>
<br>
-=C2=A0 =C2=A0 # if config check visibility is non-zero, report dropped co=
nfiguration values<br>
-=C2=A0 =C2=A0 mismatch_file =3D d.expand(&quot;${S}/%s/cfg/mismatch.txt&q=
uot; % kmeta)<br>
-=C2=A0 =C2=A0 if os.path.exists(mismatch_file):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if config_check_visibility:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (mismatch_file, &quot=
;r&quot;) as myfile:<br>
+=C2=A0 =C2=A0 # if config check visibility is &quot;1&quot;, that&#39;s t=
he lowest level of audit. So<br>
+=C2=A0 =C2=A0 # we add the --classify option to the run, since classifica=
tion will<br>
+=C2=A0 =C2=A0 # streamline the output to only report options that could b=
e boot issues,<br>
+=C2=A0 =C2=A0 # or are otherwise required for proper operation.<br>
+=C2=A0 =C2=A0 extra_params =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 if config_check_visibility =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0extra_params =3D &quot;--classify&quot;<br>
+<br>
+=C2=A0 =C2=A0 # category #1: mismatches<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 analysis =3D subprocess.check_output([&#39;sy=
mbol_why.py&#39;, &#39;--dotconfig&#39;,=C2=A0 &#39;{}&#39;.format( d.getVa=
r(&#39;B&#39;) + &#39;/.config&#39; ), &#39;--mismatches&#39;, extra_params=
], cwd=3Ds, env=3Denv ).decode(&#39;utf-8&#39;)<br>
+=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal( &quot;config analysis failed: %s&qu=
ot; % e.output.decode(&#39;utf-8&#39;))<br>
+<br>
+=C2=A0 =C2=A0 if analysis:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D &quot;{}/{}/cfg/mismatch.txt&quot=
;.format( s, kmeta )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(outfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(outfile)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(outfile, &#39;w+&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write( analysis )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if config_check_visibility and os.stat(outfil=
e).st_size &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (outfile, &quot;r&quo=
t;) as myfile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0results =3D =
myfile.read()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn( &qu=
ot;[kernel config]: specified values did not make it into the kernel&#39;s =
final configuration:\n\n%s&quot; % results)<br>
<br>
-=C2=A0 =C2=A0 if bsp_check_visibility:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid_file =3D d.expand(&quot;${S}/%s/cfg/i=
nvalid.cfg&quot; % kmeta)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(invalid_file) and os.stat(i=
nvalid_file).st_size &gt; 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (invalid_file, &quot;=
r&quot;) as myfile:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D myfil=
e.read()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn( &quot;[k=
ernel config]: This BSP sets config options that are not offered anywhere w=
ithin this kernel:\n\n%s&quot; % results)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 errors_file =3D d.expand(&quot;${S}/%s/cfg/fr=
agment_errors.txt&quot; % kmeta)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(errors_file) and os.stat(er=
rors_file).st_size &gt; 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (errors_file, &quot;r=
&quot;) as myfile:<br>
+=C2=A0 =C2=A0 # category #2: invalid fragment elements<br>
+=C2=A0 =C2=A0 extra_params =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 if bsp_check_visibility &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_params =3D &quot;--strict&quot;<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 analysis =3D subprocess.check_output([&#39;sy=
mbol_why.py&#39;, &#39;--dotconfig&#39;,=C2=A0 &#39;{}&#39;.format( d.getVa=
r(&#39;B&#39;) + &#39;/.config&#39; ), &#39;--invalid&#39;, extra_params], =
cwd=3Ds, env=3Denv ).decode(&#39;utf-8&#39;)<br>
+=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal( &quot;config analysis failed: %s&qu=
ot; % e.output.decode(&#39;utf-8&#39;))<br>
+<br>
+=C2=A0 =C2=A0 if analysis:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D &quot;{}/{}/cfg/invalid.txt&quot;=
.format(s,kmeta)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(outfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(outfile)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(outfile, &#39;w+&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write( analysis )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bsp_check_visibility and os.stat(outfile).=
st_size &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (outfile, &quot;r&quo=
t;) as myfile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D myfile=
.read()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn( &quot;[ke=
rnel config]: This BSP contains fragments with errors:\n\n%s&quot; % result=
s)<br>
-<br>
-=C2=A0 =C2=A0 # if the audit level is greater than two, we report if a fr=
agment has overriden<br>
-=C2=A0 =C2=A0 # a value from a base fragment. This is really only used fo=
r new kernel introduction<br>
-=C2=A0 =C2=A0 if bsp_check_visibility &gt; 2:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 redefinition_file =3D d.expand(&quot;${S}/%s/=
cfg/redefinition.txt&quot; % kmeta)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(redefinition_file) and os.s=
tat(redefinition_file).st_size &gt; 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (redefinition_file, &=
quot;r&quot;) as myfile:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn( &quot;[ke=
rnel config]: This BSP contains fragments with warnings:\n\n%s&quot; % resu=
lts)<br>
+<br>
+=C2=A0 =C2=A0 # category #3: redefined options (this is pretty verbose an=
d is debug only)<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 analysis =3D subprocess.check_output([&#39;sy=
mbol_why.py&#39;, &#39;--dotconfig&#39;,=C2=A0 &#39;{}&#39;.format( d.getVa=
r(&#39;B&#39;) + &#39;/.config&#39; ), &#39;--sanity&#39;], cwd=3Ds, env=3D=
env ).decode(&#39;utf-8&#39;)<br>
+=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal( &quot;config analysis failed: %s&qu=
ot; % e.output.decode(&#39;utf-8&#39;))<br>
+<br>
+=C2=A0 =C2=A0 if analysis:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D &quot;{}/{}/cfg/redefinition.txt&=
quot;.format(s,kmeta)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(outfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(outfile)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(outfile, &#39;w+&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write( analysis )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the audit level is greater than two, we =
report if a fragment has overriden<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # a value from a base fragment. This is reall=
y only used for new kernel introduction<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bsp_check_visibility &gt; 2 and os.stat(ou=
tfile).st_size &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (outfile, &quot;r&quo=
t;) as myfile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0results =3D =
myfile.read()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn( &qu=
ot;[kernel config]: This BSP has configuration options defined in more than=
 one config, with differing values:\n\n%s&quot; % results)<br>
=C2=A0}<br>
diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-n=
ative_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb=
</a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br=
>
index 4f1af731d6..4402e14754 100644<br>
--- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br=
>
+++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br=
>
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://tools/kgit;beginline=3D5=
;endline=3D9;md5=3D9c30e971d435e249<br>
<br>
=C2=A0DEPENDS =3D &quot;git-native&quot;<br>
<br>
-SRCREV =3D &quot;c66833e1caac25279a5052fceb13213f5e4f79f9&quot;<br>
+SRCREV =3D &quot;8b6fa727013daba5e8d72e5fc61d80caed944c6a&quot;<br>
=C2=A0PR =3D &quot;r12&quot;<br>
=C2=A0PV =3D &quot;0.2+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a> b/meta/recip=
es-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">linux-yocto_5.4.bb</a><br>
index 7904850317..3f9e6aa480 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
@@ -38,7 +38,7 @@ DEPENDS +=3D &quot;openssl-native util-linux-native&quot=
;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
+KCONF_BSP_AUDIT_LEVEL =3D &quot;1&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarmv5 =3D &quot;versatile-pb.dtb&quot;<br>
<br>
-- <br>
2.19.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--00000000000012af3205ac3af1c8--
