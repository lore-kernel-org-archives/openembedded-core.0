Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEBD74F4B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 15:54:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w54Fs8bS001934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 4 Jun 2018 16:54:09 +0100
Message-ID: <8d58855729cdcd56b30d8550c529e12595c39be8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Damien Riegel <damien.riegel@savoirfairelinux.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Jun 2018 16:54:08 +0100
In-Reply-To: <20180604153827.5186-1-damien.riegel@savoirfairelinux.com>
References: <20180604153827.5186-1-damien.riegel@savoirfairelinux.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] populate_sdk_ext.bbclass: fix corebase identification
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
X-List-Received-Date: Mon, 04 Jun 2018 15:54:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-04 at 11:38 -0400, Damien Riegel wrote:
> When generating the extended SDK, there is a copy step where this
> class
> goes through the layers and other stuff that have been copied to
> generate the SDK.
> 
> The corebase; ie. the folder that contains the core layer 'meta' is
> treated in a special way. Unfortunately in our tree, we have:
> 
>   layers/meta/meta
>            |     `- core layer
>            `------- corebase
> 
> When populate_sdk_ext checks this layer, it thinks wrongly that it's
> the
> corebase folder, so it treats it differently and doesn't add it to
> the
> layer list. When bitbake tries to run in the generated SDK, it will
> fail
> because it doesn't find information stored in that layer.
> 
> This patch makes sure only the corebase folder is identified as so.
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass
> index 2dd21237e2..917fbfa1b4 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -207,7 +207,7 @@ python copy_buildsystem () {
>      sdkbblayers = []
>      corebase = os.path.basename(d.getVar('COREBASE'))
>      for layer in layers_copied:
> -        if corebase == os.path.basename(layer):
> +        if corebase == layer:
>              conf_bbpath = os.path.join('layers', layer, 'bitbake')
> 

Whilst I appreciate the problem, the fix doesn't look like it would
work for other use cases since its comparing a basename on one side and
a non-basename on the other...

Cheers,

Richard

