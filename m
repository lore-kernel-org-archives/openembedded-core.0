Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 538FD601A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 01:57:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F1vEO9017216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 18:57:14 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 14 Aug 2014 18:57:13 -0700
Message-ID: <53ED690B.7020700@windriver.com>
Date: Fri, 15 Aug 2014 09:57:31 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
	<18e2b9ecac47dcfef1b00a538a61d1f5d4fe51fd.1408005909.git.Qi.Chen@windriver.com>
In-Reply-To: <18e2b9ecac47dcfef1b00a538a61d1f5d4fe51fd.1408005909.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH 08/10] v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 15 Aug 2014 01:57:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2014 04:46 PM, Chen Qi wrote:
> Set INHIBIT_UPDATERCD_BBCLASS to "1" if 'sysvinit' is not in DISTRO_FEATURES.
>
> The functionality of the init script 'fbsetup' is implemented internally in
> systemd. So fbsetup is not installed if 'sysvinit' is in DISTRO_FEATURES.
>
> That's why we need to set INHIBIT_UPDATERCD_BBCLASS to "1" to avoid
> generation of update-rc.d related preinst/postinst scripts.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-bsp/v86d/v86d_0.1.10.bb |    7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> index 08438be..7ccb4ee 100644
> --- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> +++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> @@ -49,4 +49,11 @@ do_install () {
>           fi
>   }
>   
> +# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
> +# manually to avoid unnecessary postinst/preinst generated.
> +python __anonymous() {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
> +
>   inherit update-rc.d

This recipe doesn't inherit systemd.bbclass, it doesn't have a systemd 
unit file.

There are more related information in the commit message of the 
following patch.
[OE-core] [PATCH 04/10] update-rc.d: fix logic in 
populate_packages_updatercd

Best Regards,
Chen Qi

