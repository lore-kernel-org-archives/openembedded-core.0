Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0133565C5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 06:06:26 +0000 (UTC)
Received: by oiyy130 with SMTP id y130so24715564oiy.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 23:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kg69IDmNKDoJqP4TMtnomcQ13njJy2pqZ5gc/E1jd2s=;
	b=cfPJn09xO1yNru24d/TdTAcaY/zTcoCkWhJfHoafFTd4viqsYE7E2bbUtCqMgWwvvj
	wSwlJ0jvtNCwPYRo8JjJuFvmHs7dn/yI8UUH1AlctOTh2FOR0up79sqQd2aCL82X7fad
	espMS+kRVcOrc2UXRGMsPuNs+GhG+SJWStGvjm5Fi9F8sDDHDlCzQasGt8Dge4ZcnkPr
	EgLftZUOuw8KFtWS9lSeMRlw4cTXX43+W27K8+zoCgKDi6yyCReWfxFc/7qTwOudCxE8
	BUtdfmTb3hj9yU063bcDN8OUQxklcvnBxJUdcGex7Gt3rqvZ8LFtOzLn/srPlxyxIli5
	WUcA==
MIME-Version: 1.0
X-Received: by 10.60.176.37 with SMTP id cf5mr23245540oec.19.1435730787078;
	Tue, 30 Jun 2015 23:06:27 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Tue, 30 Jun 2015 23:06:26 -0700 (PDT)
In-Reply-To: <1435663180-43011-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1435663180-43011-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Date: Tue, 30 Jun 2015 23:06:26 -0700
Message-ID: <CAJ86T=XVq-jnL4T0T464WRnnqbbOBPRwUV3A2x691rfcSv4fKA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: Check output folder is present before creating files-in-$pkg.txt
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
X-List-Received-Date: Wed, 01 Jul 2015 06:06:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi Leonardo,

On Tue, Jun 30, 2015 at 4:19 AM,
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> This is just a safe check to make sure the output folder is present, before
> creating the files-in-$pkg.txt file.
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

This patch fixes the build issues I was seeing previously.

> ---
>  meta/classes/buildhistory.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 8fc8a3a..cad5116 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -444,7 +444,13 @@ buildhistory_list_pkg_files() {
>          # Create individual files-in-package for each recipe's package
>          for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
>                  pkgname=$(basename ${pkgdir})
> -                outfile="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}/${file_prefix}${pkgname}.txt"
> +                outfolder="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}"
> +                outfile="${outfolder}/${file_prefix}${pkgname}.txt"
> +                # Make sure the output folder, exist so we can create the files-in-$pkgname.txt file
> +                if [ ! -d ${outfolder} ] ; then
> +                        bbdebug 2 "Folder ${outfolder} does not exist, file ${outfile} not created"
> +                        continue
> +                fi
>                  buildhistory_list_files ${pkgdir} ${outfile}
>          done
>  }
> --
> 1.8.4.5
>

