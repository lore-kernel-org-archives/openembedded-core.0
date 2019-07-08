Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DB3117D41C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 10:05:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p74so12065858wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jPNVKPStvhLBEwj2L4FdnygBXN8kbLyh2+ZJgFg19+0=;
	b=Mwi+Zgux0QuZZid5XTgScUJjfUDFIwsFiqxqep3V9Dv1SyPHmiYrQVgIfx7TVha2BL
	1cGQf/McBrxP0vy/vOCTLD8++qTU4sEAecyxuRWCcOYplVsFZfi+jtFUDcYGvChSpxGh
	hTtzhxzfifq6f9l/WrH3kexpec/DLc9XEZgDF40ccZTcSzbut9/DMGwc2vQjRdP6bOvM
	G5ssvQMcmq+ldXFxFej+uD8eyv4uXr1XKrtJgE7q67LyHbMvRKgMC1eWFjVivcxVizVE
	uLIlzveuVpVxWY2dMMVPlK6t+wPuI1QDAEBjuWaerlUOYSrQQI5BL4C92xvuuH8KoOwy
	/nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jPNVKPStvhLBEwj2L4FdnygBXN8kbLyh2+ZJgFg19+0=;
	b=ZUvpCqkpGmlXfv/bDwBxClppNr/ZuVDQV4eO4mWCwYvXD08YalgDbuWHoU9xFt+m7p
	G8H9cZDcS8/W+R5vwzGTKznrMGK9IePU1g0JcNV2/tZWeZECZSLNbDdCOkteI0iuqG/K
	OVjYfFyRT13VwqaH7SpO7TDix5EhH374YUa41OvLsDazqkzjBVRYUOn4gZ65m+8H1K/K
	xVE04Pf99f0iVxFcFcbqfwQFOibZIIwS1eJQ39ylEAJl7xYPZyIt4X3r7yGgfhoh61+w
	V9kMDg2zc5VRCy7/51BOm30W1Roo0M30nsXfK4vv0dpgdS7eky+ba+K3ppj4wI/uzVfs
	Ts9g==
X-Gm-Message-State: APjAAAX9ZYtjU+oPlcygyiw3znMIfcMASl+YpW7zyX3fdeDkO5hq481C
	6FwLY6kY1BcRQhkxynzdFXAdvGR9
X-Google-Smtp-Source: APXvYqys7wNG5mfjq/ksxLyWvCQBFM3qWgn58Bsq8pTP6qu26jAahCnmQ7HrKT7FRIaSiks0zAi+ag==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr15649345wmb.32.1562580339981; 
	Mon, 08 Jul 2019 03:05:39 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	u18sm15756628wmd.19.2019.07.08.03.05.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Jul 2019 03:05:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 10:05:35 +0000
Message-Id: <20190708100535.937-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [RFC][PATCH] icecc.bbclass: catch subprocess.CalledProcessError
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
X-List-Received-Date: Mon, 08 Jul 2019 10:05:40 -0000

* this might be related to:
  commit d2fcaeb153fdc3f8d7143ea823139f1537055ff1
  Author: Douglas Royds <douglas.royds@taitradio.com>
  Date:   Thu Dec 20 11:59:47 2018 +1300

    icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time

* it's still a bit unclear when and why this happends, but I'm seeing
  random tasks sometimes failing with:

WARNING: Exception during build_dependencies for set_icecc_env
WARNING: Error during finalise of /build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
ERROR: Traceback (most recent call last):
  File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
    return eval(source, ctx, locals)
  File "Var <set_icecc_env>", line 1, in <module>
  File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in icecc_get_and_check_tool
    link_path = icecc_get_tool_link(t, d)
  File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in icecc_get_tool_link
    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
  File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
    **kwargs).stdout
  File "/usr/lib/python3.6/subprocess.py", line 418, in run
    output=stdout, stderr=stderr)
subprocess.CalledProcessError: Command 'readlink -f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++' returned non-zero exit status 1.

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/build/bitbake/bin/bitbake-worker", line 239, in child
    the_data = bb_cache.loadDataFull(fn, appends)
  File "/build/bitbake/lib/bb/cache.py", line 327, in loadDataFull
    bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
  File "/build/bitbake/lib/bb/cache.py", line 340, in load_bbfile
    datastores = parse_recipe(bb_data, bbfile, appends, mc)
  File "/build/bitbake/lib/bb/cache.py", line 303, in parse_recipe
    bb_data = bb.parse.handle(bbfile, bb_data)
  File "/build/bitbake/lib/bb/parse/__init__.py", line 107, in handle
    return h['handle'](fn, data, include)
  File "/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 142, in handle
    return ast.multi_finalize(fn, d)
  File "/build/bitbake/lib/bb/parse/ast.py", line 386, in multi_finalize
    finalize(fn, d)
  File "/build/bitbake/lib/bb/parse/ast.py", line 351, in finalize
    bb.parse.siggen.finalise(fn, d, variant)
  File "/build/bitbake/lib/bb/siggen.py", line 147, in finalise
    taskdeps = self._build_data(fn, d)
  File "/build/bitbake/lib/bb/siggen.py", line 118, in _build_data
    tasklist, gendeps, lookupcache = bb.data.generate_dependencies(d)
  File "/build/bitbake/lib/bb/data.py", line 388, in generate_dependencies
    deps[dep], values[dep] = build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
  File "/build/bitbake/lib/bb/data.py", line 317, in build_dependencies
    value, parsedvar = d.getVarFlag(key, "_content", False, retparser=True)
  File "/build/bitbake/lib/bb/data_smart.py", line 802, in getVarFlag
    parser = self.expandWithRefs(value, cachename)
  File "/build/bitbake/lib/bb/data_smart.py", line 424, in expandWithRefs
    raise ExpansionError(varname, s, exc).with_traceback(tb) from exc
  File "/build/bitbake/lib/bb/data_smart.py", line 411, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/build/bitbake/lib/bb/data_smart.py", line 136, in python_sub
    value = utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d})
  File "/build/bitbake/lib/bb/utils.py", line 421, in better_eval
    return eval(source, ctx, locals)
  File "Var <set_icecc_env>", line 1, in <module>
  File "/build/oe-core/meta/classes/icecc.bbclass", line 287, in icecc_get_and_check_tool
    link_path = icecc_get_tool_link(t, d)
  File "/build/oe-core/meta/classes/icecc.bbclass", line 246, in icecc_get_tool_link
    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
  File "/usr/lib/python3.6/subprocess.py", line 336, in check_output
    **kwargs).stdout
  File "/usr/lib/python3.6/subprocess.py", line 418, in run
    output=stdout, stderr=stderr)
