Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Su4o0-0005ee-Ia
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 18:51:24 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2012 09:39:30 -0700
Received: by ggnf1 with SMTP id f1so825156ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 09:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=ToJhCQzLLkje5SUY4P6YuHrfuvJ41mQAU7Drk4XbgPQ=;
	b=cv5PXYXISxfL8rb938lu6abmjTx5GC65bsDD/wB3pXZ/hB8UofIgrFneK9D04ibiYy
	rzmouTefD38SlYluvvcfnnv3pz4MFBKFCRic6+Dh4SRDtksiVqE9oO1xD+kfsacHIB9V
	x1r0PQbMSc1hA9cpM9vlnIkIl4bZk7V06j1YiRWSzb7ANNLmMNrBWx150d+ru14MB0uU
	BTS1nY0VxybXmhy6OOVZxDoIoj/4+iANfQrD3ivOZaAt4mQN9+tV+N5Vpn5hhQlaeSqp
	BsMXwZLLtxZ73B6WNBVJAPFm5N6UYKS8jLUFIoeS6k+MG0Yd/hFbUGrhYuDbpNBCmVMn
	BEgg==
Received: by 10.42.54.133 with SMTP id r5mr21465628icg.9.1343234369330; Wed,
	25 Jul 2012 09:39:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Wed, 25 Jul 2012 09:39:09 -0700 (PDT)
In-Reply-To: <1343234199-21520-1-git-send-email-ross.burton@intel.com>
References: <1343234199-21520-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2012 17:39:09 +0100
Message-ID: <CAJTo0LYgXx4camSSmap_HpitQ+gMOhshDLbJDDEr71=kfYnyUQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQlVo+NrEvhmAOBj/84s8QBGWSMClmdev5Zz+T5lK+/ivhyB8i2szQ2nqMtDFz0hKvU6wSaQ
Subject: Re: [PATCH] package.bbclass: don't error when the root doesn't exist in do_split_packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 16:51:24 -0000
Content-Type: text/plain; charset=UTF-8

Ignore this, typo in the python.

On 25 July 2012 17:36, Ross Burton <ross.burton@intel.com> wrote:
> If nothing has been installed in the root automake 1.12 won't install the
> directory, which means os.walk will throw a file not found exception.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/package.bbclass |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index fc83424..0ddf788 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -74,6 +74,10 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
>      given package, usually plugins or modules.
>      """
>
> +    # If the root doesn't exist, return early
> +    if not os.path.exists(dvar + root):
> +        return
> +
>      ml = d.getVar("MLPREFIX", True)
>      if ml:
>          if not output_pattern.startswith(ml):
> --
> 1.7.10
>


