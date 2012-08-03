Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SxOcz-0007Il-Go
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 22:37:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q73KQ37t016430
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2012 13:26:03 -0700 (PDT)
Received: from msp-dhcp43.wrs.com (172.25.34.43) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 3 Aug 2012 13:26:03 -0700
Message-ID: <501C33D4.6070409@windriver.com>
Date: Fri, 3 Aug 2012 15:25:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<c8630bc519bcb2d6671e5bd30f9b11ccb9d768b2.1344022584.git.laurentiu.palcu@intel.com>
In-Reply-To: <c8630bc519bcb2d6671e5bd30f9b11ccb9d768b2.1344022584.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 3/5] package_rpm: export the native directory to the postinst scriptlets
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
X-List-Received-Date: Fri, 03 Aug 2012 20:37:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/12 3:19 PM, Laurentiu Palcu wrote:
> Some postinst scriptlets test for the existence of certain files but
> have the paths hardcoded to the target's rootfs. This patch will allow
> us to run postinst scriptlets at do_rootfs time by calling native
> binaries.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   meta/classes/package_rpm.bbclass |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 50e9b31..113b19c 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -443,6 +443,7 @@ export D="${target_rootfs}"
>   export OFFLINE_ROOT="\$D"
>   export IPKG_OFFLINE_ROOT="\$D"
>   export OPKG_OFFLINE_ROOT="\$D"
> +export NATIVE_DIR="${STAGING_DIR_NATIVE}"

Why is this needed?  Normally the host items run from the path (and should know 
how to access any related files they need), and ${D} points to the target rootfs 
directory for things needing full paths.

--Mark

>
>   \$2 \$1/\$3 \$4
>   if [ \$? -ne 0 ]; then
>



