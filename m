Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Th5FU-0001Wl-NC
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 22:14:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB7KxqUf005472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Dec 2012 12:59:53 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 7 Dec 2012 12:59:52 -0800
Message-ID: <50C258D6.4020506@windriver.com>
Date: Fri, 7 Dec 2012 15:00:06 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1354914756-9488-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1354914756-9488-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH 4/6 v2] package_rpm: Update the way the multilib package names are translated
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
X-List-Received-Date: Fri, 07 Dec 2012 21:14:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Fix a minor mistake in the original patch...

Original:
+	sdk_archs=${SDK_PACKAGE_ARCH}

new:
+	sdk_archs="${SDK_PACKAGE_ARCHS}"

Somehow I must have cleaned up something at the last minute and forgotten to 
verify the SDK_PACKAGE_ARCHS worked correctly.  Not only was there a typo, but 
missing ".  Fixed now and verified locally.

--Mark

On 12/7/12 3:12 PM, Mark Hatle wrote:
> The variable MULTILIB_PACKAGE_ARCHS has been removed in favor of a
> repurposed MULTILIB_PREFIX_LIST.  The format of this item is now
> <libid>:<arch>:<arch1>:...:<archN>.  This ensures that we can correctly
> translate the libid to one of the supported archs in a tri-lib system.
>
> All of the users of MULTILIB_PREFIX_LIST and MULTILIB_PACKAGE_ARCHS have
> been modified accordingly.
>
> Also change the way attempted packages are installed, verify the package
> exists in the translate functions, then perform the install in one single
> operation.  This results in a significantly faster install time.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/classes/package_rpm.bbclass      |  167 ++++++++++++++++++++++++++++++---
>   meta/classes/populate_sdk_rpm.bbclass |   26 ++++--
>   meta/classes/rootfs_rpm.bbclass       |   47 +++++-----
>   3 files changed, 195 insertions(+), 45 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 4b81b68..091880e 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -24,11 +24,25 @@ package_update_index_rpm () {
>   		return
>   	fi
>
> -	base_archs="`echo ${PACKAGE_ARCHS} | sed 's/-/_/g'`"
> -	ml_archs="`echo ${MULTILIB_PACKAGE_ARCHS} | sed 's/-/_/g'`"
> -	sdk_archs="`echo ${SDK_PACKAGE_ARCHS} | sed 's/-/_/g'`"
> +	sdk_archs="${SDK_PACKAGE_ARCHS}"
> +	sdk_archs=${sdk_archs//-/_}
> +
....


