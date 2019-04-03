Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA657D29B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 05:29:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c1so5873681wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 22:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dI9bX6cpafmxSYAPvN/n+cTmRK1Ez5WoWAAeUV3bs/E=;
	b=J8fYPUvYB0YS5ZCw7OfAO2x7m74N6mqfXkny6va0bLc+tBxrVJKbCUzGw2+AixqKaA
	IVehKNWyig8X7JzNlV/LRNW07a5uYXyd1pYH/HVGStfIoSgjeI8dQvDdIAKIH8KucTEp
	83a2zqHKvGIEhK+lGieKSBOU9nA79oMF0wILzG1YOM7nXcRRY8A/EMHiGiif3kvtQZZh
	qtrKhwh5JajVxRyWFtnVBIFucn9jiwmsB+XVWUbIn7W4DHJkgd6YrXdhDSgKbD0Am6ao
	2jOg+5gfPXAs1PXJWtG88P+VczqcvmpZqBt6RMk02GYGcYhx8cPj2ntLhUV6YeMbr97o
	NMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dI9bX6cpafmxSYAPvN/n+cTmRK1Ez5WoWAAeUV3bs/E=;
	b=TtWfj4bf7xr6ge5TH8+NvFRY2B3fTQDwMHTnXr8M3CsUd+KdK9zRieQV5/eS3Le5or
	d1+PVw0GB0rUuw39Jfx+uZI5UAsUQUVTGRAS3a8mPpJnGY+UmyoBXkOOofTyb3AriouE
	tfhCOhp0D5mIvtOYO8tOYqPwajUKotSnMCVJ1G3cwbltACqQSgu+bUszbPqHy/O/+DMw
	KgJ5VZBq0GYjh/pqRJKsAmXswJL+Qmc4isve+a7ta3cWUyLjS69QMtY5PKX6Jpx3U5b9
	4PJgpQn9Ak/+bHbcC1B0Vfh+sTlt5MqkLo+0T+E0cPzZKhui64KNBpU6LDQIM9jitnMD
	RkVw==
X-Gm-Message-State: APjAAAVyzgQ2qwaWZRniZdgAOWUKwM6k7FFaIXOebKlMXlrhgaFMn7+b
	FrV2FKRXzYRz155i1M3iysk+jELUef5svsUabZMEnv9a
X-Google-Smtp-Source: APXvYqwwQbxjnSX+gyamANf5oeB/4LQywh/0YCyi9SFNmrY6U7TDTdma6wgpkntngzJHvRn6E43SeWwbdmfie+9XI08=
X-Received: by 2002:a1c:6587:: with SMTP id z129mr548484wmb.84.1554269394331; 
	Tue, 02 Apr 2019 22:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190402082153.3630-1-nathan@nathanrossi.com>
	<20190402082153.3630-2-nathan@nathanrossi.com>
