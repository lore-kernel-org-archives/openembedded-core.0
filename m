Return-Path: <erik.boto@pelagicore.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACEF71741
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 07:18:21 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id g201so4702212oib.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 00:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=iOzKJtSFZn0etkXAb4agJhm04zwAAKWtfowmP3PAq3w=;
	b=Ijfh97QKK6fQcsHo3Bjal3+yLKzqqReLdaSaLaS8ZHsGPpS1RlHCg+483/5BDiYlAG
	ly68PMU72/qRWqJWbIKb7+iy4JU9bLqoaAbwKcQXy1afzP0DUGJ6ncArZrmwdNOfZGK8
	4rzcNfm9aj++lGnmYIGgO5kjBYlhdq6urPC72eYZCqDNZ6A9NXl8zWAXZzUXPAR7X54H
	UhNHKVlmo+WaCt1bk1DXNWo4cmaXYZwmVOzWLg0Tbs6A4Ke4hA6T4Db+Z4j4KNRTrysK
	TXAEC39TAWZ8aZW22cUr78LOPFQGE9a5dt4yHSRQw8xZ2+Y0sW5SwXjBTc0+/HJe7Mt0
	LxGw==
X-Gm-Message-State: ALoCoQlu/WFrLbfmUZ3PKkHrvRVNAyKWzF0szQzDOhE4wbxRU/68Gyy1jNSESzccGaQxCzsmSShn
MIME-Version: 1.0
X-Received: by 10.182.102.98 with SMTP id fn2mr1806312obb.13.1412666302690;
	Tue, 07 Oct 2014 00:18:22 -0700 (PDT)
Received: by 10.76.44.146 with HTTP; Tue, 7 Oct 2014 00:18:22 -0700 (PDT)
In-Reply-To: <1412633433-23255-1-git-send-email-ross.burton@intel.com>
References: <1412633433-23255-1-git-send-email-ross.burton@intel.com>
Date: Tue, 7 Oct 2014 09:18:22 +0200
Message-ID: <CA+AhUGw=iumQ49Y-kshAM5R8zqww+vL7ADErTN-Ywtq+PYq9ug@mail.gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: don't add files and dependencies from units Conflicts
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
X-List-Received-Date: Tue, 07 Oct 2014 07:18:24 -0000
Content-Type: text/plain; charset=UTF-8

This patch works well for me. Any chance of it getting cherry-picked
into Daisy as well?

Cheers,
Erik

On Tue, Oct 7, 2014 at 12:10 AM, Ross Burton <ross.burton@intel.com> wrote:
> Adding dependencies and moving files based on Conflicts tags in unit files isn't
> right, mainly as it means that systemd depends on systemd-binfmt, because the
> latter ends up containing the shutdown.target unit.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/systemd.bbclass |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 708ba89..c34884b 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -143,10 +143,7 @@ python systemd_populate_packages() {
>          if has_exactly_one_service:
>              has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
>
> -        keys = 'Also' # Conflicts??
> -        if has_exactly_one_service:
> -            # single service gets also the /dev/null dummies
> -            keys = 'Also Conflicts'
> +        keys = 'Also'
>          # scan for all in SYSTEMD_SERVICE[]
>          for pkg_systemd in systemd_packages.split():
>              for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

