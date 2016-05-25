Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B8ABB60107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 08:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7408B3142652
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 10:05:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JCMidvvIMce0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 10:05:36 +0200 (CEST)
Received: from [172.22.22.61] (55d44b28.access.ecotel.net [85.212.75.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 635FB3142354
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 10:05:36 +0200 (CEST)
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <57455CCF.7000104@opendreambox.org>
Date: Wed, 25 May 2016 10:05:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
Subject: Re: [PATCH] connman: add alias for connman
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
X-List-Received-Date: Wed, 25 May 2016 08:05:42 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 25.05.2016 09:11, Zhenbo Gao wrote:
> connman get conflicts with networkmanager when building
> the project.
> 
> here introduce alias virtual/networkmanager for these
> two recipes, so setting PREFERRED_PROVIDER to the proper
> one can solve the conflicts.
> 
> this patch is for connman recipe.
> 
> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc               | 1 +
>  meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index c375251..b5fc572 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -94,6 +94,7 @@ do_install_append() {
>  
>  # These used to be plugins, but now they are core
>  RPROVIDES_${PN} = "\
> +	virtual/networkmanager \
>  	connman-plugin-loopback \
>  	connman-plugin-ethernet \
>  	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index aa88cf9..6d7d6af 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -28,7 +28,7 @@ RDEPENDS_packagegroup-self-hosted = "\
>      "
>  
>  RDEPENDS_packagegroup-self-hosted-host-tools = "\
> -    connman \
> +    virtual/networkmanager \
>      connman-plugin-ethernet \
       ^
This will create a conflict whenever virtual/networkmanager is not
provided by connman. It's probably safe to remove this line, though,
because the ethernet plugin package is virtual, too (see connman.inc above).

Best regards,
Andreas

>      dhcp-client \
>      e2fsprogs \
> 


