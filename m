Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E592F6D181
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 10:40:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1Adml2027002; Fri, 1 Nov 2013 10:40:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FC-dFqDR0Lxl; Fri,  1 Nov 2013 10:40:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1AeTJL027039
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 10:40:30 GMT
Message-ID: <1383302424.25877.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 01 Nov 2013 10:40:24 +0000
In-Reply-To: <d79dba30a0175bd4344ba595cfce74e465f9a148.1383326626.git.liezhi.yang@windriver.com>
References: <cover.1383326626.git.liezhi.yang@windriver.com>
	<d79dba30a0175bd4344ba595cfce74e465f9a148.1383326626.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] sanity.bbclass: check that TMPDIR is not located on nfs
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
X-List-Received-Date: Fri, 01 Nov 2013 10:40:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-02 at 01:26 +0800, Robert Yang wrote:
> There would be some unexpected errors when the whole TMPDIR is located
> on nfs, so add a test for it in sanity.bbclass.
> 
> Note:
> The better way to get the filesystem id should be get f_fsid from struct
> statvfs, but there is no f_fsid in os.stat() or os.statvfs(), so we use
> 'stat -f -c "%t"' here.
> 
> [YOCTO #5442]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/sanity.bbclass | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Why does this need to run every build? It doesn't so don't do that
please.

Cheers,

Richard

> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index c4827f4..7517120 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -198,6 +198,21 @@ def check_path_length(filepath, pathname, limit):
>          return "The length of %s is longer than 410, this would cause unexpected errors, please use a shorter path.\n" % pathname
>      return ""
>  
> +def get_filesystem_id(path):
> +    status, result = oe.utils.getstatusoutput("stat -f -c '%s' %s" % ("%t", path))
> +    if status == 0:
> +        return result
> +    else:
> +        bb.warn("Can't get the filesystem id of: %s" % path)
> +        return None
> +
> +# Check that the path isn't located on nfs.
> +def check_not_nfs(path, name):
> +    # The nfs' filesystem id is 6969
> +    if get_filesystem_id(path) == "6969":
> +        return "The %s can't be located on nfs.\n" % name
> +    return ""
> +
>  def check_connectivity(d):
>      # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
>      # using the same syntax as for SRC_URI. If the variable is not set
> @@ -672,6 +687,9 @@ def check_sanity_everybuild(status, d):
>      # The length of TMPDIR can't be longer than 410
>      status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
>  
> +    # Check that TMPDIR isn't located on nfs
> +    status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
> +
>  def check_sanity(sanity_data):
>      import subprocess
>  