In-Reply-To: <20190402082153.3630-2-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 3 Apr 2019 15:29:43 +1000
Message-ID: <CA+aJhH1hNNTpRvUEL8bscKkW2SXgmoBtMQ+13e-hQxb9PuTFvA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] ccmake.bbclass: Create a cml1 style class for the CMake curses UI
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
X-List-Received-Date: Wed, 03 Apr 2019 05:29:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2019 at 18:22, Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> The ccmake bbclass implements two tasks. The first task 'ccmake'
> preserves the configured state of CMakeCache.txt (generated from the
> configure task) and invokes the 'ccmake' program within a oe_terminal
> execution. The user can then review, select and modify configuration
> options and once satisfied with the configuration exit ccmake. Once
> ccmake has exited the build can be run and the updated configuration
> should be reflected in the output build.
>
> The ccmake bbclass has a second task 'ccmake_diffconfig' to compute the
> differences in configuration which was modified by ccmake. Since there
> are many ways to persist the configuration changes within recipes and
> layer configuration, the differences are emitted as a bitbake recipe
> fragment (configuration.inc) using EXTRA_OECMAKE as well as a CMake
> script file which can be used as a input to cmake via the '-C' argument.
> Both files are generated in the WORKDIR of the build and the paths to
> the files are written as output from the build. It is then up to the
> user to take this configuration and apply it to the desired location.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/classes/ccmake.bbclass | 97 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 meta/classes/ccmake.bbclass
>
> diff --git a/meta/classes/ccmake.bbclass b/meta/classes/ccmake.bbclass
> new file mode 100644
> index 0000000000..933e122b35
> --- /dev/null
> +++ b/meta/classes/ccmake.bbclass
> @@ -0,0 +1,97 @@
> +inherit terminal
> +
> +python do_ccmake() {
> +    import shutil
> +
> +    # copy current config for diffing
> +    config = os.path.join(d.getVar("B"), "CMakeCache.txt")
> +    if os.path.exists(config):
> +        shutil.copy(config, config + ".orig")
> +
> +    oe_terminal(d.expand("ccmake ${OECMAKE_GENERATOR_ARGS} ${OECMAKE_SOURCEPATH} -Wno-dev"),
> +        d.getVar("PN") + " - ccmake", d)
> +
> +    if os.path.exists(config) and os.path.exists(config + ".orig"):
> +        if bb.utils.md5_file(config) != bb.utils.md5_file(config + ".orig"):
> +            # the cmake class uses cmake --build, which will by default
> +            # regenerate configuration, simply mark the compile step as tainted
> +            # to ensure it is re-run
> +            bb.note("Configuration changed, recompile will be forced")
> +            bb.build.write_taint('do_compile', d)
> +
> +}
> +do_ccmake[depends] += "cmake-native:do_populate_sysroot"
> +do_ccmake[nostamp] = "1"
> +do_ccmake[dirs] = "${B}"
> +addtask ccmake after do_configure
> +
> +def cmake_parse_config_cache(path):
> +    with open(path, "r") as f:
> +        for i in f:
> +            i = i.rstrip("\n")
> +            if len(i) == 0 or i.startswith("//") or i.startswith("#"):
> +                continue # empty or comment
> +            key, value = i.split("=", 1)
> +            key, keytype = key.split(":")
> +            if keytype in ["INTERNAL", "STATIC"]:
> +                continue # skip internal and static config options
> +            yield key, keytype, value
> +
> +def cmake_diff_config_vars(a, b):
> +    removed, added = [], []
> +
> +    for ak, akt, av in a:
> +        found = False
> +        for bk, bkt, bv in b:
> +            if bk == ak:
> +                found = True
> +                if bkt != akt or bv != av: # changed
> +                    removed.append((ak, akt, av))
> +                    added.append((bk, bkt, bv))
> +                break
> +        # remove any missing from b
> +        if not found:
> +            removed.append((ak, akt, av))
> +
> +    # add any missing from a
> +    for bk, bkt, bv in b:
> +        if not any(bk == ak for ak, akt, av in a):
> +            added.append((bk, bkt, bv))
> +
> +    return removed, added
> +
> +python do_ccmake_diffconfig() {
> +    import shutil
> +    config = os.path.join(d.getVar("B"), "CMakeCache.txt")
> +    if os.path.exists(config) and os.path.exists(config + ".orig"):
> +        if bb.utils.md5_file(config) != bb.utils.md5_file(config + ".orig"):
> +            # scan the changed options
> +            old = list(cmake_parse_config_cache(config + ".orig"))
> +            new = list(cmake_parse_config_cache(config))
> +            _, added = cmake_diff_config_vars(old, new)
> +
> +            if len(added) != 0:
> +                with open(d.expand("${WORKDIR}/configuration.inc"), "w") as f:
> +                    f.write("EXTRA_OECMAKE += \" \\\n")
> +                    for k, kt, v in added:
> +                        escaped = v if " " not in v else "\"{0}\"".format(v)
> +                        f.write("    -D{0}:{1}={2} \\\n".format(k, kt, escaped))
> +                    f.write("    \"\n")
> +                bb.plain("Configuration recipe fragment written to: {0}".format(d.expand("${WORKDIR}/configuration.inc")))
> +
> +                with open(d.expand("${WORKDIR}/site-file.cmake"), "w") as f:
> +                    for k, kt, v in added:
> +                        f.write("SET({0} \"{1}\" CACHE {2} "")\n".format(k, v, kt))
> +                bb.plain("Configuration cmake fragment written to: {0}".format(d.expand("${WORKDIR}/site-file.cmake")))
> +
> +                # restore the original config
> +                shutil.copy(config + ".orig", config)
> +            else:
> +                bb.plain("No configuration differences, skipping configuration fragment generation.")
> +    else:
> +        bb.fatal("No config files found. Did you run ccmake?\n{0}".format(e))

I've just noticed I had not cleaned up the debugging format of an
exception here, I will send a v2 with this fixed up.

Regards,
Nathan

> +}
> +do_ccmake_diffconfig[nostamp] = "1"
> +do_ccmake_diffconfig[dirs] = "${B}"
> +addtask ccmake_diffconfig
> +
> ---
> 2.20.1

