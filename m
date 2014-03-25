Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 04CEE6F898
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:50:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2P8oPSF024032; Tue, 25 Mar 2014 08:50:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zJSK8u-tdjMo; Tue, 25 Mar 2014 08:50:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2P8oMGA024026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 25 Mar 2014 08:50:24 GMT
Message-ID: <1395737416.24890.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 25 Mar 2014 08:50:16 +0000
In-Reply-To: <1394724708-9894-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1394724708-9894-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_deb: Remove version from Provides Field
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
X-List-Received-Date: Tue, 25 Mar 2014 08:50:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-13 at 16:31 +0100, Ricardo Ribalda Delgado wrote:
> According to Debian Policy Manual. Chapter 7.1
> 
> All of the fields except for Provides may restrict their applicability
> to particular versions of each named package. This is done in
> parentheses after each individual package name; the parentheses should
> contain a relation from the list below followed by a version number, in
> the format described in Version, Section 5.6.12.
> 
> This Fixes the following warning:
> 
> root@qt5022:~# apt-get update
> 
> ...
> 
> Reading package lists... Done
> W: Ignoring Provides line with DepCompareOp for package
> pkgconfig__pkg-config__
> W: You may want to run apt-get update to correct these problems
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/classes/package_deb.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index 2d2f3f1..905af24 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -322,6 +322,13 @@ python do_package_deb () {
>  
>          mapping_rename_hook(localdata)
>  
> +        def debian_cmp_purgeversion(var):
> +            # dpkg does not allow versions on Provides.
> +            # From Debian Policy Manual, Chapter 7:
> +            # All of the fields except for Provides may restrict their applicability to particular versions of each named package.
> +            for key in var:
> +                var[key] = []
> +
Shouldn't this actually make a version comparison, i.e. if <condition>
then emit the Provides, otherwise don't (looking at the package version
for comparison)?

I can imagine having multiple versions of a recipe, some with provides
and some without, all using the same code.

Cheers,

Richard

         def debian_cmp_remap(var):
>              # dpkg does not allow for '(' or ')' in a dependency name
>              # replace these instances with '__' and '__'
> @@ -359,6 +366,7 @@ python do_package_deb () {
>          debian_cmp_remap(rsuggests)
>          rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
>          debian_cmp_remap(rprovides)
> +        debian_cmp_purgeversion(rprovides)
>          rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
>          debian_cmp_remap(rreplaces)
>          rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")



