Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 67C13731A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 01:56:23 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id j37so80535qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=77ckgmXZ88bsUgC0vZheryYCe8LMMLtXyOMk+D46lEY=;
	b=Wot8i3GB2E8l/4zN1CrEJJJpNsn4A7R3MLy/Pd43KRlJcX03aU5VhYK5U9lk6mBF3t
	O0j7itxWk3Bd1zi1F/hBbGHZS6Gtze38KxiQOHAy7eAGvhc/GvcoLu+YN8L3UHfpNxA/
	9vrtPwJ48cz/S9IJ1/uJOjYO1fU4GiUgTcBoWewn4einb4bsmXwJxLFRRuNhLTWICe80
	vxq//0EwkRTP7bhDM1epYigKXRce+NbAgQ8ZyachWVPayKNRGVguBR4NkPNQexJysqoB
	WyDt90UL3/+0bajAMNTJI6yY51RXoSmS/ucs4pThisgmfLWS5xOcae4KNXSLl3WHoIdY
	5TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=77ckgmXZ88bsUgC0vZheryYCe8LMMLtXyOMk+D46lEY=;
	b=AU+5Ao1opgk8SjTOpwsZWm8QC9oyFtQjMV4MwE9ig2//YaJwYj/2iNaxIxd9JpOIIR
	hr3Aq6WCc0fW3b5JlstqU+OkSsSmJGUg00+48CeJelykc7OaTIIi+A8a9YnSkelA41MD
	G8Mz+0OyQxUxn57e2arm/U3zjaEtCAS2nsZPxhQC7zo94uLCaEpKK00xg+ryMVkjTyZ1
	yysDM4cPt5D4cudfVsYCU5Ir/cZnRTn8WqwhxwZEM5DfV1quwVZeKdcE0pKEQwAL2WPw
	AYmm3mK5joOhqkvckfgDEV1yKl3Tj+FZnDFK8Q2Liq210SmSOUFlkYyBxqP96pXbzVm4
	yszA==
X-Gm-Message-State: ALyK8tIloI2FWSaLr6ZWXGcc82rH0QBJsyUQTsw/a/Olq1cO//1btGv9VO7GucU+nb3nW7yZa1i4aRMBLQHF9A==
X-Received: by 10.200.48.141 with SMTP id v13mr28903624qta.76.1468288583739;
	Mon, 11 Jul 2016 18:56:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 18:55:54 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84A6F92430@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84A6F92430@ALA-MBB.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 18:55:54 -0700
Message-ID: <CAMKF1sqEqmzKYaashVO6N9ZxD6ZSpV_QvUv10-6efrTomLF3UQ@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: recipes that inherit useradd delete users in do_configure
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
X-List-Received-Date: Tue, 12 Jul 2016 01:56:26 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 6:50 PM, Slater, Joseph
<joe.slater@windriver.com> wrote:
> This might or might not be a bug, but it does lead to unpleasant behavior if
> two recipes create the same user.  They probably should not, but who's
> stopping them?
>
>
>
> I realize they are not in oe-core, but proftpd and vsftpd are an example of
> this.  We have seen failures when building world because proftpd creates
> "ftp",
>
> then vsftpd deletes it, then proftpd tries to chown a directory to the
> now-gone "ftp".
>
>
>
> Is this a recipe by recipe issue, or should something be changed in the
> behavior of useradd.bbclass?

I think we do the user creation during sysroot phase, so may be it can keep
an account of user creation/deletion, and emit a diagnostic about it.
in the end there always will be packages who step over each other, we need
to catch it at right spot.

>
>
>
> Joe
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

