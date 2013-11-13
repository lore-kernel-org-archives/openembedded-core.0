Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6158B6D98D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 16:26:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2013 08:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="434680977"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2013 08:26:47 -0800
Message-ID: <5283A847.6030600@linux.intel.com>
Date: Wed, 13 Nov 2013 08:26:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Irina Patru <irina.patru@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <0001-distrodata.bbclass-Add-fetch2-handlers-to-svn-case-i.patch>
	<1384335941-25306-1-git-send-email-irina.patru@intel.com>
In-Reply-To: <1384335941-25306-1-git-send-email-irina.patru@intel.com>
Subject: Re: [PATCH v2] distrodata.bbclass: Add fetch2 handlers to svn case in checkpkg
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
X-List-Received-Date: Wed, 13 Nov 2013 16:26:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2013 01:45 AM, Irina Patru wrote:
> The existing code in checkpkg from distrodata.bbclass had similar
> functionality with fetch when searching for latest package version.
>
> For packages that use svn protocol that part was rewrote in order
> to use fetcher API.
> It now calls latest_revision method from Git class in fetch2 so
> that it gets latest version.
>
Do you mean SVN class here not Git, correct?

Sau!

> [ YOCTO #1813 ]
>
> Signed-off-by: Irina Patru <irina.patru@intel.com>
> ---
>   meta/classes/distrodata.bbclass |   43 ++++++++++++++++-----------------------
>   1 file changed, 17 insertions(+), 26 deletions(-)
>
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
> index 085575a..e481027 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -751,34 +751,25 @@ python do_checkpkg() {
>                                   if not tmp3:
>                                           bb.plain("#DEBUG# Package %s: current version (%s) doesn't match the usual pattern" %(pname, pversion))
>           elif type == 'svn':
> -                options = []
> -                if user:
> -                        options.append("--username %s" % user)
> -                if pswd:
> -                        options.append("--password %s" % pswd)
> -                svnproto = 'svn'
> -                if 'proto' in parm:
> -                        svnproto = parm['proto']
> -                if 'rev' in parm:
> -                        pcurver = parm['rev']
> -
> -                svncmd = "svn info %s %s://%s%s/%s/ 2>&1" % (" ".join(options), svnproto, host, path, parm["module"])
> -                print svncmd
> -                svninfo = os.popen(svncmd).read()
> -                if "Can't connect to host " in svninfo or "Connection timed out" in svninfo:
> -                        svncmd = "svn info %s %s://%s%s/%s/ 2>&1" % (" ".join(options), "http",
> -                                       host, path, parm["module"])
> -                        svninfo = os.popen(svncmd).read()
> -                for line in svninfo.split("\n"):
> -                        if re.search("^Last Changed Rev:", line):
> -                                pupver = line.split(" ")[-1]
> -                                if pupver in pversion:
> -                                        pstatus = "MATCH"
> -                                else:
> -                                        pstatus = "UPDATE"
> +                ud = bb.fetch2.FetchData(uri, d)
>
> -                if re.match("Err", pstatus):
> +                svnFetcher = bb.fetch2.svn.Svn(d)
> +                svnFetcher.urldata_init(ud, d)
> +                try:
> +                        pupver = svnFetcher.latest_revision(uri, ud, d, ud.names[0])
> +                except bb.fetch2.FetchError:
> +                        pstatus = "ErrSvnAccess"
> +
> +                if pupver:
> +                        if pupver in pversion:
> +                                pstatus = "MATCH"
> +                        else:
> +                                pstatus = "UPDATE"
> +                else:
>                           pstatus = "ErrSvnAccess"
> +
> +                if 'rev' in ud.parm:
> +                        pcurver = ud.parm['rev']
>
>                   if pstatus != "ErrSvnAccess":
>                           tag = pversion.rsplit("+svn")[0]
>

