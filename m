Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S77KZ-00028d-W2
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 16:38:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2CFTtVK011311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 08:29:55 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 12 Mar 2012 08:29:55 -0700
Message-ID: <4F5E1672.7090706@windriver.com>
Date: Mon, 12 Mar 2012 10:29:54 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1331345726-9577-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331345726-9577-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] package_ipk: apply umask to control and conffiles
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
X-List-Received-Date: Mon, 12 Mar 2012 15:38:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/12 8:15 PM, Andreas Oberritter wrote:
> * Explicitly set umask to 022. Otherwise the build system's
>    umask leaks into the image.

I'm surprised that do_package_ipk[umask] didn't work.  Perhaps its the way it's 
being invoked that is the issue.  (If bitbake doesn't run it, but something else 
does.. then the umask setting doesn't get used.)

As for the change of the umask, the changes appear to be specific to the ipk 
case.  Is this the desired behavior, or could deb and rpm suffer from similar 
issues?  (I'm not familiar enough with opkg to know how it handles umask 
settings during package install/rootfs construction..)

I believe that RPM sets a default umask when it goes through it's package 
installs/rootfs generation.  But does DEB?

--Mark

> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * I tried do_package_ipk[umask] = "022" first, but it didn't work.
>
>   meta/classes/package_ipk.bbclass |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 565ef93..e7da07a 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -317,7 +317,9 @@ python do_package_ipk () {
>   		controldir = os.path.join(root, 'CONTROL')
>   		bb.mkdirhier(controldir)
>   		try:
> +			mask = os.umask(022)
>   			ctrlfile = file(os.path.join(controldir, 'control'), 'w')
> +			os.umask(mask)
>   		except OSError:
>   			bb.utils.unlockfile(lf)
>   			raise bb.build.FuncFailed("unable to open control file for writing.")
> @@ -410,7 +412,9 @@ python do_package_ipk () {
>   		conffiles_str = localdata.getVar("CONFFILES", True)
>   		if conffiles_str:
>   			try:
> +				mask = os.umask(022)
>   				conffiles = file(os.path.join(controldir, 'conffiles'), 'w')
> +				os.umask(mask)
>   			except OSError:
>   				bb.utils.unlockfile(lf)
>   				raise bb.build.FuncFailed("unable to open conffiles for writing.")



