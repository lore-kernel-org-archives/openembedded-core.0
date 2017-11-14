Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 562 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Nov 2017 13:11:07 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9F16003C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6CC5831A6C15;
	Tue, 14 Nov 2017 14:01:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id AAMDBnDdLlmb; Tue, 14 Nov 2017 14:01:40 +0100 (CET)
Received: from t460p (p57A61BB5.dip0.t-ipconnect.de [87.166.27.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 207D131A6BC2;
	Tue, 14 Nov 2017 14:01:40 +0100 (CET)
Date: Tue, 14 Nov 2017 14:01:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Martyn Welch <martyn.welch@collabora.co.uk>
Message-ID: <20171114140134.64914cb2@t460p>
In-Reply-To: <1510600788-27455-1-git-send-email-martyn.welch@collabora.co.uk>
References: <1510600788-27455-1-git-send-email-martyn.welch@collabora.co.uk>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] package.bbclass: add prohibited-path qa test
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
X-List-Received-Date: Tue, 14 Nov 2017 13:11:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Martyn,

On Mon, 13 Nov 2017 19:19:47 +0000
Martyn Welch <martyn.welch@collabora.co.uk> wrote:

> Sometimes we wish to ensure that packages don't install files or
> directories somewhere that may prove detrimental to the operation of the
> system. For example, this may be the case if files are placed in a
> directory that is utilised as a mount point at run time, thus making them
> inaccessible once when the mount point is being utilised.
> 
> Implement the prohibited-path QA test, which enables such locations to be
> specified in a "PROHIBITED_PATH" variable. This implementation allows for
> exact matches and simple wildcards (paths ending with an asterisk. An
> error will be raised should a match be found, or in the case of a
> wildcard, for any files added below the specificed location(s).
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
> 
> Changes since v1:
>  - Correcting author and SOB.
> 
>  meta/classes/insane.bbclass  |  2 +-
>  meta/classes/package.bbclass | 11 +++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index def9c70..fb10681 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -33,7 +33,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
>              split-strip packages-list pkgv-undefined var-undefined \
>              version-going-backwards expanded-d invalid-chars \
> -            license-checksum dev-elf file-rdeps \
> +            license-checksum dev-elf file-rdeps prohibited-path \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 2053d46..721ca1e 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1162,6 +1162,17 @@ python populate_packages () {
>                  continue
>              seen.append(file)
>  
> +            prohibited_path = d.getVar('PROHIBITED_PATH')
> +            if prohibited_path is not None:
> +                for p in prohibited_path.split():

Paths may contain space characters. How about using colons as path separators
like in $PATH and several other path variables in OE-Core?

> +                    exactmatch = True
> +                    if p.endswith("*"):
> +                        p = p[:len(p)-1]
> +                        exactmatch = False
> +                    if file[1:].startswith(p) and ((file[1:] != p) or exactmatch) :
> +                        msg = "%s is in a prohibited path.\n" % file[1:]
> +                        package_qa_handle_error("prohibited-path", msg, d)
> +

You could use fnmatch to allow generic shell wildcards.

Why don't you compare the first character? Saved mount points are usually
absolute.

Regards,
Andreas

