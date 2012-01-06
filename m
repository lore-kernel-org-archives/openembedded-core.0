Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1Rj9xp-0002d9-2K
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:36:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06DSj71020933
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 13:28:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20000-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 13:28:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06DSbHm020927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 13:28:38 GMT
Message-ID: <1325856518.20759.115.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 13:28:38 +0000
In-Reply-To: <03140960a07a85cb0549d0cb8fab4ee09281ba6a.1325302234.git.lianhao.lu@intel.com>
References: <cover.1325302234.git.lianhao.lu@intel.com>
	<03140960a07a85cb0549d0cb8fab4ee09281ba6a.1325302234.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PRService/meta V2 1/3] meta/PRService: Added export/import fuctions.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 13:36:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Lianhao,

On Sat, 2011-12-31 at 11:31 +0800, Lianhao Lu wrote:
> [YOCTO #1556]
> - Modified meta/class/package.bbclass and prserv.bbclass according to
> the change in PR service by adding PACKAGE_ARCH into the query tuple.
> 
> - Added new bitbake tasks export/import AUTOPR values from/to the PR
> service.
> 
> - Supported reading the AUTOPR values from the exported .inc file
> instead of reading it from remote PR service.
> 
> - Created a new script bitbake-prserv-tool to export/import the AUTOPR
> values from/to the PR service.
> 
> Typical usage scenario of the export/import is:
> 1. bitbake-prserv-tool export <file> to export the AUTOPR values from
> the current PR service into an exported .inc file.
> 
> 2. Others may use that exported .inc file(to be included in the
> local.conf) to lockdown and reproduce the same AUTOPR when generating
> package feeds.
> 
> 3. Others may "bitbake-prserv-tool import <file>" to import the AUTOPR
> values into their own PR service and the AUTOPR values will be
> incremented from there.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/package.bbclass          |   13 ++-
>  meta/classes/prserv.bbclass           |  163 ++++++++++++++++++++++++++++++---
>  meta/conf/bitbake.conf                |    4 +-
>  meta/recipes-core/meta/prserv-misc.bb |   67 ++++++++++++++
>  scripts/bitbake-prserv-tool           |   53 +++++++++++
>  5 files changed, 283 insertions(+), 17 deletions(-)
>  create mode 100644 meta/recipes-core/meta/prserv-misc.bb
>  create mode 100755 scripts/bitbake-prserv-tool
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 9040eb4..65e6571 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -351,10 +351,17 @@ def runtime_mapping_rename (varname, d):
>  
>  python package_get_auto_pr() {
>  	if d.getVar('USE_PR_SERV', True) != "0":
> -		auto_pr=prserv_get_pr_auto(d)
> -		if auto_pr is None:
> -			bb.fatal("Can NOT get auto PR revision from remote PR service")
> +		try:
> +			auto_pr=prserv_get_pr_auto(d)
> +		except Exception as e:
> +			bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
>  			return
> +		if auto_pr is None:
> +			if d.getVar('PRSERV_LOCKDOWN', True):
> +				bb.fatal("Can NOT get PRAUTO from lockdown exported file")
> +			else:
> +				bb.fatal("Can NOT get PRAUTO from remote PR service")
> +			return 
>  		d.setVar('PRAUTO',str(auto_pr))
>  }
>  
> diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
> index 18b8589..add3e03 100644
> --- a/meta/classes/prserv.bbclass
> +++ b/meta/classes/prserv.bbclass
> @@ -1,10 +1,10 @@
>  def prserv_make_conn(d):
>      import prserv.serv
> -    host=d.getVar("PRSERV_HOST",True)
> -    port=d.getVar("PRSERV_PORT",True)
> +    host = d.getVar("PRSERV_HOST",True)
> +    port = d.getVar("PRSERV_PORT",True)
>      try:
> -        conn=None
> -        conn=prserv.serv.PRServerConnection(host,int(port))
> +        conn = None
> +        conn = prserv.serv.PRServerConnection(host,int(port))
>          d.setVar("__PRSERV_CONN",conn)
>      except Exception, exc:
>          bb.fatal("Connecting to PR service %s:%s failed: %s" % (host, port, str(exc)))
> @@ -12,18 +12,157 @@ def prserv_make_conn(d):
>      return conn
>  
>  def prserv_get_pr_auto(d):
> -    if d.getVar('USE_PR_SERV', True) != "0":
> +    if d.getVar('USE_PR_SERV', True) != "1":
>          bb.warn("Not using network based PR service")
>          return None
>  
> -    conn=d.getVar("__PRSERV_CONN", True)
> +    version = d.getVar("PRAUTOINX", True)
> +    pkgarch = d.getVar("PACKAGE_ARCH", True)
> +    checksum = d.getVar("BB_TASKHASH", True)
> +
> +    if d.getVar('PRSERV_LOCKDOWN', True):
> +        auto_rev = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
> +    else:
> +        conn = d.getVar("__PRSERV_CONN", True)
> +        if conn is None:
> +            conn = prserv_make_conn(d)
> +            if conn is None:
> +                return None
> +        auto_rev = conn.getPR(version, pkgarch, checksum)
> +
> +    return auto_rev
> +
> +PRSERV_DUMPOPT_VERSION = "${PRAUTOINX}"
> +PRSERV_DUMPOPT_PKGARCH  = ""
> +PRSERV_DUMPOPT_CHECKSUM = ""
> +PRSERV_DUMPOPT_COL = "0"
> +
> +def prserv_dump_db(d):
> +    if d.getVar('USE_PR_SERV', True) != "1":
> +        bb.error("Not using network based PR service")
> +        return None
> +
> +    conn = d.getVar("__PRSERV_CONN", True)
>      if conn is None:
> -        conn=prserv_make_conn(d)
> +        conn = prserv_make_conn(d)
>          if conn is None:
> +            bb.error("Making connection failed to remote PR service")
>              return None
>  
> -    version=d.getVar("PF", True)
> -    checksum=d.getVar("BB_TASKHASH", True)
> -    auto_rev=conn.getPR(version,checksum)
> -    bb.debug(1,"prserv_get_pr_auto: version: %s checksum: %s result %d" % (version, checksum, auto_rev))
> -    return auto_rev
> +    #dump db
> +    opt_version = d.getVar('PRSERV_DUMPOPT_VERSION', True)
> +    opt_pkgarch = d.getVar('PRSERV_DUMPOPT_PKGARCH', True)
> +    opt_checksum = d.getVar('PRSERV_DUMPOPT_CHECKSUM', True)
> +    opt_col = ("1" == d.getVar('PRSERV_DUMPOPT_COL', True))
> +    return conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
> +
> +def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksum=None):
> +    if d.getVar('USE_PR_SERV', True) != "1":
> +        bb.error("Not using network based PR service")
> +        return None
> +
> +    conn = d.getVar("__PRSERV_CONN", True)
> +    if conn is None:
> +        conn = prserv_make_conn(d)
> +        if conn is None:
> +            bb.error("Making connection failed to remote PR service")
> +            return None
> +    #get the entry values
> +    imported = []
> +    prefix = "PRAUTO$"
> +    for v in d.keys():
> +        if v.startswith(prefix):
> +            (remain, sep, checksum) = v.rpartition('$')
> +            (remain, sep, pkgarch) = remain.rpartition('$')
> +            (remain, sep, version) = remain.rpartition('$')
> +            if (remain + '$' != prefix) or \
> +               (filter_version and filter_version != version) or \
> +               (filter_pkgarch and filter_pkgarch != pkgarch) or \
> +               (filter_checksum and filter_checksum != checksum):
> +               continue
> +            try:
> +                value = int(d.getVar(remain + '$' + version + '$' + pkgarch + '$' + checksum, True))
> +            except BaseException as exc:
> +                bb.debug("Not valid value of %s:%s" % (v,str(exc)))
> +                continue
> +            ret = conn.importone(version,pkgarch,checksum,value)
> +            if ret != value:
> +                bb.error("importing(%s,%s,%s,%d) failed. DB may have larger value %d" % (version,pkgarch,checksum,value,ret))
> +            else:
> +               imported.append((version,pkgarch,checksum,value))
> +    return imported
> +
> +PRSERV_DUMPDIR ??= "${LOG_DIR}/db"
> +PRSERV_DUMPFILE ??= "${PRSERV_DUMPDIR}/prserv.inc"
> +
> +def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
> +    #initilize the output file
> +    bb.utils.mkdirhier(d.getVar('PRSERV_DUMPDIR', True))
> +    df = d.getVar('PRSERV_DUMPFILE', True)
> +    #write data
> +    lf = bb.utils.lockfile("%s.lock" % df)
> +    f = open(df, "a")
> +    if metainfo:
> +        #dump column info 
> +        f.write("#PR_core_ver = \"%s\"\n\n" % metainfo['core_ver']);
> +        f.write("#Table: %s\n" % metainfo['tbl_name'])
> +        f.write("#Columns:\n")
> +        f.write("#name      \t type    \t notn    \t dflt    \t pk\n")
> +        f.write("#----------\t --------\t --------\t --------\t ----\n")
> +        for i in range(len(metainfo['col_info'])):
> +            f.write("#%10s\t %8s\t %8s\t %8s\t %4s\n" % 
> +                    (metainfo['col_info'][i]['name'], 
> +                     metainfo['col_info'][i]['type'], 
> +                     metainfo['col_info'][i]['notnull'], 
> +                     metainfo['col_info'][i]['dflt_value'], 
> +                     metainfo['col_info'][i]['pk']))
> +        f.write("\n")
> +
> +    if lockdown:
> +        f.write("PRSERV_LOCKDOWN = \"1\"\n\n")
> +
> +    if datainfo:
> +        idx = {}
> +        for i in range(len(datainfo)):
> +            pkgarch = datainfo[i]['pkgarch']
> +            value = datainfo[i]['value']
> +            if not idx.has_key(pkgarch):
> +                idx[pkgarch] = i
> +            elif value > datainfo[idx[pkgarch]]['value']:
> +                idx[pkgarch] = i
> +            f.write("PRAUTO$%s$%s$%s = \"%s\"\n" % 
> +                (str(datainfo[i]['version']), pkgarch, str(datainfo[i]['checksum']), str(value)))
> +        if not nomax:
> +            for i in idx:
> +                f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']),str(datainfo[idx[i]]['pkgarch']),str(datainfo[idx[i]]['value'])))
> +    f.close()
> +    bb.utils.unlockfile(lf)
> +
> +addtask prservdump
> +do_prservdump[nostamp] = "1"
> +python do_prservdump() {
> +    #get all PR values for the current PRAUTOINX
> +    ver = d.getVar('PRSERV_DUMPOPT_VERSION', True)
> +    ver = ver.replace('%','-')
> +    retval = prserv_dump_db(d)
> +    if not retval:
> +        bb.fatal("export failed!")
> +
> +    (metainfo, datainfo) = retval
> +    if not datainfo:
> +        bb.error("prservdump %s: No AUROPR values found" % ver)
> +        return
> +    prserv_export_tofile(d, None, datainfo, False) 
> +}
> +
> +addtask prservimport
> +do_prservimport[nostamp] = "1"
> +python do_prservimport() {
> +    #import PR values for current PRAUTOINX
> +    imported = prserv_import_db(d, filter_version=d.getVar('PRAUTOINX',True))
> +    if imported is None:
> +        bb.fatal("import failed!")
> +
> +    for (version, pkgarch, checksum, value) in imported:
> +        bb.note("imported (%s,%s,%s,%d)" % (version, pkgarch, checksum, value))
> +}
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1c21616..31a722e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -190,7 +190,7 @@ BP = "${BPN}-${PV}"
>  #
>  # network based PR service
>  #
> -USE_PR_SERV = "${@[1,0][(d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_PORT',1) is None)]}"
> +USE_PR_SERV = "${@[1,0][((d.getVar('PRSERV_HOST',1) is None) or (d.getVar('PRSERV_PORT',1) is None)) and (d.getVar('PRSERV_LOCKDOWN',1) is None)]}"
>  
>  # Package info.
>  
> @@ -740,7 +740,7 @@ BB_CONSOLELOG = "${TMPDIR}/cooker.log.${DATETIME}"
>  # Setup our default hash policy
>  BB_SIGNATURE_HANDLER ?= "basic"
>  BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
> -BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
> +BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
>  
>  MLPREFIX ??= ""
>  MULTILIB_VARIANTS ??= ""
> diff --git a/meta/recipes-core/meta/prserv-misc.bb b/meta/recipes-core/meta/prserv-misc.bb
> new file mode 100644
> index 0000000..5746f06
> --- /dev/null
> +++ b/meta/recipes-core/meta/prserv-misc.bb
> @@ -0,0 +1,67 @@
> +DESCRIPTION = "Misc tasks for PR service"
> +LICENSE = "MIT"
> +EXCLUDE_FROM_WORLD = "1"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +ALLOW_EMPTY = "1"
> +PACKAGES = ""
> +
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_install[noexec] = "1"
> +do_package[noexec] = "1"
> +do_package_write[noexec] = "1"
> +do_package_write_ipk[noexec] = "1"
> +do_package_write_rpm[noexec] = "1"
> +do_package_write_deb[noexec] = "1"
> +do_populate_sysroot[noexec] = "1"
> +
> +addtask dbexport_clean
> +do_dbexport_clean[nostamp] = "1"
> +do_dbexport_clean() {
> +    rm -f ${PRSERV_DUMPFILE}
> +}
> +
> +addtask dbexport_metainfo
> +do_dbexport_metainfo[nostamp] = "1"
> +python do_dbexport_metainfo() {
> +    d.setVar('PRSERV_DUMPOPT_COL', "1")
> +    retval = prserv_dump_db(d)
> +
> +    if not retval:
> +        bb.error("export failed!")
> +        return
> +
> +    (metainfo, datainfo) = retval
> +    prserv_export_tofile(d, metainfo, None, True)
> +}
> +
> +addtask dbexport_all after do_dbexport_clean
> +do_dbexport_all[nostamp] = "1"
> +python do_dbexport_all() {
> +    d.setVar('PRSERV_DUMPOPT_VERSION', "")
> +    d.setVar('PRSERV_DUMPOPT_CHECKSUM', "")
> +    d.setVar('PRSERV_DUMPOPT_COL', "1")
> +    #get all PR values for the current PRAUTOINX
> +    retval = prserv_dump_db(d)
> +    if not retval:
> +        bb.fatal("do_dbexport_all")
> +
> +    (metainfo, datainfo) = retval
> +    prserv_export_tofile(d, metainfo, datainfo, True, True)
> +}
> +
> +addtask dbimport_all
> +do_dbimport_all[nostamp] = "1"
> +python do_dbimport_all() {
> +    #import PR values for all
> +    imported = prserv_import_db(d)
> +    if imported is None:
> +        bb.fatal("do_dbimport_all")
> +
> +    for (version, pkgarch, checksum, value) in imported:
> +        bb.note("imported (%s,%s,%s,%d)" % (version, pkgarch, checksum, value))
> +}
> diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
> new file mode 100755
> index 0000000..c543d8b
> --- /dev/null
> +++ b/scripts/bitbake-prserv-tool
> @@ -0,0 +1,53 @@
> +#!/usr/bin/env bash
> +
> +help ()
> +{
> +    base=`basename $0`
> +    echo -e "Usage: $base command"
> +    echo "Avaliable commands:"
> +    echo -e "\texport <file>: export and lock down the AUTOPR values from the PR service into a file for release."
> +    echo -e "\timport <file>: import the AUTOPR values from the exported file into the PR service."
> +}
> +
> +export ()
> +{
> +    file=$1
> +    [ "x${file}" == "x" ] && help && exit 1
> +    rm -f ${file}
> +
> +    bitbake prserv-misc -c dbexport_clean && bitbake prserv-misc -c dbexport_metainfo && bitbake -k universe -c prservdump
> +    s=`bitbake prserv-misc -e | grep ^PRSERV_DUMPFILE= | cut -f2 -d\"`
> +    if [ "x${s}" != "x" ];
> +    then
> +       [ -e $s ] && mv -f $s $file && echo "Exporting to file $file succeeded!"
> +       return 0
> +    fi
> +    echo "Exporting to file $file failed!"
> +    return 1
> +}
> +
> +import ()
> +{
> +    file=$1
> +    [ "x${file}" == "x" ] && help && exit 1
> +
> +    bitbake prserv-misc -c dbimport_all -R $file
> +    ret=$?
> +    [ $ret -eq 0 ] && echo "Importing from file $file succeeded!" || echo "Importing from file $file failed!"
> +    return $ret
> +}
> +
> +[ $# -eq 0 ] && help  && exit 1
> +
> +case $1 in
> +export)
> +    export $2
> +    ;;
> +import)
> +    import $2
> +    ;;
> +*)
> +    help
> +    exit 1
> +    ;;
> +esac

