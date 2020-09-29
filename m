Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.9379.1601338298824103501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 17:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rr4gmJ/w;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id v123so2799583qkd.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 17:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mu4916quLecYtLq+FdTcystjSHc87t2owKAWPJurcwY=;
        b=Rr4gmJ/w6r/Px/5t4TrUB/t2wI3LSCdq/OYG+/2C6meDfcJ4dHKO4hSB4Hc7Xt6HJr
         38Ia41Vuj+7nOrSGV9IgE/Obnf09suOL4cS9DeneEjumv63eMdZIEAMFTjuUBLYaiG+0
         ZFDuAgFZrOTHNhozd9pifDXDDoFY/CJV0K0g3NZpkzi+Ez3ZkBEpRc3/QatMlQjd3W55
         JORaniN4Dk2fxerJDRgtuhZObDFhB5/wnZaX4RenbOL7SKB5iUPNjpL95C/KVEmBg60M
         Y8vSemX72nxDYDr8hX7qskFwBuHZKrVMhJQfZei7A+5chpVQYhyMPV6WOf6bQhvlPKjt
         F1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mu4916quLecYtLq+FdTcystjSHc87t2owKAWPJurcwY=;
        b=hd8+zmER5lhxVb4KIwnxgAepGzhy9iD0LPuY0kSCxFC1uVsUm6OL7N5aPDlMGjgPeD
         2B6CYt5EmC272Dwnj7dDVGoCDKE/dguAJ0Y6ZBxBWjrSHZKtg83HeLvWcS1KKTLiYaU4
         xLDr2otAhhlQJsiGGaFyTB9fnMwBTbdTA+6ZPq+GHi2QHuk0SR8G9bdekpu0xOwlDqkr
         K0/mpb6vO2AqJMAXc/USFt68ejgT7RLNcxG7qo3OVFP0wGjY80+YaxN0sbwOEM4BBc5S
         K7oxBPfPJ58gMNXuyeYdk2vGKNNQtS6AwTLLSjX32ia17w35kdCMrHCOzXZYY8oHc5gx
         rULA==
X-Gm-Message-State: AOAM533SwRQQO14CvUlcCKSD6/paQWAr8SAN25Pyng+Tnkub2ND4/O7Y
	sA1QOSwwekbgBKrRWBdXK6pxdPi8J6UykRADVyU=
X-Google-Smtp-Source: ABdhPJzhz0bSiR2xYIdb27z0cKhmDD1pNRJRW6d0jAYqb3oWaMlGdAdgGZ/TUdkpfMACMiwLrwta0o1Ilu1vFKXX99M=
X-Received: by 2002:a05:620a:13f6:: with SMTP id h22mr2085373qkl.9.1601338297785;
 Mon, 28 Sep 2020 17:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200923150515.2548741-1-richard.purdie@linuxfoundation.org>
 <20200923150515.2548741-2-richard.purdie@linuxfoundation.org> <dbbdf39c-6565-b461-a973-b58a21513826@kernel.crashing.org>