bb.data_smart.ExpansionError: Failure expanding variable set_icecc_env, expression was     if [ "${@use_icecc(bb, d)}" = "no" ]
    then
        return
    fi
    ICECC_VERSION="${@icecc_version(bb, d)}"
    if [ "x${ICECC_VERSION}" = "x" ]
    then
        bbwarn "Cannot use icecc: could not get ICECC_VERSION"
        return
    fi

    ICE_PATH="${@icecc_path(bb, d)}"
    if [ "x${ICE_PATH}" = "x" ]
    then
        bbwarn "Cannot use icecc: could not get ICE_PATH"
        return
    fi

    ICECC_BIN="${@get_icecc(d)}"
    if [ -z "${ICECC_BIN}" ]; then
        bbwarn "Cannot use icecc: icecc binary not found"
        return
    fi
    if [ -z "$(which patchelf patchelf-uninative)" ]; then
        bbwarn "Cannot use icecc: patchelf not found"
        return
    fi

    # Create symlinks to icecc in the recipe-sysroot directory
    mkdir -p ${ICE_PATH}
    if [ -n "${KERNEL_CC}" ]; then
        compilers="${@get_cross_kernel_cc(bb,d)}"
    else
        compilers="x86_64-oe-linux-gcc x86_64-oe-linux-g++"
    fi
    for compiler in $compilers; do
        ln -sf ${ICECC_BIN} ${ICE_PATH}/$compiler
    done

    ICECC_CC="${@icecc_get_and_check_tool(bb, d, "gcc")}"
    ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
    # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
    ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
    if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
    then
        bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
        return
    fi

    ICE_VERSION=`$ICECC_CC -dumpversion`
    ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g"`
    if [ ! -x "/build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env" ]
    then
        bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
        return
    fi

    ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
    # for target recipes should return something like:
    # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
    # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
    if [ "`dirname "${ICECC_AS}"`" = "." ]
    then
        ICECC_AS="${ICECC_WHICH_AS}"
    fi

    if [ ! -f "${ICECC_VERSION}.done" ]
    then
        mkdir -p "`dirname "${ICECC_VERSION}"`"

        # the ICECC_VERSION generation step must be locked by a mutex
        # in order to prevent race conditions
        if flock -n "${ICECC_VERSION}.lock" \
            /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/icecc-create-env  "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
        then
            touch "${ICECC_VERSION}.done"
        elif ! wait_for_file "${ICECC_VERSION}.done" 30
        then
            # locking failed so wait for ${ICECC_VERSION}.done to appear
            bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
            return
        fi
    fi

    # Don't let ccache find the icecream compiler links that have been created, otherwise
    # it can end up invoking icecream recursively.
    export CCACHE_PATH="$PATH"
    export CCACHE_DISABLE="1"

    export ICECC_VERSION ICECC_CC ICECC_CXX
    export PATH="$ICE_PATH:$PATH"

    bbnote "Using icecc path: $ICE_PATH"
    bbnote "Using icecc tarball: $ICECC_VERSION"
 which triggered exception CalledProcessError: Command 'readlink -f /build/BUILD/work/qemux86-oe-linux/python-markupsafe/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++' returned non-zero exit status 1.

ERROR: Task (virtual:multilib:lib32:/build/meta-oe/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb:do_patch) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index edb0e10434..63d8b4dfee 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -243,7 +243,11 @@ def icecc_get_external_tool(bb, d, tool):
 
 def icecc_get_tool_link(tool, d):
     import subprocess
-    return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
+    try:
+        return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
+    except subprocess.CalledProcessError as e:
+        bb.note("icecc: one of the tools probably disappeared during recipe parsing, cmd readlink -f %s returned %d:\n%s" % (tool, e.returncode, e.output.decode("utf-8")))
+        return tool
 
 def icecc_get_path_tool(tool, d):
     # This is a little ugly, but we want to make sure we add an actual
-- 
2.17.1