This is good and rather inventive but I'm a little worried about the way
we're interfacing to bitbake. I appreciate the codebase doesn't give us
a lot of good ways to do this but we perhaps need to find better ways
even if this means extending bitbake. I'm particularly worried that we
need to add a new recipe and an extra task to every recipe to make this
work.

I'm wondering if we could do something like this with an event handler:

meta/classes/primportexport.bbclass:
"""
python primportexport_handler () {
    if not e.data:
        return

    if isinstance(e, bb.event.RecipeParsed):
        [code like do_prservdump here]

}

addhandler primportexport_handler
"""

meta/conf/primpexp.conf:
"""
INHERIT += "primportexport"
"""

and then scripts/bitbake-prserv-tool for exporting would do something
like:

bitbake prserv-misc -c dbexport_clean 
bitbake prserv-misc -c dbexport_metainfo
touch meta/conf/primpexp.conf
bitbake -p -R meta/conf/primpexp.conf


You could also trigger the db_export_clean/dbexport_metainfo on
bb.event.ParseStarted and write out the variables upon the
bb.event.ParseCompleted event? This might mean we could end up not
needing the prserv-misc.bb recipe at all?



Also, for large amounts of python code, we're tending to place this into
meta/lib/*.py files now since these have less parsing overhead and tend
to lend themselves better to creation of python classes. Could you see
if it would make sense to add a prserv.py file there containing some of
these functions. As an example of usage, this commit is one I recently
made doing something like this for the multlib code:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=8e43f9a751f1637d483d48aa9a9a647d1e3d2003

The clear benefit here will come when we add something like:









