Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 08835723BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 01:09:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Nov 2014 17:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,473,1413270000"; d="scan'208";a="644774904"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.148])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2014 17:09:46 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 19:09:43 -0600
Message-Id: <3085b1d6aa23c584cd0bbeb788ed1f8ec0b9ef85.1417134564.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417134564.git.anibal.limon@linux.intel.com>
References: <cover.1417134564.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1417134564.git.anibal.limon@linux.intel.com>
References: <cover.1417134564.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] distrodata_class: checkpkg make usage of latest_versionstring methods in bitbake fetcher
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
X-List-Received-Date: Fri, 28 Nov 2014 01:09:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Because methods for get latest version of upstream package are now available
into bitbake removes duplicated code and make use of it.

Compatibility testing was made running distrodata class and the result files
can be found at:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=1813

[YOCTO #1813]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 492 ++++------------------------------------
 1 file changed, 43 insertions(+), 449 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index a890de7..83aa381 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -268,240 +268,6 @@ python do_checkpkg() {
         import tempfile
         import subprocess
 
-        """
-        sanity check to ensure same name and type. Match as many patterns as possible
-        such as:
-                gnome-common-2.20.0.tar.gz (most common format)
-                gtk+-2.90.1.tar.gz
-                xf86-input-synaptics-12.6.9.tar.gz
-                dri2proto-2.3.tar.gz
-                blktool_4.orig.tar.gz
-                libid3tag-0.15.1b.tar.gz
-                unzip552.tar.gz
-                icu4c-3_6-src.tgz
-                genext2fs_1.3.orig.tar.gz
-                gst-fluendo-mp3
-        """
-        prefix1 = "[a-zA-Z][a-zA-Z0-9]*([\-_][a-zA-Z]\w+)*\+?[\-_]"        # match most patterns which uses "-" as separator to version digits
-        prefix2 = "[a-zA-Z]+"                        # a loose pattern such as for unzip552.tar.gz
-        prefix3 = "[0-9]+[\-]?[a-zA-Z]+"                        # a loose pattern such as for 80325-quicky-0.4.tar.gz
-        prefix = "(%s|%s|%s)" % (prefix1, prefix2, prefix3)
-        ver_regex = "(([A-Z]*\d+[a-zA-Z]*[\.\-_]*)+)"#"((\d+[\.\-_[a-z]])+)"
-        # src.rpm extension was added only for rpm package. Can be removed if the rpm
-        # packaged will always be considered as having to be manually upgraded
-        suffix = "(tar\.gz|tgz|tar\.bz2|tar\.lz4|zip|xz|rpm|bz2|lz4|orig\.tar\.gz|tar\.xz|src\.tar\.gz|src\.tgz|svnr\d+\.tar\.bz2|stable\.tar\.gz|src\.rpm)"
-
-        suffixtuple = ("tar.gz", "tgz", "zip", "tar.bz2", "tar.xz", "tar.lz4", "bz2", "lz4", "orig.tar.gz", "src.tar.gz", "src.rpm", "src.tgz", "svnr\d+.tar.bz2", "stable.tar.gz", "src.rpm")
-        sinterstr = "(?P<name>%s?)v?(?P<ver>%s)(\-source)?" % (prefix, ver_regex)
-        sdirstr = "(?P<name>%s)\.?v?(?P<ver>%s)(\-source)?[\.\-](?P<type>%s$)" % (prefix, ver_regex, suffix)
-
-        def parse_inter(s):
-                m = re.search(sinterstr, s)
-                if not m:
-                        return None
-                else:
-                        return (m.group('name'), m.group('ver'), "")
-
-        def parse_dir(s):
-                m = re.search(sdirstr, s)
-                if not m:
-                        return None
-                else:
-                        return (m.group('name'), m.group('ver'), m.group('type'))
-
-        def modelate_version(version):
-                if version[0] in ['.', '-']:
-                        if version[1].isdigit():
-                                version = version[1] + version[0] + version[2:len(version)]
-                        else:
-                                version = version[1:len(version)]
-
-                version = re.sub('\-', '.', version)
-                version = re.sub('_', '.', version)
-                version = re.sub('(rc)+', '.-1.', version)
-                version = re.sub('(alpha)+', '.-3.', version)
-                version = re.sub('(beta)+', '.-2.', version)
-                if version[0] == 'v':
-                        version = version[1:len(version)]
-                return version
-
-        """
-        Check whether 'new' is newer than 'old' version. We use existing vercmp() for the
-        purpose. PE is cleared in comparison as it's not for build, and PV is cleared too
-        for simplicity as it's somehow difficult to get from various upstream format
-        """
-        def __vercmp(old, new):
-                (on, ov, ot) = old
-                (en, ev, et) = new
-                if on != en or (et and et not in suffixtuple):
-                        return False
-                ov = modelate_version(ov)
-                ev = modelate_version(ev)
-
-                result = bb.utils.vercmp(("0", ov, ""), ("0", ev, ""))
-                if result < 0:
-                    return True
-                else:
-                    return False
-
-        """
-        wrapper for fetch upstream directory info
-                'url'        - upstream link customized by regular expression
-                'd'        - database
-                'tmpf'        - tmpfile for fetcher output
-        We don't want to exit whole build due to one recipe error. So handle all exceptions 
-        gracefully w/o leaking to outer. 
-        """
-        def internal_fetch_wget(url, ud, d, tmpf):
-                status = "ErrFetchUnknown"
-
-                agent = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12"
-                fetchcmd = "/usr/bin/env wget -t 1 --passive-ftp -O %s --user-agent=\"%s\" '%s'" % (tmpf.name, agent, url)
-                try:
-                        fetcher = bb.fetch2.wget.Wget(d)
-                        fetcher._runwget(ud, d, fetchcmd, True)
-                        status = "SUCC"
-                except bb.fetch2.BBFetchException, e:
-                        status = "ErrFetch"
-
-                return status
-
-        """
-        Check on middle version directory such as "2.4/" in "http://xxx/2.4/pkg-2.4.1.tar.gz", 
-                'url'        - upstream link customized by regular expression
-                'd'        - database
-                'curver' - current version
-        Return new version if success, or else error in "Errxxxx" style
-        """
-        def check_new_dir(url, curver, ud, d):
-                pn = d.getVar('PN', True)
-                f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-1-" % pn)
-                status = internal_fetch_wget(url, ud, d, f)
-                fhtml = f.read()
-                if status == "SUCC" and len(fhtml):
-                        newver = parse_inter(curver)
-
-                        """
-                        match "*4.1/">*4.1/ where '*' matches chars
-                        N.B. add package name, only match for digits
-                        """
-                        regex = d.getVar('REGEX', True)
-                        if regex == '':
-                                regex = "^%s" %prefix
-                        m = re.search("^%s" % regex, curver)
-                        if m:
-                                s = "%s[^\d\"]*?(\d+[\.\-_])+\d+/?" % m.group()
-                        else:
-                                s = "(\d+[\.\-_])+\d+/?"
-
-                        searchstr = "[hH][rR][eE][fF]=\"%s\">" % s
-
-                        reg = re.compile(searchstr)
-                        valid = 0
-                        for line in fhtml.split("\n"):
-                                if line.find(curver) >= 0:
-                                        valid = 1
-                                m = reg.search(line)
-                                if m:
-                                        ver = m.group().split("\"")[1]
-                                        ver = ver.strip("/")
-                                        ver = parse_inter(ver)
-                                        if ver and __vercmp(newver, ver) == True:
-                                                newver = ver
-
-                        """Expect a match for curver in directory list, or else it indicates unknown format"""
-                        if not valid:
-                                status = "ErrParseInterDir"
-                        else:
-                                """rejoin the path name"""
-                                status = newver[0] + newver[1]
-                elif not len(fhtml):
-                        status = "ErrHostNoDir"
-
-                f.close()
-                if status != "ErrHostNoDir" and re.match("Err", status):
-                        logpath = d.getVar('LOG_DIR', True)
-                        subprocess.call("cp %s %s/" % (f.name, logpath), shell=True)
-                os.unlink(f.name)
-                return status
-
-        """
-        Check on the last directory to search '2.4.1' in "http://xxx/2.4/pkg-2.4.1.tar.gz", 
-                'url'        - upstream link customized by regular expression
-                'd'        - database
-                'curname' - current package name
-        Return new version if success, or else error in "Errxxxx" style
-        """
-        def check_new_version(url, curname, ud, d):
-                """possible to have no version in pkg name, such as spectrum-fw"""
-                if not re.search("\d+", curname):
-                        return pcurver
-                pn = d.getVar('PN', True)
-                newver_regex = d.getVar('REGEX', True)
-                f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-2-" % pn)
-                status = internal_fetch_wget(url, ud, d, f)
-                fhtml = f.read()
-
-                if status == "SUCC" and len(fhtml):
-                        newver = parse_dir(curname)
-
-                        if not newver_regex:
-                                """this is the default matching pattern, if recipe does not """
-                                """provide a regex expression """
-                                """match "{PN}-5.21.1.tar.gz">{PN}-5.21.1.tar.gz """
-                                pn1 = re.search("^%s" % prefix, curname).group()
-                                s = "[^\"]*%s[^\d\"]*?(\d+[\.\-_])+[^\"]*" % pn1
-                                searchstr = "[hH][rR][eE][fF]=\"%s\".*[>\"]" % s
-                                reg = searchstr
-                        else:
-                               reg = newver_regex
-                        valid = 0
-                        count = 0
-                        for line in fhtml.split("\n"):
-                                if pn == 'kconfig-frontends':
-                                        m = re.findall(reg, line)
-                                        if m:
-                                            valid = 1
-                                            for match in m:
-                                                    (on, ov, oe) = newver
-                                                    ver = (on, match[0], oe)
-                                                    if ver and __vercmp(newver, ver) == True:
-                                                            newver = ver
-                                        continue
-                                count += 1
-                                m = re.search(reg, line)
-                                if m:
-                                        valid = 1
-                                        if not newver_regex:
-                                                ver = m.group().split("\"")[1].split("/")[-1]
-                                                if ver == "download":
-                                                        ver = m.group().split("\"")[1].split("/")[-2]
-                                                ver = parse_dir(ver)
-                                        else:
-                                                """ we cheat a little here, but we assume that the
-                                                regular expression in the recipe will extract exacly
-                                                the version """
-                                                (on, ov, oe) = newver
-                                                ver = (on, m.group('pver'), oe)
-                                        if ver and __vercmp(newver, ver) == True:
-                                                newver = ver
-                        """Expect a match for curver in directory list, or else it indicates unknown format"""
-                        if not valid:
-                                status = "ErrParseDir"
-                        else:
-                                """newver still contains a full package name string"""
-                                status = re.sub('_', '.', newver[1])
-                elif not len(fhtml):
-                        status = "ErrHostNoDir"
-
-                f.close()
-                """if host hasn't directory information, no need to save tmp file"""
-                if status != "ErrHostNoDir" and re.match("Err", status):
-                        logpath = d.getVar('LOG_DIR', True)
-                        subprocess.call("cp %s %s/" % (f.name, logpath), shell=True)
-                os.unlink(f.name)
-                return status
-
         """first check whether a uri is provided"""
         src_uri = d.getVar('SRC_URI', True)
         if not src_uri:
@@ -543,9 +309,6 @@ python do_checkpkg() {
             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
             bb.data.update_data(localdata)
 
-        chk_uri = d.getVar('REGEX_URI', True)
-        if not chk_uri:
-               chk_uri = src_uri
         pdesc = localdata.getVar('DESCRIPTION', True)
         pgrp = localdata.getVar('SECTION', True)
         if localdata.getVar('PRSPV', True):
@@ -562,232 +325,63 @@ python do_checkpkg() {
         psrcuri = localdata.getVar('SRC_URI', True)
         maintainer = localdata.getVar('RECIPE_MAINTAINER', True)
 
+        """ Get upstream version version """
+        pupver = None
+        pstatus = "ErrUnknown"
         found = 0
+
         for uri in src_uri.split():
-                m = re.compile('(?P<type>[^:]*)').match(uri)
-                if not m:
-                        raise MalformedUrl(uri)
-                elif m.group('type') in ('http', 'https', 'ftp', 'cvs', 'svn', 'git'):
-                        found = 1
-                        pproto = m.group('type')
-                        break
+            m = re.compile('(?P<type>[^:]*)').match(uri)
+            if not m:
+                raise MalformedUrl(uri)
+            elif m.group('type') in ('http', 'https', 'ftp', 'cvs', 'svn', 'git'):
+                found = 1
+                psrcuri = uri
+                pproto = m.group('type')
+                break
         if not found:
                 pproto = "file"
-        pupver = "N/A"
-        pstatus = "ErrUnknown"
-
-        (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(uri)
-        if type in ['http', 'https', 'ftp']:
-                if d.getVar('PRSPV', True):
-                    pcurver = d.getVar('PRSPV', True)
-                else:
-                    pcurver = d.getVar('PV', True)
-        else:
-                if d.getVar('PRSPV', True):
-                    pcurver = d.getVar('PRSPV', True)
-                else:
-                    pcurver = d.getVar("SRCREV", True)
-
-
-        if type in ['http', 'https', 'ftp']:
-                ud = bb.fetch2.FetchData(uri, d)
-                newver = pcurver
-                altpath = path
-                dirver = "-"
-                curname = "-"
-
-                """
-                match version number amid the path, such as "5.7" in:
-                        http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
-                N.B. how about sth. like "../5.7/5.8/..."? Not find such example so far :-P
-                """
-                m = re.search(r"[^/]*(\d+\.)+\d+([\-_]r\d+)*/", path)
-                if m:
-                        altpath = path.split(m.group())[0]
-                        dirver = m.group().strip("/")
-
-                        """use new path and remove param. for wget only param is md5sum"""
-                        alturi = bb.fetch.encodeurl([type, host, altpath, user, pswd, {}])
-                        my_uri = d.getVar('REGEX_URI', True)
-                        if my_uri:
-                            if d.getVar('PRSPV', True):
-                                    newver = d.getVar('PRSPV', True)
-                            else:
-                                    newver = d.getVar('PV', True)
-                        else:
-                            newver = check_new_dir(alturi, dirver, ud, d)
-                        altpath = path
-                        if not re.match("Err", newver) and dirver != newver:
-                                altpath = altpath.replace(dirver, newver, True)
-                # For folder in folder cases - try to enter the folder again and then try parsing
-                """Now try to acquire all remote files in current directory"""
-                if not re.match("Err", newver):
-                        curname = altpath.split("/")[-1]
-
-                        """get remote name by skipping pacakge name"""
-                        m = re.search(r"/.*/", altpath)
-                        if not m:
-                                altpath = "/"
-                        else:
-                                altpath = m.group()
-
-                        chk_uri = d.getVar('REGEX_URI', True)
-                        if not chk_uri:
-                                alturi = bb.fetch.encodeurl([type, host, altpath, user, pswd, {}])
-                        else:
-                                alturi = chk_uri
-                        newver = check_new_version(alturi, curname, ud, d)
-                        while(newver == "ErrHostNoDir"):
-                                if alturi == "/download":
-                                        break
-                                else:
-                                        alturi = "/".join(alturi.split("/")[0:-2]) + "/download"
-                                        newver = check_new_version(alturi, curname, ud, d)
-                if not re.match("Err", newver):
-                        pupver = newver
-                        if pupver != pcurver:
-                                pstatus = "UPDATE"
-                        else:
-                                pstatus = "MATCH"
-
-                if re.match("Err", newver):
-                        pstatus = newver + ":" + altpath + ":" + dirver + ":" + curname
-        elif type == 'git':
-                if user:
-                        gituser = user + '@'
-                else:
-                        gituser = ""
-
-                if 'protocol' in parm:
-                        gitproto = parm['protocol']
-                else:
-                        gitproto = "git"
 
-                # Get all tags and HEAD
-                if d.getVar('GIT_REGEX', True):
-                        gitcmd = "git ls-remote %s://%s%s%s %s 2>&1" % (gitproto, gituser, host, path, d.getVar('GIT_REGEX', True))
-                else:
-                        gitcmd = "git ls-remote %s://%s%s%s *tag* 2>&1" % (gitproto, gituser, host, path)
-                gitcmd2 = "git ls-remote %s://%s%s%s HEAD 2>&1" % (gitproto, gituser, host, path)
-
-                tmp = os.popen(gitcmd).read()
-                if 'unable to connect' in tmp:
-                        tmp = None
-                tmp2 = os.popen(gitcmd2).read()
-                if 'unable to connect' in tmp2:
-                        tmp2 = None
-                #This is for those repos have tag like: refs/tags/1.2.2
-                phash = pversion.rsplit("+")[-1]
-                if tmp:
-                        tmpline = tmp.split("\n")
-                        verflag = 0
-                        pupver = pversion
-                        for line in tmpline:
-                                if len(line)==0:
-                                        break;
-                                puptag = line.split("/")[-1]
-                                upstr_regex = d.getVar('REGEX', True)
-                                if upstr_regex:
-                                        puptag = re.search(upstr_regex, puptag)
-                                else:
-                                        puptag = re.search("(?P<pver>([0-9][\.|_]?)+)", puptag)
-                                if puptag == None:
-                                        continue
-                                puptag = puptag.group('pver')
-                                puptag = re.sub("_",".",puptag)
-                                plocaltag = pupver.split("+git")[0]
-                                if "git" in plocaltag:
-                                        plocaltag = plocaltag.split("-")[0]
-                                result = bb.utils.vercmp(("0", puptag, ""), ("0", plocaltag, ""))
-
-                                if result > 0:
-                                         verflag = 1
-                                         pupver = puptag
-                                elif verflag == 0 :
-                                         pupver = plocaltag
-                #This is for those no tag repo
-                elif tmp2:
+        if pproto in ['http', 'https', 'ftp', 'git']:
+            try:
+                ud = bb.fetch2.FetchData(psrcuri, d)
+                pupver = ud.method.latest_versionstring(ud, d)
+                if pproto == 'git':
+                    if pupver == "":
                         pupver = pversion.rsplit("+")[0]
-                        phash = pupver
-                else:
-                        pstatus = "ErrGitAccess"
-                if not ('ErrGitAccess' in pstatus):
-
-                        latest_head = tmp2.rsplit("\t")[0][:7]
-                        tmp3 = re.search('(?P<git_ver>(\d+[\.-]?)+)(?P<git_prefix>(\+git[r|\-|]?)AUTOINC\+)(?P<head_md5>([\w|_]+))', pversion)
-                        tmp4 = re.search('(?P<git_ver>(\d+[\.-]?)+)(?P<git_prefix>(\+git[r|\-|]?)AUTOINC\+)(?P<head_md5>([\w|_]+))', pupver)
-                        if not tmp4:
-                                tmp4 = re.search('(?P<git_ver>(\d+[\.-]?)+)', pupver)
-
-                        if tmp3:
-                                # Get status of the package - MATCH/UPDATE
-                                result = bb.utils.vercmp(("0", tmp3.group('git_ver'), ""), ("0",tmp3.group('git_ver') , ""))
-                                # Get the latest tag
-                                pstatus = 'MATCH'
-                                if result < 0:
-                                        latest_pv = tmp3.group('git_ver')
-                                else:
-                                        latest_pv = pupver
-                                        if not(tmp3.group('head_md5')[:7] in latest_head) or not(latest_head in tmp3.group('head_md5')[:7]):
-                                                pstatus = 'UPDATE'
-
-                                git_prefix = tmp3.group('git_prefix')
-                                pupver = latest_pv + tmp3.group('git_prefix') + latest_head
-                        else:
-                                if not tmp3:
-                                        bb.plain("#DEBUG# Package %s: current version (%s) doesn't match the usual pattern" %(pname, pversion))
-        elif type == 'svn':
-                ud = bb.fetch2.FetchData(uri, d)
-
-                svnFetcher = bb.fetch2.svn.Svn(d)
-                svnFetcher.urldata_init(ud, d)
-                try:
-                        pupver = svnFetcher.latest_revision(ud, d, ud.names[0])
-                except bb.fetch2.FetchError:
-                        pstatus = "ErrSvnAccess"
-                
-                if pupver:
-                        if pupver in pversion:
-                                pstatus = "MATCH"
-                        else:
-                                pstatus = "UPDATE"
-                else:
-                        pstatus = "ErrSvnAccess"
-                
-                if 'rev' in ud.parm:
-                        pcurver = ud.parm['rev']
-
-                if pstatus != "ErrSvnAccess":
-                        tag = pversion.rsplit("+svn")[0]
-                        svn_prefix = re.search('(\+svn[r|\-]?)', pversion)
-                        if tag and svn_prefix:
-                                pupver = tag + svn_prefix.group() + pupver
-
-        elif type == 'cvs':
-                pupver = "HEAD"
-                pstatus = "UPDATE"
-        elif type == 'file':
-                """local file is always up-to-date"""
-                pupver = pcurver
-                pstatus = "MATCH"
+                    if re.search(pversion, "gitrAUTOINC"):
+                        pupver += "+gitrAUTOINC+"
+                    else:
+                        pupver += "+gitAUTOINC+"
+                    latest_revision = ud.method.latest_revision(ud, d, ud.names[0])
+                    pupver += latest_revision[:10]
+            except Exception as inst:
+                bb.warn("%s: unexpected error: %s" % (pname, repr(inst)))
+                pstatus = "ErrAccess"
+        elif pproto == "file":
+            """Local files are always updated"""
+            pupver = pversion
         else:
-                pstatus = "ErrUnsupportedProto"
+            pstatus = "ErrUnsupportedProto"
+            bb.note("do_checkpkg, protocol %s isn't implemented" % pproto)
 
-        if re.match("Err", pstatus):
-                pstatus += ":%s%s" % (host, path)
+        if not pupver:
+            pupver = "N/A"
+        elif pupver == pversion:
+            pstatus = "MATCH"
+        else:
+            pstatus = "UPDATE"
 
         """Read from manual distro tracking fields as alternative"""
         pmver = d.getVar("RECIPE_UPSTREAM_VERSION", True)
         if not pmver:
-                pmver = "N/A"
-                pmstatus = "ErrNoRecipeData"
+            pmver = "N/A"
+            pmstatus = "ErrNoRecipeData"
+        elif pmver == pupver:
+            pmstatus = "MATCH"
         else:
-                if pmver == pcurver:
-                        pmstatus = "MATCH"
-                else:
-                        pmstatus = "UPDATE"
+            pmstatus = "UPDATE"
 
-        psrcuri = psrcuri.split()[0]
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
         no_upgr_reason = d.getVar('RECIPE_NO_UPDATE_REASON', True)
-- 
1.9.1