In-Reply-To: <dbbdf39c-6565-b461-a973-b58a21513826@kernel.crashing.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Sep 2020 17:11:11 -0700
Message-ID: <CAMKF1srDUGSi8qFGQmE5Hm3xQU=_YSyzBYKbq2RXoc=ebBacBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] ssh-regen-hostkeys: Add a recipe with pregenerated ssh host keys
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 8:39 AM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> I'm worried about this from a product security perspective.
>
> I think this is very valid case for an autobuilder/autotest infrastructu=
re,
> however if this ends up in a release product it will lead to huge proble=
ms.
>
> Is there a way we can ensure this can only be used for the autobuilder/a=
utotest
> infrastructure, and never provided by accident in an image.  (If a user =
decided
> they must do something like this, we can't stop them -- but we should al=
low it
> to happene either by accident or make it look like it's good practice.)
>


its in same class as debug-tweaks in IMAGE_FEATURES, so if we can tie
it to debug tweaks we should be offering a good
balanced solution.

> --Mark
>
> On 9/23/20 10:05 AM, Richard Purdie wrote:
> > Host keys are getting bigger and taking an ever increasing amount of t=
ime
> > to generate. Whilst we do need to test that works, we don't need to te=
st
> > it in every image. Add a recipe which can be added to images with
> > pre-generated keys, allowing us to speed up tests on the autobuilder
> > where it makes sense to.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../ssh-pregen-hostkeys/dropbear_rsa_host_key | Bin 0 -> 805 bytes
> >  .../openssh/ssh_host_ecdsa_key                |   9 +++++
> >  .../openssh/ssh_host_ecdsa_key.pub            |   1 +
> >  .../openssh/ssh_host_ed25519_key              |   7 ++++
> >  .../openssh/ssh_host_ed25519_key.pub          |   1 +
> >  .../openssh/ssh_host_rsa_key                  |  38 +++++++++++++++++=
+
> >  .../openssh/ssh_host_rsa_key.pub              |   1 +
> >  .../ssh-pregen-hostkeys_1.0.bb                |  19 +++++++++
> >  8 files changed, 76 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys/dropbear_rsa_host_key
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys/openssh/ssh_host_ecdsa_key
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys/openssh/ssh_host_ecdsa_key.pub
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys/openssh/ssh_host_ed25519_key
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys/openssh/ssh_host_ed25519_key.pub
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys/openssh/ssh_host_rsa_key
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys/openssh/ssh_host_rsa_key.pub
> >  create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-=
pregen-hostkeys_1.0.bb
> >
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys/dropbear_rsa_host_key b/meta/recipes-connectivity/ssh-pregen-hostk=
eys/ssh-pregen-hostkeys/dropbear_rsa_host_key
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..30443c94388530f82308f4=
1517839c8932026eec
> > GIT binary patch
> > literal 805
> > zcmV+=3D1KRum000Mbb7(Dcb724g00RL40RR920RW_9o<Q`&RLY?p;cQBYl_0xM7ker@
> > z#>e=3DVPY-g{TMU)xikgot*E3d4mq}vnGGMFK&?`3lQuzp%&bLmM?!~`G;T{U;4Y_oX
> > ztW&5pYa=3D!AY~l?MU+0l28E$@8(~zi5Bd|IC1+@_wEtWbRYFyfC@g&!whp05e8cXIs
> > zAO2$|o3V1#D_vFi`9{vpf^~zgpZ#hwyW(^VKuj<OzgVE^XFF~}ce5HLEhMA_A#DjB
> > zr|?tGWY(1vcP3@X_D<(~^_D`?%NDne77p}AN|!y909XYC`_sATu*WrQf(gmixEp2-
> > z>$8a#0)WG<q}MUu|8+c0X4jT;_QU9xX=3D4BY0RR*iF07uNPP`KH&1{G<hh4xnn%0dY
> > zP#Ae@xR_Z!^$9gP{n3QwBhy^nPrHKA9b%3xtLoGy16TJlVr!|nt%cHREwUHDBZ)#&
> > zIuv0};sB&0b(1XUZ=3DR#^gKw)AJ->viB+c<qch4BVT!3pT)F^ZFH1vHt`w`Y0@D@##
> > z@@ZGZ%D<}4p}ve0)Xwh;edfrl=3D)p&V9UGh~&x8Yu)sWosd`Y;+BqJ~l)2TH)09_+3
> > zZ4`?ekchIl<e1h>_qjZCYr4Lp0K;iIPX5{`t64nTmV(|FuFJ&BZ$BAyJg?pxXg<a)
> > zbV^FhSAdt5<k_}IRCaywz#yJWqIS6&l<@!n0D%Ccn(fVgheZMOMklNB@_0x97I^c(
> > z)g%(nv9r;~j;->7$f}g_o>)88b=3Dv%Es_PL7V(*H}r1F5#*9l3)Gfn<ql<Ti$LHrEj
> > zS-L{YkFoPvZ(fHzZ3tgU=3D!A>JlT_mL2YLkdI4|&EdH&9vMig5l?U-%Rc`5EN%eoyF
> > zuVc{w004mi|Ec<oe#A0Q9VqAgVm(o9sLt1ZfurNgFvIvhY0&q8+JQroO#OAF8r-iY
> > zN-Z{|f9K{)ifw^eNk}eKb<KvqcQ0#>dX6Z%1|5s(MS`eaRn9_0H4of0ISncPXCoP&
> > jnu6P-g&8cZCSpI?z=3D;2?Sr97OqIjGUAl>AZv%QM*=3D5vR&
> >
> > literal 0
> > HcmV?d00001
> >
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys/openssh/ssh_host_ecdsa_key b/meta/recipes-connectivity/ssh-pregen-=
hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key
> > new file mode 100644
> > index 00000000000..86c2104ec8a
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkey=
s/openssh/ssh_host_ecdsa_key
> > @@ -0,0 +1,9 @@
> > +-----BEGIN OPENSSH PRIVATE KEY-----
> > +b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAaAAAABNlY2RzY=
S
> > +1zaGEyLW5pc3RwMjU2AAAACG5pc3RwMjU2AAAAQQRJR6iZxr/NTqQN9NOwV+WPtu42r2e=
F
> > +rJ0xsnlqw5bpmfz6aDR8RQvVHUZjRGQfR/RXPbQ5x+bjjdm176TuXNhHAAAAqAoE27MKB=
N
> > +uzAAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBElHqJnGv81OpA3=
0
> > +07BX5Y+27javZ4WsnTGyeWrDlumZ/PpoNHxFC9UdRmNEZB9H9Fc9tDnH5uON2bXvpO5c2=
E
> > +cAAAAgLiHv/IWhxwosz9BiNILOOPlXaueL5hVTBKUJkpOi48sAAAANcm9vdEBxZW11bWl=
w
> > +cwECAw=3D=3D
> > +-----END OPENSSH PRIVATE KEY-----
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys/openssh/ssh_host_ecdsa_key.pub b/meta/recipes-connectivity/ssh-pre=
gen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key.pub
> > new file mode 100644
> > index 00000000000..a358aeb88a7
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkey=
s/openssh/ssh_host_ecdsa_key.pub
> > @@ -0,0 +1 @@
> > +ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAA=
ABBBElHqJnGv81OpA3007BX5Y+27javZ4WsnTGyeWrDlumZ/PpoNHxFC9UdRmNEZB9H9Fc9tDnH=
5uON2bXvpO5c2Ec=3D root@qemupregen
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys/openssh/ssh_host_ed25519_key b/meta/recipes-connectivity/ssh-prege=
n-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key
> > new file mode 100644
> > index 00000000000..00ed9adae2f
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkey=
s/openssh/ssh_host_ed25519_key
> > @@ -0,0 +1,7 @@
> > +-----BEGIN OPENSSH PRIVATE KEY-----
> > +b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZ=
W
> > +QyNTUxOQAAACDHSFTAbJ3OTd1r1E8G5JleCmsJEpQHmdTGtMcYqwWbbwAAAJChFtV0oRb=
V
> > +dAAAAAtzc2gtZWQyNTUxOQAAACDHSFTAbJ3OTd1r1E8G5JleCmsJEpQHmdTGtMcYqwWbb=
w
> > +AAAEA8UiUsygsTbP0HkDi5leXpQaVXihDyCHeitkBCItJGhcdIVMBsnc5N3WvUTwbkmV4=
K
> > +awkSlAeZ1Ma0xxirBZtvAAAADXJvb3RAcWVtdW1pcHM=3D
> > +-----END OPENSSH PRIVATE KEY-----
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys/openssh/ssh_host_ed25519_key.pub b/meta/recipes-connectivity/ssh-p=
regen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key.pub
> > new file mode 100644
> > index 00000000000..cc0e2f43ed2
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkey=
s/openssh/ssh_host_ed25519_key.pub
> > @@ -0,0 +1 @@
> > +ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMdIVMBsnc5N3WvUTwbkmV4KawkSlAeZ1=
Ma0xxirBZtv root@qemupregen
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys/openssh/ssh_host_rsa_key b/meta/recipes-connectivity/ssh-pregen-ho=
stkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key
> > new file mode 100644
> > index 00000000000..a8e4406ba34
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkey=
s/openssh/ssh_host_rsa_key
> > @@ -0,0 +1,38 @@
> > +-----BEGIN OPENSSH PRIVATE KEY-----
> > +b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtc=
n
> > +NhAAAAAwEAAQAAAYEA2Q6dzF1xziCQCFq+e+Fv6w0607gNlyKnkhuoRq8G7/HEqXU2eEt=
C
> > +i3AMUrAP8k7s9kP5vI5CyfSgFuC9MxDV2YL2bsmvRxBSKgg6KbNxkoTaFBqyqHopuWQca=
8
> > +KRahvzt5dh9fsmeqamIwgMWKTSwtDHcsbyt84nmO2Z2ZrNXobgueMIj+HiJVgmWn86FQF=
L
> > +EoONAA+qb4SciPsxvmTlaQ/DMAh3llVo/IMLD9oyAyAI2kbHNnZttlYv5TmY7ICd3yCW8=
z
> > +PXrxNcEF3Qs1d68gVJxLjLKTlYGzJW2J+RwY+1DJZ0w4lozeQiZXTXVtzcJB0tm2DcvQM=
z
> > +kqyARmncSUwcPbEClEW6Y2xQnLeSHjexzlCCndiUbBTeG5iRl4OL6DN40iI9Lw2VROtj2=
Y
> > +59n9PCfaoUs08dsgJLaNrDbRHrCRLSdZJ6OQFiC/nAx/t4e4+wdUgNOqLyJqomdNdaLXP=
q
> > +tzr9ssrcY5j1DmmwKtzfTI5VM9LRQo+REIiUCNTFAAAFiFh232tYdt9rAAAAB3NzaC1yc=
2
> > +EAAAGBANkOncxdcc4gkAhavnvhb+sNOtO4DZcip5IbqEavBu/xxKl1NnhLQotwDFKwD/J=
O
> > +7PZD+byOQsn0oBbgvTMQ1dmC9m7Jr0cQUioIOimzcZKE2hQasqh6KblkHGvCkWob87eXY=
f
> > +X7JnqmpiMIDFik0sLQx3LG8rfOJ5jtmdmazV6G4LnjCI/h4iVYJlp/OhUBSxKDjQAPqm+=
E
> > +nIj7Mb5k5WkPwzAId5ZVaPyDCw/aMgMgCNpGxzZ2bbZWL+U5mOyAnd8glvMz168TXBBd0=
L
> > +NXevIFScS4yyk5WBsyVtifkcGPtQyWdMOJaM3kImV011bc3CQdLZtg3L0DM5KsgEZp3El=
M
> > +HD2xApRFumNsUJy3kh43sc5Qgp3YlGwU3huYkZeDi+gzeNIiPS8NlUTrY9mOfZ/Twn2qF=
L
> > +NPHbICS2jaw20R6wkS0nWSejkBYgv5wMf7eHuPsHVIDTqi8iaqJnTXWi1z6rc6/bLK3GO=
Y
> > +9Q5psCrc30yOVTPS0UKPkRCIlAjUxQAAAAMBAAEAAAGAGIj+bUtiwdoMbeVUAszIydkE/=
U
> > +mgv6S7LFjT/KlsL1M017LYJWDcdMaFnhMouksRngSxBg9OnWV5cxyURmFwytVy5bMGjRH=
b
> > +N8UWTgBqphU+UWdzKngkn0AhtkyYA1aFhgsml5d8EgEkZnFSc/KtoDfZU7AJX519/FtfO=
K
> > +m27Shx3pE7Nohh97avHyuidR1gTwdvuMIMke57g0BhrxPYmredaKCMZAHjjCeD6JbRcGj=
+
> > +ly3I9u8MF8BGSbLpBlLDUFCwP8G5CdmMua8bPJYhPSRqMLQhclI7hc6FaYk+gZV9B74Iv=
/
> > +SAxcCwI97dNbE0IAsbbWoUdoKGpAYQ5gOdhu5ioqZwKWjNjB3Xx48mq8xtmIR9HEnYzEn=
k
> > +b/tDWNRWrGkvNK7vpLvnbsSSKBqOAbMzmQdJxogTgjE5doSmu2/krIMR6KUcUox2ZrR8O=
t
> > +JM6bXyNFBviiXmYvw/SZTDrVJu8BPMu5EMS5pBl8jPFBGI/ePk4qg7lWAJeQ89ThtBAAA=
A
> > +wQDEU4HjomWwJsn9UWdoodXTV5aPY9B1OPkmYnRPtsjSAcXgtBzUXMEOsmXODOK3aQjsE=
0
> > +jQKpWDAUcUf6KKZKRehxUN4MlwujCG9czn65S6B8BsP1YUfZQjpNyub8vDBfeKzlxKBEE=
M
> > +lb4iBT+LEGkihK13H5CbqRg1GDAThZzwrV4pj3S40zgyHhn8JjK4x4djEY6NwkWH8E2Dg=
D
> > +8vYG/FKh5E/VIZtCgtAHa4QNAgGB4VMRn1VpSJzxjCxb1wancAAADBAPT7F34WYEI3Vc5=
2
> > +p1U5rPa6dZtg5QM14V0+KtMlb3frd0/F+JVj4t6COQ8J9pkOuD0YjOYJuFXIWAAYIjCdW=
t
> > +cbTi/sSERawOWxrgSwJo2vjt5izrBQtr3N8tiB6KDGa5sdgJl5XzJ0SsdStfBbyhcJO4R=
V
> > +p9lc+X8OsUfFsClmyIs45vlxBRH06DP6/zmYCAmqvlrfZJKqlpKAEWDDObRy/3+mSNhZ0=
J
> > +BdmncASiASRlPPIoIHznyA1COUn6+TnwAAAMEA4tH89Dez2JauyPVeCyHAC680vrBKjmM=
x
> > +WYdpq2Xzd/LNl2L9oc0IEZzerLTuaCh6qsbbk2wWj1nrYXvefz/xUtDR427tvRXckcsWh=
P
> > +2HYohdYBkwTpp9QuscIV76GdwbTImuNEzvABH1hpTG6DSzqeyf/EVmSq07nptJIs5lpU4=
9
> > +tW2aWraSvswHR9xfts1U79w9f4BNDy1rTmfuLERTRNF/T9CIFsk9tArLUNT64mhHtoEs8=
F
> > +9AyGuq6v49bN0bAAAADXJvb3RAcWVtdW1pcHMBAgMEBQ=3D=3D
> > +-----END OPENSSH PRIVATE KEY-----
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys/openssh/ssh_host_rsa_key.pub b/meta/recipes-connectivity/ssh-prege=
n-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key.pub
> > new file mode 100644
> > index 00000000000..9eb8c3838fb
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkey=
s/openssh/ssh_host_rsa_key.pub
> > @@ -0,0 +1 @@
> > +ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZDp3MXXHOIJAIWr574W/rDTrTuA2XI=
qeSG6hGrwbv8cSpdTZ4S0KLcAxSsA/yTuz2Q/m8jkLJ9KAW4L0zENXZgvZuya9HEFIqCDops3GS=
hNoUGrKoeim5ZBxrwpFqG/O3l2H1+yZ6pqYjCAxYpNLC0MdyxvK3zieY7ZnZms1ehuC54wiP4eI=
lWCZafzoVAUsSg40AD6pvhJyI+zG+ZOVpD8MwCHeWVWj8gwsP2jIDIAjaRsc2dm22Vi/lOZjsgJ=
3fIJbzM9evE1wQXdCzV3ryBUnEuMspOVgbMlbYn5HBj7UMlnTDiWjN5CJldNdW3NwkHS2bYNy9A=
zOSrIBGadxJTBw9sQKURbpjbFCct5IeN7HOUIKd2JRsFN4bmJGXg4voM3jSIj0vDZVE62PZjn2f=
08J9qhSzTx2yAkto2sNtEesJEtJ1kno5AWIL+cDH+3h7j7B1SA06ovImqiZ011otc+q3Ov2yytx=
jmPUOabAq3N9MjlUz0tFCj5EQiJQI1MU=3D root@qemupregen
> > diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-=
hostkeys_1.0.bb
> > new file mode 100644
> > index 00000000000..ddd10e6eeba
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkey=
s_1.0.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "Pre generated host keys mainly for speeding up our qemu =
tests"
> > +
> > +SRC_URI =3D "file://dropbear_rsa_host_key \
> > +           file://openssh"
> > +
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade6=
98e0bcf8506ecda2f7b4f302"
> > +
> > +INHIBIT_DEFAULT_DEPS =3D "1"
> > +
> > +do_install () {
> > +     install -d ${D}${sysconfdir}/dropbear
> > +     install ${WORKDIR}/dropbear_rsa_host_key -m 0600 ${D}${sysconfdi=
r}/dropbear/
> > +
> > +     install -d ${D}${sysconfdir}/ssh
> > +     install ${WORKDIR}/openssh/* ${D}${sysconfdir}/ssh/
> > +     chmod 0600 ${D}${sysconfdir}/ssh/*
> > +     chmod 0644 ${D}${sysconfdir}/ssh/*.pub
> > +}
> > \ No newline at end of file
> >
> >
> >
> >
> >
>
>=20
>
