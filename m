Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF0D7185E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 10:37:49 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id c9so3104776qcz.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=IkF0qCl9SH28WCvFxbaaXAUYXw5yd64uePt9ZjHmA6o=;
	b=zCRbcgpPxTeDfUH0kD8YHnp/hp8tzArd4xdMnRYvuwjWuu/n1ye2zOCyAepanLAzb5
	U20pZuJe3Vpn0JM8xbUn1DwXZ1yAsJpN0TLjqzA1fXIlbmCjAYNwJSjIJ34+UvjdwkNy
	IKmb1Ol8YCumWJ8mEkiQwoqbd6fhemYoVgml9txN3/KG3XYeBYSAV+RFRqCHrjB/QJps
	b6PPJL9XIRiV0jiqdY6w+owVxbQDlC8fPohnd3kx41OoOMgXONKAA/PqMiBlPjcARHY1
	BicKngaFvkwyLPgbi9efZ9wDQGexalaIoomKtUXV21q3w2hvXnE/q86lJP+XRdELnxhT
	KIpg==
X-Received: by 10.140.32.196 with SMTP id h62mr17172978qgh.13.1413023870969;
	Sat, 11 Oct 2014 03:37:50 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Sat, 11 Oct 2014 03:37:10 -0700 (PDT)
In-Reply-To: <54390771.1040402@windriver.com>
References: <cover.1412770325.git.hongxu.jia@windriver.com>
	<241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>
	<CANyK_8eqiktne2E4EwpWoBpz_-xtDweSS56XdBi6ocKoh_Wq2A@mail.gmail.com>
	<543903BC.6020706@windriver.com>
	<CANyK_8fkQmOD8=gCkUBG3BSYhF9PCvn2-CYka2Xnk=XBBgWD7w@mail.gmail.com>
	<54390771.1040402@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 11 Oct 2014 11:37:10 +0100
X-Google-Sender-Auth: BlQdu1a_E_HbUHi3XZpwpz9VdSQ
Message-ID: <CANyK_8e2DGuhNL2Cmo4MvrBFWR1_obXHqANJK6pEyixt9NycSw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Sat, 11 Oct 2014 10:37:50 -0000
Content-Type: text/plain; charset=UTF-8

On 11 October 2014 11:33, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Here is my patch, and it could not work, I think we are doing
> the same thing:
>
> --- a/libopkg/opkg_remove.c
> +++ b/libopkg/opkg_remove.c
> @@ -118,8 +118,11 @@ opkg_remove_dependent_pkgs(pkg_t *pkg, abstract_pkg_t
> **dependents)
>              for (a = 0; a < dep_ab_pkg->pkgs->len; a++) {
>                  pkg_t *dep_pkg = dep_ab_pkg->pkgs->pkgs[a];
>                  if (dep_pkg->state_status == SS_INSTALLED) {
> -                    pkg_vec_insert(dependent_pkgs, dep_pkg);
> -                    count++;
> +                    if (!pkg_vec_contains(dependent_pkgs, dep_pkg))
> +                    {
> +                        pkg_vec_insert(dependent_pkgs, dep_pkg);
> +                        count++;
> +                    }
>
> //Hongxu

My assumption was that duplicates were only being added during a
single call to opkg_remove_dependent_pkgs, as on subsequent calls a
package will no longer have state_status == SS_INSTALLED if it has
already been removed. If my assumption is wrong, your original patch
looks to be the best solution.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

