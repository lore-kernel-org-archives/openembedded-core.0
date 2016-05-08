Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9777016E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 16:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1058B31422B0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:33:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JtRk3HH13PRI
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:33:22 +0200 (CEST)
Received: from [172.22.22.61] (55d4630e.access.ecotel.net [85.212.99.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9592C31422AF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:33:22 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1462706513-5019-1-git-send-email-marex@denx.de>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <572F6A52.3090509@opendreambox.org>
Date: Sun, 8 May 2016 18:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1462706513-5019-1-git-send-email-marex@denx.de>
Subject: Re: [PATCH] kernel: fitimage: Repair misuse of shell test command
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
X-List-Received-Date: Sun, 08 May 2016 16:33:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Marek,

On 08.05.2016 13:21, Marek Vasut wrote:
> The kernel fitImage must be amended with signature if and only if
> UBOOT_SIGN_ENABLE = 1 . In the current case, the UBOOT_SIGN_ENABLE
> could be either 0 (default) or 1 , which test -n always correctly
> interprets as non-empty string, thus always true. This does not
> match the logic above though, so replace the test with check which
> passes only for UBOOT_SIGN_ENABLE = 1 .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Yannick Gicquel <yannick.gicquel@iot.bzh>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> ---
> NOTE: It'd be real nice if I was CCed on the original patches
> NOTE: I'm not convinced that UBOOT_SIGN_ENABLE is the right name
>       for this variable, since the signed object is really the
>       fitImage and U-Boot only verifies the signature. Maybe we
>       should rename it, is it still possible ?
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 809bd4d..298eda2 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -250,7 +250,7 @@ do_assemble_fitimage() {
>  		#
>  		# Step 5: Sign the image and add public key to U-Boot dtb
>  		#
> -		if test -n "${UBOOT_SIGN_ENABLE}"; then
> +		if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then

just a nitpick about coding style, but I think you should remove the
extra x. Most people add it, because they have seen it somewhere else,
but it doesn't make much sense if the variable is both enclosed in
quotes and has very little likeliness to get set to a valid option for
'test' returning true.

Leaving the extra x out improves readability for shell novices and, in
general (but not in this case), the ability to grep using whole word
matches.

Regards,
Andreas

