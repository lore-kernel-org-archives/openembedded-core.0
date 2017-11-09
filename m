Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 00CCB71A50
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 17:11:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Nov 2017 09:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; d="scan'208";a="1242103362"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2017 09:11:54 -0800
Date: Thu, 9 Nov 2017 11:22:17 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171109112217.51cd4fc9@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <d10136a2d95b9575458c01afce41fc2c41e35df4.1509034760.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1509034760.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<d10136a2d95b9575458c01afce41fc2c41e35df4.1509034760.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Thu, 09 Nov 2017 17:11:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Oct 2017 10:33:19 -0700
leonardo.sandoval.gonzalez@linux.intel.com wrote:

RP indicated two scenarios that this v1 won't work:

1) if oe-selftest comes from a tarball (together with the other repo files)
2) if other no-poky layers are present on current BBLAYERS.

I will review both items and send a v2.

Leo


> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> The main idea is to isolate the oe-selftest execution so neither the current
> build dir nor the configuration data is touch/polluted. This approach uses
> a wrapper script (which is the one presented on this commit) which creates
> a unique directory and inside it does a shallow of repo(s) (OE-Core and Bitbake),
> re-initializes the enviroment (re-sources oe-init-build-env) and finally launches
> the oe-selftest-internal (which used to be oe-selftest) command, passing command
> arguments to the latter.
> 
> The new build directory created when re-initializing the enviroment has the
> same configuration data (local.conf, auto.conf, site.conf) as the
> main build directory. The latter means that one can set DL_DIR and SSTATE_DIR
> into <main build dir>/conf/site.conf and the oe-selftest execution will use this.
> 
> [YOCTO #11429]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  scripts/oe-selftest          | 102 +++++++++++++++++++++++--------------------
>  scripts/oe-selftest-internal |  75 +++++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+), 48 deletions(-)
>  create mode 100755 scripts/oe-selftest-internal
> 
> diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> index 1bf860a415..f3ce89cedb 100755
> --- a/scripts/oe-selftest
> +++ b/scripts/oe-selftest
> @@ -1,5 +1,7 @@
> -#!/usr/bin/env python3
> +#!/bin/sh
>  
> +# scripts/oe-selftest: calls oe-selftest-internal in a isolated environment
> +#
>  # Copyright (c) 2013-2017 Intel Corporation
>  #
>  # This program is free software; you can redistribute it and/or modify
> @@ -14,62 +16,66 @@
>  # You should have received a copy of the GNU General Public License along
>  # with this program; if not, write to the Free Software Foundation, Inc.,
>  # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +# Variable definitions
> +ORIGBUILDDIR="$BUILDDIR"
> +OESELFTESTSCRIPTDIR="$(which oe-selftest)"
> +SCRIPTSDIR="$(dirname $OESELFTESTSCRIPTDIR)"
> +OECOREDIR="$(dirname $SCRIPTSDIR)"
> +
> +# oe-selftest-$$ related
> +OESELFTESTDIR="$ORIGBUILDDIR/oe-selftest-$$"
> +OESELFTESTOECOREDIR="$OESELFTESTDIR/openembedded-core"
> +OESELFTESTBUILDDIR="$OESELFTESTDIR/openembedded-core/build"
> +TEMPLATEPATH="$OESELFTESTDIR/template/conf"
>  
> -# DESCRIPTION
> -# This script runs tests defined in meta/lib/oeqa/selftest/
> -# It's purpose is to automate the testing of different bitbake tools.
> -# To use it you just need to source your build environment setup script and
> -# add the meta-selftest layer to your BBLAYERS.
> -# Call the script as: "oe-selftest -a" to run all the tests in meta/lib/oeqa/selftest/
> -# Call the script as: "oe-selftest -r <module>.<Class>.<method>" to run just a single test
> -# E.g: "oe-selftest -r bblayers.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/oeqa/selftest/bblayers.py
> +# 0. Return immediately in case no test execution
> +ADDTESTS="$(echo "$@" | grep -i '\-a')"
> +SOMETESTS="$(echo "$@" | grep -i '\-r')"
> +if [ -z "$ADDTESTS" -a -z "$SOMETESTS" ]; then
> +    if [ -z "$@" ]; then
> +	oe-selftest-internal -h
> +    else
> +	oe-selftest-internal "$@"
> +    fi
> +    exit 0
> +fi
>  
> +# 1. All work will be done under OESELFTESTDIR
> +mkdir $OESELFTESTDIR && cd $OESELFTESTDIR
>  
> +# 2.1 Shallow clone OE-Core
> +git clone file://$OECOREDIR --depth 1 $OESELFTESTOECOREDIR
>  
> -import os
> -import sys
> -import argparse
> -import logging
> +# 2.2 Shallow clone bitbake if necessary (if OE-Core is embedded on a combo repo, like Poky, there is no need)
> +if [ ! -d "$OESELFTESTOECOREDIR/bitbake" ]; then
> +    git clone file://$OECOREDIR/bitbake --depth 1 $OESELFTESTOECOREDIR/bitbake
> +fi
>  
> -scripts_path = os.path.dirname(os.path.realpath(__file__))
> -lib_path = scripts_path + '/lib'
> -sys.path = sys.path + [lib_path]
> -import argparse_oe
> -import scriptutils
> -import scriptpath
> -scriptpath.add_oe_lib_path()
> -scriptpath.add_bitbake_lib_path()
> +# 3. Template: create template directory based on BUILDIR/conf/local.conf
> +mkdir -p $TEMPLATEPATH
> +cp $ORIGBUILDDIR/conf/local.conf $TEMPLATEPATH/local.conf.sample
>  
> -from oeqa.utils import load_test_components
> -from oeqa.core.exception import OEQAPreRun
> +# 4. re-initialized environment with new metadata and templateconf environement
> +cd $OESELFTESTOECOREDIR
> +export TEMPLATEPATH && source ./oe-init-build-env $OESELFTESTBUILDDIR
>  
> -logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout)
> +# 5. Respect any site.conf and/or auto.conf and place it into conf directory
> +if [ -r "$ORIGBUILDDIR/conf/site.conf" ]; then
> +    cp -f $ORIGBUILDDIR/conf/site.conf $OESELFTESTBUILDDIR/conf
> +fi
> +if [ -r "$ORIGBUILDDIR/conf/auto.conf" ]; then
> +    cp -f $ORIGBUILDDIR/conf/auto.conf $OESELFTESTBUILDDIR/conf
> +fi
>  
> -def main():
> -    description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
> -    parser = argparse_oe.ArgumentParser(description=description)
> +# 6. Execute the tests throught oe-selftest-internal
> +oe-selftest-internal "$@"
>  
> -    comp_name, comp = load_test_components(logger, 'oe-selftest').popitem()
> -    comp.register_commands(logger, parser)
> +OESELFTESTRC="$?"
>  
> -    try:
> -        args = parser.parse_args()
> -        results = args.func(logger, args)
> -        ret = 0 if results.wasSuccessful() else 1
> -    except SystemExit as err:
> -        if err.code != 0:
> -            raise err
> -        ret = err.code
> -    except OEQAPreRun as pr:
> -        ret = 1
> +# 7. Echo working folder
>  
> -    return ret
> +echo -e "\nAll work done under $OESELFTESTDIR\n"
>  
> -if __name__ == '__main__':
> -    try:
> -        ret = main()
> -    except Exception:
> -        ret = 1
> -        import traceback
> -        traceback.print_exc()
> -    sys.exit(ret)
> +exit $OESELFTESTRC
> diff --git a/scripts/oe-selftest-internal b/scripts/oe-selftest-internal
> new file mode 100755
> index 0000000000..cff2906763
> --- /dev/null
> +++ b/scripts/oe-selftest-internal
> @@ -0,0 +1,75 @@
> +#!/usr/bin/env python3
> +
> +# Copyright (c) 2013-2017 Intel Corporation
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +
> +# DESCRIPTION
> +# This script runs tests defined in meta/lib/oeqa/selftest/
> +# It's purpose is to automate the testing of different bitbake tools.
> +# To use it you just need to source your build environment setup script and
> +# add the meta-selftest layer to your BBLAYERS.
> +# Call the script as: "oe-selftest -a" to run all the tests in meta/lib/oeqa/selftest/
> +# Call the script as: "oe-selftest -r <module>.<Class>.<method>" to run just a single test
> +# E.g: "oe-selftest -r bblayers.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/oeqa/selftest/bblayers.py
> +
> +
> +
> +import os
> +import sys
> +import argparse
> +import logging
> +
> +scripts_path = os.path.dirname(os.path.realpath(__file__))
> +lib_path = scripts_path + '/lib'
> +sys.path = sys.path + [lib_path]
> +import argparse_oe
> +import scriptutils
> +import scriptpath
> +scriptpath.add_oe_lib_path()
> +scriptpath.add_bitbake_lib_path()
> +
> +from oeqa.utils import load_test_components
> +from oeqa.core.exception import OEQAPreRun
> +
> +logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout)
> +
> +def main():
> +    description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
> +    parser = argparse_oe.ArgumentParser(prog='oe-selftest', description=description)
> +
> +    comp_name, comp = load_test_components(logger, 'oe-selftest').popitem()
> +    comp.register_commands(logger, parser)
> +
> +    try:
> +        args = parser.parse_args()
> +        results = args.func(logger, args)
> +        ret = 0 if results.wasSuccessful() else 1
> +    except SystemExit as err:
> +        if err.code != 0:
> +            raise err
> +        ret = err.code
> +    except OEQAPreRun as pr:
> +        ret = 1
> +
> +    return ret
> +
> +if __name__ == '__main__':
> +    try:
> +        ret = main()
> +    except Exception:
> +        ret = 1
> +        import traceback
> +        traceback.print_exc()
> +    sys.exit(ret)
> -- 
> 2.12.3
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

