Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6FED1612E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 12:10:02 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id z135so119680364iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 04:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KzhM58BJpUPWQysLR3LXY1s0YkIGSa6n3/L2DRIPH34=;
	b=uMrPR1adLLI3gI5dELgzJyunFrgoKfKPFkDilvm7+e/FbDDecbn+i0j1wAPoGYwqcM
	wdw9BwtJN+1bwFqYRgRW3bOr6kUyiRlA/Ju5YGx8Tptl4mC44cgASyewioBfeQG4B+qL
	8w0IV4KIJ8HDDGZtYjKbi/7JM2jJWOD4Jh3bt2j96V+h56m2z0dJL7F8bNLydmgYZaC6
	dqiBqf2BAMNzmGaPf3c3DHomqf3QZgOeJ8RxcB0GLPtlfIxDSobdjqSwPSZAmFX5X2jh
	VZkKbKFK5Twf6dfe8KHwth5IZChV/xQcQLico1FrbnMdBNfOQZNi6F4gf8LXVPgb5LqH
	GRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KzhM58BJpUPWQysLR3LXY1s0YkIGSa6n3/L2DRIPH34=;
	b=QuMu/ZOP6400/LNB0BTc3T8ampiBuHbQZy58wBbvnfebtnkoNTCbSeRGG554kMnR3S
	b1izGEU5iry7BYLib5UUvaXbzr5x0usWCPuhjA1z/JQRC6TsFnNK89QdLDUTIs0HFOAV
	e5usXZLbq70s68maeBebUg2vlshPJckKbvywrFjzBODrfJTBrOjs08TtHC5v6U2oV2yk
	KuPz1i0Ia8DFYOyXPrOfvxOIClTke38RiAvmfPQbBNFjgGc9q7uZXIa6uxotGbcfZgDc
	1e38HPr8tzmn8GPhz2zw4IE83FCe3pHg2AFx1ytwUi21PX0pB1/arFw/G3wRDAvkX3oQ
	7tcw==
X-Gm-Message-State: AG10YOSBbEP8hO05/V02dGRJqWmsvqk9CRxAsOfoyKV9UJM3frL/ca+qMmWkGwzJEtqcPldLu1dSf83+1YpoJ1HI
X-Received: by 10.107.137.92 with SMTP id l89mr24618520iod.133.1455624602771; 
	Tue, 16 Feb 2016 04:10:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 16 Feb 2016 04:09:43 -0800 (PST)
In-Reply-To: <edb161a868336c0688a6e03343ee7920b34222f5.1455606710.git.kai.kang@windriver.com>
References: <cover.1455606710.git.kai.kang@windriver.com>
	<edb161a868336c0688a6e03343ee7920b34222f5.1455606710.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Feb 2016 12:09:43 +0000
Message-ID: <CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Tue, 16 Feb 2016 12:10:04 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb45ff7d9052be20386

--001a113ebdb45ff7d9052be20386
Content-Type: text/plain; charset=UTF-8

On 16 February 2016 at 07:14, <kai.kang@windriver.com> wrote:

> +FLOCK_FILE=$SYSROOT/etc
>

useradd_base is also used by extrausers.bbclass, so it would be best if
useradd_base decided where to use as a lock ($rootdir/${sysconfdir} sounds
sensible) instead of expecting that the caller sets FLOCK_FILE and
mysteriously failing if it wasn't set.

Also if we're locking and waiting properly instead of using timeouts and
loops, can we remove the "does it exist?" check before the operation (eg
groupadd -f will exit 0 if the group exists) and after (with proper locking
that shouldn't be happening).

Ross

--001a113ebdb45ff7d9052be20386
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 February 2016 at 07:14,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":4lc" class=3D"a3s" st=
yle=3D"overflow:hidden">+FLOCK_FILE=3D$SYSROOT/etc<br></div></blockquote></=
div><br>useradd_base is also used by extrausers.bbclass, so it would be bes=
t if useradd_base decided where to use as a lock ($rootdir/${sysconfdir} so=
unds sensible) instead of expecting that the caller sets FLOCK_FILE and mys=
teriously failing if it wasn&#39;t set.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Also if we&#39;re locking and waiting pro=
perly instead of using timeouts and loops, can we remove the &quot;does it =
exist?&quot; check before the operation (eg groupadd -f will exit 0 if the =
group exists) and after (with proper locking that shouldn&#39;t be happenin=
g).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a113ebdb45ff7d9052be20386--
