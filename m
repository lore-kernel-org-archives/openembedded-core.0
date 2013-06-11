Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 09DAC6A9BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:57:57 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wz7so2934525pbc.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 06:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=69bK8htWmS/AgtsxXmIVaryXoUGEG47Q3OdxBOK3pPQ=;
	b=bOYBTF+myEtVEi05qcQYidDo2EUfNN0dgYHkkCVlOdf3nO5StUq1T/4HL0Ur0dpz1Q
	b0g1M8PdcfdiBByiZ3EB/QYp+Wu5BYNs00KkUZdm1esWeOfGnmVaunIk00ckHXzr5OIS
	FBpYr/YWMYPPNdwDSrt3ctuLTTmJT3N1YqngCEIfXWgO2JeACv8jXcrDqoDcJEsdLMBs
	l+hwGM35AAzJxvZaDEAZ0601bNxNhUyHFJgVBar4sN1WUGWVuHrXkd87l1mSz1i0p29C
	2EaFVYtAyn9WNuUpwUNTzj75wtHmfE8N8KOlemCu/O7I5yKvBxBjuY3YyRZXg/5fduFH
	u3mQ==
X-Received: by 10.68.28.232 with SMTP id e8mr12137605pbh.94.1370959078254;
	Tue, 11 Jun 2013 06:57:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Tue, 11 Jun 2013 06:57:38 -0700 (PDT)
In-Reply-To: <1370900715-29294-4-git-send-email-sgw@linux.intel.com>
References: <1370900715-29294-1-git-send-email-sgw@linux.intel.com>
	<1370900715-29294-4-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2013 14:57:38 +0100
Message-ID: <CAJTo0LasM4vffd7pJrioqebt7sq8BDYuOYXSBOg687oKLpP+5g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmWHXpebox5jSZvq+qcnSullhX6r+CkeB0/DLUgjTK7EnE0auNDvh0HwDJU9TZFEKe0MXxW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] dpkg: Fix usage of create_wrapper
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
X-List-Received-Date: Tue, 11 Jun 2013 13:57:57 -0000
Content-Type: text/plain; charset=UTF-8

On 10 June 2013 22:45, Saul Wold <sgw@linux.intel.com> wrote:
> create_wrapper changed recently and behaves differently now. It does
> not directly exec the , but exports them, so the first parameter
> needs to be an environemnt variable like a PATH, not a executable.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
> index 28c4f89..02383ed 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -56,7 +56,7 @@ do_install_append () {
>  do_install_append_class-native () {
>         tmp=`find ${D}${bindir} -type f -exec grep -m 1 -l '#!/.*/perl-native/perl' {} \;`
>         for i in $tmp; do
> -               create_wrapper $i ${STAGING_BINDIR_NATIVE}/perl-native/perl
> +               create_wrapper $i PATH=${STAGING_BINDIR_NATIVE}/perl-native:\$PATH

NACK.

The message isn't entirely accurate - the changes to the wrapper
scripts were consistent with the documentation of the function which
clearly says the arguments are NAME=VALUE pairs, but recipes such as
this were using "insider" knowledge that the wrapper was implemented
with "env" to effectively inject perl-native so that is the binary
executed, not the real script itself.  This avoids the stupidly small
buffer in binfmt_script that parses the #! lines (128 bytes), which is
what the comment above this block refers to.

Setting the path won't perform this workaround, so this patch (and
similar) re-introduces the problem with deeply nested work
directories.

I guess the real question is why do we wrap scripts one by one instead
of doing some wrapping centrally when writing to the native sysroot
itself?  At the moment we're playing whack-a-mole where sufficient
scripts have been wrapped that a specific build appears to work.

Ross

