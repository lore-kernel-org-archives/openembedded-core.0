Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web12.5234.1607557271653093975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 15:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dncXQGEd;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id t15so1103389ual.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 15:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sekVDnveaN+577uS4sMixFdpkCe1M/iXcqSVDBkQcB8=;
        b=dncXQGEdNUWuIdNC46QsCCeEoPCIIL6du9IRSaG0bJqGeo4pVekQLk8s3GeTqMd4zs
         A0b6PnRkWlxe1OHekneTCLM+0ZHfpRn1x0iWuR4ERDAE9iEDVSd1+i4S1pmloQk64vLI
         MXA7z14kRB5Ni7xRcjs3q9kGmM70UVHcnO2+XA/M4t6t1Ihn7dooDP4qfsBjt4YczbWC
         Ba1Ld5KyRFtkEVs+/g5galzLlFKXbuYTmq7vZaw9yWA/FxdWAwPynzwe4eKxX5nN50su
         c+0faQTGaXeBabF5uCNROwiVNon/jOGRaF+zV2CJlmayHYNGqPpwsZp1vbXUJ5CVuKMO
         YDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sekVDnveaN+577uS4sMixFdpkCe1M/iXcqSVDBkQcB8=;
        b=qpJtt1TKGEid4AjLq4wMS9dNrqzfj1gmpT1Z2lhfYOOK/vjo075m0FY6CCdwvvUQ4p
         79gaT5TavWTkUGN8djA+sO9PQTV9pqq4qWsKFgl9isELIObA+6M+6sf784mZLAMAfdDV
         E/VrLCaIPgs+/UI5S2ZHVR9QqyJn6WPpAHKlh97wzv7Qei3DbBqbN68i31HroclH2+Ls
         5sqxhpk2srpcozgIIwiDQF4gXZWz88ZbNikAjQwMzSZjueS51YwRkkzuKk8y9I7wopQ/
         YYBWvL4c4InsQub99CSLVlwx7VCbjHVJU51pte/tMuXUFAX7qQyzMfT0pHb65dYVHHyG
         W86A==
X-Gm-Message-State: AOAM530Wc7+dMmGPolJpk415BcGl/C4INY3w0p7hd+Styukf9qFgfPrs
	heyeb+qYhjFT/0uiwxy7LNmyTkw+Nwn4Jh0o5os=
X-Google-Smtp-Source: ABdhPJyzmkqA9Asj/URK0I2d0wSe6Oet2Hq8GACTfODiPh655JDKEy6ytHTuwZwwJnnuopNKU2hAnwpVPF3dSdcFbOI=
X-Received: by 2002:a9f:2356:: with SMTP id 80mr4659554uae.92.1607557270747;
 Wed, 09 Dec 2020 15:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20201205082246.14954-1-alanp@snowmoose.com> <bb38bb9111dbc5e0a2c3c47256d2bead31b70316.camel@linuxfoundation.org>
 <83ae3fae-37a5-e32d-5084-e1a20d97b13d@snowmoose.com>
In-Reply-To: <83ae3fae-37a5-e32d-5084-e1a20d97b13d@snowmoose.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 9 Dec 2020 15:40:58 -0800
Message-ID: <CAJ86T=WMCdqRn5mzzDHYVuu_eVtH3M=X-moWJzEeP2nBLzYALQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
To: Alan Perry <alanp@snowmoose.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 2:39 PM Alan Perry <alanp@snowmoose.com> wrote:
> On 12/7/20 1:49 PM, Richard Purdie wrote:
> > On Sat, 2020-12-05 at 08:22 +0000, Alan Perry wrote:
> >> Many scripts exist that expect the iproute2 tools to be found in
> >> the same directories where they are found in Debian or Ubuntu.
> >> For the iproute2 tools included in the iproute2 recipe, move
> >> them to those directories or create links there.. Also, add
> >> bash-completion files as is done by Debian and Ubuntu.
> >>
> >> Signed-off-by: Alan Perry <alanp@snowmoose.com>
> >> ---
> >>   .../iproute2/iproute2.inc                     | 23 +++++++++++++++++--
> >>   1 file changed, 21 insertions(+), 2 deletions(-)
> > The direction in the patch is worrying me a little.
> >
> > There is a bash-completion class which splits completion files into
> > their own package, most "embedded" users don't want them in the main
> > packages. This patch does something different to what has been done
> > elsewhere.
> >
> > Secondly, I'm also not sure that just because debian does something we
> > should therefore do it, I'm not convinced that scripts should be
> > hardcoding path assumptions about these tools. IF this is such a
> > universal need, why doesn't upstream change the default installation
> > locations? Has it been discussed?
> >
> > I'd expect there to be opinions on this topic but I'm not seeing much
> > discussion. I suspect if if does merge there would be push back later
> > though.
> >
> > Also, the duplication between bin and sbin for ip is not particularly
> > good practise.
> >
> Thanks for your comments. I apologize for the delay in responding, but I
> needed to do some research first.
>
> I will look at the bash-completion class and make the appropriate
> changes there.
>
> As far as the installation path changes, I discussed why those aren't
> the defaults with the iproute2 upstream maintainer. The idea is that the
> upstream puts everything in /sbin and where is appropriate to install
> them for a given distro is left as an exercise for that distro.
>
> The iproute2 recipe is doing that exercise for poky. So, where is the
> correct place to install these tools on poky? I'd argue that they should
> go in the expected directories for Unix-y OSes. Someone at Debian went
> through that analysis and put them where they put them and those mostly
> seem like reasonable places to me. It is also where users coming to
> poky-based systems will likely expecting to find them.
>
> As far as duplicating ip in bin and sbin, I agree that it isn't good
> practice. Having it in both doesn't seem necessary to me.

But isn't that duplication all part of aligning with Debian (where
/sbin/ip is a symlink to /bin/ip)? Presumably something relies on the
symlink or Debian wouldn't be doing it.

Based on:

  https://sources.debian.org/src/iproute2/5.9.0-1/debian/iproute2.install/
  https://sources.debian.org/src/iproute2/5.9.0-1/debian/iproute2.links/

Debian does seem to do quite a lot or rearranging of the installed
files. Open question seems to be whether that rearranging is to align
with requirements which are specific to Debian or something which
other distros might need too?

Based on:

  https://centos.pkgs.org/8/centos-baseos-x86_64/iproute-5.3.0-5.el8.x86_64.rpm.html

It looks like Centos installs all binaries under /usr/sbin
