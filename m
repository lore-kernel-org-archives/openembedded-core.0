Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D555719B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 18:02:57 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 97so99625wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7CV+YxoojKVGrNbrcxRhJaipy+wLgpzMc3/RqbkfQns=;
	b=dK9c3PuzMot2HxYCOvPaiJ7swvgTc0bBEqVq6DqXQwCnnRLlSVyz+Yb/96Asr2fBrf
	qHgdNee0EX+kdmOXPKWv3ZWDgLiEz2H3ZhtYr0xUHAfdDdmrz6wkcLPuiMsOPzFLOgWo
	nJ99MXlgBIzJzKlORrOmiKZFcP1LfAC2yMTyy79hycDe729lN4+gPfmXlIA+MOp9PTqd
	DAbXq43E8dS1mVeVjIZundHgbVJ9NyokaHPBg9bWtPzO0OIr9d+d3LvMcs9fB+X2GVuC
	yPgVoIvxnS0/2MqXcTijVAH/j9wwBYtj6k9dVxUoQfiYd9jJHqTRP0ngyxx5LSOlWDWX
	e8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7CV+YxoojKVGrNbrcxRhJaipy+wLgpzMc3/RqbkfQns=;
	b=tH9utdiXZDAmzq75T84RT+njk0S51oeouN22B7VYW7Y54DYoRweYA3oA4TPROpHGtD
	7JQWTKUBecnDGDUqpPz7pWJdgV64WaKP83agO55PGpR253a4SSYY6XqIvVe7mjDna+M1
	RX3Tw80l/+gAl5xWt9N6rF4WYh2byZTXWR5tulgNVE1I3ZmFPwU6VyUA1LqXHH7khauN
	kOJo7vDPTPLn0JKliBfEQYmDcrRDJ01ffRBhROCeCC/T6C4CbK98JkXUs4zTrpYWNZHQ
	h7DCPp9qFcsblStM5EjY5xavS0DiXcNmVrQYVv6ONZSgwpDN29fEq1BVYzNNHsMvQXbU
	0nfA==
X-Gm-Message-State: AHPjjUhd0bHv9KgJtRu9hTk4JJowebO3L0JljXXU5hV1WxCqvsXnosZr
	yV/4TUK9hBPwUbr3KZn+IxT2mR/0pqNFe8q0NmU=
X-Google-Smtp-Source: AOwi7QDkb+RKcLhk0u76V1HzFwFTPeAizR+uxHm55snX6vV/p/YkCn434oVlqa8AZlRDEwiIJCEBuqIn+HPmb/r2MK0=
X-Received: by 10.223.146.197 with SMTP id 63mr2056951wrn.180.1506535378772;
	Wed, 27 Sep 2017 11:02:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Wed, 27 Sep 2017 11:02:58 -0700 (PDT)
In-Reply-To: <1506513706-14213-1-git-send-email-matt@madison.systems>
References: <1506513706-14213-1-git-send-email-matt@madison.systems>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 27 Sep 2017 11:02:58 -0700
Message-ID: <CAJ86T=Un0JAF_M3XSck_qdCFdU3V0qFLRHsCQgri081gSj+99g@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: rework mips architecture checks
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
X-List-Received-Date: Wed, 27 Sep 2017 18:02:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 5:01 AM, Matt Madison <matt@madison.systems> wrote:
> Move the mips32r2->mips32 rewrite to an anonymous
> python function, and change the GOARCH setting to
> use just the passed-in architecture string, to
> avoid an unwanted variable dependency.
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/classes/goarch.bbclass | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 9ed562d..7553987 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -43,14 +43,10 @@ def go_map_arch(a, d):
>          return 'mips64le'
>      elif re.match('mips64*', a):
>          return 'mips64'
> -    elif re.match('mips.*', a):
> -        tf = d.getVar('TUNE_FEATURES').split()
> -        if 'fpu-hard' in tf and 'n32' not in tf:
> -            if 'mips32r2' in tf:
> -                newtf = [t for t in tf if t != 'mips32r2']
> -                newtf.append('mips32')
> -                d.setVar('TUNE_FEATURES', ' '.join(newtf))
> -            return 'mips' if 'bigendian' in tf else 'mipsle'
> +    elif re.match('mipsel.*', a) and 'r6' not in a and '-nf' not in a and '-n32' not in a:
> +        return 'mipsle'
> +    elif re.match('mips', a) and 'r6' not in a and '-nf' not in a and '-n32' not in a:
> +        return 'mipsle'

Should that be "mips" rather than "mipsle" ?

>      elif re.match('p(pc|owerpc)(64)', a):
>          return 'ppc64'
>      elif re.match('p(pc|owerpc)(64el)', a):
> @@ -74,4 +70,10 @@ def go_map_os(o, d):
>          return 'linux'
>      return o
>

