Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 510DA7BDE3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:17:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r10so6635274wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=c3DoR5eKOVtz6gDHqpU7vAqWwkTgmKhfgOp/aXaHFDg=;
	b=SLw6sOTbRyzv7Oe8tz34QNnbaFMwneM1dc0MW0S3sc9FjLnaOxMz7Wk7lUtC6f3NDG
	b4ZokKIho/fjuzqZd5L/EnCAw6crG1+B1TBbm46d1xu+UZVStDF5nqzf/ySGM3mn/eux
	TQpf57u2hzS1gy3rAv6pUK2qbnpgfaDbNtr7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=c3DoR5eKOVtz6gDHqpU7vAqWwkTgmKhfgOp/aXaHFDg=;
	b=oWQ1nb07y/Tn5Gs5T5MXSL/LzyN9ertRqE7HanILZeNkzZpgUQ/IM7UK5hbGlRcM+P
	QYIwtcIqCNwXnlUzUGQ61e91gnJPPis712p57JHZ23kuDKKyYJvQUKIw6PSa41EPDiUr
	qIUzmnCv4OxQ0N9OUbjJSMXLE/v0K8UqOg2bgijbIknEukbEB2HCm6cl3CfuiczW6aKH
	tRQsax6IDkB+4D/pHvH2evmSE17SLyLwTHsGazsbyyRYPVPkJrTjBP6JZBoEDSAVmCt5
	9MyP1rgzEuUXwaEvzT8Z8YAOxfSb5EfjCija/EY3EgUslAEsodjZsOhwxn02McQ07wWN
	uC6A==
X-Gm-Message-State: AJcUukcdIEqcN/PUGndo/9PedZ1qQaJngstFpHpXGaY7dLrTPhwy/tro
	dOBYQjayPoXY2WlZtKADQcsBuA==
X-Google-Smtp-Source: ALg8bN4DMQVnfvmo/ZbOuEXw7oUPbEPsxJI4JymB7QOYChLnIbivAGSumvOppZUSX3jR4nC/80yxgQ==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr8059614wrt.227.1547641021793; 
	Wed, 16 Jan 2019 04:17:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm63289317wrr.43.2019.01.16.04.17.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 04:17:01 -0800 (PST)
Message-ID: <9f3dec7dee6b57f15e48b9dcfbe09ec61d2debbf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:17:00 +0000
In-Reply-To: <20190116120051.12182-7-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
	<20190116120051.12182-7-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 06/15] update-alternatives: convert file renames to PACKAGE_PREPROCESS_FUNCS
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
X-List-Received-Date: Wed, 16 Jan 2019 12:17:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-01-16 at 12:00 +0000, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> At the moment, the update-alternatives file renaming is
> happening right after copying into PKGD during packaging
> time using an _append OVERRIDE to the copy function
> perform_packagecopy().
> 
> This is not really readable and hard to maintain.
> 
> Additionally, this makes it impossible to e.g. populate
> PACKAGES dynamically using do_split_packages() and still
> do update-alternatives - update-alternatives file renaming
> requires the PACKAGES variable to have been fully populated
> to work correctly. On the other hand, do_split_packages()
> can only execute after perform_packagecopy(), as it needs
> PKGD populated; so it's impossible to insert
> do_split_packages() early enough in a deterministic way in
> this use-case.
> 
> As there doesn't seem to be a reason not to, convert
> this to a proper function and use PACKAGE_PREPROCESS_FUNCS
> instead - after all, that's what this is meant for.
> 
> No other classes or recipes in oe-core or meta-openembededd
> seem to have a hard requirement on update-alterantives
> executing before any other PACKAGE_PREPROCESS_FUNCS, so
> this should be perfectly fine.
> 
> The only implication is that if compress_doc is inherited,
> compressed man-page file names will end up being, e.g.
>     eject.1.util-linux.gz
>   or
>     eject.1.gz.util-linux
> based on the include of compress_doc.bbclass vs.
> update-alternatives.bbclass order, but the symlink created
> (alternative name) will always be correct.
> 
> This solves both problems:
> * the code is easier to read / follow
> * the above described use-case can be accomodated easily
> 
> [YOCTO #13058]
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  meta/classes/update-alternatives.bbclass | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/update-alternatives.bbclass
> b/meta/classes/update-alternatives.bbclass
> index f1250f877b..78291e7e45 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -131,14 +131,10 @@ def gen_updatealternativesvars(d):
>  populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativ
> esvars(d)}"
>  
>  # We need to do the rename after the image creation step, but before
> -# the split and strip steps..  packagecopy seems to be the earliest
> reasonable
> -# place.
> -python perform_packagecopy_append () {
> -    if update_alternatives_enabled(d):
> -        apply_update_alternative_renames(d)
> -}
> -
> -def apply_update_alternative_renames(d):
> +# the split and strip steps..  PACKAGE_PREPROCESS_FUNCS is the right
> +# place for that.
> +PACKAGE_PREPROCESS_FUNCS += "${@'apply_update_alternative_renames'
> if update_alternatives_enabled(d) else ''}"
> +python apply_update_alternative_renames () {

Looks good, how about adding:

    if not update_alternatives_enabled(d):
       return

here to make it slightly more readable?

>      # Check for deprecated usage...
>      pn = d.getVar('BPN')
>      if d.getVar('ALTERNATIVE_LINKS') != None:
> @@ -204,6 +200,7 @@ def apply_update_alternative_renames(d):
>                      os.unlink(src)
>                  else:
>                      bb.warn('%s: Unable to resolve dangling symlink:
> %s' % (pn, alt_target))
> +}


Cheers,

Richard


