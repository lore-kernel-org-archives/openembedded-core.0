Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D16760034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 01:22:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0U1Mne0018786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Jan 2015 17:22:49 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 29 Jan 2015 17:22:48 -0800
Message-ID: <54CADCE5.4050009@windriver.com>
Date: Fri, 30 Jan 2015 09:22:45 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1419500687.git.Chong.Lu@windriver.com>
	<d63d5ff53d6f64ac6d4a72c770283a21e0750112.1419500687.git.Chong.Lu@windriver.com>
In-Reply-To: <d63d5ff53d6f64ac6d4a72c770283a21e0750112.1419500687.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] check-layers.py: some checks for distro and bsp layer
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
X-List-Received-Date: Fri, 30 Jan 2015 01:22:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

//Chong

On 12/25/2014 05:45 PM, Chong Lu wrote:
> * Check that a BSP layer isn't making any changes when the layer is included
>    but MACHINE is not set to point to one of the conf/machine/*.conf that the
>    layer provides
> * Check that a distribution layer isn't making any changes when the layer is
>    included but DISTRO is not set to point to one of the conf/distro/*.conf that
>    the layer provides
> * Check that conf/distro and conf/machine don't appear in the same layer
> * Check that BSP/distro layers don't provide their own linux-libc-headers
> * Check that distro variables such as DISTRO_FEATURES are not being set in
>    machine conf files
>
> In build environment, use "../poky/scripts/contrib/check-layers.py" to
> run script.
>
> [YOCTO #5427]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   scripts/contrib/check-layers.py | 248 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 248 insertions(+)
>   create mode 100755 scripts/contrib/check-layers.py
>
> diff --git a/scripts/contrib/check-layers.py b/scripts/contrib/check-layers.py
> new file mode 100755
> index 0000000..2d42479
> --- /dev/null
> +++ b/scripts/contrib/check-layers.py
> @@ -0,0 +1,248 @@
> +#!/usr/bin/env python
> +
> +# This script is used by checking layers.
> +
> +import sys
> +import os
> +import re
> +import argparse
> +
> +parser = argparse.ArgumentParser(description="check-distro-machine.py [options]")
> +parser.add_argument("-b", action="store_true", default=False, dest="bsp", help="check that a BSP layer isn't making any changes when the layer is included but MACHINE is not set to point to one of the conf/machine/*.conf that the layer provides")
> +parser.add_argument("-d", action="store_true", default=False, dest="distro_in_machine", help="check that distro variables are not being set in machine conf files")
> +parser.add_argument("-l", action="store_true", default=False, dest="provides_include_linux_libc_header", help="check that BSP/distro layers don't provide their own linux-libc-headers")
> +parser.add_argument("-i", action="store_true", default=False, dest="dis", help="check that a distro layer isn't making any changes when the layer is included but DISTRO is not set to point to one of the conf/distro/*.conf that the layer provides")
> +parser.add_argument("-s", action="store_true", default=False, dest="distro_machine_in_same_layer", help="check that conf/distro and conf/machine don't appear in the same layer")
> +args = parser.parse_args()
> +
> +scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
> +lib_path = os.path.abspath(scripts_path + '/../lib')
> +sys.path = sys.path + [lib_path]
> +
> +import scriptpath
> +
> +# For importing the following modules
> +bitbakepath = scriptpath.add_bitbake_lib_path()
> +if not bitbakepath:
> +    sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
> +    sys.exit(1)
> +
> +import bb.cache
> +import bb.cooker
> +import bb.providers
> +import bb.tinfoil
> +
> +def findExt(path, key):
> +    confq = []
> +    confline = ""
> +    f = file('%s' % path, mode = 'r')
> +    line = f.readline()
> +    while line:
> +        if line.find(key) != -1:
> +            confline = line[8:-1]
> +            confq.append(confline)
> +        line = f.readline()
> +    f.close()
> +    return confq
> +
> +def findDistro(path, key):
> +    f = file('%s' % path, mode = 'r')
> +    line = f.readline()
> +    linen = 1
> +    while line:
> +        if line.find(key) != -1:
> +            bb.warn("%s:%s contains distro variables." % (path, linen))
> +        line = f.readline()
> +        linen += 1
> +    f.close()
> +
> +def findFull(conf, bblayers):
> +    for bblayer in bblayers:
> +        fullpath = bblayer + "/" + conf
> +        if os.path.exists(fullpath):
> +            return fullpath
> +
> +def check_distro_in_machine(bbhandler):
> +# Check that distro variables are not being set in machine conf files
> +    machine = bbhandler.config_data.getVar("MACHINE")
> +    bblayers = bbhandler.config_data.getVar("BBLAYERS").split()
> +    lists = ["conf/machine/" + machine + ".conf"]
> +
> +    while lists:
> +        for l in lists:
> +            lists.remove(l)
> +            fpath = findFull(l, bblayers)
> +            if fpath:
> +                findDistro(fpath, "DISTRO_")
> +                lists.extend(findExt(fpath, "require conf/machine"))
> +                lists.extend(findExt(fpath, "include conf/machine"))
> +
> +def check_distro_machine_in_same_layer(bbhandler):
> +# Check that conf/distro and conf/machine don't appear in the same layer
> +    bblayers = bbhandler.config_data.getVar("BBLAYERS").split()
> +    for bblayer in bblayers:
> +        if bblayer.endswith("/"):
> +            sys.exit(1)
> +    for bblayer in bblayers:
> +        if bblayer.endswith("meta"):
> +            continue
> +        elif os.path.exists(bblayer + "/" + "conf/machine") and os.path.exists(bblayer + "/" + "conf/distro"):
> +            bb.warn("%s shouldn't be providing both a distro and a machine" % bblayer)
> +
> +def get_layer_name(layerdir):
> +    return os.path.basename(layerdir.rstrip(os.sep))
> +
> +def get_file_layer(bbhandler, bblayers, filename):
> +    for layer, _, regex, _ in bbhandler.cooker.recipecache.bbfile_config_priorities:
> +        if regex.match(filename):
> +            for layerdir in bblayers:
> +                if regex.match(os.path.join(layerdir, 'test')) and re.match(layerdir, filename):
> +                    return get_layer_name(layerdir)
> +    return "?"
> +
> +def check_linux_libc_headers(bbhandler):
> +# Check that BSP/distro layers don't provide their own linux-libc-headers
> +    bblayers = (bbhandler.config_data.getVar('BBLAYERS', True) or "").split()
> +    pkg_pn = bbhandler.cooker.recipecache.pkg_pn
> +    (latest_versions, preferred_versions) = bb.providers.findProviders(bbhandler.config_data, bbhandler.cooker.recipecache, pkg_pn)
> +    for p in sorted(pkg_pn):
> +        pref = preferred_versions[p]
> +        preffile = bb.cache.Cache.virtualfn2realfn(pref[1])[0]
> +        preflayer = get_file_layer(bbhandler, bblayers, preffile)
> +        fn = pkg_pn[p].pop()
> +        data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
> +        provide = data.getVar("PROVIDES", True)
> +        if 'linux-libc-header' in provide and preflayer != 'meta':
> +            bb.warn("%s shouldn't provide its own linux-libc-headers" % preflayer)
> +
> +import re
> +
> +__config_regexp__  = re.compile( r"""
> +    ^
> +    (?P<exp>export\s*)?
> +    (?P<var>[a-zA-Z0-9\-~_+.${}/]+?)
> +    (\[(?P<flag>[a-zA-Z0-9\-_+.]+)\])?
> +
> +    \s* (
> +        (?P<colon>:=) |
> +        (?P<lazyques>\?\?=) |
> +        (?P<ques>\?=) |
> +        (?P<append>\+=) |
> +        (?P<prepend>=\+) |
> +        (?P<predot>=\.) |
> +        (?P<postdot>\.=) |
> +        =
> +    ) \s*
> +
> +    (?!'[^']*'[^']*'$)
> +    (?!\"[^\"]*\"[^\"]*\"$)
> +    (?P<apo>['\"])
> +    (?P<value>.*)
> +    (?P=apo)
> +    $
> +    """, re.X)
> +
> +def feeder(lineno, s, fn, statements):
> +    m = __config_regexp__.match(s)
> +    if m:
> +        groupd = m.groupdict()
> +        g = groupd['var'].replace("_","")
> +        if not groupd['colon']:
> +            if groupd['append'] or groupd['prepend']:
> +                if g.isalnum() and g.isupper():
> +                    bb.warn("The %s variable may be modified by %s:%s" % (groupd['var'], fn, lineno))
> +                    bb.warn("%s" % s)
> +            else:
> +                if g.replace("append","").isupper() or g.replace("prepend","").isupper() or g.replace("remove","").isupper():
> +                    bb.warn("The %s variable may be modified by %s:%s" % (groupd['var'], fn, lineno))
> +                    bb.warn("%s" % s)
> +
> +from bb.parse import ast
> +
> +def handle(fn, data):
> +
> +    f = open(fn, 'r')
> +
> +    statements = ast.StatementGroup()
> +    lineno = 0
> +    while True:
> +        lineno = lineno + 1
> +        s = f.readline()
> +        if not s:
> +            break
> +        w = s.strip()
> +        # skip empty lines
> +        if not w:
> +            continue
> +        s = s.rstrip()
> +        while s[-1] == '\\':
> +            s2 = f.readline().strip()
> +            lineno = lineno + 1
> +            if (not s2 or s2 and s2[0] != "#") and s[0] == "#" :
> +                bb.fatal("There is a confusing multiline, partially commented expression on line %s of file %s (%s).\nPlease clarify whether this is all a comment or should be parsed." % (lineno, fn, s))
> +            s = s[:-1] + s2
> +        # skip comments
> +        if s[0] == '#':
> +            continue
> +
> +        feeder(lineno, s, fn, statements)
> +
> +    f.close()
> +
> +def check_var_in_layer(bbhandler, bsp=False, dis=False):
> +# Check that a BSP or distro layer isn't making any changes when the layer is
> +# included but MACHINE or DISTRO is not set to point to one of the
> +# conf/machine/*.conf or conf/distro/*.conf that the layer provides
> +    machine = bbhandler.config_data.getVar("MACHINE")
> +    distro = bbhandler.config_data.getVar("DISTRO")
> +    bblayers = (bbhandler.config_data.getVar("BBLAYERS", True) or "").split()
> +    chklayers = []
> +    filepaths = []
> +
> +    for bblayer in bblayers:
> +        if bsp:
> +            confpath = "/conf/machine/"
> +            conffile = bblayer + confpath + machine + ".conf"
> +        if dis:
> +            confpath = "/conf/distro/"
> +            conffile = bblayer + confpath + distro + ".conf"
> +        if bblayer.endswith("/meta"):
> +            continue
> +        elif os.path.exists(conffile):
> +            continue
> +        elif not os.path.exists(bblayer + confpath):
> +            continue
> +        else:
> +            chklayers.append(bblayer)
> +
> +    for layer in list(set(chklayers)):
> +        for dirpath, dirnames, filenames in os.walk(layer):
> +            for filename in filenames:
> +                if os.path.splitext(filename)[1] == '.bbappend':
> +                    filepath = os.path.join(dirpath, filename)
> +                    if not filepath in filepaths:
> +                        filepaths.append(filepath)
> +
> +    for fn in list(set(filepaths)):
> +        handle(fn, bbhandler.config_data)
> +
> +def main():
> +    bbhandler = bb.tinfoil.Tinfoil()
> +    bbhandler.cooker.enableDataTracking()
> +    bbhandler.prepare()
> +    if args.distro_machine_in_same_layer:
> +        check_distro_machine_in_same_layer(bbhandler)
> +    if args.distro_in_machine:
> +        check_distro_in_machine(bbhandler)
> +    if args.provides_include_linux_libc_header:
> +        check_linux_libc_headers(bbhandler)
> +    if args.bsp:
> +        check_var_in_layer(bbhandler, bsp=True)
> +    if args.dis:
> +        check_var_in_layer(bbhandler, dis=True)
> +
> +if __name__=='__main__':
> +    if len(sys.argv) < 2:
> +        parser.parse_args(['-h'])
> +    else:
> +        main()


