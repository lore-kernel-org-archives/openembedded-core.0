Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6606C0F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 16:06:18 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id w18so21407987ite.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 08:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5FDAWvRA06hKvpGwcLBrcdls69xS8dmPEXfJID1OFgk=;
	b=SpEnWTbT7vspyjBawifnov9mXegntL12cekAz9xlKUOZU3JMJKyiyJeOO6ELoWDU0G
	VoHwsuGbSCOAbXGuIzFYZHlrsqFUUC9f2epTdFMnJG8SNl4KqiZgOp8LSCga+jdWJ+oV
	VIlyF25pJFTG+VnpmgLrIAa0XT92/CsKHlEdRrjO03e+RLD7aOmywR5DInfOXCtiNcmW
	SqngOCb6lxzXj7F1+ObB6gGZYlweQV5YsDn/pkXrKsTv8ATT4WTSIaWUzRFwQbA7AYNa
	2q8E2kGsAoWyBIF6vYPVflyAFogYOtm+c5xMoXCasjRXduF/YoNYeRR1YehOEi/71gZ+
	v6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5FDAWvRA06hKvpGwcLBrcdls69xS8dmPEXfJID1OFgk=;
	b=MLcEVI1iQh1XiTr+WeavEikBzvokoYgkeI65iU3cjCOa72gY14rWjLS6uRFejPRAeX
	yRAyecysMqj4fj6U/uFcD8yQripdYk5FJ+zi9dBCYwfGs9KTp6tzUgpnrR2p7/YjHfEf
	LU7I+dscgLd4t0NFmO5+TiYaX6taPdTzRd5o+x1n/3U8uO7mOAvKuJg0r/vHJfdN3VuH
	01vot5EWk/6GeXeCn9HS10F2uwRZEp0NbJNO9D1sQC3GAXqaw9KTwGEMg0eN2USXo+wB
	UBf/RF1NKUoQ8wPgcxL/f7t3pKmNmxhe+BTDrjiDKTNExNSJCvJ5Zcz6wJ30oAsAdbFa
	ou9Q==
X-Gm-Message-State: AJcUuke4iU90l3LxtjoRbdSfuWHW6F/oUnnTgv1/KiC8ep4KbIDD2OTe
	1WcXiVVPxZdNAimLri8SW+NQC5P7di6jwWKTpUQ=
X-Google-Smtp-Source: ALg8bN49WprLjF2E5J390KPp+jRQiKi3q8psG6kUnWOlzQjlDxqEICx2zW2bBxkRXx+0S7dSJoK5aebrr8PN1gxEZj4=
X-Received: by 2002:a24:214a:: with SMTP id e71mr10811553ita.60.1545840379308; 
	Wed, 26 Dec 2018 08:06:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543484174.git.Qi.Chen@windriver.com>
	<75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
In-Reply-To: <75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Wed, 26 Dec 2018 17:06:07 +0100
Message-ID: <CAPbeDCk-GccokSj9tNUj6CGpQ-U946C-emM48=ANdOZATORiCA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Wed, 26 Dec 2018 16:06:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 30, 2018 at 3:18 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> We default hostname to ${MACHINE}, but it's not in /etc/hosts,
> resulting in commands like `hostname -f' failing due to lack
> of entry.
>
> So add entry to /etc/hosts according to /etc/hostname. We do
> this via pkg_postinst because hostname is set in base-files
> recipe.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/netbase/netbase_5.4.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta/recipes-core/netbase/netbase_5.4.bb b/meta/recipes-core/netbase/netbase_5.4.bb
> index 5ab0c58..da9255a 100644
> --- a/meta/recipes-core/netbase/netbase_5.4.bb
> +++ b/meta/recipes-core/netbase/netbase_5.4.bb
> @@ -23,3 +23,14 @@ do_install () {
>  }
>
>  CONFFILES_${PN} = "${sysconfdir}/hosts"
> +
> +RDEPENDS_${PN} += "base-files"
> +
> +pkg_postinst_${PN} () {
> +       if [ -s $D${sysconfdir}/hostname ]; then
> +               hostname=`cat $D${sysconfdir}/hostname`
> +               if ! grep -q "[[:space:]]$hostname[[:space:]]*" $D${sysconfdir}/hosts; then
> +                       echo "127.0.1.1 $hostname" >> $D${sysconfdir}/hosts

Shouldn't that be "127.0.0.1" ?

> +               fi
> +       fi
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

