Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 497 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Oct 2016 15:00:01 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 416FC71A53
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 15:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8168F31A587B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 16:51:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GIFLa0hcSygq
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 16:51:39 +0200 (CEST)
Received: from [172.22.22.61] (55d46a4c.access.ecotel.net [85.212.106.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 79BBC31A5878
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 16:51:39 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1475676667-24280-1-git-send-email-markus.lehtonen@linux.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <b32b7b2f-68cc-31d6-d687-2eeb12aa196a@opendreambox.org>
Date: Wed, 5 Oct 2016 16:51:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475676667-24280-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH] update-rc.d.bbclass: check that init script exists before running it
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
X-List-Received-Date: Wed, 05 Oct 2016 15:00:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Markus,

On 05.10.2016 16:11, Markus Lehtonen wrote:
> Check that the init script that is going to be called in the prerm()
> script really exists. There might be a packaging bug or the script
> might've been removed already earlier in prerm().

isn't it called prerm in the first place because it's not supposed to
remove any packaged files?

And if there's a packaging bug, we should IMO better add a sanity check
there and abort the build.

Regards,
Andreas



> 
> [YOCTO #10299]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/classes/update-rc.d.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index dfef2a2..24da547 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -37,7 +37,7 @@ fi
>  }
>  
>  updatercd_prerm() {
> -if [ -z "$D" ]; then
> +if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
>  	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>  fi
>  }
> 


