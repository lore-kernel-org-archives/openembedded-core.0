Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 10D7C71B72
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 10:37:03 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p190so41674312wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sLmhJDLSZboGPNhG3pzxRf4/H2OUi2DiPQB17j5BlCI=;
	b=hQqS9s+pVgknp+F11J9qJkouG011gf6XoykhnFOl2X7+Vt0/3rmKMwOSh+ikv0aFPO
	Yr9hlN9Uu4zsDJF+zeuDemIBzAhVksJNv5yjlAQqpyPpJzvJ578YcfcmDmfpm3Qn8LbB
	aF6vrHIFJZlVql5v6Z1h0v3lSS1K/9qoGRqDEBGGeA3ugIqIY1a8DruJVCb5cNK/Gm33
	yBnS5hWWxinDGfQHlNcfu5DW2iHzUiluxfAec3gPafSFMznTX1oyZZEuvIJFHe/TLOsK
	urvUBk0i6XzgqUDu8SpEzVfkYKLT3CRCBvfxHOoISie+7xYH9rwev6HfrCzOmX5++p7d
	ZARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sLmhJDLSZboGPNhG3pzxRf4/H2OUi2DiPQB17j5BlCI=;
	b=VUbEJWv0A9q00ZSf9fxHLtJrsLiVYV7bN7pzJ3CUV73vYY+5tcRUkZoA8FGpKGmd38
	Zv/1G57unGzSOVxcsg9MBIXM3QuohGVL/PBldV+/HbMFBWYFKlGgjfVgTnayWTxmByhM
	JhVDPKKKfR+aYIJKFqzO4g91ryFTjSzlBiw6U2B/sxjD3PrqtYA72DXkwhfbMFZzyur8
	uKLR+gCqBX1Wcy683vWu4gbpk8BnCFGD0kS1Ij8q9rBmGfmbWipbUZ1JBivfY1sPfF4q
	2doN+0ngW8S6F13Zua3hsgGDtN+xE+4HBhz+xA+g3gpMS09+4XLkdUmggr0setgQHvL3
	uBzg==
X-Gm-Message-State: ABUngvfsGyCcWe+8d32oae8dVo8rAUG+GEwTgyHEa3nTmx4Xufg7Tep5NwSj9cAMqvUBdvSv
X-Received: by 10.28.87.85 with SMTP id l82mr2498243wmb.99.1478255824190;
	Fri, 04 Nov 2016 03:37:04 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l6sm13598641wjc.7.2016.11.04.03.37.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Nov 2016 03:37:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 10:37:01 +0000
Message-Id: <1478255821-5289-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] distro_check: partial rewrite to make it work again
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
X-List-Received-Date: Fri, 04 Nov 2016 10:37:04 -0000

This library suffered as part of the Python 2 to Python 3 migration and stopped
working entirely.

Fix all the migration problems such as files being treated as strings but opened
in binary mode, insufficient use of with on files, and so on.

Rewrite large amounts to be Pythonic instead of C-in-Python.

Update OpenSuse and Fedora URLs.

Fedora now splits the archive alphabetically so handle that.

