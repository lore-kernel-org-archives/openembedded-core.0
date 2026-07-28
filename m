Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D884C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 10:21:47 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8432.1785234095052542435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 03:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SDvgLExy;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so33512766d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 03:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785234094; cv=none;
        d=google.com; s=arc-20260327;
        b=Mf3dRQOhcBwLcFSaicMqD0STMTX5FvjU+MyOULgT8LJLIzaWO/Q7jtOpMmPJ3NQXd4
         UCCmtJtTB2oBF6PnLCpyaEhCFPTJGUcIrPdPxwdVKrYT3aeQTpGcwztjrlN+evSlqQQe
         Xc8HZC5772rYqYxTauJxfeCE4Y5OdwUv8k4o3NKQpj2yK8ME+n+KcUUhkgoGVPf3k0xD
         u+C5ZYZXLprqx3t83FCHIA1efwowTXgI69Wak7cteynr9Hs/DCNHW22XL7468QzOlm2g
         XSXzYm70o/wkwYTwTsQrGbDMTMSk5zEAqjChHUwTVdQ1QIvbaYAU2Uij2gMWmdLyNv+w
         Hsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iuXxgJnKo2cASOPdHbGniI9+tc1fxO9BPOp/D5271EM=;
        fh=svEKOZTe5zreLZegZlSpAu1Eb98QHFHS/RhRO1grit8=;
        b=Mvcp87Bo7JJuL5d6yhM/PYoG2w3L/cnBpzklkwnifr1skF1rxQ+bC3hkTIdn0DvTI1
         ym08jgEDc7rV1v6TNgjCYsdbewmWFsU420aTc2IN7T+fWtIcYWek/QZMXzDHrP9U659+
         SmHpeI4fPwUqHnCP2iKseDsWJexLc/RBhRkGkmBWC0N7eRfwW1MyyKjIic0/0YRFCsM/
         sbw/UZIubpqWFnnaWogDrNxVDk1M27cm4MIeuFLVWA2oRNY/iZmvGEbcMMDiOp5u7SaO
         VyWgm1KuQuYKnglf4mdFPDSlZh/sVDNJduKCm4rCG2S3ProiRo+NWovcT9FyHwY0YiX6
         q0xw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785234094; x=1785838894; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuXxgJnKo2cASOPdHbGniI9+tc1fxO9BPOp/D5271EM=;
        b=SDvgLExykYm3nFRdj46PDyo7I8HzvFAVJ/1nLzRvNXbMCnuTnGY2gfstB0BXxa8fuy
         ukCyjYzbKrzlLvwpQ02Lw8ziS7LX8RJDoCA5u00dPTmGakvNoAYSojGbcgicVsV4NUAR
         rp/ldWiMuZFv2j7+Dk3GjiB2gzF5JwpPPHzaGMwKssUOyW0io48VzsOlrLK8piZwVyHL
         JI5hejlcME7fFRfWXqA0ywJcCoxBtLMzpivtEIYfv94o7VHpzz1p7qlJ/hQV29afGn1a
         pqs9Fzfa7KLzA4HH8FmGAclnZJ+E8AsA1GUq2D9ZQJL52pjcoEEc7KqtjPY67f0VGkpl
         12KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234094; x=1785838894;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iuXxgJnKo2cASOPdHbGniI9+tc1fxO9BPOp/D5271EM=;
        b=Qd6O4oYCz7lhCoKjs7+SUjtaL+q2IeJCF4MHskvJqwRehzcz+xG6qodO9yUfQiyetW
         h/Um+sf/Ex/o5iKBuoi+Po7KpvsLr5lOUNm9U9C4/lkC6Z7ZH4LZrEQDaXJTT0nPyF02
         W2MS20pgDRR+ZYHwvoiVXnLxcHKOcFXMDB0sFnk1czaP4xgjqv8eZ9y6GOTTOo5+4xNw
         qeuCo5zDAOmEhZg/4KfTWM1MaRjWeiwydCHRAPUNzdfSzIaPRnn5ZYUsWJameRzAUTGH
         6O4Rw2xg34sOigoVfANJ2Ia1reF5KvIywTqJT+5usxQIgSBvql9L2Tw645vKxwfO5kCv
         iLUg==
