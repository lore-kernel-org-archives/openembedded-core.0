Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id C469270101
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jun 2017 21:37:09 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id q97so29373456wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Jun 2017 14:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u1Z8lazhbLIllJTZ2WkeDlaGQ/CpVHsW7N/GAuVm9kI=;
	b=SXwHw7m0559KKHTfWfWhvB+XP+3MingXiO8/sO8s+fP6QdJuEGGopQUSTZHxpFc1aA
	/Gsr4uJ3MiXsGsfNbayrxVI4VaSh3Lx9bac9osq8KV6JdzD/5DiYuiGZ2hNb6Mm176nb
	7mgWxgvLlCKuzdqE8rz7XTsKg3IETw1aX9LMQ61n4lOM8vCyQz6/2HAbnO3/78FOCxaA
	H8kpC7bCa9/hZvPFA6gcJYRY9ZATU5YuFJkG4a2Jj2OSTn0gwv8Kl0LtAumUXamGSHqm
	7ndMYiiCWk2o2ePWNEbT6lC7vnfczUnwRLetMnb+IbnlORFzXSXkHW4OcSRjGA9X4rB+
	/S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u1Z8lazhbLIllJTZ2WkeDlaGQ/CpVHsW7N/GAuVm9kI=;
	b=ROPTcjQx56EeJeqXkdpxuLst8r6qHPOr0bYYYRTMi6JllIOuuhR4kljnM6zI3V1xvI
	ceaSo8XWo7AMCD3VzoNlqUIjJW4LyOBtyUZ9jc53sNF/Xuyu6osmMyMs42hiMfOLvUTN
	rd07SzsCaYHNQirt/lQ/ICvvEUsZW1nDxKsamC8xFxwlrT1Av5EQvw1qDSa2ZvGbMyDs
	Jzx+jRmOctE1VfViibFDUe6Hiy5gAVHLlwi6OxqCdZ80yTXQHvARinSmVBtxv9l9MMd4
	ANh0zEahW/KRj4h+7o8Qgr2Z0DhoJzPvwjSybP0+hHNImdqn0+ApajJnee81PO800tUu
	zEdA==
X-Gm-Message-State: AODbwcBYSdKuTM/iQ1eGbezZb9HnTnRW46I1CWdpcYae30WXOP63xNix
	z9VLwTU/XEGrMY9zaG3U9g4r7kT07hpg
X-Received: by 10.223.156.26 with SMTP id f26mr11178785wrc.187.1496612230013; 
	Sun, 04 Jun 2017 14:37:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.4 with HTTP; Sun, 4 Jun 2017 14:37:09 -0700 (PDT)
In-Reply-To: <20170601013319.25260-1-JPEWhacker@gmail.com>
References: <20170601013319.25260-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 4 Jun 2017 16:37:09 -0500
Message-ID: <CAJdd5Gani8CqS-7G4nA0qx1cAU1fuj5=TUNJdkxjyw=sA1p-vg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] archiver: Escape recipe name in regex
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
X-List-Received-Date: Sun, 04 Jun 2017 21:37:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 31, 2017 at 8:33 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
> The recipe name needs to be escaped when it is used in a regular expression so
> that any special characters are treated literally
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/archiver.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 2c04557..9cc9fb5 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -349,8 +349,8 @@ python do_ar_recipe () {
>      bbappend_files = d.getVar('BBINCLUDED').split()
>      # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
>      # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
> -    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
> -    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
> +    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" % re.escape(pn))
> +    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
>      for file in bbappend_files:
>          if bbappend_re.match(file) or bbappend_re1.match(file):
>              shutil.copy(file, outdir)
> --
> 2.9.4
>
Would it be possible to get this backported to pyro and morty? If
there is something else I need to move that along, please let me know.

Thanks,
Joshua Watt

