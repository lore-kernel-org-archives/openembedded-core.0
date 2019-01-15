Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 115807C138
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:45:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x10so3710460wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ytIIaWluB504CIoECiNnwsm+gjDwwBDJvRs5g1Fa37c=;
	b=KXmu3ODGl4/sRujIhZ+7zdXP9y0gy/rYJTeOGaj4Cy0DrOopE0VGiig9x8+ZZqYVuV
	KYlkvqQaD2IZMyO/PkkjL05sI9PaOM27gblnohwrx8nt5jTrP/e8BxLbt8d7hPGgXugp
	xee/GUkQO5JiKC1VEr79uoo3hqsvRAYs/6geg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ytIIaWluB504CIoECiNnwsm+gjDwwBDJvRs5g1Fa37c=;
	b=Tl48G0Ia5qne4AJFeC2ya+Xb2vcv2Negm5HUb0JhzAF4CsvHY92ONyLvjB6DDT6av2
	eN0md++qze/jxaSNPoYAi+2Qlo1gq4sAUj+AMsxeoxpFHOY3fAwrch7XXFekaMv0hz4S
	ns6lKAMzqEmkQioIyLnxCIVR1dHxavS0uA8+PirwVBoPcJAVcKggI8lFN/a1wzLG6+Tz
	4iuqFLqOp2kZs063w1TAgFQo/5YdLBeIFIBauRhNtBvaullbJMcMwGw2NPyWARLntGk7
	MSj1QiVe8WybMnJRh39zkvC9zKE+iMCKQQleRNODPOkcXWToVaSxHQSWSGCvPACrxUbX
	FwgA==
X-Gm-Message-State: AJcUukcc9TJ+u4KxZRKbIosYMWvzFcKRei7PVFTgiv9g31MPXEdznsH5
	+sWyi3RYZlVWVRld7SuY+0QstA==
X-Google-Smtp-Source: ALg8bN6ETZMIh9OEc3MLs6scg/Prd7D1JPGE5GRJErEKfda66ZPywFtLdf4yuRAnRIrDI8YJC+3rYQ==
X-Received: by 2002:adf:c711:: with SMTP id k17mr3754706wrg.197.1547570718593; 
	Tue, 15 Jan 2019 08:45:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s132sm15464390wmf.28.2019.01.15.08.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Jan 2019 08:45:17 -0800 (PST)
Message-ID: <b1951f4cee3d7d3afaa7a0b1c3fcafba7a53b695.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 16:45:16 +0000
In-Reply-To: <20190115144525.29388-7-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
	<20190115144525.29388-7-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 06/15] update-alternatives: allow hooks before renaming files
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
X-List-Received-Date: Tue, 15 Jan 2019 16:45:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-01-15 at 14:45 +0000, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> At the moment, the update alternatives handling is happening
> right after copying into PKGD during packaging time using
> an _append OVERRIDE to the copy function. This means that at
> this point the PACKAGES variable must have been fully
> populated, as that is a prerequisite for update-alternatives.
> 
> In other words, this makes it impossible to e.g. populate
> PACKAGES dynamically using do_split_packages() and still do
> update-alternatives, as do_split_packages() can never
> execute early enough in a deterministic way.
> 
> By converting the existing python function from a 'def'
> type function to a 'python' type function, we now make it
> possible for somebody to hook themselves between copying
> into PKGD and execution of update-alternatives, via
> a _prepend OVERRIDE, which is not possible with 'def' type
> functions.
> 
> [YOCTO #13058]

I don't think you need to do this. Can you add your function to the
start of PACKAGEBUILDPKGD rather than using
apply_update_alternative_renames_prepend
?
or maybe use PACKAGE_PREPROCESS_FUNCS?

In fact we should probably fix the update-alternatives class to use
PACKAGE_PREPROCESS_FUNCS rather than perform_packagecopy_append too.

Regardless, I'd like to see us try and make this more readable rather
than less which means separate functions and less prepend/appending and
more use of the variables...

Cheers,

Richard


> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  meta/classes/update-alternatives.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/update-alternatives.bbclass
> b/meta/classes/update-alternatives.bbclass
> index f1250f877b..ffedada2f6 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -135,10 +135,10 @@ populate_packages[vardeps] += "${UPDALTVARS} 
> ${@gen_updatealternativesvars(d)}"
>  # place.
>  python perform_packagecopy_append () {
>      if update_alternatives_enabled(d):
> -        apply_update_alternative_renames(d)
> +        bb.build.exec_func('apply_update_alternative_renames', d)
>  }
>  
> -def apply_update_alternative_renames(d):
> +python apply_update_alternative_renames () {
>      # Check for deprecated usage...
>      pn = d.getVar('BPN')
>      if d.getVar('ALTERNATIVE_LINKS') != None:
> @@ -204,6 +204,7 @@ def apply_update_alternative_renames(d):
>                      os.unlink(src)
>                  else:
>                      bb.warn('%s: Unable to resolve dangling symlink:
> %s' % (pn, alt_target))
> +}
>  
>  PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
>  
> -- 
> 2.20.1
> 


