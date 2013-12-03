Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 142F96DEE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 12:20:31 +0000 (UTC)
Received: (qmail 14245 invoked by uid 1003); 3 Dec 2013 12:20:29 -0000
Received: from unknown (HELO ?192.168.1.113?)
	(philip@opensdr.com@108.44.82.190)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Dec 2013 12:20:29 -0000
Message-ID: <529DCC8B.8050506@balister.org>
Date: Tue, 03 Dec 2013 07:20:27 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1385985877-6840-1-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1385985877-6840-1-git-send-email-koen.kooi@linaro.org>
X-Enigmail-Version: 1.6
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-dummy: catch up with image.bbclass changes
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
X-List-Received-Date: Tue, 03 Dec 2013 12:20:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I saw the same issue and this patch resolved the problem.

Tested-by: Philip Balister <philip@balister.org>

On 12/02/2013 07:04 AM, Koen Kooi wrote:
> image.bbclass now depends on virtual/kernel:do_deploy, so add a task for that.
> 
> This fixes errors like this:
> 
> 	ERROR: Task do_build in /build/linaro/build/meta-linaro/meta-linaro/recipes-linaro/images/linaro-image-lng.bb depends upon non-existent task do_deploy in /build/linaro/build/openembedded-core/meta/recipes-kernel/linux/linux-dummy.bb
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/recipes-kernel/linux/linux-dummy.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
> index 8a211da..1c837c9 100644
> --- a/meta/recipes-kernel/linux/linux-dummy.bb
> +++ b/meta/recipes-kernel/linux/linux-dummy.bb
> @@ -31,6 +31,12 @@ do_install() {
>  do_bundle_initramfs() {
>          :
>  }
> +
> +do_deploy() {
> +	:
> +}
> +
>  do_bundle_initramfs[nostamp] = "1"
>  addtask bundle_initramfs after do_compile
> +addtask deploy after do_install
>  
> 

