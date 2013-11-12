Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E4F156D593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 10:21:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACALmQn007616; Tue, 12 Nov 2013 10:21:48 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gi8gwrNrs_jN; Tue, 12 Nov 2013 10:21:48 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACALffP007607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Nov 2013 10:21:43 GMT
Message-ID: <1384251698.1143.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Irina Patru <irina.patru@intel.com>
Date: Tue, 12 Nov 2013 10:21:38 +0000
In-Reply-To: <1384173319-22148-1-git-send-email-irina.patru@intel.com>
References: <1384173319-22148-1-git-send-email-irina.patru@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] distrodata.bbclass: Add fetch2 handlers to svn case in checkpkg
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
X-List-Received-Date: Tue, 12 Nov 2013 10:21:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Irina,

You have a summary but this patch also needs a description of why we're
making this change and a Signed-off-by: line. The patch itself looks
good and is a nice cleanup.

Cheers,

Richard

On Mon, 2013-11-11 at 14:35 +0200, Irina Patru wrote:
> ---
>  meta/classes/distrodata.bbclass |   43 ++++++++++++++++-----------------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
> index 085575a..e481027 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -751,34 +751,25 @@ python do_checkpkg() {
>                                  if not tmp3:
>                                          bb.plain("#DEBUG# Package %s: current version (%s) doesn't match the usual pattern" %(pname, pversion))
>          elif type == 'svn':
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
>                          pstatus = "ErrSvnAccess"
> +                
> +                if 'rev' in ud.parm:
> +                        pcurver = ud.parm['rev']
>  
>                  if pstatus != "ErrSvnAccess":
>                          tag = pversion.rsplit("+svn")[0]



