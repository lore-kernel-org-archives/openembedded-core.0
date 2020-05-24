Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web10.11207.1590313263166849519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 02:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ab6FIavO;
 spf=pass (domain: konsulko.com, ip: 209.85.167.196, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f196.google.com with SMTP id l6so13594151oic.9
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 02:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BjC0mW2gtDelxQ89rETxk8zXg0JM0p5JuiKha6WnXGg=;
        b=ab6FIavOmfwpsPJOiKhs6/O47U9FHjUElTw0DeRhMpB7LUEdJtkHPUPpdhA/T0GzwI
         +WQ2iuW7Plyf79rs6N1FWKA/KmKte6J0fjATEIqm2Guua/5mJe7UwcniGC+Ricvd3Esl
         8J1ua3E+r7x5muZJPK8nkmWwxqb7BXT/AdLYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BjC0mW2gtDelxQ89rETxk8zXg0JM0p5JuiKha6WnXGg=;
        b=IG2zRswR6XSbXvXlcZUmn5+qZMGMbMYX+yX+WSW5Q+inNsIw/iN9Em67Iz4K7AWU1h
         AygQKRJXog79uDCZuvybyGcVsUJ1KLYrpUmyY65wvikPAoL+bi6oHBBVnqHW9qPMa6hC
         HFcvMNpAkJMlE8Sx3vI+W458U5Dd9aBJxAh+4P9x9EGVexle/rbjcV1tESHCggUX3DlR
         2S/PONbNS7ToGO1F37n9c2//L6muT+IhXolT/Ycej9FcaRZfv6xNo4YbnYy7abuHryuF
         NqeUgptTuqXJbKpjlbsYWoYfISNPsoybsTOEqM2+4NxsGzSiIMkKLhEJsGLEwl85Nkkf
         tZFQ==
X-Gm-Message-State: AOAM530bwN0rCNZngxK/XXJqNF3gJGo3cYt71dtfi+KNa6yu9rLPnE2a
	Fz+9VyVUx1CMn+eB/b1y0MifOol217dS2HYiLR1vcw==
X-Google-Smtp-Source: ABdhPJyCA8yiAYvuHeurEoKU7OqB0ivUUAFaaoHmftW2Wq/ZZ3hg+IzXNxecZJjfGN/WXEXfK8Hc7cPuHJ3JuE3cf9Y=
X-Received: by 2002:aca:ea46:: with SMTP id i67mr7575481oih.152.1590313262328;
 Sun, 24 May 2020 02:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200523202710.1302479-1-gzatko@gmail.com>
In-Reply-To: <20200523202710.1302479-1-gzatko@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Sun, 24 May 2020 10:40:51 +0100
Message-ID: <CAM9ZRVtZ92MP0m4e_ZhY-hB711ckKvrfEQMbVaaOv_5UTpE++g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
To: Gregor Zatko <gzatko@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 May 2020 at 21:27, Gregor Zatko <gzatko@gmail.com> wrote:
>
> 'inherit' directive may not be used in conf files as it's supposed
> to be used for the inheritance of classes.
> Correct form in conf file is INHERIT.
>
> This commit adds:
> - a sanity check to find whether the wrong case exists
> - fail the build if so
> - tell user about the difference in directives
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5426
>
> Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 48 +++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 21 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 292c5591dd..b6b3d0c71d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -25,7 +25,7 @@ def sanity_conf_update(fn, lines, version_var_name, new_version):
>      with open(fn, "w") as f:
>          f.write(''.join(lines))
>
> -# Functions added to this variable MUST throw a NotImplementedError exception unless
> +# Functions added to this variable MUST throw a NotImplementedError exception unless
>  # they successfully changed the config version in the config file. Exceptions
>  # are used since exec_func doesn't handle return values.
>  BBLAYERS_CONF_UPDATE_FUNCS += " \
> @@ -42,13 +42,13 @@ python oecore_update_localconf() {
>      current_conf  = d.getVar('CONF_VERSION')
>      conf_version =  d.getVar('LOCALCONF_VERSION')
>
> -    failmsg = """Your version of local.conf was generated from an older/newer version of
> -local.conf.sample and there have been updates made to this file. Please compare the two
> +    failmsg = """Your version of local.conf was generated from an older/newer version of
> +local.conf.sample and there have been updates made to this file. Please compare the two
>  files and merge any changes before continuing.
>
>  Matching the version numbers will remove this message.
>
> -\"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\"
> +\"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\"
>
>  is a good way to visualise the changes."""
>      failmsg = d.expand(failmsg)
> @@ -62,13 +62,13 @@ python oecore_update_siteconf() {
>      current_sconf = d.getVar('SCONF_VERSION')
>      sconf_version = d.getVar('SITE_CONF_VERSION')
>
> -    failmsg = """Your version of site.conf was generated from an older version of
> -site.conf.sample and there have been updates made to this file. Please compare the two
> +    failmsg = """Your version of site.conf was generated from an older version of
> +site.conf.sample and there have been updates made to this file. Please compare the two
>  files and merge any changes before continuing.
>
>  Matching the version numbers will remove this message.
>
> -\"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\"
> +\"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\"
>
>  is a good way to visualise the changes."""
>      failmsg = d.expand(failmsg)
> @@ -85,7 +85,7 @@ python oecore_update_bblayers() {
>
>      failmsg = """Your version of bblayers.conf has the wrong LCONF_VERSION (has ${LCONF_VERSION}, expecting ${LAYER_CONF_VERSION}).
>  Please compare your file against bblayers.conf.sample and merge any changes before continuing.
> -"${SANITY_DIFF_TOOL} conf/bblayers.conf ${SANITY_BBLAYERCONF_SAMPLE}"
> +"${SANITY_DIFF_TOOL} conf/bblayers.conf ${SANITY_BBLAYERCONF_SAMPLE}"
>
>  is a good way to visualise the changes."""
>      failmsg = d.expand(failmsg)
> @@ -182,7 +182,7 @@ def raise_sanity_error(msg, d, network_error=False):
>      bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
>      Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>      Following is the list of potential problems / advisories:
> -
> +
>      %s""" % msg)
>
>  # Check flags associated with a tuning.
> @@ -538,7 +538,7 @@ def check_wsl(d):
>  def check_gcc_version(sanity_data):
>      from distutils.version import LooseVersion
>      import subprocess
> -
> +
>      build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
>      if build_cc.strip() == "gcc":
>          if LooseVersion(version) < LooseVersion("6.0"):
> @@ -561,7 +561,7 @@ def check_tar_version(sanity_data):
>      return None
>
>  # We use git parameters and functionality only found in 1.7.8 or later
> -# The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162
> +# The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162
>  # The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
>  def check_git_version(sanity_data):
>      from distutils.version import LooseVersion
> @@ -644,7 +644,7 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
>
>  def check_sanity_version_change(status, d):
>      # Sanity checks to be done when SANITY_VERSION or NATIVELSBSTRING changes
> -    # In other words, these tests run once in a given build directory and then
> +    # In other words, these tests run once in a given build directory and then
>      # never again until the sanity version or host distrubution id/version changes.
>
>      # Check the python install is complete. Examples that are often removed in
> @@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
>      if "." in paths or "./" in paths or "" in paths:
>          status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
>
> +    # Check whether 'inherit' directive is found (used for a class to inherit)
> +    # in conf file it's supposed to be uppercase INHERIT
> +    inherit = d.getVar('inherit')
> +    if inherit:
> +        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in classes and recipes only to inherit of bbclasses. Here INHERIT should be used.\n")
> +
>      # Check that the DISTRO is valid, if set
>      # need to take into account DISTRO renaming DISTRO
>      distro = d.getVar('DISTRO')
> @@ -796,7 +802,7 @@ def check_sanity_everybuild(status, d):
>          if d.getVar(v).startswith("~"):
>              status.addresult("%s uses ~ but Bitbake will not expand this, use an absolute path or variables." % v)
>
> -    # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't
> +    # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't
>      # set, since so much relies on it being set.
>      dldir = d.getVar('DL_DIR')
>      if not dldir:
> @@ -966,32 +972,32 @@ def check_sanity(sanity_data):
>                      last_nativelsbstr = line.split()[1]
>
>      check_sanity_everybuild(status, sanity_data)
> -
> +
>      sanity_version = int(sanity_data.getVar('SANITY_VERSION') or 1)
>      network_error = False
>      # NATIVELSBSTRING var may have been overridden with "universal", so
>      # get actual host distribution id and version
>      nativelsbstr = lsb_distro_identifier(sanity_data)
> -    if last_sanity_version < sanity_version or last_nativelsbstr != nativelsbstr:
> +    if last_sanity_version < sanity_version or last_nativelsbstr != nativelsbstr:
>          check_sanity_version_change(status, sanity_data)
>          status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
> -    else:
> +    else:
>          if last_sstate_dir != sstate_dir:
>              status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
>
>      if os.path.exists(os.path.dirname(sanityverfile)) and not status.messages:
>          with open(sanityverfile, 'w') as f:
> -            f.write("SANITY_VERSION %s\n" % sanity_version)
> -            f.write("TMPDIR %s\n" % tmpdir)
> -            f.write("SSTATE_DIR %s\n" % sstate_dir)
> -            f.write("NATIVELSBSTRING %s\n" % nativelsbstr)
> +            f.write("SANITY_VERSION %s\n" % sanity_version)
> +            f.write("TMPDIR %s\n" % tmpdir)
> +            f.write("SSTATE_DIR %s\n" % sstate_dir)
> +            f.write("NATIVELSBSTRING %s\n" % nativelsbstr)
>
>      sanity_handle_abichanges(status, sanity_data)
>
>      if status.messages != "":
>          raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
>
> -# Create a copy of the datastore and finalise it to ensure appends and
> +# Create a copy of the datastore and finalise it to ensure appends and
>  # overrides are set - the datastore has yet to be finalised at ConfigParsed
>  def copy_data(e):
>      sanity_data = bb.data.createCopy(e.data)

You seem to have lots of whitespace changes in this patch. Could you
strip those out so we can clearly see what the functional changes are
here?

If you want to fix up the whitespace that should be sent as a separate
follow-on patch.

Thanks,

-- 
Paul Barker
Konsulko Group
