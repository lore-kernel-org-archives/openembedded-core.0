Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 07BAB6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 18:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E3F8E31540FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 20:49:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4jQ3sD-6hcgV
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 20:49:54 +0200 (CEST)
Received: from [172.22.22.61] (55d45d57.access.ecotel.net [85.212.93.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 870DA31540FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 20:49:53 +0200 (CEST)
Message-ID: <554BB3D1.8050508@opendreambox.org>
Date: Thu, 07 May 2015 20:49:53 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1431016840-26287-1-git-send-email-bruno.bottazzini@intel.com>
	<1431016840-26287-3-git-send-email-bruno.bottazzini@intel.com>
In-Reply-To: <1431016840-26287-3-git-send-email-bruno.bottazzini@intel.com>
Subject: Re: [PATCH V3 2/3] systemd: Verify if journal-flush.service exists.
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
X-List-Received-Date: Thu, 07 May 2015 18:49:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Bruno,

On 07.05.2015 18:40, Bruno Bottazzini wrote:
> If the users wants to enable networkd this file will not be generate and the
> installation will fail.
> 
> Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_219.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index c196017..b4bff18 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -177,8 +177,11 @@ do_install() {
>  	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
>  	# its needed in 216 upstream has fixed it with 919699ec301ea507edce4a619141ed22e789ac0d
>  	# don't order journal flushing afte remote-fs.target
> -	sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
> -	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
> +	if [ -s ${D}${systemd_unitdir}/system/systemd-journal-flush.service ]; then
> +                # this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
> +                sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
> +        fi
> +

According to the comment above, this is a workaround specific to 216.
Commit 919699ec301ea507edce4a619141ed22e789ac0d made it into 218. So
maybe these lines should just get removed.

Regards,
Andreas

