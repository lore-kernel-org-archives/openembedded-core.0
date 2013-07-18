Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7F13A6B1E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 19:23:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Jul 2013 12:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,695,1367996400"; d="scan'208";a="372718769"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2013 12:23:33 -0700
Message-ID: <51E840B5.2080106@linux.intel.com>
Date: Thu, 18 Jul 2013 12:23:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
References: <1374163718-26829-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <1374163718-26829-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distrodata.bbclass: Include PRSPV variable in upstream version checking
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
X-List-Received-Date: Thu, 18 Jul 2013 19:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2013 09:08 AM, Emilia Ciobanu wrote:
> The PRSPV variable is used for the packages that have different
> representation for a same upstream and local version (e.g 2.0 vs 20).
> In this case, the system is using PRSPV instead of PV when comparing
> the local and upstream versions.
>
> The packages that are using this modification are the following:
> 	* zip
> 	* unzip
> 	* docbook-sgml-dtd-3.1-native
> 	* docbook-sgml-dtd-4.1-native
>

I thought we were going to look into use regex instead of adding a new 
variable.

This also seems to contain some white space changes, those should be in 
a seperate patch.

Sau!

> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>   meta/classes/distrodata.bbclass |   39 ++++++++++++++++++++++++++-------------
>   1 file changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
> index 204612c..af52dd5 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -71,7 +71,7 @@ python do_distrodata_np() {
>           rstatus = localdata.getVar('RECIPE_COLOR', True)
>           if rstatus is not None:
>                   rstatus = rstatus.replace(',','')
> -
> +
>           pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
>           if pcurver == pupver:
>                   vermatch="1"
> @@ -157,7 +157,7 @@ python do_distrodata() {
>           rstatus = localdata.getVar('RECIPE_COLOR', True)
>           if rstatus is not None:
>                   rstatus = rstatus.replace(',','')
> -
> +
>           pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
>           if pcurver == pupver:
>                   vermatch="1"
> @@ -408,7 +408,7 @@ python do_checkpkg() {
>                                   s = "%s[^\d\"]*?(\d+[\.\-_])+\d+/?" % m.group()
>                           else:
>                                   s = "(\d+[\.\-_])+\d+/?"
> -
> +
>                           searchstr = "[hH][rR][eE][fF]=\"%s\">" % s
>
>                           reg = re.compile(searchstr)
> @@ -563,7 +563,10 @@ python do_checkpkg() {
>                  chk_uri = src_uri
>           pdesc = localdata.getVar('DESCRIPTION', True)
>           pgrp = localdata.getVar('SECTION', True)
> -        pversion = localdata.getVar('PV', True)
> +        if localdata.getVar('PRSPV', True):
> +                pversion = localdata.getVar('PRSPV', True)
> +        else:
> +                pversion = localdata.getVar('PV', True)
>           plicense = localdata.getVar('LICENSE', True)
>           psection = localdata.getVar('SECTION', True)
>           phome = localdata.getVar('HOMEPAGE', True)
> @@ -590,31 +593,41 @@ python do_checkpkg() {
>
>           (type, host, path, user, pswd, parm) = bb.decodeurl(uri)
>           if type in ['http', 'https', 'ftp']:
> -                pcurver = d.getVar('PV', True)
> +                if d.getVar('PRSPV', True):
> +                    pcurver = d.getVar('PRSPV', True)
> +                else:
> +                    pcurver = d.getVar('PV', True)
>           else:
> -                pcurver = d.getVar("SRCREV", True)
> +                if d.getVar('PRSPV', True):
> +                    pcurver = d.getVar('PRSPV', True)
> +                else:
> +                    pcurver = d.getVar("SRCREV", True)
> +
>
>           if type in ['http', 'https', 'ftp']:
>                   newver = pcurver
>                   altpath = path
>                   dirver = "-"
>                   curname = "-"
> -
> +
>                   """
>                   match version number amid the path, such as "5.7" in:
> -                        http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
> +                        http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
>                   N.B. how about sth. like "../5.7/5.8/..."? Not find such example so far :-P
>                   """
>                   m = re.search(r"[^/]*(\d+\.)+\d+([\-_]r\d+)*/", path)
>                   if m:
>                           altpath = path.split(m.group())[0]
>                           dirver = m.group().strip("/")
> -
> +
>                           """use new path and remove param. for wget only param is md5sum"""
>                           alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
>                           my_uri = d.getVar('REGEX_URI', True)
>                           if my_uri:
> -                            newver = d.getVar('PV', True)
> +                            if d.getVar('PRSPV', True):
> +                                    newver = d.getVar('PRSPV', True)
> +                            else:
> +                                    newver = d.getVar('PV', True)
>                           else:
>                               newver = check_new_dir(alturi, dirver, d)
>                           altpath = path
> @@ -624,7 +637,7 @@ python do_checkpkg() {
>                   """Now try to acquire all remote files in current directory"""
>                   if not re.match("Err", newver):
>                           curname = altpath.split("/")[-1]
> -
> +
>                           """get remote name by skipping pacakge name"""
>                           m = re.search(r"/.*/", altpath)
>                           if not m:
> @@ -650,7 +663,7 @@ python do_checkpkg() {
>                                   pstatus = "UPDATE"
>                           else:
>                                   pstatus = "MATCH"
> -
> +
>                   if re.match("Err", newver):
>                           pstatus = newver + ":" + altpath + ":" + dirver + ":" + curname
>           elif type == 'git':
> @@ -796,7 +809,7 @@ python do_checkpkg() {
>                           pmstatus = "MATCH"
>                   else:
>                           pmstatus = "UPDATE"
> -
> +
>           psrcuri = psrcuri.split()[0]
>           pdepends = "".join(pdepends.split("\t"))
>           pdesc = "".join(pdesc.split("\t"))
>

