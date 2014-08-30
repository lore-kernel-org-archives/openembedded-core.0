Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBAD7054E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 10:16:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7UAGXn0023728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 30 Aug 2014 03:16:33 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 30 Aug 2014 03:16:32 -0700
Message-ID: <5401A47F.7060702@windriver.com>
Date: Sat, 30 Aug 2014 18:16:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>,
	<openembedded-core@lists.openembedded.org>
References: <1409268800-17566-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1409268800-17566-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH 1/2] libpam: Fix runtime providers
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
X-List-Received-Date: Sat, 30 Aug 2014 10:16:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I've sent a patch to fix the warning like:

WARNING: QA Issue: lib32-pam-plugin-access rdepends on 
lib32-lib32-libpam-suffix, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: lib32-pam-plugin-cracklib rdepends on 
lib32-lib32-libpam-suffix, but it isn't a build dependency? [build-deps]

WARNING: QA Issue: nativesdk-pam-plugin-access rdepends on 
nativesdk-nativesdk-libpam-suffix, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: nativesdk-pam-plugin-cracklib rdepends on 
nativesdk-nativesdk-libpam-suffix, but it isn't a build dependency? [build-deps]


And the patch:
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/096594.html

// Robert

On 08/29/2014 07:33 AM, Otavio Salvador wrote:
> The runtime providers were commented out. Removing the comment brings
> up a issue with the native renaming which has been workarounded
> disabling the runtime recommendation. This is indeed a workaround so a
> FIXME comment has been added to remind about it in case we someday
> move to native prefix.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-extended/pam/libpam_1.1.6.bb |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
> index d7033d0..f08b4af 100644
> --- a/meta/recipes-extended/pam/libpam_1.1.6.bb
> +++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
> @@ -81,7 +81,10 @@ RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} \
>       pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} \
>       pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} \
>       coreutils bash"
> -#RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
> +
> +# FIXME: Native suffix breaks here, disable it for now
> +RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
> +RRECOMMENDS_${PN}_class-native = ""
>
>   python populate_packages_prepend () {
>       def pam_plugin_append_file(pn, dir, file):
>

