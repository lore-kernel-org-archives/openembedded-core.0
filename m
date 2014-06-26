Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2B46465DF9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 14:21:10 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id m5so2894564qaj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 07:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=60pJzLADBYVIpPC11BHN/dhHoUS8OypkydMCnZCwpKw=;
	b=a01VsIQQ+zT5cEq9i+cS+G5u42MXL8KadkS5c1PbfRaK6YZuwqiFRUAWli9qp2PA2l
	jhAENO/nqadt/0ytkebt6o8owACLgtfkDGk5t3ZyH0xBjOAsNiTIThGToMeoNp83twsK
	JZNSnBevW0TpXi5fJ8Q1N1s4yidV7o3TjcVFiz1JzHN8vwns2Q9YicK6cPKH8G/kZz2v
	JsGQRT4kEUkfV79xROVYaPPhBuIDX4NOCfrUKY6fc+QvNTSiUos4moBqoIJLV0SvbIpw
	oSrgZKoKtnd9QglA4dC7dC8pgk51tb9VCpqIjSJB4vkQhZrvDRtAM2o6qqBKp/UKXBfv
	fLmQ==
X-Gm-Message-State: ALoCoQn6SlmBfBLfInpLC6Z66ibvML6W7nltkAv6nHtXZyGSV95Jk1Y+Z/WWFbimaZP7heglMVem
X-Received: by 10.229.44.65 with SMTP id z1mr9163753qce.7.1403792471450; Thu,
	26 Jun 2014 07:21:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Thu, 26 Jun 2014 07:20:50 -0700 (PDT)
In-Reply-To: <1403792215-4306-1-git-send-email-ross.burton@intel.com>
References: <1403792215-4306-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jun 2014 15:20:50 +0100
Message-ID: <CAJTo0LZA+_MccT4S4oUvn+LWdARN3gUbrppbyGY75UQzB3xfqQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch.bbclass: unset TMPDIR after use
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
X-List-Received-Date: Thu, 26 Jun 2014 14:21:15 -0000
Content-Type: text/plain; charset=UTF-8

I forgot to say that Robert sent almost exactly this patch last year
but I nacked it because the TMPDIR assignment should happen when patch
is exec'd.  I'm not so sure now as that would cause an unnecessary
overhead to patching.

Ross

On 26 June 2014 15:16, Ross Burton <ross.burton@intel.com> wrote:
> GNU Patch < 2.6.1 has a race condition so we create a per-instance TMPDIR to
> avoid this.  This was implemented by setting os.environ[TMPDIR] but at the end
> of do_patch the temporary directory is deleted but TMPDIR is not unset.
>
> In general this doesn't cause a problem but if do_patch is embedded in a larger
> function then TMPDIR is set to a directory that doesn't exist.  Avoid this by
> removing TMPDIR from os.environ when the directory is deleted.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/patch.bbclass |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 86c65b3..1e2aab0 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -177,6 +177,7 @@ python patch_do_patch() {
>              bb.fatal(str(e))
>
>      bb.utils.remove(process_tmpdir, True)
> +    del os.environ['TMPDIR']
>  }
>  patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>
> --
> 1.7.10.4
>

