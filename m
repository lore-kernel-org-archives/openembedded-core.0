Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 849C37702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 18:09:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Sep 2015 11:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,455,1437462000"; d="scan'208";a="796480075"
Received: from eresheto-mobl3.ger.corp.intel.com (HELO [10.254.52.237])
	([10.254.52.237])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 11:09:24 -0700
Message-ID: <55E73B5D.2000204@linux.intel.com>
Date: Wed, 02 Sep 2015 13:09:33 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org
References: <1441184383-11515-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <1441184383-11515-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH] distrodata: Take account proxies on distrodata tasks
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
X-List-Received-Date: Wed, 02 Sep 2015 18:09:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

HI Leo,

This is a way to do it but implies that functions doing distro_data 
needs to know about the data store
and ii can be improved only exporting the proxies in the interface 
function update_data,

If you don't specify proxies into urllib.urlopen it search into environment.

For export proxies you can use as an example [1], see below.

Regards,
     alimon

[1] 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/bitbake/lib/bb/fetch2/wget.py#n221


On 02/09/15 03:59, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Proxies defined in the enviroment where not taken into account
> on the distrodata tasks. This commit implied passing the datastore
> into the distro_check library and context manager for the
> urllib.urlopen function.
>
> One way to run distrodata tasks is using 'universe' as target and the
> 'all' distrodata task:
>
>        $ bitbake universe -c distrodataall
>        $ bitbake universe -c distro_checkall
>        $ bitbake universe -c checklicenseall
>
> Logs are located under TMPDIR/log
>
> [YOCTO #7567]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/classes/distrodata.bbclass |   6 +--
>   meta/lib/oe/distro_check.py     | 113 +++++++++++++++++++++++-----------------
>   2 files changed, 69 insertions(+), 50 deletions(-)
>
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
> index 4168e43..0a706ef 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -33,7 +33,7 @@ python do_distrodata_np() {
>           tmpdir = d.getVar('TMPDIR', True)
>           distro_check_dir = os.path.join(tmpdir, "distro_check")
>           datetime = localdata.getVar('DATETIME', True)
> -        dist_check.update_distro_data(distro_check_dir, datetime)
> +        dist_check.update_distro_data(distro_check_dir, datetime, localdata)
>   
>           if pn.find("-native") != -1:
>               pnstripped = pn.split("-native")
> @@ -118,7 +118,7 @@ python do_distrodata() {
>           tmpdir = d.getVar('TMPDIR', True)
>           distro_check_dir = os.path.join(tmpdir, "distro_check")
>           datetime = localdata.getVar('DATETIME', True)
> -        dist_check.update_distro_data(distro_check_dir, datetime)
> +        dist_check.update_distro_data(distro_check_dir, datetime, localdata)
>   
>           pn = d.getVar("PN", True)
>           bb.note("Package Name: %s" % pn)
> @@ -402,7 +402,7 @@ python do_distro_check() {
>       bb.utils.mkdirhier(logpath)
>       result_file = os.path.join(logpath, "distrocheck.csv")
>       datetime = localdata.getVar('DATETIME', True)
> -    dc.update_distro_data(distro_check_dir, datetime)
> +    dc.update_distro_data(distro_check_dir, datetime, localdata)
>   
>       # do the comparison
>       result = dc.compare_in_distro_packages_list(distro_check_dir, d)
> diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
> index 8ed5b0e..b3419ce 100644
> --- a/meta/lib/oe/distro_check.py
> +++ b/meta/lib/oe/distro_check.py
> @@ -1,7 +1,28 @@
> -def get_links_from_url(url):
> +from contextlib import contextmanager
> +@contextmanager
> +def create_socket(url, d):
> +    import urllib
> +    socket = urllib.urlopen(url, proxies=get_proxies(d))
> +    try:
> +        yield socket
> +    finally:
> +        socket.close()
> +
> +def get_proxies(d):
> +    import os
> +    proxykeys = ['HTTP_PROXY', 'http_proxy',
> +                 'HTTPS_PROXY', 'https_proxy',
> +                 'FTP_PROXY', 'ftp_proxy',
> +                 'FTPS_PROXY', 'ftps_proxy',
> +                 'NO_PROXY', 'no_proxy',
> +                 'ALL_PROXY', 'all_proxy']
> +    proxyvalues = map(lambda key: d.getVar(key, True), proxykeys)
> +    return dict(zip(proxykeys, proxyvalues))
> +
> +def get_links_from_url(url, d):
>       "Return all the href links found on the web location"
>   
> -    import urllib, sgmllib
> +    import sgmllib
>       
>       class LinksParser(sgmllib.SGMLParser):
>           def parse(self, s):
> @@ -24,19 +45,18 @@ def get_links_from_url(url):
>               "Return the list of hyperlinks."
>               return self.hyperlinks
>   
> -    sock = urllib.urlopen(url)
> -    webpage = sock.read()
> -    sock.close()
> +    with create_socket(url,d) as sock:
> +        webpage = sock.read()
>   
>       linksparser = LinksParser()
>       linksparser.parse(webpage)
>       return linksparser.get_hyperlinks()
>   
> -def find_latest_numeric_release(url):
> +def find_latest_numeric_release(url, d):
>       "Find the latest listed numeric release on the given url"
>       max=0
>       maxstr=""
> -    for link in get_links_from_url(url):
> +    for link in get_links_from_url(url, d):
>           try:
>               release = float(link)
>           except:
> @@ -70,7 +90,7 @@ def clean_package_list(package_list):
>       return set.keys()
>   
>   
> -def get_latest_released_meego_source_package_list():
> +def get_latest_released_meego_source_package_list(d):
>       "Returns list of all the name os packages in the latest meego distro"
>   
>       package_names = []
> @@ -82,11 +102,11 @@ def get_latest_released_meego_source_package_list():
>       package_list=clean_package_list(package_names)
>       return "1.0", package_list
>   
> -def get_source_package_list_from_url(url, section):
> +def get_source_package_list_from_url(url, section, d):
>       "Return a sectioned list of package names from a URL list"
>   
>       bb.note("Reading %s: %s" % (url, section))
> -    links = get_links_from_url(url)
> +    links = get_links_from_url(url, d)
>       srpms = filter(is_src_rpm, links)
>       names_list = map(package_name_from_srpm, srpms)
>   
> @@ -96,44 +116,44 @@ def get_source_package_list_from_url(url, section):
>   
>       return new_pkgs
>   
> -def get_latest_released_fedora_source_package_list():
> +def get_latest_released_fedora_source_package_list(d):
>       "Returns list of all the name os packages in the latest fedora distro"
> -    latest = find_latest_numeric_release("http://archive.fedoraproject.org/pub/fedora/linux/releases/")
> +    latest = find_latest_numeric_release("http://archive.fedoraproject.org/pub/fedora/linux/releases/", d)
>   
> -    package_names = get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/releases/%s/Fedora/source/SRPMS/" % latest, "main")
> +    package_names = get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/releases/%s/Fedora/source/SRPMS/" % latest, "main", d)
>   
>   #    package_names += get_source_package_list_from_url("http://download.fedora.redhat.com/pub/fedora/linux/releases/%s/Everything/source/SPRMS/" % latest, "everything")
> -    package_names += get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates")
> +    package_names += get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates", d)
>   
>       package_list=clean_package_list(package_names)
>           
>       return latest, package_list
>   
> -def get_latest_released_opensuse_source_package_list():
> +def get_latest_released_opensuse_source_package_list(d):
>       "Returns list of all the name os packages in the latest opensuse distro"
> -    latest = find_latest_numeric_release("http://download.opensuse.org/source/distribution/")
> +    latest = find_latest_numeric_release("http://download.opensuse.org/source/distribution/",d)
>   
> -    package_names = get_source_package_list_from_url("http://download.opensuse.org/source/distribution/%s/repo/oss/suse/src/" % latest, "main")
> -    package_names += get_source_package_list_from_url("http://download.opensuse.org/update/%s/rpm/src/" % latest, "updates")
> +    package_names = get_source_package_list_from_url("http://download.opensuse.org/source/distribution/%s/repo/oss/suse/src/" % latest, "main", d)
> +    package_names += get_source_package_list_from_url("http://download.opensuse.org/update/%s/rpm/src/" % latest, "updates", d)
>   
>       package_list=clean_package_list(package_names)
>       return latest, package_list
>   
> -def get_latest_released_mandriva_source_package_list():
> +def get_latest_released_mandriva_source_package_list(d):
>       "Returns list of all the name os packages in the latest mandriva distro"
> -    latest = find_latest_numeric_release("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/")
> -    package_names = get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/release/" % latest, "main")
> +    latest = find_latest_numeric_release("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/", d)
> +    package_names = get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/release/" % latest, "main", d)
>   #    package_names += get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/contrib/release/" % latest, "contrib")
> -    package_names += get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/updates/" % latest, "updates")
> +    package_names += get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/updates/" % latest, "updates", d)
>   
>       package_list=clean_package_list(package_names)
>       return latest, package_list
>   
> -def find_latest_debian_release(url):
> +def find_latest_debian_release(url, d):
>       "Find the latest listed debian release on the given url"
>   
>       releases = []
> -    for link in get_links_from_url(url):
> +    for link in get_links_from_url(url, d):
>           if link[:6] == "Debian":
>               if ';' not in link:
>                   releases.append(link)
> @@ -143,16 +163,15 @@ def find_latest_debian_release(url):
>       except:
>           return "_NotFound_"
>   
> -def get_debian_style_source_package_list(url, section):
> +def get_debian_style_source_package_list(url, section, d):
>       "Return the list of package-names stored in the debian style Sources.gz file"
> -    import urllib
> -    sock = urllib.urlopen(url)
> -    import tempfile
> -    tmpfile = tempfile.NamedTemporaryFile(mode='wb', prefix='oecore.', suffix='.tmp', delete=False)
> -    tmpfilename=tmpfile.name
> -    tmpfile.write(sock.read())
> -    sock.close()
> -    tmpfile.close()
> +    with create_socket(url,d) as sock:
> +        webpage = sock.read()
> +        import tempfile
> +        tmpfile = tempfile.NamedTemporaryFile(mode='wb', prefix='oecore.', suffix='.tmp', delete=False)
> +        tmpfilename=tmpfile.name
> +        tmpfile.write(sock.read())
> +        tmpfile.close()
>       import gzip
>       bb.note("Reading %s: %s" % (url, section))
>   
> @@ -165,41 +184,41 @@ def get_debian_style_source_package_list(url, section):
>   
>       return package_names
>   
> -def get_latest_released_debian_source_package_list():
> +def get_latest_released_debian_source_package_list(d):
>       "Returns list of all the name os packages in the latest debian distro"
> -    latest = find_latest_debian_release("http://ftp.debian.org/debian/dists/")
> +    latest = find_latest_debian_release("http://ftp.debian.org/debian/dists/", d)
>       url = "http://ftp.debian.org/debian/dists/stable/main/source/Sources.gz"
> -    package_names = get_debian_style_source_package_list(url, "main")
> +    package_names = get_debian_style_source_package_list(url, "main", d)
>   #    url = "http://ftp.debian.org/debian/dists/stable/contrib/source/Sources.gz"
>   #    package_names += get_debian_style_source_package_list(url, "contrib")
>       url = "http://ftp.debian.org/debian/dists/stable-proposed-updates/main/source/Sources.gz"
> -    package_names += get_debian_style_source_package_list(url, "updates")
> +    package_names += get_debian_style_source_package_list(url, "updates", d)
>       package_list=clean_package_list(package_names)
>       return latest, package_list
>   
> -def find_latest_ubuntu_release(url):
> +def find_latest_ubuntu_release(url, d):
>       "Find the latest listed ubuntu release on the given url"
>       url += "?C=M;O=D" # Descending Sort by Last Modified
> -    for link in get_links_from_url(url):
> +    for link in get_links_from_url(url, d):
>           if link[-8:] == "-updates":
>               return link[:-8]
>       return "_NotFound_"
>   
> -def get_latest_released_ubuntu_source_package_list():
> +def get_latest_released_ubuntu_source_package_list(d):
>       "Returns list of all the name os packages in the latest ubuntu distro"
> -    latest = find_latest_ubuntu_release("http://archive.ubuntu.com/ubuntu/dists/")
> +    latest = find_latest_ubuntu_release("http://archive.ubuntu.com/ubuntu/dists/", d)
>       url = "http://archive.ubuntu.com/ubuntu/dists/%s/main/source/Sources.gz" % latest
> -    package_names = get_debian_style_source_package_list(url, "main")
> +    package_names = get_debian_style_source_package_list(url, "main", d)
>   #    url = "http://archive.ubuntu.com/ubuntu/dists/%s/multiverse/source/Sources.gz" % latest
>   #    package_names += get_debian_style_source_package_list(url, "multiverse")
>   #    url = "http://archive.ubuntu.com/ubuntu/dists/%s/universe/source/Sources.gz" % latest
>   #    package_names += get_debian_style_source_package_list(url, "universe")
>       url = "http://archive.ubuntu.com/ubuntu/dists/%s-updates/main/source/Sources.gz" % latest
> -    package_names += get_debian_style_source_package_list(url, "updates")
> +    package_names += get_debian_style_source_package_list(url, "updates", d)
>       package_list=clean_package_list(package_names)
>       return latest, package_list
>   
> -def create_distro_packages_list(distro_check_dir):
> +def create_distro_packages_list(distro_check_dir, d):
>       pkglst_dir = os.path.join(distro_check_dir, "package_lists")
>       if not os.path.isdir (pkglst_dir):
>           os.makedirs(pkglst_dir)
> @@ -220,7 +239,7 @@ def create_distro_packages_list(distro_check_dir):
>       begin = datetime.now()
>       for distro in per_distro_functions:
>           name = distro[0]
> -        release, package_list = distro[1]()
> +        release, package_list = distro[1](d)
>           bb.note("Distro: %s, Latest Release: %s, # src packages: %d" % (name, release, len(package_list)))
>           package_list_file = os.path.join(pkglst_dir, name + "-" + release)
>           f = open(package_list_file, "w+b")
> @@ -231,7 +250,7 @@ def create_distro_packages_list(distro_check_dir):
>       delta = end - begin
>       bb.note("package_list generatiosn took this much time: %d seconds" % delta.seconds)
>   
> -def update_distro_data(distro_check_dir, datetime):
> +def update_distro_data(distro_check_dir, datetime, d):
>       """
>           If distro packages list data is old then rebuild it.
>           The operations has to be protected by a lock so that
> @@ -258,7 +277,7 @@ def update_distro_data(distro_check_dir, datetime):
>           if saved_datetime[0:8] != datetime[0:8]:
>               bb.note("The build datetime did not match: saved:%s current:%s" % (saved_datetime, datetime))
>               bb.note("Regenerating distro package lists")
> -            create_distro_packages_list(distro_check_dir)

Use export proxies,

export_proxies(d)

> +            create_distro_packages_list(distro_check_dir, d)
>               f.seek(0)
>               f.write(datetime)
>   