X-Gm-Message-State: AOJu0YyReFKadhGXU0LIAwKcirESbHSq2p3l0vm14EVCy/z8Z1VRbSUz
	GbX994kP0E5Qdvo3JM8flIV1MCkwERvpE/j6kA4otZ+Q5l0PJjvMZrfcoa+6czIERyC3lW/wnot
	0Un1t8F50QbCwJVOFNnI2PbWYCs9UKCQ=
X-Gm-Gg: AR+sD131Ra4gH0AvzFMamgTAmykQ5/5RfzSXXtyfIF1oFOyPJ3mY9525j8Xp//htrsY
	TT58WY0yNFlucW1XPiCuivBUAuj+y2rTQE3jYV3BBkS+1Lazj34Uoax4cbiZcYWmAxONLTxCiXy
	cehg0HCZx3BF4bXJwRskISj8pbUttLZrJ1hwJFXvHLSAYDRknNJTn9C+AFz2OsKqkS2knlLsclY
	svSHPKqe8h9xJjxRPujqEIvn4FYeN+upu12B3CsWpGTfPd6e9MFRn7WeYs2vry+3q4jHwI8U1/D
	yHlmPxap2XCH9S67grj6
X-Received: by 2002:a05:6214:2607:b0:904:86a4:cf76 with SMTP id
 6a1803df08f44-90817325a53mr16947386d6.40.1785234093911; Tue, 28 Jul 2026
 03:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260728051641.1997335-1-shinucha@cisco.com>
In-Reply-To: <20260728051641.1997335-1-shinucha@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jul 2026 12:21:21 +0200
X-Gm-Features: AUfX_mwMfTKGF-il0XL8Q6MqxVu6ct8OtWRLJOcONKfEHalPUdr_fJA-mIn7kHE
Message-ID: <CANNYZj8+PHovCNCWT-xw+YcFOe8aomprOwa8A=tYV01Hj7Z1QA@mail.gmail.com>
Subject: Re: [OE-core] [master] [PATCH] boost: make Boost.Locale ICU backend optional
To: shinucha@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com, 
	to@cisco.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 10:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242177

On Tue, 28 Jul 2026 at 07:17, Shinu Chandran via
lists.openembedded.org <shinucha=cisco.com@lists.openembedded.org>
wrote:
>  # optional libraries
> -PACKAGECONFIG ??= "locale python"
> -PACKAGECONFIG[locale] = ",,icu"
> +PACKAGECONFIG ??= "locale python icu"
> +BOOST_LOCALE_ICU_DEP = "${@bb.utils.contains('PACKAGECONFIG', 'locale', 'icu', '', d)}"
> +PACKAGECONFIG[locale] = ",,"
> +PACKAGECONFIG[icu] = ",,${BOOST_LOCALE_ICU_DEP}"
>  PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
>  PACKAGECONFIG[mpi] = ",,mpich"
>  PACKAGECONFIG[python] = ",,python3"
> @@ -148,7 +150,7 @@ BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d')}"
>  BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
>                 ${BJAM_TOOLS} \
>                 -sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
> -               -sICU_PATH=${STAGING_EXECPREFIXDIR} \
> +               ${@bb.utils.contains('PACKAGECONFIG', 'locale icu', '-sICU_PATH=${STAGING_EXECPREFIXDIR}', 'boost.locale.icu=off', d)} \
>                 --build-dir=${B} \
>                 --disable-icu \

As we're passing --disable-icu, what does that do? How is it related
to the icu PACKAGECONFIG? Should we perhaps name things more clearer,
e.g. the newly introduced option should be 'locale-icu' and not just
'icu'?

Also, I think boost.locale.icu=on should be passed when it is enabled,
to explicitly avoid possible floating configurations, e.g. when
upstream quietly changes the default.

Alex

