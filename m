Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 13F297BDE3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:18:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q18so6650816wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VG7/oF37P6UXJApeh3DTB2JEFhihhFmMkih62icYuqY=;
	b=BqPvIo51h0UJ0j+oBvxSqJ5kqmAXrnZtkmKJLMt2j2fQPHcrJ8CVSaBmi4zDT5sts9
	QTij+lMo9dU3fa3vpnjH/QvYP7PRo/nkP/wxhukz8rzxUSYWHLG/mh5aUiTCvB2KJQRP
	ISip6arXZmUWNFWcoDc+/OCSaoBsIHJiDsZGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VG7/oF37P6UXJApeh3DTB2JEFhihhFmMkih62icYuqY=;
	b=kvTkFEneBGBcssFmp+wMDUMq8Fdu5JLQNRc2o1PJ4hA7aPoKXJs3X3T0jaeZFykhvb
	2833NTQ38DLRx2U2VYOTrwrzKdZuoJ+c8fG0Av5MglHPt7Iax+a7gBGdDVUevDN9So3g
	lRlRRSX4P/k6FNowvSttYbmt66IZ1zsXeHxtis/FqjJIsiIKoI7Kv7i3Fg4e1MNuWTfH
	b0oBrPX4FYsf1ze+fDg/mB3qhsq/ub5cItyxSaLptSoNdHcFtGa0N0YY5UE4pyqDSxvH
	/pyCAUg8dqPuc00ZNyct05McwkYmFa4z7Ok1PJnJy53vvssFuBpNdPCCmSTVYhQiDhmt
	/OCQ==
X-Gm-Message-State: AJcUukfAOdbKu+fQPtEFiJJYh4KJGOdtzEiwCkV9zGht8LgckN5T1RGk
	A4+CIhB6IQAbZqNWM/n+Zk9FUxU6sjI=
X-Google-Smtp-Source: ALg8bN6jww5dBbttoMOt4tJwIjH3LFyBlY94+swtMoXPAlkGuhKZTyGooVxNXH+t/hMdBbte+ojM0w==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr7695019wrm.223.1547641124653; 
	Wed, 16 Jan 2019 04:18:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q12sm22966186wmf.2.2019.01.16.04.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 04:18:43 -0800 (PST)
Message-ID: <d8e7a584d5fe4fb73ce26f3bf54cc3317c5650ce.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:18:42 +0000
In-Reply-To: <20190116120051.12182-8-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
	<20190116120051.12182-8-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 07/15] update-alternatives: try to update FILES_${PN} when renaming a file
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
X-List-Received-Date: Wed, 16 Jan 2019 12:18:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-01-16 at 12:00 +0000, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> When using update-alternatives, FILES_${PN} must be
> referencing the new name after update-alternatives has
> renamed files.
> 
> This is more or less OK when having static lists of files to
> be packaged into a package, but makes it quite hard to
> dynamically generate FILES_${PN}, e.g. using do_split_packages(),
> as in that case we can not easily modify what goes into
> FILES_${PN}, because that list is based on filenames as seen
> at the time do_split_packages() is executing.
> 
> Of couse one could explicitly specify the (renamed) file(s)
> in the recipe, but that contradicts the intended usage of
> do_split_packages().
> 
> Instead, if FILES_${PN} contains the file name as it was pre
> renaming, we here modify this to reflect the new name.
> 
> This will allow usage of do_split_packages() to populate
> FILES_${PN}.
> 
> [YOCTO #13058]
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  meta/classes/update-alternatives.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> index 78291e7e45..363f1ae129 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -135,6 +135,8 @@ populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
>  # place for that.
>  PACKAGE_PREPROCESS_FUNCS += "${@'apply_update_alternative_renames' if update_alternatives_enabled(d) else ''}"
>  python apply_update_alternative_renames () {
> +    from re import sub
> +
>      # Check for deprecated usage...
>      pn = d.getVar('BPN')
>      if d.getVar('ALTERNATIVE_LINKS') != None:
> @@ -174,6 +176,10 @@ python apply_update_alternative_renames () {
>                      else:
>                          bb.note('%s: Rename %s -> %s' % (pn, alt_target, alt_target_rename))
>                          os.rename(src, dest)
> +                        f = d.getVar('FILES_' + pkg)
> +                        if f:
> +                            f = sub(r'(^|\s)%s(\s|$)' % alt_target, r'\1%s\2' % alt_target_rename, f)
> +                            d.setVar('FILES_' + pkg, f)
>                  else:
>                      bb.warn("%s: alternative target (%s or %s) does not exist, skipping..." % (pn, alt_target, alt_target_rename))
>                      continue
> @@ -200,6 +206,11 @@ python apply_update_alternative_renames () {
>                      os.unlink(src)
>                  else:
>                      bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
> +                    continue
> +            f = d.getVar('FILES_' + pkg)
> +            if f:
> +                f = sub(r'(^|\s)%s(\s|$)' % alt_target, r'\1%s\2' % alt_target_rename, f)
> +                d.setVar('FILES_' + pkg, f)
>  }
> 

Create an internal function and call it twice:

    def update_files(alt_target, alt_target_rename, pkg, d):
        f = d.getVar('FILES_' + pkg)
        if f:
            f = sub(r'(^|\s)%s(\s|$)' % alt_target, r'\1%s\2' % alt_target_rename, f)
            d.setVar('FILES_' + pkg, f)

?

Cheers,

Richard