[ YOCTO #10562 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/distro_check.py | 281 +++++++++++++++++---------------------------
 1 file changed, 110 insertions(+), 171 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 87c52fa..00c827e 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -1,32 +1,17 @@
-from contextlib import contextmanager
-
-from bb.utils import export_proxies
-
 def create_socket(url, d):
     import urllib
+    from bb.utils import export_proxies
 
-    socket = None
-    try:
-        export_proxies(d)
-        socket = urllib.request.urlopen(url)
-    except:
-        bb.warn("distro_check: create_socket url %s can't access" % url)
-
-    return socket
+    export_proxies(d)
+    return urllib.request.urlopen(url)
 
 def get_links_from_url(url, d):
     "Return all the href links found on the web location"
 
     from bs4 import BeautifulSoup, SoupStrainer
 
+    soup = BeautifulSoup(create_socket(url,d), "html.parser", parse_only=SoupStrainer("a"))
     hyperlinks = []
-
-    webpage = ''
-    sock = create_socket(url,d)
-    if sock:
-        webpage = sock.read()
-
-    soup = BeautifulSoup(webpage, "html.parser", parse_only=SoupStrainer("a"))
     for line in soup.find_all('a', href=True):
         hyperlinks.append(line['href'].strip('/'))
     return hyperlinks
@@ -37,6 +22,7 @@ def find_latest_numeric_release(url, d):
     maxstr=""
     for link in get_links_from_url(url, d):
         try:
+            # TODO use LooseVersion
             release = float(link)
         except:
             release = 0
@@ -47,144 +33,116 @@ def find_latest_numeric_release(url, d):
 
 def is_src_rpm(name):
     "Check if the link is pointing to a src.rpm file"
-    if name[-8:] == ".src.rpm":
-        return True
-    else:
-        return False
+    return name.endswith(".src.rpm")
 
 def package_name_from_srpm(srpm):
     "Strip out the package name from the src.rpm filename"
-    strings = srpm.split('-')
-    package_name = strings[0]
-    for i in range(1, len (strings) - 1):
-        str = strings[i]
-        if not str[0].isdigit():
-            package_name += '-' + str
-    return package_name
-
-def clean_package_list(package_list):
-    "Removes multiple entries of packages and sorts the list"
-    set = {}
-    map(set.__setitem__, package_list, [])
-    return set.keys()
 
+    # ca-certificates-2016.2.7-1.0.fc24.src.rpm
+    # ^name           ^ver     ^release^removed
+    (name, version, release) = srpm.replace(".src.rpm", "").rsplit("-", 2)
+    return name
 
 def get_latest_released_meego_source_package_list(d):
     "Returns list of all the name os packages in the latest meego distro"
 
-    package_names = []
-    try:
-        f = open("/tmp/Meego-1.1", "r")
+    package_names = set()
+    with open("/tmp/Meego-1.1", "r") as f:
         for line in f:
-            package_names.append(line[:-1] + ":" + "main") # Also strip the '\n' at the end
-    except IOError: pass
-    package_list=clean_package_list(package_names)
-    return "1.0", package_list
+            package_names.add(line.strip() + ":" + "main")
+    return "1.1", package_names
 
 def get_source_package_list_from_url(url, section, d):
     "Return a sectioned list of package names from a URL list"
 
     bb.note("Reading %s: %s" % (url, section))
     links = get_links_from_url(url, d)
-    srpms = list(filter(is_src_rpm, links))
-    names_list = list(map(package_name_from_srpm, srpms))
+    srpms = filter(is_src_rpm, links)
+    names_list = map(package_name_from_srpm, srpms)
 
-    new_pkgs = []
+    new_pkgs = set()
     for pkgs in names_list:
-       new_pkgs.append(pkgs + ":" + section)
-
+       new_pkgs.add(pkgs + ":" + section)
     return new_pkgs
 
+def get_source_package_list_from_url_by_letter(url, section, d):
+    import string
+    from urllib.error import HTTPError
+    packages = set()
+    for letter in (string.ascii_lowercase + string.digits):
+        # Not all subfolders may exist, so silently handle 404
+        try:
+            packages |= get_source_package_list_from_url(url + "/" + letter, section, d)
+        except HTTPError as e:
+            if e.code != 404: raise
+    return packages
+
 def get_latest_released_fedora_source_package_list(d):
     "Returns list of all the name os packages in the latest fedora distro"
     latest = find_latest_numeric_release("http://archive.fedoraproject.org/pub/fedora/linux/releases/", d)
-
-    package_names = get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/releases/%s/Fedora/source/SRPMS/" % latest, "main", d)
-
-#    package_names += get_source_package_list_from_url("http://download.fedora.redhat.com/pub/fedora/linux/releases/%s/Everything/source/SPRMS/" % latest, "everything")
-    package_names += get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates", d)
-
-    package_list=clean_package_list(package_names)
-        
-    return latest, package_list
+    package_names = get_source_package_list_from_url_by_letter("http://archive.fedoraproject.org/pub/fedora/linux/releases/%s/Everything/source/tree/Packages/" % latest, "main", d)
+    package_names |= get_source_package_list_from_url_by_letter("http://archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates", d)
+    return latest, package_names
 
 def get_latest_released_opensuse_source_package_list(d):
     "Returns list of all the name os packages in the latest opensuse distro"
     latest = find_latest_numeric_release("http://download.opensuse.org/source/distribution/",d)
 
     package_names = get_source_package_list_from_url("http://download.opensuse.org/source/distribution/%s/repo/oss/suse/src/" % latest, "main", d)
-    package_names += get_source_package_list_from_url("http://download.opensuse.org/update/%s/rpm/src/" % latest, "updates", d)
-
-    package_list=clean_package_list(package_names)
-    return latest, package_list
+    package_names |= get_source_package_list_from_url("http://download.opensuse.org/update/%s/src/" % latest, "updates", d)
+    return latest, package_names
 
 def get_latest_released_mandriva_source_package_list(d):
     "Returns list of all the name os packages in the latest mandriva distro"
     latest = find_latest_numeric_release("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/", d)
     package_names = get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/release/" % latest, "main", d)
-#    package_names += get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/contrib/release/" % latest, "contrib")
-    package_names += get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/updates/" % latest, "updates", d)
-
-    package_list=clean_package_list(package_names)
-    return latest, package_list
+    package_names |= get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/updates/" % latest, "updates", d)
+    return latest, package_names
 
 def find_latest_debian_release(url, d):
     "Find the latest listed debian release on the given url"
 
-    releases = []
-    for link in get_links_from_url(url, d):
-        if link[:6] == "Debian":
-            if ';' not in link:
-                releases.append(link)
+    releases = [link.replace("Debian", "")
+                for link in get_links_from_url(url, d)
+                if link.startswith("Debian")]
     releases.sort()
     try:
-        return releases.pop()[6:]
+        return releases[-1]
     except:
         return "_NotFound_"
 
 def get_debian_style_source_package_list(url, section, d):
     "Return the list of package-names stored in the debian style Sources.gz file"
-    import tempfile
     import gzip
 
-    webpage = ''
-    sock = create_socket(url,d)
-    if sock:
-        webpage = sock.read()
-
-    tmpfile = tempfile.NamedTemporaryFile(mode='wb', prefix='oecore.', suffix='.tmp', delete=False)
-    tmpfilename=tmpfile.name
-    tmpfile.write(sock.read())
-    tmpfile.close()
-    bb.note("Reading %s: %s" % (url, section))
-
-    f = gzip.open(tmpfilename)
-    package_names = []
-    for line in f:
-        if line[:9] == "Package: ":
-            package_names.append(line[9:-1] + ":" + section) # Also strip the '\n' at the end
-    os.unlink(tmpfilename)
-
+    package_names = set()
+    for line in gzip.open(create_socket(url, d), mode="rt"):
+        if line.startswith("Package:"):
+            pkg = line.split(":", 1)[1].strip()
+            package_names.add(pkg + ":" + section)
     return package_names
 
 def get_latest_released_debian_source_package_list(d):
-    "Returns list of all the name os packages in the latest debian distro"
+    "Returns list of all the name of packages in the latest debian distro"
     latest = find_latest_debian_release("http://ftp.debian.org/debian/dists/", d)
-    url = "http://ftp.debian.org/debian/dists/stable/main/source/Sources.gz" 
+    url = "http://ftp.debian.org/debian/dists/stable/main/source/Sources.gz"
     package_names = get_debian_style_source_package_list(url, "main", d)
-#    url = "http://ftp.debian.org/debian/dists/stable/contrib/source/Sources.gz" 
-#    package_names += get_debian_style_source_package_list(url, "contrib")
-    url = "http://ftp.debian.org/debian/dists/stable-proposed-updates/main/source/Sources.gz" 
-    package_names += get_debian_style_source_package_list(url, "updates", d)
-    package_list=clean_package_list(package_names)
-    return latest, package_list
+    url = "http://ftp.debian.org/debian/dists/stable-proposed-updates/main/source/Sources.gz"
+    package_names |= get_debian_style_source_package_list(url, "updates", d)
+    return latest, package_names
 
 def find_latest_ubuntu_release(url, d):
-    "Find the latest listed ubuntu release on the given url"
+    """
+    Find the latest listed Ubuntu release on the given ubuntu/dists/ URL.
+
+    To avoid matching development releases look for distributions that have
+    updates, so the resulting distro could be any supported release.
+    """
     url += "?C=M;O=D" # Descending Sort by Last Modified
     for link in get_links_from_url(url, d):
-        if link[-8:] == "-updates":
-            return link[:-8]
+        if "-updates" in link:
+            distro = link.replace("-updates", "")
+            return distro
     return "_NotFound_"
 
 def get_latest_released_ubuntu_source_package_list(d):
@@ -192,52 +150,45 @@ def get_latest_released_ubuntu_source_package_list(d):
     latest = find_latest_ubuntu_release("http://archive.ubuntu.com/ubuntu/dists/", d)
     url = "http://archive.ubuntu.com/ubuntu/dists/%s/main/source/Sources.gz" % latest
     package_names = get_debian_style_source_package_list(url, "main", d)
-#    url = "http://archive.ubuntu.com/ubuntu/dists/%s/multiverse/source/Sources.gz" % latest
-#    package_names += get_debian_style_source_package_list(url, "multiverse")
-#    url = "http://archive.ubuntu.com/ubuntu/dists/%s/universe/source/Sources.gz" % latest
-#    package_names += get_debian_style_source_package_list(url, "universe")
     url = "http://archive.ubuntu.com/ubuntu/dists/%s-updates/main/source/Sources.gz" % latest
-    package_names += get_debian_style_source_package_list(url, "updates", d)
-    package_list=clean_package_list(package_names)
-    return latest, package_list
+    package_names |= get_debian_style_source_package_list(url, "updates", d)
+    return latest, package_names
 
 def create_distro_packages_list(distro_check_dir, d):
+    import shutil
+
     pkglst_dir = os.path.join(distro_check_dir, "package_lists")
-    if not os.path.isdir (pkglst_dir):
-        os.makedirs(pkglst_dir)
-    # first clear old stuff
-    for file in os.listdir(pkglst_dir):
-        os.unlink(os.path.join(pkglst_dir, file))
- 
-    per_distro_functions = [
-                            ["Debian", get_latest_released_debian_source_package_list],
-                            ["Ubuntu", get_latest_released_ubuntu_source_package_list],
-                            ["Fedora", get_latest_released_fedora_source_package_list],
-                            ["OpenSuSE", get_latest_released_opensuse_source_package_list],
-                            ["Mandriva", get_latest_released_mandriva_source_package_list],
-                            ["Meego", get_latest_released_meego_source_package_list]
-                           ]
- 
-    from datetime import datetime
-    begin = datetime.now()
-    for distro in per_distro_functions:
-        name = distro[0]
-        release, package_list = distro[1](d)
+    bb.utils.remove(pkglst_dir, True)
+    bb.utils.mkdirhier(pkglst_dir)
+
+    per_distro_functions = (
+                            ("Debian", get_latest_released_debian_source_package_list),
+                            ("Ubuntu", get_latest_released_ubuntu_source_package_list),
+                            ("Fedora", get_latest_released_fedora_source_package_list),
+                            ("OpenSuSE", get_latest_released_opensuse_source_package_list),
+                            ("Mandriva", get_latest_released_mandriva_source_package_list),
+                            ("Meego", get_latest_released_meego_source_package_list)
+                           )
+
+    for name, fetcher_func in per_distro_functions:
+        try:
+            release, package_list = fetcher_func(d)
+        except Exception as e:
+            bb.warn("Cannot fetch packages for %s: %s" % (name, e))
         bb.note("Distro: %s, Latest Release: %s, # src packages: %d" % (name, release, len(package_list)))
+        if len(package_list) == 0:
+            bb.error("Didn't fetch any packages for %s %s" % (name, release))
+
         package_list_file = os.path.join(pkglst_dir, name + "-" + release)
-        f = open(package_list_file, "w+b")
-        for pkg in package_list:
-            f.write(pkg + "\n")
-        f.close()
-    end = datetime.now()
-    delta = end - begin
-    bb.note("package_list generatiosn took this much time: %d seconds" % delta.seconds)
+        with open(package_list_file, 'w') as f:
+            for pkg in sorted(package_list):
+                f.write(pkg + "\n")
 
 def update_distro_data(distro_check_dir, datetime, d):
     """
-        If distro packages list data is old then rebuild it.
-        The operations has to be protected by a lock so that
-        only one thread performes it at a time.
+    If distro packages list data is old then rebuild it.
+    The operations has to be protected by a lock so that
+    only one thread performes it at a time.
     """
     if not os.path.isdir (distro_check_dir):
         try:
@@ -264,25 +215,22 @@ def update_distro_data(distro_check_dir, datetime, d):
             f.seek(0)
             f.write(datetime)
 
-    except OSError:
-        raise Exception('Unable to read/write this file: %s' % (datetime_file))
+    except OSError as e:
+        raise Exception('Unable to open timestamp: %s' % e)
     finally:
         fcntl.lockf(f, fcntl.LOCK_UN)
         f.close()
- 
+
 def compare_in_distro_packages_list(distro_check_dir, d):
     if not os.path.isdir(distro_check_dir):
         raise Exception("compare_in_distro_packages_list: invalid distro_check_dir passed")
-        
+
     localdata = bb.data.createCopy(d)
     pkglst_dir = os.path.join(distro_check_dir, "package_lists")
     matching_distros = []
-    pn = d.getVar('PN', True)
-    recipe_name = d.getVar('PN', True)
+    pn = recipe_name = d.getVar('PN', True)
     bb.note("Checking: %s" % pn)
 
-    trim_dict = dict({"-native":"-native", "-cross":"-cross", "-initial":"-initial"})
-
     if pn.find("-native") != -1:
         pnstripped = pn.split("-native")
         localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
@@ -308,27 +256,22 @@ def compare_in_distro_packages_list(distro_check_dir, d):
         recipe_name = pnstripped[0]
 
     bb.note("Recipe: %s" % recipe_name)
-    tmp = localdata.getVar('DISTRO_PN_ALIAS', True)
 
     distro_exceptions = dict({"OE-Core":'OE-Core', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "Windriver":'Windriver', "OSPDT":'OSPDT Approved', "Poky":'poky'})
-
-    if tmp:
-        list = tmp.split(' ')
-        for str in list:
-            if str and str.find("=") == -1 and distro_exceptions[str]:
-                matching_distros.append(str)
+    tmp = localdata.getVar('DISTRO_PN_ALIAS', True) or ""
+    for str in tmp.split():
+        if str and str.find("=") == -1 and distro_exceptions[str]:
+            matching_distros.append(str)
 
     distro_pn_aliases = {}
-    if tmp:
-        list = tmp.split(' ')
-        for str in list:
-            if str.find("=") != -1:
-                (dist, pn_alias) = str.split('=')
-                distro_pn_aliases[dist.strip().lower()] = pn_alias.strip()
- 
+    for str in tmp.split():
+        if "=" in str:
+            (dist, pn_alias) = str.split('=')
+            distro_pn_aliases[dist.strip().lower()] = pn_alias.strip()
+
     for file in os.listdir(pkglst_dir):
         (distro, distro_release) = file.split("-")
-        f = open(os.path.join(pkglst_dir, file), "rb")
+        f = open(os.path.join(pkglst_dir, file), "r")
         for line in f:
             (pkg, section) = line.split(":")
             if distro.lower() in distro_pn_aliases:
@@ -341,16 +284,12 @@ def compare_in_distro_packages_list(distro_check_dir, d):
                 break
         f.close()
 
-    
-    if tmp != None:
-        list = tmp.split(' ')
-        for item in list:
-            matching_distros.append(item)
+    for item in tmp.split():
+        matching_distros.append(item)
     bb.note("Matching: %s" % matching_distros)
     return matching_distros
 
 def create_log_file(d, logname):
-    import subprocess
     logpath = d.getVar('LOG_DIR', True)
     bb.utils.mkdirhier(logpath)
     logfn, logsuffix = os.path.splitext(logname)
@@ -359,7 +298,7 @@ def create_log_file(d, logname):
             slogfile = os.path.join(logpath, logname)
             if os.path.exists(slogfile):
                     os.remove(slogfile)
-            subprocess.call("touch %s" % logfile, shell=True)
+            open(logfile, 'w+').close()
             os.symlink(logfile, slogfile)
             d.setVar('LOG_FILE', logfile)
     return logfile
@@ -371,8 +310,8 @@ def save_distro_check_result(result, datetime, result_file, d):
     if not logdir:
         bb.error("LOG_DIR variable is not defined, can't write the distro_check results")
         return
-    if not os.path.isdir(logdir):
-        os.makedirs(logdir)
+    bb.utils.mkdirhier(logdir)
+
     line = pn
     for i in result:
         line = line + "," + i
-- 
2.8.1


