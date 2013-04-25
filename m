Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVMrP-0006yK-CK
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:09:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3PDpQ9w028464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 06:51:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 25 Apr 2013 06:51:26 -0700
Message-ID: <517934DE.90303@windriver.com>
Date: Thu, 25 Apr 2013 08:51:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
	<f0a9ef998eba08dce22e9a931e34f89c6c2c34e7.1366892003.git.laurentiu.palcu@intel.com>
In-Reply-To: <f0a9ef998eba08dce22e9a931e34f89c6c2c34e7.1366892003.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 4/4] scripts/postinst-intercepts: create separete hooks for multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 14:09:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/13 7:24 AM, Laurentiu Palcu wrote:
> When using multilib, the hooks for lib32/lib64 must be different because
> the libdir/base_libdir point to different locations. Nothing has to be
> done in the postinstalls for this. When a hook is installed, it will be
> detected automatically if this is a ML package (from the libXX- package
> prefix) and a separate hook will be created.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   scripts/postinst-intercepts/postinst_intercept |   18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
> index ed32f27..5969eba 100755
> --- a/scripts/postinst-intercepts/postinst_intercept
> +++ b/scripts/postinst-intercepts/postinst_intercept
> @@ -17,9 +17,27 @@
>
>   intercept_script=$INTERCEPT_DIR/$1 && shift
>   package_name=$1 && shift
> +mlprefix=$(echo $package_name|sed -rn 's/^(lib32|lib64|libx32)-.*/\1/p')

The mlprefix is theoretically arbitrary.  It would be better to base the parse 
list off of a given machines available multilibs.  If you can dump the multilib 
list from bitbake, that would be best.

> +# if the hook we want to install does not exist, then there's nothing we can do
>   [ -f "$intercept_script" ] || exit 1
>
> +# if the postinstall wanting to install the hook belongs to a multilib package,
> +# then we'd better have a separate hook for this because the default ${libdir} and
> +# ${base_libdir} will point to the wrong locations
> +if [ -n "$mlprefix" ]; then
> +	ml_intercept_script=$intercept_script-$mlprefix
> +	# if the multilib hook does not exist, create it from the default one
> +	if [ ! -f "$ml_intercept_script" ]; then
> +		cp $intercept_script $ml_intercept_script
> +
> +		# clear the ##PKGS: line and the already set variables
> +		[ -x "$ml_intercept_script" ] && sed -i -e "2,$(($#+1)) {/.*/d}" -e "/^##PKGS: .*/d" $ml_intercept_script
> +	fi
> +
> +	intercept_script=$ml_intercept_script
> +fi
> +
>   chmod +x "$intercept_script"
>
>   pkgs_line="$(cat $intercept_script|grep "##PKGS:")"
>



